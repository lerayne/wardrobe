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
			$new_row['update_cause'] = 'this agency created';

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
			$new_row['update_cause'] = 'this model created';

			$new_model_id = $db->query('INSERT INTO ?_models (?#) VALUES (?a)', array_keys($new_row), array_values($new_row));

			$this->update_times(
				'new model ('.$params['name'].') created',
				$now,
				$params['agency']
			);

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
			$new_row['update_cause'] = 'this shelf created';
			$new_row['required'] = $params['required'];

			$new_shelf_id = $db->query('INSERT INTO ?_shelves (?#) VALUES (?a)', array_keys($new_row), array_values($new_row));

			$agency_id = $db->selectCell('SELECT agency_id FROM ?_models WHERE id = ?', $params['model']);

			$this->update_times(
				'new shelf ('.$params['name'].') created',
				$now,
				$agency_id,
				$params['model']
			);

		} else {
			$result['error'] = 'name exists!';
		}
	}


	function add_item($params) {
		global $db, $env;

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
			$new_item['name'] = $params['item_name'];
			$new_item['title'] = $params['item_title'];
			$new_item['shelf_id'] = $params['shelf'];
			$new_item['model_id'] = $path_data['model_id'];
			$new_item['author_id'] = 1; // todo login
			$new_item['updater'] = 1; // todo login
			$new_item['update_cause'] = 'this item created';
			$new_item['z_index'] = $params['z_index'];
			$new_item['created'] = $now;
			$new_item['updated'] = $now;

			$new_item_id = $db->query('INSERT INTO ?_items (?#) VALUES (?a)', array_keys($new_item), array_values($new_item));
			$path_data['item_id'] = $new_item_id;

			// set default
			if ($params['default']) {
				$GLOBALS['debug']['set_as_Default'] = true;
				$db->query('UPDATE ?_items SET `default` = 0 WHERE shelf_id = ?', $params['shelf']);
				$db->query('UPDATE ?_items SET `default` = 1 WHERE id = ?', $new_item_id);
			}

			// write default layer
			$new_layer_id = $this->add_layer(array_merge($params, Array(
				'item' => $new_item_id
			)));

			//write default instance
			$instance_data = $this->add_instance(array_merge($params, Array(
				'layer' => $new_layer_id,
				'item' => $new_item_id,
				'skip_time_update' => true,
				'set_cover' => true
			)));

			$this->update_times(
				'new item ('.$params['item_title'].') created',
				$now,
				$path_data['agency_id'],
				$path_data['model_id'],
				$params['shelf']
			);

			// make returned data
			$created = array_merge($path_data, $instance_data);

			return $created;
		}
	}


	function update_item($params){
		global $db;

		foreach ($params['layers'] as $layer){
			$new_params = Array(
				'x_offset' => $layer['x_offset'],
				'y_offset' => $layer['y_offset'],
				'z_index' => $layer['z_index']
			);

			$db->query('UPDATE ?_layers SET ?a WHERE id = ?', $new_params, $layer['id']);
		}

		$item = $db->selectRow('
				SELECT
					itm.*,
					mdl.agency_id,
					slv.required
				FROM ?_items itm
				JOIN ?_shelves slv ON itm.shelf_id = slv.id
				JOIN ?_models mdl ON itm.model_id = mdl.id
				WHERE itm.id = ?
				',
			$params['id']
		);

		$now = now();

		if ($params['default'] && !$item['default']){

			$db->query('UPDATE ?_items SET `default` = 0, updated = ? WHERE shelf_id = ?d AND `default` = 1', $now, $item['shelf_id']);
			$db->query('UPDATE ?_items SET `default` = 1 WHERE id = ?d', $item['id']);

			$this->update_times(
				'default item changed to ' . $item['title'],
				$now,
				$item['agency_id'],
				$item['model_id'],
				$item['shelf_id'],
				$item['id']
			);
		}

		if ($params['default'] == 'false' && $item['default']){

			if (!$item['required']) {
				$db->query('UPDATE ?_items SET `default` = 0, updated = ? WHERE id = ?', $now, $item['id']);
			} else {
				return 'required shelf should have default item!';
			}
		}
	}


	function delete_item($params){
		global $db, $env;

		// collect deletion data
		$item_to_delete = $db->selectRow('
			SELECT
				itm.title,
				itm.shelf_id,
				itm.model_id,
				mdl.agency_id,
				itm.default,
				slv.required
			FROM ?_items itm
			JOIN ?_shelves slv ON slv.id = itm.shelf_id
			JOIN ?_models mdl ON mdl.id = itm.model_id
			JOIN ?_agencies ags ON ags.id = mdl.agency_id
			WHERE itm.id = ?
			',
			$params['id']
		);

		$layers_to_delete = $db->selectCol('
			SELECT
				id
			FROM ?_layers
			WHERE item_id = ?
			'
			,$params['id']
		);

		$instances_to_delete = $db->selectCol('
			SELECT
				file
			FROM ?_item_instances
			WHERE item_id = ?
			',
			$params['id']
		);

		$GLOBALS['debug']['$item_to_delete'] = $item_to_delete;
		//$GLOBALS['debug']['$layers_to_delete'] = $layers_to_delete;
		//$GLOBALS['debug']['$instances_to_delete'] = $instances_to_delete;

		// check for last item deletion if shelf is required
		$items_count = $db->selectCell('SELECT count(id) FROM ?_items WHERE shelf_id = ?', $item_to_delete['shelf_id']);

		$GLOBALS['debug']['$items_count'] = $items_count;

		if ($items_count == '1' && $item_to_delete['required'] == '1') {
			return "cant delete last item from required shelf!";
		}

		// delete files
		foreach ($instances_to_delete as $file) {
			foreach ($layers_to_delete as $layer_id) {
				unlink($env['assets'].$file.'.'.dechex($layer_id).'.png');
			}
		}

		// delete db entries
		$db->query('DELETE FROM ?_item_instances WHERE item_id = ?', $params['id']);
		$db->query('DELETE FROM ?_layers WHERE item_id = ?', $params['id']);
		$db->query('DELETE FROM ?_items WHERE id = ?', $params['id']);

		// set new default if needed
		if ($item_to_delete['default'] != '0') {
			$db->query('UPDATE ?_items SET default = 1 WHERE shelf_id = ? ORDER BY id LIMIT 1', $item_to_delete['shelf_id']);
		}

		//update time
		$this->update_times(
			'item '. $item_to_delete['title'] .' deleted',
			now(),
			$item_to_delete['agency_id'],
			$item_to_delete['model_id'],
			$item_to_delete['shelf_id']
		);
	}


	function add_layer($params){
		global $db;

		$layers_count = $db->selectCell('SELECT COUNT(id) FROM ?_layers WHERE item_id = ?', $params['item']);

		if ($layers_count <= 3) {
			$new_layer['item_id'] = $params['item'];
			$new_layer['z_index'] = $params['z_index'];
			$new_layer['x_offset'] = 0;
			$new_layer['y_offset'] = 0;

			$new_layer_id = $db->query('INSERT INTO ?_layers (?#) VALUES (?a)', array_keys($new_layer), array_values($new_layer));

			return $new_layer_id;
		} else {
			return "item's layer cap of 3 reached";
		}
	}


	function delete_layer($params){
		global $db;

		// select file paths
		$to_delete = $db->select('
			SELECT
				ins.file
			FROM ?_layers lrs
			JOIN ?_item_instances ins ON lrs.item_id = ins.item_id
			WHERE lrs.id = ?
			'
			, $params['id']
		);

		//delete db entry
		$db->query('DELETE FROM ?_layers WHERE id = ?', $params['id']);

		//delete files
		foreach ($to_delete as $file) {
			unlink($file.'.'.dechex($params['id']).'.png');
		}
	}


	function add_instance($params) {
		global $db, $env;

		// get agency and model
		$path_data = $db->selectRow('
			SELECT
				itm.id AS item_id,
				itm.name AS item_name,
				itm.shelf_id,
				itm.title AS item_title,
				mdl.id AS model_id,
				mdl.name AS model_name,
				ags.id AS agency_id,
				ags.name AS agency_name
			FROM ?_items itm
			JOIN ?_shelves slv ON itm.shelf_id = slv.id
			JOIN ?_models mdl ON slv.model_id = mdl.id
			JOIN ?_agencies ags ON mdl.agency_id = ags.id
			WHERE itm.id = ?
			',
			$params['item']
		);

		$layer_id = $params['layer'] ? $params['layer'] : $db->selectCell('SELECT id FROM ?_layers WHERE item_id = ? ORDER BY id LIMIT 1', $params['item']);

		// create db entry
		$new_item['item_id'] = $params['item'];
		$new_item['title'] = $params['instance_title'] ? $params['instance_title'] : 'Default';
		$new_item['file'] = '';
		$new_item['icon'] = '';

		$new_instance_id = $db->query('INSERT INTO ?_item_instances (?#) VALUES (?a)', array_keys($new_item), array_values($new_item));

		// save file
		$filename = $path_data['item_name'].'.'.dechex($new_instance_id);

		$filepath = 'assets/agencies/'.$path_data['agency_name'].'/'.$path_data['model_name'].'/'.$filename;
		$filepath_layer = $filepath.'.'.dechex($layer_id).'.png';

		rename($env['assets'].$params['image'], $env['assets'].$filepath_layer);

		// update instance (write files paths)
		$edit_instance['file'] = $filepath;

		$db->query('UPDATE ?_item_instances SET ?a WHERE id = ?', $edit_instance, $new_instance_id);

		// todo - temp thunbnail, make real one
		if ($params['set_cover']) {
			$db->query('UPDATE ?_items SET cover = ? WHERE id = ?', $filepath_layer, $params['item']);
		}

		//update times
		if (!$params['skip_time_update']) {
			$this->update_times(
				'new instance ("'.$params['instance_title'].'") of item "'.$path_data['item_title'].'" created',
				now(),
				$path_data['agency_id'],
				$path_data['model_id'],
				$path_data['shelf_id'],
				$params['item']
			);
		}

		return Array(
			'instance_id' => $new_instance_id,
			'filepath' => $filepath_layer
		);
	}



	function upload_stencil ($params){
		global $db, $env;

		$instance = $db->selectRow('SELECT file FROM ?_item_instances WHERE id = ?', $params['instance']);

		$filepath = $instance['file'].'.'.dechex($params['layer']).'.png';

		rename($env['assets'].$params['image'], $env['assets'].$filepath);
	}



	function update_times ($cause, $now, $agency, $model=false, $shelf=false, $item=false){
		global $db, $env;

		$time_update['updated'] = $now;
		$time_update['updater'] = 1; // todo login
		$time_update['update_cause'] = $cause;

		if ($item) {
			$db->query('UPDATE ?_items SET ?a WHERE id = ?', $time_update, $item);
		}

		if ($shelf) {
			$db->query('UPDATE ?_shelves SET ?a WHERE id = ?', $time_update, $shelf);
		}

		if ($model){
			$db->query('UPDATE ?_models SET ?a WHERE id = ?', $time_update, $model);
		}

		$db->query('UPDATE ?_agencies SET ?a WHERE id = ?', $time_update, $agency);
	}



	function add_saved($params){
		global $db;

		$model_id = $db->selectCell('
			SELECT itm.model_id
			FROM ?_item_instances ins
			JOIN ?_items itm ON ins.item_id = itm.id
			WHERE ins.id = ?
			',
			$params['instances'][0]
		);

		$now = now();

		$new_item['user_id'] = $params['user_id'];
		$new_item['model_id'] = $model_id;
		$new_item['data'] = join(',', $params['instances']);
		$new_item['created'] = $now;
		$new_item['updated'] = $now;

		$db->query('INSERT INTO ?_saved (?#) VALUES (?a)', array_keys($new_item), array_values($new_item));

	}


	function delete_saved ($params){
		global $db;

		$db->query('DELETE FROM ?_saved WHERE id = ?d', $params['id']);
	}
} 