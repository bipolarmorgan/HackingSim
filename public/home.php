<?php
/**
 * Created by PhpStorm.
 * User: srainsdon
 * Date: 4/2/2017
 * Time: 5:19 AM
 */

$smarty->assign('links', array(
    'Admin' => '/admin/',
));

$smarty->display('adminHome.tpl');