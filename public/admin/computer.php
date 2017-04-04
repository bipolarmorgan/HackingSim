<?php
/**
 * Created by PhpStorm.
 * User: srainsdon
 * Date: 3/30/2017
 * Time: 5:52 AM
 */


if (isset($_POST['submit'])) {
    if ($_POST['submit'] == 'Edit') {
        if (!$sql->updateComputer($_POST)) {
            $smarty->assign('alert', "Edit Failed");
        } else {
            $smarty->assign('message', "Edit Successful!!!");
        }
    } elseif ($_POST['submit'] == 'Add') {
        $res = $sql->addComputer($_POST['ComputerHostName'], $_POST['ComputerDomain'], $_POST['ComputerIP'], $_POST['ComputerNetwork']);
        print_r($sql);
        if ($res) {
            $smarty->assign('message', "Computer {$_POST['ComputerHostName']} was added!");
        } else {
            $smarty->assign('alert', "ERROR:\n$res");
        }
    }
}
if (isset($computerId) && $computerId != '') {
    $tempData = array();
    foreach ($sql->getNetworkList() as $row) {
        $tempData[$row['NetworkID']] = $row['NetName'];
    }
    if ($computerId == 'add') {
        $smarty->append('bCrumbs', "<a href='/admin/computer/' >Computer List</a>");
        $smarty->append('bCrumbs', "<a>New Computer</a>");
        $smarty->assign("Networks", $tempData);
        $smarty->assign('task', "Add");
        $smarty->display('computer.tpl');
    } else {
        $smarty->append('bCrumbs', "<a href='/admin/computer/' >Computer List</a>");
        $smarty->append('bCrumbs', "<a>Computer Editor</a>");
        $smarty->assign("Computer", $sql->getComputerByID($computerId));
        $smarty->assign("Networks", $tempData);
        $smarty->assign('task', "Edit");
        $smarty->display('computer.tpl');
    }
} else {
    $smarty->append('bCrumbs', "<a>Computer List</a>");
    $smarty->assign("computers", $sql->getAllComputers());
    $smarty->display('list.tpl');
}