<?php

/* OPTIONAL: Display errors only on local development instance */
if ( getenv("NODE_ENV") == "development" ) {
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
} else {
    ini_set('display_errors', 0);
    ini_set('display_startup_errors', 0);
    error_reporting(0);
}

require("/var/www/vendor/autoload.php");

$bigfoot = Bigfoot::CMS("./.config.ini");

$bigfoot->run();