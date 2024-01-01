# Set the base image for semantic release. Only node is needed.
FROM macstab/node-python-git-jq-bookworm:latest
LABEL maintainer="Nolem / Per! <schnapka.christian@googlemail.com>"

# By the environment varianle SEMANTIC_RELEASE_CONFIG the semantic-release configuration can be overwritten. This is
# used to define different project environments. Current valid values are:
# - /configs/.releaserc-js.json
# - /configs/.releaserc-maven.json
# - /configs/.releaserc-python.json
# - /configs/.releaserc-gradle.json
# Besides this you can declare your own configuration file and mount it to the container.
ENV SEMANTIC_RELEASE_CONFIG=/configs/.releaserc-js.json
ENV JAVA_HOME /opt/java/openjdk
ENV PATH $JAVA_HOME/bin:$PATH
ENV MAVEN_VERSION=3.9.6
ENV GRADLE_VERSION=8.5
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
ENV GRADLE_HOME /opt/gradle/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

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
RUN npm install -g semantic-release@21.0.2 \
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
         ESUM='33e440c237438aa2e3866d84ead8d4e00dc0992d98d9fd0ee2fe48192f2dbc4b'; \
         BINARY_URL='https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21%2B35/OpenJDK21U-jdk_aarch64_linux_hotspot_21_35.tar.gz'; \
         ;; \
       amd64|i386:x86-64) \
         ESUM='82f64c53acaa045370d6762ebd7441b74e6fda14b464d54d1ff8ca941ec069e6'; \
         BINARY_URL='https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21%2B35/OpenJDK21U-jdk_x64_linux_hotspot_21_35.tar.gz'; \
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
    wget -O /tmp/gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
      && unzip /tmp/gradle.zip -d /opt/gradle \
      && rm /tmp/gradle.zip \
      && ln -s /opt/gradle/gradle-${GRADLE_VERSION}/bin/gradle /usr/bin/gradle


CMD ["sh"]