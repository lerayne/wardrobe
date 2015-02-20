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

		$GLOBALS['debug']['params'] = $params;

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
} 