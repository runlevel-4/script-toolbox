# Wordpress Installer Script

This script will setup all of the prerequisite LAMP stack components and create a default WordPress database and DB user.

## Prerequisites

- Ubuntu/Debian-based Linux
- A user account with `sudo` privileges
- Internet access
- Git

## Installation

Run the following commands:

```bash
sudo apt update
sudo apt install -y git
git clone https://github.com/runlevel-4/script-toolbox.git
cd script-toolbox
bash web-server-automation/wordpress/install_wp.sh
```

**NOTE:** It is recommended to login to MySQL/MariaDB and change the root login as well as the password for the _wordpress_ user.  Then update the password value in your _wp-config.php_ file to match.  Do this only if you plan on exposing your server to the internet...otherwise, the default is fine for development.

Do the following to access the database and change the default passwords:

`sudo mysql -u root -p` (if you don't have a mysql password, just hit _Enter_)

`ALTER USER 'wordpress'@'localhost' IDENTIFIED BY 'newpassword';`

ALWAYS be sure to protect your WP config files by not exposing them to the public internet.
