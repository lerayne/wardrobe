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

	function add_agency($params) {
		global $db, $result, $env;

		global $db;

		$name_exists = $db->selectCell('SELECT id FROM ?_agencies WHERE name = ?', $params['name']);

		if (!$name_exists) {

			$now = now();

			$new_row['name'] = $params['name'];
			$new_row['title'] = $params['title'];
			$new_row['created'] = $now;
			$new_row['updated'] = $now;
			$new_row['author_id'] = 1; // todo login
			$new_row['updater'] = 1; // todo login
			$new_row['update_cause'] = 'this item created';

			$new_agency_id = $db->query('INSERT INTO ?_agencies (?#) VALUES (?a)', array_keys($new_row), array_values($new_row));

			mkdir($env['assets'].'assets/agencies/'.$params['name'], '0777', true);

			$result['return'] = Array('agency_id' => $new_agency_id);
		} else {
			$result['error'] = 'name exists!';
		}
	}


	function add_model($params) {
		global $db, $result, $env;

		global $db;

		$name_exists = $db->selectCell('SELECT id FROM ?_models WHERE name = ? AND agency_id = ?', $params['name'], $params['agency']);

		if (!$name_exists) {

			$agency = $db->selectRow('SELECT id, name, title FROM ?_agencies WHERE id = ?', $params['agency']);

			$now = now();

			$new_row['name'] = $params['name'];
			$new_row['title'] = $params['title'];
			$new_row['size'] = $params['size'];
			$new_row['created'] = $now;
			$new_row['updated'] = $now;
			$new_row['author_id'] = 1; // todo login
			$new_row['agency_id'] = $params['agency'];
			$new_row['updater'] = 1; // todo login
			$new_row['update_cause'] = 'this item created';

			$new_model_id = $db->query('INSERT INTO ?_models (?#) VALUES (?a)', array_keys($new_row), array_values($new_row));

			$time_update['updated'] = $now;
			$time_update['updater'] = 1; // todo login
			$time_update['update_cause'] = 'new model ('.$params['name'].') created';

			$db->query('UPDATE ?_agencies SET ?a WHERE id = ?', $time_update, $params['agency']);

			mkdir($env['assets'].'assets/agencies/'.$agency['name'].'/'.$params['name'], '0777', true);

			$result['return'] = Array('model_id' => $new_model_id);
		} else {
			$result['error'] = 'name exists!';
		}
	}

	function add_shelf($params){
		global $db, $env;

		$name_exists = $db->selectCell('SELECT id FROM ?_shelves WHERE name = ? AND model_id = ?', $params['name'], $params['model']);

		if (!$name_exists) {

			$now = now();

			$new_row['name'] = $params['name'];
			$new_row['title'] = $params['title'];
			$new_row['model_id'] = $params['model'];
			$new_row['z_index'] = $params['z_index'];
			$new_row['created'] = $now;
			$new_row['updated'] = $now;
			$new_row['author_id'] = 1; // todo login
			$new_row['updater'] = 1; // todo login
			$new_row['update_cause'] = 'this item created';
			$new_row['required'] = $params['required'];

			$new_shelf_id = $db->query('INSERT INTO ?_shelves (?#) VALUES (?a)', array_keys($new_row), array_values($new_row));

			$time_update['updated'] = $now;
			$time_update['updater'] = 1; // todo login
			$time_update['update_cause'] = 'new shelf ('.$params['name'].') created';

			$db->query('UPDATE ?_models SET ?a WHERE id = ?', $time_update, $params['model']);

			$agency_id = $db->selectCell('SELECT agency_id FROM ?_models WHERE id = ?', $params['model']);

			$db->query('UPDATE ?_agencies SET ?a WHERE id = ?', $time_update, $agency_id);

		} else {
			$result['error'] = 'name exists!';
		}
	}


	function add_item($params) {
		global $db, $result, $env;

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

			// write item
			$new_item['name'] = $params['name'];
			$new_item['title'] = $params['title'];
			$new_item['shelf_id'] = $params['shelf'];
			$new_item['model_id'] = $path_data['model_id'];
			$new_item['author_id'] = 1; // todo login
			$new_item['updater'] = 1; // todo login
			$new_item['update_cause'] = 'this item created';
			$new_item['z_index'] = $params['z_index'];
			$new_item['created'] = $now;
			$new_item['updated'] = $now;

			$new_item_id = $db->query('INSERT INTO ?_items (?#) VALUES (?a)', array_keys($new_item), array_values($new_item));

			//update times
			$time_update['updated'] = $now;
			$time_update['updater'] = 1; // todo login
			$time_update['update_cause'] = 'new item ('.$params['name'].') created';

			$db->query('UPDATE ?_shelves SET ?a WHERE id = ?', $time_update, $params['shelf']);
			$db->query('UPDATE ?_models SET ?a WHERE id = ?', $time_update, $path_data['model_id']);
			$db->query('UPDATE ?_agencies SET ?a WHERE id = ?', $time_update, $path_data['agency_id']);

			// write default layer
			$new_layer['item_id'] = $new_item_id;
			$new_layer['z_index'] = $params['z_index'];
			$new_layer['x_offset'] = 0;
			$new_layer['y_offset'] = 0;

			$new_layer_id = $db->query('INSERT INTO ?_layers (?#) VALUES (?a)', array_keys($new_layer), array_values($new_layer));

			//write default instance
			$new_instance['item_id'] = $new_item_id;
			$new_instance['file'] = '';
			$new_instance['icon'] = '';
			$new_instance['title'] = 'Default';

			$new_instance_id = $db->query('INSERT INTO ?_item_instances (?#) VALUES (?a)', array_keys($new_instance), array_values($new_instance));

			// save main file
			$filename = $params['name'].'.'.dechex($new_instance_id);

			$filepath = 'assets/agencies/'.$path_data['agency_name'].'/'.$path_data['model_name'].'/'.$filename;
			$filepath_layer = $filepath.'.'.dechex($new_layer_id).'.png';

			rename($env['assets'].$params['image'], $env['assets'].$filepath_layer);

			// update instance (write files paths)
			$edit_instance['file'] = $filepath;

			$db->query('UPDATE ?_item_instances SET ?a WHERE id = ?', $edit_instance, $new_instance_id);

			// todo temp thunbnail
			$db->query('UPDATE ?_items SET cover = ? WHERE id = ?', $filepath_layer, $new_item_id);

			// make returned data
			$path_data['filepath'] = $filepath_layer;
			$path_data['item_id'] = $new_item_id;
			$path_data['instance_id'] = $new_instance_id;

			$result['return'] = $path_data;
		}
	}


	function add_instance($params) {
		global $db, $result, $env;

		// get agency and model
		$path_data = $db->selectRow('
			SELECT
				itm.id AS item_id,
				itm.name AS item_name,
				mdl.id AS model_id,
				mdl.name AS model_name,
				ags.id AS agency_id,
				ags.name AS agency_name
			FROM ?_items itm
			LEFT JOIN ?_shelves slv ON itm.shelf_id = slv.id
			LEFT JOIN ?_models mdl ON slv.model_id = mdl.id
			LEFT JOIN ?_agencies ags ON mdl.agency_id = ags.id
			WHERE itm.id = ?
			',
			$params['item']
		);

		$layer_id = $db->selectCell('SELECT id FROM ?_layers WHERE item_id = ? ORDER BY id LIMIT 1', $params['item']);

		$new_item['item_id'] = $params['item'];
		$new_item['title'] = $params['title'];
		$new_item['file'] = '';
		$new_item['icon'] = '';

		$new_instance_id = $db->query('INSERT INTO ?_item_instances (?#) VALUES (?a)', array_keys($new_item), array_values($new_item));

		// save main file
		$filename = $path_data['item_name'].'.'.dechex($new_instance_id);

		$filepath = 'assets/agencies/'.$path_data['agency_name'].'/'.$path_data['model_name'].'/'.$filename;
		$filepath_layer = $filepath.'.'.dechex($layer_id).'.png';

		rename($env['assets'].$params['image'], $env['assets'].$filepath_layer);

		// update instance (write files paths)
		$edit_instance['file'] = $filepath;

		$db->query('UPDATE ?_item_instances SET ?a WHERE id = ?', $edit_instance, $new_instance_id);
	}
} 