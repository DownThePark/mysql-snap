# MySQL Snap
[![mysql-strict](https://snapcraft.io/mysql-strict/badge.svg)](https://snapcraft.io/mysql-strict)

## Introduction

This is a community-developed MySQL snap, made with the goal to have the ability to run with minimal privileges, while maintaining the ability to run as a stable, full-fledged MySQL server.

## Features
- Strict confinement (only uses the `network` and `network-bind` interfaces)
- Non-root daemon for improved security
- Support for multiple CPU architectures

## Installation
[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/mysql-strict)

This snap can be installed from the Snap Store using the following command:

    sudo snap install mysql-strict

> [!NOTE]
> During installation, a randomly generated password is created for the MySQL `root` user. To retrieve it, issue the following command:

    sudo mysql-strict.rootpass

> [!WARNING]
> MySQL will prevent itself from being used until you change this password. To update it, start by logging into the MySQL server:

    mysql-strict.mysql -u root -p

Afterwards, execute the following SQL statement (replace `YOUR_NEW_PASS` below with a strong password):
    
    ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'YOUR_NEW_PASS';

## Usage

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

## Configuration

| Type            | Location                                |
|-----------------|-----------------------------------------|
|Databases        |/var/snap/mysql-strict/common/data   |
|Logs             |/var/snap/mysql-strict/current/log       |
|Settings         |/var/snap/mysql-strict/current/etc       |
|Sockets          |/var/snap/mysql-strict/current/run       |

>[!NOTE]
> MySQL will need to be restarted after any changes are made to any of the configuration files.

    sudo snap restart mysql-strict

## To Do List:
- Support mysqlrouter
- Support log rotation
- Support multiple languages
