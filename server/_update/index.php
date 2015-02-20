<?php
/**
 * Created by PhpStorm.
 * User: M. Yegorov
 * Date: 2015-02-20
 * Time: 10:54
 */

require_once '../includes/backend_initial.php';
require_once '../includes/funcs.php';
require_once '../classes/Feed.php';


function parse_request($request) {
	global $user, $db;

	$result = array();

	// write the latest user access time to db
	if ($user->id > 0) {

		$data = array(
			'last_read' => now('sql'),
			'status' => 'online'
		);

		$db->query('UPDATE ?_users SET ?a WHERE id = ?d', $data, $user->id);
	}

	///////////////////////////////
	// Записываем в базу обновления
	///////////////////////////////

	if ($request['write']) {

		$writes = $request['write'];
		$now = now('sql');

		foreach ($writes as $write_index => $write) {
			switch ($write['action']) {


			}
		}
	}

	/////////////////////////////
	// выдаем данные по подпискам
	/////////////////////////////

	if ($request['subscribe']) {

		$subscribers = $request['subscribe'];

		if ($request['meta']) $meta = $request['meta'];

		// есть ли подписчики и хоть что-то обновленное на сервере?
		if (count($subscribers)) {

			$feed = new Feed();

			foreach ($subscribers as $subscriberId => $subscriptions) {

				foreach ($subscriptions as $feedName => $params) {

					// вызываем метод get_[имя фида]
					$method_name = 'get_' . $params['feed'];

					list($feed_data, $feed_meta) =  $feed->$method_name($params, $meta[$subscriberId][$feedName]);

					$feed_meta = strip_nulls($feed_meta);

					if (count($feed_data)) $result['feeds'][$subscriberId][$feedName] = $feed_data;
					if (count($feed_meta)) $result['meta'][$subscriberId][$feedName] = $feed_meta;
				}
			}
		}
	}

	return $result;
}


$result = array('data' => parse_request($_REQUEST));

require_once '../includes/backend_final.php';