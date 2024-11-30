# MySQL Snap
[![mysql-strict](https://snapcraft.io/mysql-strict/badge.svg)](https://snapcraft.io/mysql-strict)

## Introduction

This is a community-developed MySQL snap, made with the goal to have the ability to run with minimal privileges, while maintaining the ability to run as a stable, full-fledged MySQL server. This snap features strict confinement security, a non-root daemon, and support for the `amd64` and `arm64` architectures.

## Installation
[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/mysql-strict)

MySQL can be installed from the Snap Store using the following command:

    sudo snap install mysql-strict

> [!Note]
> By default, the MySQL `root` user is authenticated using the `auth_socket` plugin. If you would like to set and use a password instead, you can do so with the following commands, replacing "`Y0UR_N3W_Pa$$`" below with a strong password:

```
sudo mysql-strict.mysql -u root
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'Y0UR_N3W_Pa$$';
```

## Commands

This snap comes with a number of useful commands to help you work with your MySQL instance.
- `mysql-strict.mysql`
- `mysql-strict.mysqladmin`
- `mysql-strict.mysqldump`
- `mysql-strict.mysqlimport`
- `mysql-strict.mysql-secure-installation`

> [!TIP]
> For the sake of convenience, you can create an alias for any of above commands using the alias feature. For example:

    sudo snap alias mysql-strict.mysql mysql

This way, you can now log into the MySQL server with just:

    mysql -u root

## Data

Your data is stored as seen in the table below.

| Type            | Location                                |
|-----------------|-----------------------------------------|
|Databases        |/var/snap/mysql-strict/common/data   |
|Logs             |/var/snap/mysql-strict/current/log       |
|Settings         |/var/snap/mysql-strict/current/etc       |
|Sockets          |/var/snap/mysql-strict/current/run       |

> [!TIP]
> For creating and restoring backups, it's recommended to use the snapshot feature, which perfectly preserves permissions and attributes. See [https://snapcraft.io/docs/snapshot](https://snapcraft.io/docs/snapshots) for more details.
