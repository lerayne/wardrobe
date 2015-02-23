<?php
/**
 * Created by PhpStorm.
 * User: Lerayne
 * Date: 20.02.2015
 * Time: 22:51
 */

class Actions {
	function __construct() {

	}

	function add_shelf($params){
		global $db;

		$name_exists = $db->selectCell('SELECT id FROM ?_shelves WHERE name = ?', $params['name']);

		if (!$name_exists) {

			$now = now();

			$new_row['name'] = $params['name'];
			$new_row['title'] = $params['title'];
			$new_row['model_id'] = $params['model'];
			$new_row['z_index'] = $params['z_index'];
			$new_row['created'] = $now;
			$new_row['updated'] = $now;
			$new_row['author_id'] = 1; // todo login

			$new_shelf_id = $db->query('INSERT INTO ?_shelves (?#) VALUES (?a)', array_keys($new_row), array_values($new_row));

			$model = $db->selectRow('SELECT id, name FROM ?_models WHERE id = ?', $params['model']);
			$agency = $db->selectRow('SELECT id, name FROM ?_agencies WHERE id = ?', $model['id']);

			$path = './assets/agencies/'.$agency['name'].'/'.$model['name'];
		} else {
			$GLOBALS['debug']['error'] = 'name exists!';
		}
	}


	function add_item($params) {
		global $db, $result;

		$GLOBALS['debug']['params'] = $params;

		// get agency and model
		$path_data = $db->selectRow('
			SELECT
				slv.model_id,
				mdl.name AS model_name,
				ags.id AS agency_id,
				ags.name AS agency_name
			FROM ?_shelves slv
			LEFT JOIN ?_models mdl ON mdl.id = slv.model_id
			LEFT JOIN ?_agencies ags ON ags.id = mdl.agency_id
			WHERE slv.id = ?
			',
			$params['shelf']
		);

		if ($path_data['model_id'] && !$params['bypass_write']) {
			$now = now();

			$new_item['name'] = $params['name'];
			$new_item['title'] = $params['title'];
			$new_item['shelf_id'] = $params['shelf'];
			$new_item['model_id'] = $path_data['model_id'];
			$new_item['author_id'] = 1; // todo login
			$new_item['z_index'] = $params['z_index'];
			$new_item['created'] = $now;
			$new_item['updated'] = $now;

			$new_item_id = $db->query('INSERT INTO ?_items (?#) VALUES (?a)', array_keys($new_item), array_values($new_item));

			$new_layer['item_id'] = $new_item_id;
			$new_layer['z_index'] = $params['z_index'];
			$new_layer['x_offset'] = 0;
			$new_layer['y_offset'] = 0;

			$new_layer_id = $db->query('INSERT INTO ?_layers (?#) VALUES (?a)', array_keys($new_layer), array_values($new_layer));

			$new_instance['item_id'] = $new_item_id;
			$new_instance['layer_id'] = $new_layer_id;
			$new_instance['file'] = '';
			$new_instance['icon'] = '';

			$new_instance_id = $db->query('INSERT INTO ?_item_instances (?#) VALUES (?a)', array_keys($new_instance), array_values($new_instance));

			$path = 'assets/agencies/'.$path_data['agency_name'].'/'.$path_data['model_name'].'/'.dechex($new_instance_id).'.png';

			rename('../../'.$params['image'], '../../'.$path);

			$edit_instance['file'] = $path;

			$db->query('UPDATE ?_item_instances SET ?a WHERE id = ?', $edit_instance, $new_instance_id);

			$path_data['path'] = $path;
			$path_data['instance_id'] = $new_instance_id;

			$result['return'] = $path_data;
		}
	}
} 