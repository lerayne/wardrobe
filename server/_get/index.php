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

		// todo - unify subscription and usual selects
		$result['item'] = $db->selectRow('SELECT * FROM ?_items WHERE id = ?', $_REQUEST['id']);
		$result['layers'] = $db->select('SELECT * FROM ?_layers WHERE item_id = ?', $_REQUEST['id']);
		$result['instances'] = $db->select('SELECT * FROM ?_item_instances WHERE item_id = ?', $_REQUEST['id']);

		break;

	case 'default_items':

		// assume that the first item created will be the default
		$result = $db->select('
			SELECT
				ins.id AS ins_id,
				lrs.id AS layer_id,
				lrs.x_offset,
				lrs.y_offset,
				lrs.z_index,
				ins.file,
				slv.id AS shelf_id
			FROM ?_layers lrs
			JOIN ?_items itm ON lrs.item_id = itm.id AND itm.default = 1
			JOIN ?_item_instances ins ON ins.item_id = itm.id
			JOIN ?_shelves slv ON itm.shelf_id = slv.id
			WHERE itm.model_id = ?
			GROUP BY lrs.id
			',
			$_REQUEST['model']
		);

		break;
}

require_once '../includes/backend_final.php';