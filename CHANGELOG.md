## [1.5.2](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/1.5.1...1.5.2) (2026-01-24)


### Bug Fixes

* **workflows:** consolidate PATH and ([#49](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/49)) ([0d67484](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/0d67484dab990a698a79bb9303f583f7ae4acc0e)), closes [#30](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/30)

## [1.5.1](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/1.5.0...1.5.1) (2026-01-24)


### Bug Fixes

* **env:** fixing the env vars in the squashed images ([#48](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/48)) ([b061134](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/b061134cbc86bf278ec3f088f22ac2c4b095afc6)), closes [#30](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/30)

# [1.5.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/1.4.0...1.5.0) (2026-01-24)


### Features

* upgrade to latest tool versions ([#47](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/47)) ([6c4fb41](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/6c4fb41518419dbddf93330a1a523528c86f10e9)), closes [#30](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/30)

# [1.4.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/1.3.1...1.4.0) (2026-01-19)


### Features

* enable multi architecture builds and images ([#42](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/42)) ([1242730](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/12427304160a715104a8d915b282abcf48535596)), closes [#30](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/30)

## [1.3.1](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/1.3.0...1.3.1) (2025-09-02)

# [1.3.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/1.2.0...1.3.0) (2025-08-06)


### Features

* **multi-arch:** multi architecture for linux amd64 and arm systems. added last versions and implemented internal gradle wrapper hash calcualtion to prevent download of grade when utitlizing a gradle wrapper and using docker image gradle instead. ([#37](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/37)) ([ddfd5de](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/ddfd5de9abe8261b614ed44dda75b058bd3123fc)), closes [#30](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/30)

# [1.2.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/1.1.5...1.2.0) (2025-08-03)


### Features

* **deps:** using base with python 1.13 and nodejs 23 +  jdk24 and many more. gradle 8.14.3 and maven 3.9.9 ([#35](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/35)) ([76671b3](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/76671b361760d15787a4458a441da1d56d0d5303)), closes [#30](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/issues/30)

## [1.1.5](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/1.1.4...1.1.5) (2025-08-02)

## [1.1.4](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/1.1.3...1.1.4) (2025-07-27)

## [1.1.3](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/1.1.2...1.1.3) (2025-07-27)

## [1.1.2](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/1.1.1...1.1.2) (2024-01-20)

## [1.1.1](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.1.0...1.1.1) (2024-01-20)

# [1.1.0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.0.2...v1.1.0) (2024-01-19)


### Features

* change the version to a prefix less style ([9f3b2b7](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/9f3b2b72435f926dd6584fd7c70916460d08cf66))

## [1.0.2](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.0.1...v1.0.2) (2024-01-16)


### Bug Fixes

* correct double backmerge bug. ([d24584a](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/d24584a2418b55023ba1b725451ea3aa76c3f402))

## [1.0.1](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/compare/v1.0.0...v1.0.1) (2024-01-16)


### Bug Fixes

* allow empty commits ([8278141](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/82781419f3d31855f3b46351b619f03d9579a151))

# 1.0.0 (2024-01-16)


### Bug Fixes

* correct steps for pull requests. ([de91354](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/de91354e7e058bf6ab36d5b5e93263a520ead59d))


### Features

* initial build of the image and build ([5c737b0](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/5c737b0708cf4f003941b620e879842f38e1666d))

# 1.0.0 (2024-01-16)


### Bug Fixes

* correct steps for pull requests. ([de91354](https://github.com/macstab/semantic-release-maven-gradle-nodejs-python-git-jq/commit/de91354e7e058bf6ab36d5b5e93263a520ead59d))

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
