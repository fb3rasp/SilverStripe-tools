<?php

global $project;
$project = 'mysite';

global $database;
$database = 'ss_databasename';

require_once('conf/ConfigureFromEnv.php');

// Use Postgresql Database. Uncomment this section if you want to use MySQL
if(defined('SS_PGSQL_DATABASE_SERVER')) {
	$databaseConfig=array(
		'type' => 'PostgreSQLDatabase',
		'server' => SS_PGSQL_DATABASE_SERVER,
		'username' => SS_PGSQL_DATABASE_USERNAME ? SS_PGSQL_DATABASE_USERNAME :  SS_DATABASE_USERNAME,
		'password' => SS_PGSQL_DATABASE_PASSWORD ? SS_PGSQL_DATABASE_PASSWORD : SS_DATABASE_PASSWORD,
		'database' => $database
	);
}

MySQLDatabase::set_connection_charset('utf8');

// Set the current theme. More themes can be downloaded from
// http://www.silverstripe.org/themes/
SSViewer::set_theme('blackcandy');

// Enable nested URLs for this site (e.g. page/sub-page/)
if(class_exists('SiteTree')) SiteTree::enable_nested_urls();