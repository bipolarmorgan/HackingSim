<?php
/**
 * Created by PhpStorm.
 * User: srainsdon
 * Date: 4/12/2017
 * Time: 6:25 PM
 */

include_once '../config.php';

$cidr = new cidr();
$ip = new ipv4('28.237.245.45/24');
echo "<h3>" . $ip->getAddress() . "/" . $ip->getCidr() . "</h3>";
$cidrValue = $ip->getCidr();
$netMask = $cidr->cidr2netmask($cidrValue);
echo "cidr2netmask: $cidrValue $netMask<br />\n";
echo "cidr2network: 28.237.245.45\24 " . $cidr->cidr2network('28.237.245.45', 24) . "<br />\n";
echo "netmask2cidr: $netMask " . $cidr->netmask2cidr($netMask) . "<br />\n";
echo "cidr_match: 28.237.245.45/24 " . $cidr->cidr_match('28.237.245.45', '28.237.245.0', '24') . "<br />\n";

$netList = $sql->getNetworkList();
foreach ($netList as $row) {
    $netData = explode(" - ", $row['NetName']);
    $netIP = new ipv4($netData[1] . '/24');
    echo $netIP->getAddress() . ":" . nl2br(print_r($netIP, 1)) . "<br />";
}

$all = $ip->getAllAddress();
reset($all);
echo "First: " . current($all) . " Last: " . end($all);
/*
$settings = new appSettings();
$settings->setData('name', 'ssh');
$settings->setData('version', '0.12');
$settings->setPorts(22,"open");
echo $settings->getData();
*/