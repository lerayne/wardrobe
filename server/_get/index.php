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

	case 'default_items':

		// assume that the first item created will be the default
		$result = $db->selectCol('
			SELECT itm.id
			FROM ?_shelves slv
			JOIN ?_items itm ON slv.id = itm.shelf_id AND itm.default = 1
			WHERE slv.model_id = ?
			',
			$_REQUEST['model']
		);

		break;
}

require_once '../includes/backend_final.php';