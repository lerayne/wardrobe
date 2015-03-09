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

	case 'instances':

		if ($_REQUEST['defaults']) $defaults = 1;
		if ($_REQUEST['multiple']) $multiple = 1;

		$result = $db->select('
			SELECT
				ins.id AS ins_id,
				lrs.id AS layer_id,
				ins.file,
				lrs.x_offset,
				lrs.y_offset,
				lrs.z_index,
				slv.id AS shelf_id,
				slv.name AS shelf_name,
				slv.title AS shelf_title,
				slv.cover AS shelf_cover,
				slv.z_index AS shelf_z_index,
				slv.required AS shelf_required
			FROM ?_layers lrs
			JOIN ?_items itm ON lrs.item_id = itm.id {AND itm.default = ?}
			JOIN ?_item_instances ins ON ins.item_id = itm.id
			JOIN ?_shelves slv ON itm.shelf_id = slv.id
			{WHERE ins.id IN (?a)}
			{WHERE itm.model_id = ?d}
			GROUP BY lrs.id
			',
			$defaults ? 1 : DBSIMPLE_SKIP,
			$multiple ? explode(',', $_REQUEST['ids']) : DBSIMPLE_SKIP,
			$defaults ? $_REQUEST['model'] : DBSIMPLE_SKIP
		);

		foreach ($result as $i => $item) {
			$result[$i]['shelf'] = Array(
				'id' => $item['shelf_id'],
				'name' => $item['shelf_name'],
				'title' => $item['shelf_title'],
				'cover' => $item['shelf_cover'],
				'z_index' => $item['shelf_z_index'],
				'required' => $item['shelf_required'],
			);

			unset(
				$result[$i]['shelf_id'],
				$result[$i]['shelf_name'],
				$result[$i]['shelf_title'],
				$result[$i]['shelf_cover'],
				$result[$i]['shelf_z_index'],
				$result[$i]['shelf_required']
			);
		}

		break;
}

require_once '../includes/backend_final.php';