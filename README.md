# PHP for Laravel

![Docker Automated build status](https://img.shields.io/docker/build/roelofr/php.svg)
![Docker Automated build](https://img.shields.io/docker/automated/roelofr/php.svg)

A php installation with Composer, MySQL via PDO, multi-process signals and other
important extensions for good testing of Laravel apps

Could also work for, you know, other stuff

## Images

This image contains three variants; which are all based on the [`php`][php] repository.

 - **CLI** - Tagged as `cli`, `latest` ([Dockerfile][d1]).
 - **FPM** - Tagged as `fpm` ([Dockerfile][d2]).
 - **Apache** - Tagged as `apache` ([Dockerfile][d3]).

[php]: https://hub.docker.com/_/php/
[d1]: php/Dockerfile
[d2]: php-fpm/Dockerfile
[d3]: php-apache/Dockerfile
