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

## Configuration

### Root Password
After installation, a randomly generated password is created for the MySQL root user. To retrieve this password, issue the following command:

    mysql-strict.temporary-root-password

This password is stored in plaintext on your file system. Therefore, it is **important** to change it **immediately**!

    mysql-strict.mysql -u root -p
    ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'YOUR_NEW_PASS';

## Connecting

By default, MySQL listens on `127.0.0.1:3306`.

Additionally, a socket is available at: `/var/snap/mysql-strict/current/run/mysql.sock`

If you would like to change the listening address and/or port, you can do so in: `/var/snap/mysql-strict/current/etc/mysqld.cnf`

### Data Files & Folders

Configuration: `/var/snap/mysql-strict/current/etc`

Logs: `/var/snap/mysql-strict/current/log`

Databases: `/var/snap/mysql-strict/common/data`

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
