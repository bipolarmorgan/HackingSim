<?php
/**
 * Created by PhpStorm.
 * User: srainsdon
 * Date: 4/2/2017
 * Time: 5:19 AM
 */

$smarty->assign('body', getIpInfo());

$smarty->display('main.tpl');