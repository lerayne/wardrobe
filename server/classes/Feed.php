<?php
/**
 * Created by PhpStorm.
 * User: Lerayne
 * Date: 09.02.14
 * Time: 18:26
 */
// класс чтения обновлений сервера
class Feed {

	function __construct() {

	}


	function get_agencies($request, $meta = Array()) {
		global $cfg, $db, $user;

		$result = Array();

		// defaults
		$request = load_defaults($request, $request_defaults = Array(
			'sort' => 'updated',
			'sort_direction' => 'desc',
			'filter' => ''
		));

		$meta = load_defaults($meta, $meta_defaults = Array(
			'updates_since' => '0' // работает как false, а в SQL-запросах по дате - как 0
		));

		// режим обновления?
		$update_mode = !!$meta['updates_since'];

		//$GLOBALS['debug']['meta'] = $meta['updates_since'];

		// are there any updates?
		$latest_update_date = $db->selectCell('
			SELECT MAX(updated) FROM ?_agencies
			WHERE updated > ?d
			',
			(int) $meta['updates_since']
		);

		//$GLOBALS['debug']['$latest_update_date'] = $latest_update_date;

		// if not - return everything as it is
		if (!$latest_update_date) return Array(Array(), $meta);

		$raw_agencies = $db->select('
			SELECT
				ags.id,
				ags.name,
				ags.title,
				ags.cover,
				ags.author_id,
				usr.login AS author_login,
				usr.display_name AS author_name
			FROM ?_agencies ags
			LEFT JOIN ?_users usr ON ags.author_id = usr.id
			WHERE updated > ?d
			',
			$meta['updates_since']
		);

		$agencies = sort_by_field($raw_agencies, $request['sort']);

		// milestone for future requests
		$meta['updates_since'] = $latest_update_date;

		return Array($agencies, $meta);
	}

}