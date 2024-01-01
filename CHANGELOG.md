## [1.6.3](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.6.2...v1.6.3) (2024-01-01)

## [1.6.2](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.6.1...v1.6.2) (2024-01-01)

## [1.6.1](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.6.0...v1.6.1) (2024-01-01)


### Bug Fixes

* correct backmerge. ([582ff41](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/582ff41f009fe1123c9e43276ebde9c45204f3b6))

# [1.6.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.5.0...v1.6.0) (2024-01-01)


### Features

* removed backmerge by using external github action to merge main branch into develop ([47ddfeb](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/47ddfeb2e3668c9fac5ca7c54a253d07e1b72f50))

# [1.5.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.4.0...v1.5.0) (2024-01-01)


### Features

* get the github release changes from the remote repo before the backmerge. ([ff88e40](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/ff88e40394993e7556d07d5b70816ee247f28da9))

# [1.5.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.4.0...v1.5.0) (2024-01-01)


### Features

* get the github release changes from the remote repo before the backmerge. ([ff88e40](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/ff88e40394993e7556d07d5b70816ee247f28da9))

# [1.4.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.3.0...v1.4.0) (2024-01-01)


### Features

* add concurrency for workflows ([#10](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/10)) ([68abec6](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/68abec6e182de3b3a65fcfc1c7960499013310b3))

# [1.3.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.2.0...v1.3.0) (2024-01-01)


### Features

* add npm version change on npm in release phase as well. ([#9](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/9)) ([4230800](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/4230800c8b95b23dc0e6f52cf7df2351ac16a828))

# [1.2.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.1.0...v1.2.0) (2024-01-01)


### Features

* include the docker image version keeper by a npm package.json file for the backmerge. ([dcc5bba](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/dcc5bba3c4040d4302f5f090b3bd59b165312dcf))
* manual back merge after error. ([#8](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/8)) ([b3fac29](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/b3fac29a0f47d7208ffe165d716551ccf84f8c0b))

# [1.2.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.1.0...v1.2.0) (2024-01-01)


### Features

* include the docker image version keeper by a npm package.json file for the backmerge. ([dcc5bba](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/dcc5bba3c4040d4302f5f090b3bd59b165312dcf))

# [1.1.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.0.0...v1.1.0) (2024-01-01)


### Features

* allow dedicated docker image release for the docker file build. ([5eb3023](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/5eb3023824b60105135d6bdb21bab14332ca3888))

# 1.0.0 (2023-12-31)


### Bug Fixes

* changed the order ([b4d3cac](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/b4d3cac8358ff18541acebe25d457209d93f6101))


### Features

* Add .releaserc-nobuild.json configuration file ([57c3eea](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/57c3eea38195d660e66f2ba4461710c88a5f2fa8))
* add configurations for python, nodejs, gradle and maven projects to manage their version. Add documentation of use. Add Dockerfile for semantic release. ([09e84fe](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/09e84fef0899657334601312554ed4ed4503bb18))
* add explicit call of semantic release context including the main branch and the workdir path. ([86c6408](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/86c6408d24cc1589fcaee7a22c10dd66f646857d))
* add pipeline for docker image. ([7dfc494](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/7dfc494ebe55ec1872ff7359e0ca11110a3d5cca))
* add renovate configuration. ([fda4dda](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/fda4dda274d7b9cbe02426f628ac403d8d14c0b4))
* add semantic release config for main branch only ([48ab338](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/48ab3380c2514baf02745ffdec612343386fe57f))
* disable npm publication ([#5](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/5)) ([bd4783b](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/bd4783b493856645bac5f3c932603ae8504d9ed4))
* enable default npm usage without publish ([#6](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/6)) ([16169a5](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/16169a50e906cdc1c147a3022167a8d7599f5e15))
* integrate semantic-release into pipeline. ([2f3f8de](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/2f3f8de2f57dc40ba0eb5c9c84f84c1c39b1ad66))
* use ALTERNATE_GITHUB_TOKEN env var as GITHUB_TOKEN only, if it is set. ([5f4286b](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/5f4286b1c2d4cd017318d5a85c0bf95c3b2a899e))
* use BOT_GITHUB_TOKEN env var as GITHUB_TOKEN only, if it is set. ([a9788a6](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/a9788a6130e6083338aa7603e96b027252ae5a21))
