# MySQL Snap
[![mysql-strict](https://snapcraft.io/mysql-strict/badge.svg)](https://snapcraft.io/mysql-strict)

## Introduction

This is a community-developed MySQL snap, made with the goal to have the ability to run with minimal privileges, while maintaining the ability to run as a stable, full-fledged MySQL server. This snap features strict confinement security, a non-root daemon, and support for the `amd64` and `arm64` architectures.

## Installation
[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/mysql-strict)

MySQL can be installed from the Snap Store using the following command:

    sudo snap install mysql-strict

## Commands

List of available commands:
- `mysql-strict.mysql`
- `mysql-strict.mysqladmin`
- `mysql-strict.mysqldump`
- `mysql-strict.mysqlimport`
- `mysql-strict.mysql-secure-installation`

> [!TIP]
> For convenience, you can create an alias for any of above commands using the alias feature. For example:
```
sudo snap alias mysql-strict.mysql mysql
```

This way, you can now log into the MySQL server with just:
```
sudo mysql
```

If you set a password for the MySQL `root` user, then the command would be:
```
mysql -u root -p
```

## Usage

By default, the MySQL `root` user is authenticated using the `auth_socket` plugin, similar to the deb version in the Ubuntu package repository. Therefore, to log as the `root` MySQL user, you need to prefix the `mysql` command with `sudo`.
```
sudo mysql
```

If you would like to log in to the MySQL server using a password instead, execute the following SQL statement:
```
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'Y0UR_N3W_Pa$$';
```
Replace "`Y0UR_N3W_Pa$$`" above with a strong password.

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
