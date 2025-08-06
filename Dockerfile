# Set the base image for semantic release. Only node is needed.
FROM macstab/nodejs-tools-git-jq-python:1.3.0
LABEL maintainer="Nolem / Per! <schnapka.christian@googlemail.com>"

# By the environment varianle SEMANTIC_RELEASE_CONFIG the semantic-release configuration can be overwritten. This is
# used to define different project environments. Current valid values are:
# - /configs/.releaserc-js.json
# - /configs/.releaserc-maven.json
# - /configs/.releaserc-python.json
# - /configs/.releaserc-gradle.json
# Besides this you can declare your own configuration file and mount it to the container.
ENV SEMANTIC_RELEASE_CONFIG=/configs/.releaserc-js.json
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH=$JAVA_HOME/bin:$PATH
ENV MAVEN_VERSION=3.9.9
ENV GRADLE_VERSION=8.14.3
ENV MAVEN_HOME=/usr/share/maven
ENV MAVEN_CONFIG="/root/.m2"
ENV GRADLE_HOME=/opt/gradle/gradle
ENV PATH=$PATH:$GRADLE_HOME/bin

# Install required packages for java environment
RUN apt-get update \
    && apt-get install -y tzdata curl wget ca-certificates fontconfig binutils dumb-init bash openssl libc6 libcurl4 libgcc-s1 unzip \
    && ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install global packages and clean cache in a single layer to reduce image size
# The --save-dev and -D flags are not necessary for global installs
# Also, it's unusual to run semantic-release during the build, as it's typically run in CI/CD pipelines
RUN npm install -g semantic-release@24.2.7 \
    @semantic-release/git \
    @semantic-release/changelog \
    @semantic-release/release-notes-generator@11.0.7 \
    @semantic-release/exec \
    semantic-release/github \
    semantic-release-maven \
    semantic-release-gradle \
    semantic-release-pypi \
    @semantic-release/commit-analyzer@10.0.4 \
    @saithodev/semantic-release-backmerge \
    semantic-release-license && \
    npm cache clean --force

# Determine system architecture and download appropriate JDK
# at this point we just use arm64 for macos and arm clusters and amd64 for x86 clusters and linux / windows devs
RUN set -eux; \
    ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in \
       aarch64|arm64) \
         ESUM='6f8725d186d05c627176db9c46c732a6ef3ba41d9e9b3775c4727fc8ac642bb2'; \
         BINARY_URL='https://github.com/adoptium/temurin24-binaries/releases/download/jdk-24.0.2%2B12/OpenJDK24U-jdk_aarch64_linux_hotspot_24.0.2_12.tar.gz'; \
         ;; \
       amd64|i386:x86-64) \
         ESUM='aea1cc55e51cf651c85f2f00ad021603fe269c4bb6493fa97a321ad770c9b096'; \
         BINARY_URL='https://github.com/adoptium/temurin24-binaries/releases/download/jdk-24.0.2%2B12/OpenJDK24U-jdk_x64_linux_hotspot_24.0.2_12.tar.gz'; \
         ;; \
       *) \
         echo "Unsupported arch: ${ARCH}"; \
         exit 1; \
         ;; \
    esac; \
	  wget -O /tmp/openjdk.tar.gz ${BINARY_URL}; \
	  echo "${ESUM} */tmp/openjdk.tar.gz" | sha256sum -c -; \
	  mkdir -p "$JAVA_HOME"; \
	  tar --extract \
	      --file /tmp/openjdk.tar.gz \
	      --directory "$JAVA_HOME" \
	      --strip-components 1 \
	      --no-same-owner \
	  ; \
    rm /tmp/openjdk.tar.gz; \
# https://github.com/docker-library/openjdk/issues/331#issuecomment-498834472
    find "$JAVA_HOME/lib" -name '*.so' -exec dirname '{}' ';' | sort -u > /etc/ld.so.conf.d/docker-openjdk.conf; \
    ldconfig; \
# https://github.com/docker-library/openjdk/issues/212#issuecomment-420979840
# https://openjdk.java.net/jeps/341
    java -Xshare:dump;

COPY configs/ /configs/

# Install maven and gradle
RUN echo Verifying install ... \
    && fileEncoding="$(echo 'System.out.println(System.getProperty("file.encoding"))' | jshell -s -)"; [ "$fileEncoding" = 'UTF-8' ]; rm -rf ~/.java \
    && echo javac --version && javac --version \
    && echo java --version && java --version \
    && echo Complete. && \
    set -eux;  \
    find . -maxdepth 1 -type f \( -iname \*.pem -o -iname \*.der -o -iname \*.crt \) ! -name all-certs.pem -delete  && \
    semantic-release --version; \
    echo "installing maven ${MAVEN_VERSION}"; \
    mkdir -p /usr/share/maven /usr/share/maven/ref \
      && curl -fsSL -o /tmp/apache-maven.tar.gz https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
      && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
      && rm -f /tmp/apache-maven.tar.gz \
      && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn; \
    echo "installing gradle ${GRADLE_VERSION}"; \
    wget -O /tmp/gradle-${GRADLE_VERSION}-bin.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
      && unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip -d /opt/gradle \
      && ln -s /opt/gradle/gradle-${GRADLE_VERSION}/bin/gradle /usr/bin/gradle; \
    echo "pre-populating gradle wrapper cache"; \
    GRADLE_HASH=$(python3 -c "import hashlib,sys;a='0123456789abcdefghijklmnopqrstuvwxyz';n=int.from_bytes(hashlib.md5(sys.argv[1].encode()).digest(),'big');r='';exec('while n:r=a[n%36]+r;n//=36');print(r or '0')" "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip") && \
    mkdir -p /root/.gradle/wrapper/dists/gradle-${GRADLE_VERSION}-bin/${GRADLE_HASH} && \
    cp /tmp/gradle-${GRADLE_VERSION}-bin.zip /root/.gradle/wrapper/dists/gradle-${GRADLE_VERSION}-bin/${GRADLE_HASH}/ && \
    cd /root/.gradle/wrapper/dists/gradle-${GRADLE_VERSION}-bin/${GRADLE_HASH} && \
    unzip -q gradle-${GRADLE_VERSION}-bin.zip && \
    rm /tmp/gradle-${GRADLE_VERSION}-bin.zip


CMD ["sh"]