# MySQL Snap
[![mysql-strict](https://snapcraft.io/mysql-strict/badge.svg)](https://snapcraft.io/mysql-strict)

## Introduction

This is a community-developed MySQL snap, made with the goal to have the ability to run with minimal privileges, while maintaining the ability to run as a stable, full-fledged MySQL server.

## Features
- Strict confinement (only uses the `network` and `network-bind` interfaces)
- Non-root daemon (for improved security)
- Requires manually set MySQL root password
- Disallows Linux root user from logging into MySQL without password
- Support for multiple CPU architectures

## Installation
[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/mysql-strict)

This snap can be installed from the Snap Store using the following command:

    sudo snap install mysql-strict

> [!NOTE]
> During installation, a randomly generated password is created for the MySQL `root` user. To retrieve it, issue the following command:

    sudo mysql-strict.rootpass

## Commands

This snap comes packaged with a number of useful commands:
- `mysql-strict.mysql`
- `mysql-strict.mysqladmin`
- `mysql-strict.mysqldump`
- `mysql-strict.mysqlimport`

> [!TIP]
> For convenience, you can create an an alias for any of these commands using snapd's alias feature. For example:

    sudo snap alias mysql-strict.mysql mysql

This way, you can now simply log into the MySQL server with just:

    mysql -u root -p


## Data

| Type            | Location                                |
|-----------------|-----------------------------------------|
|Databases        |/var/snap/mysql-strict/common/data   |
|Logs             |/var/snap/mysql-strict/current/log       |
|Settings         |/var/snap/mysql-strict/current/etc       |
|Sockets          |/var/snap/mysql-strict/current/run       |

> [!TIP]
> For creating backups, it is recommended to use snapd's snapshot feature. See [here](https://snapcraft.io/docs/snapshots) for more details.
