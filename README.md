# MySQL Server Snap
[![mysql-strict](https://snapcraft.io/mysql-strict/badge.svg)](https://snapcraft.io/mysql-strict)

## Introduction

This is a community-developed snap for the upstream [MySQL Server](https://github.com/mysql/mysql-server/tags) project.

## Features
- Enforced strict confinement, using only the [network](https://snapcraft.io/docs/network-interface) and [network-bind](https://snapcraft.io/docs/network-bind-interface) interfaces.
- Support for multiple CPU architectures.

## Installation
[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/mysql-strict)

MySQL Server can be installed from the Snap Store using the following command:

    sudo snap install mysql-strict

## Configuration & Data

Configuration files are stored under: `/var/snap/mysql-strict/current/etc`

Log files file are stored under: `/var/snap/mysql-strict/current/log`

Databases are stored under: `/var/snap/mysql-strict/common/data`

## Connection

By default, MySQL listens on `127.0.0.1:3306`.

If you would like to change the listening address and/or port, you can do so by editing:

`/var/snap/mysql-strict/current/etc/mysqld.cnf`

## Applying Changes

MySQL will need to be restarted after any changes are made to the configuration.

    sudo snap restart mysql-strict

## Building

Install and configure needed dependencies.

    sudo snap install snapcraft --classic
    sudo snap install lxd
    sudo lxd init --minimal

Then, add yourself to the lxd group. Afterwards, log out and log back in.

    sudo usermod -a -G lxd $USER

Thereafter, clone this repository, change your working directory into it, and finally, run the build.

    git clone https://github.com/DownThePark/snapcraft-mysql-strict.git
    cd snapcraft-mysql-strict
    snapcraft
