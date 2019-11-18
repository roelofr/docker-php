#!/usr/bin/env bash

# Build versions
BUILD_TYPES=(cli fpm apache)

# PHP versions to install
BUILD_VERSIONS=(latest 7.3 7.2 7.1)

# XDebug versions
XDEBUG_VERSIONS=(beta stable stable stable)

# Default values
DEFAULT_PLATFORM=cli
DEFAULT_VERSION=latest
