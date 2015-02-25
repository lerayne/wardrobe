<?php
/**
 * Created by PhpStorm.
 * User: M. Yegorov
 * Date: 2015-02-25
 * Time: 14:10
 */

require_once '../includes/backend_initial.php';
require_once '../includes/funcs.php';

$result = Array();

$rootdir = '../../';

switch ($_REQUEST['subject']){
	case 'item':

		$result['item'] = $db->selectRow('SELECT * FROM ?_items WHERE id = ?', $_REQUEST['id']);
		$result['layers'] = $db->select('SELECT * FROM ?_layers WHERE item_id = ?', $_REQUEST['id']);
		$result['instances'] = $db->select('SELECT * FROM ?_item_instances WHERE item_id = ?', $_REQUEST['id']);

		break;

	case 'default_item':

		// assume that the first item created will be the default
		$result['id'] = $db->selectCell('SELECT id FROM ?_items WHERE model_id = ? ORDER BY id LIMIT 1', $_REQUEST['model']);

		break;
}

require_once '../includes/backend_final.php';