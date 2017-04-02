<?php
/**
 * Created by PhpStorm.
 * User: srainsdon
 * Date: 3/30/2017
 * Time: 5:52 AM
 */
include_once 'admin.config.php';

$data = $sql->getFixedIPs();
$newData = array();
foreach ($data as $row) {
    $row['NewLong'] = rand($row['NetworkStart'], $row['NetworkEnd']);
    $row['NewIP'] = long2ip($row['NewIP']);
    $newData[] = $row;
}

$smarty->assign("bCrumbs", "Full Computer List");
//$smarty->assign("computers", $sql->getAllComputers());
$smarty->assign("computers", $newData);
$smarty->display('Fixlist.tpl');