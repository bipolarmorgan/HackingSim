<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);
require_once ('../vendor/autoload.php');
Logger::configure($_SERVER["DOCUMENT_ROOT"] . '/../log4php.xml');
$corePDO = \HackSim\Database\core::getInstance();
echo nl2br(print_r(\HackSim\Database\User::getUserData(), true));