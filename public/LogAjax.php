<?php
/**
 * Created by PhpStorm.
 * User: srainsdon
 * Date: 4/26/2017
 * Time: 10:10 AM
 */
$rows = 25;
if (isset($_REQUEST['rows']))
    $rows = $_REQUEST['rows'];
error_reporting(E_ALL);
ini_set("display_errors", 1);
require_once('../vendor/autoload.php');
Logger::configure($_SERVER["DOCUMENT_ROOT"] . '/../log4php.xml');
$dev = new \HackSim\Core\Development();
$data = $dev->getLogTail($rows);
header("content-type: application/json");
echo json_encode(array('data' => $data));