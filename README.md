# MySQL Server Snap
[![mysql-strict](https://snapcraft.io/mysql-strict/badge.svg)](https://snapcraft.io/mysql-strict)

## Introduction

This is a community-developed MySQL Server snap, made with the goal of running with minimal privileges, while maintaining the ability to run as a stable, full-fledged MySQL server.

## Features
- Enforced strict confinement (uses only the [network](https://snapcraft.io/docs/network-interface) and [network-bind](https://snapcraft.io/docs/network-bind-interface) interfaces)
- Non-root daemon for improved security
- Support for multiple CPU architectures

## Installation
[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/mysql-strict)

MySQL Server can be installed from the Snap Store using the following command:

    sudo snap install mysql-strict

## Configuration

### Root Password
During installation, a randomly generated password is automatically created for the MySQL `root` user. To retrieve this password, issue the following command:

    sudo mysql-strict.rootpass

MySQL will prevent itself from being used until you change this password. You can use the following commands to update it (don't forget to change `YOUR_NEW_PASS` with a strong password):

    mysql-strict.mysql -u root -p
    ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'YOUR_NEW_PASS';

### Folders

| Type            | Location                                |
|-----------------|-----------------------------------------|
|Configuration    |/var/snap/mysql-strict/current/etc       |
|Logs             |/var/snap/mysql-strict/current/log       |
|Sockets          |/var/snap/mysql-strict/current/run       |
|Databases        |/var/snap/mysql-strict/**common**/data   |

### Applying Changes

MySQL will need to be restarted after any changes are made to any of the configuration files found under `/var/snap/mysql-strict/current/etc`.

    sudo snap restart mysql-strict

## Commands

This snap comes packaged with a number of useful commands:
- `mysql-strict.mysql`
- `mysql-strict.mysqladmin`
- `mysql-strict.mysqldump`
- `mysql-strict.mysqlimport`

For convenience, you can create an an alias for any of these commands using snapd's built-in alias feature. For example:

    sudo snap alias mysql-strict.mysql mysql

This way, you can now simply log into the MySQL server with just:

    mysql -u root -p

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
