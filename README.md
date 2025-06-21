# MySQL Snap
[![mysql-strict](https://snapcraft.io/mysql-strict/badge.svg)](https://snapcraft.io/mysql-strict)

## Introduction

This is a community-developed MySQL snap, made with the goal to have the ability to run with minimal privileges, while maintaining the ability to run as a stable, full-fledged MySQL server. This snap features strict confinement security, a rootless daemon, and support for the `amd64` and `arm64` architectures.

## Installation
[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/mysql-strict)

MySQL can be installed from the Snap Store using the following command:

    sudo snap install mysql-strict

This snap supports MySQL versions `8.0`, `8.4`, and `latest`. By default, the most current LTS version is used. You can choose which version to install by appending `--channel=<channel>` to the install command. 

## Commands

List of available commands:
- `mysql-strict.mysql`
- `mysql-strict.mysqladmin`
- `mysql-strict.mysqldump`
- `mysql-strict.mysqlimport`
- `mysql-strict.mysql-secure-installation`

> [!TIP]
> For convenience, you can create an alias for any of above commands using snapd's alias feature. For example:
```
sudo snap alias mysql-strict.mysql mysql
```

This way, you can then login to the MySQL server with just:
```
sudo mysql
```

## Usage

By default, the MySQL root user is authenticated using the `auth_socket` plugin, similar to the deb version in the Ubuntu package repository. Therefore, to login as the root MySQL user, you need to prefix the `mysql` command with `sudo`.
```
sudo mysql
```

To login with a password instead, execute the following SQL statement (change `YOUR_NEW_PASS` below with a strong password):
```
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'YOUR_NEW_PASS';
```

This way, you can then login without system superuser privileges.
```
mysql -u root -p
```

## Data

Your data is stored as seen in the table below.

| Type            | Location                                |
|-----------------|-----------------------------------------|
|Databases        |/var/snap/mysql-strict/common/data   |
|Logs             |/var/snap/mysql-strict/current/log       |
|Settings         |/var/snap/mysql-strict/current/etc       |
|Sockets          |/var/snap/mysql-strict/current/run       |

> [!TIP]
> For creating and restoring backups, it's recommended to use snapd's snapshot feature, which perfectly preserves permissions and attributes. See [https://snapcraft.io/docs/snapshot](https://snapcraft.io/docs/snapshots) for more details.

> [!Warning]
> If you want to switch to another version of MySQL after installation, make sure not to downgrade to an older version  (i.e. `8.4` to `8.0`), otherwise that will result in data corruption.
