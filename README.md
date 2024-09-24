# Moodle

# Prerequisites

_install php_ `brew install php` (for macbook)
_install mysql_ `brew install mysql` if you haven't already have it (for macbook)
_install composer (globally)_ `brew install composer` (for macbook)
_install node_ if you haven't already had it
_install lynx_ `brew install lynx`

# Install the application:

Go to the moodle folder:
1- composer install
2- npm install
3- cp config-dist.php config.php

4- edit config.php which you've just created:
$CFG->dirroot   = '[path/to]/moodle';
$CFG->dbtype = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost = 'localhost';
$CFG->dbname    = 'moodle';is it isis
$CFG->dbuser = 'root'; (step 5.6)
$CFG->dbpass    = ''; (step 5.6)
$CFG->prefix = 'mdl\_';

5- setup database
5.1- start your mysql: `brew services start mysql` (for mac)
you can check the status: `brew service list` to ensure it is up and running
5.2- open your mysql workbench
5.3- create a schema with the name: moodle
5.4- got to server > Users & Privileges
5.5- add account, give it your name and a password on local host
5.6- match it with config.php file you've created (Step 4)

GRANT ALL PRIVILEGES ON _._ TO 'bani'@'localhost' IDENTIFIED BY '000333soundwin' WITH GRANT OPTION;
FLUSH PRIVILEGES;

6- npm install -g browser-sync

# To start the application:

1- brew services start mysql
2- brew services list (to make sure everything is running as expected)
3- mysql -u root -p
4- sudo apachectl start (restart)
5- sudo apachectl status (to verify Apache is working as expected)
6- sudo apachectl configtest (to verify Apache config is alright, expect Syntax OK)

<p align="center"><a href="https://moodle.org" target="_blank" title="Moodle Website">
  <img src="https://raw.githubusercontent.com/moodle/moodle/main/.github/moodlelogo.svg" alt="The Moodle Logo">
</a></p>

[Moodle][1] is the World's Open Source Learning Platform, widely used around the world by countless universities, schools, companies, and all manner of organisations and individuals.

Moodle is designed to allow educators, administrators and learners to create personalised learning environments with a single robust, secure and integrated system.

##httpd.conf:

## Global Settings

ServerRoot "/usr/local/opt/httpd"
ServerName localhost
Listen 8080

# Load Modules

LoadModule php_module /usr/local/opt/php/lib/httpd/modules/libphp.so
LoadModule mpm_prefork_module lib/httpd/modules/mod_mpm_prefork.so
LoadModule rewrite_module /usr/local/Cellar/httpd/2.4.62/lib/httpd/modules/mod_rewrite.so
LoadModule mime_module lib/httpd/modules/mod_mime.so
LoadModule log_config_module lib/httpd/modules/mod_log_config.so
LoadModule env_module lib/httpd/modules/mod_env.so
LoadModule headers_module lib/httpd/modules/mod_headers.so
LoadModule setenvif_module lib/httpd/modules/mod_setenvif.so
LoadModule dir_module lib/httpd/modules/mod_dir.so
LoadModule alias_module lib/httpd/modules/mod_alias.so
LoadModule authz_core_module lib/httpd/modules/mod_authz_core.so
LoadModule authz_host_module lib/httpd/modules/mod_authz_host.so
LoadModule status_module lib/httpd/modules/mod_status.so
LoadModule unixd_module lib/httpd/modules/mod_unixd.so

# Document Root and Directory Configuration

<VirtualHost \*:8080>
ServerAdmin webmaster@localhost
DocumentRoot "/Users/ben/dev/moodle"
ServerName localhost

    <FilesMatch \.php$>
        SetHandler application/x-httpd-php
    </FilesMatch>

    <Directory "/Users/ben/dev/moodle">
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

</VirtualHost>

# Logging Configuration

ErrorLog "/usr/local/var/log/httpd/error_log"
LogLevel warn
CustomLog "/usr/local/var/log/httpd/access_log" common

# DirectoryIndex: sets the file that Apache will serve if a directory is requested.

<IfModule dir_module>
    DirectoryIndex index.php index.html
</IfModule>

# Accept access to .ht\* files

<Files ".ht\*">
Require all granted
</Files>

# Enable server-status page

<Location "/server-status">
SetHandler server-status
Require all granted
</Location>

#Locate the User and Group Directives:
User \_www
Group \_www

# How to run moodle whit docker for development

Install Docker and Docker-Compose. [link](https://docs.docker.com/engine/install/)

Open the terminal and `cd` to main directory. After that, run command below to start moodle container for development:

```bash
docker-compose up --build -d
```

For stop container you can use command below:

```bash
docker-compose down
```

### Run faster

For more confteble to run moodle with docker you can build a docker image and after that change `docker-compose.yml` file.
follow step below:

- ```bash
  docker build . -t corax
  ```

- Open `docker-compose.yml` file and comment `build` key in `moodle` service. add `image` key to `moodle` service under commented `build` key whit `corax:latest` value.

- ```bash
  docker-compose up -d
  ```

## Documentation

- Read our [User documentation][3]
- Discover our [developer documentation][5]
- Take a look at our [demo site][4]

## Community

[moodle.org][1] is the central hub for the Moodle Community, with spaces for educators, administrators and developers to meet and work together.

You may also be interested in:

- attending a [Moodle Moot][6]
- our regular series of [developer meetings][7]
- the [Moodle User Association][8]

## Installation and hosting

Moodle is Free, and Open Source software. You can easily [download Moodle][9] and run it on your own web server, however you may prefer to work with one of our experienced [Moodle Partners][10].

Moodle also offers hosting through both [MoodleCloud][11], and our [partner network][10].

## License

Moodle is provided freely as open source software, under version 3 of the GNU General Public License. For more information on our license see

[1]: https://moodle.org
[2]: https://moodle.com
[3]: https://docs.moodle.org/
[4]: https://sandbox.moodledemo.net/
[5]: https://moodledev.io
[6]: https://moodle.com/events/mootglobal/
[7]: https://moodledev.io/general/community/meetings
[8]: https://moodleassociation.org/
[9]: https://download.moodle.org
[10]: https://moodle.com/partners
[11]: https://moodle.com/cloud
[12]: https://moodledev.io/general/license
