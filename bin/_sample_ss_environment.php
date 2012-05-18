<?php
/* This file gives SilverStripe information about the environment that it's running in */

define('SS_ENVIRONMENT_TYPE', 'dev');
define('SS_ENVIRONMENT_STYLE', 'shared');

// mysql configuration
define('SS_DATABASE_SERVER', '127.0.0.1');
define('SS_DATABASE_USERNAME', '[username]');
define('SS_DATABASE_PASSWORD', '[password]');

// postgres configuration
define('SS_PGSQL_DATABASE_SERVER', 'localhost');
define('SS_PGSQL_DATABASE_USERNAME', '[username]');
define('SS_PGSQL_DATABASE_PASSWORD', '[password]');

define('SS_DATABASE_CHOOSE_NAME', true);

define('SS_DEFAULT_ADMIN_USERNAME', 'admin');
define('SS_DEFAULT_ADMIN_PASSWORD', 'password');

define('SS_SEND_ALL_EMAILS_TO', '[email-address]');

global $_FILE_TO_URL_MAPPING;
// $_FILE_TO_URL_MAPPING['/Users/rainer/Sites'] = 'http://localhost';