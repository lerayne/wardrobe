<?php
/**
 * Created by PhpStorm.
 * User: Lerayne
 * Date: 21.02.2015
 * Time: 1:19
 */

require_once '../includes/backend_initial.php';
require_once '../includes/funcs.php';

$result = Array();

$rootdir = '../../';

$uploaddir = 'assets/temp/';


foreach ($_FILES as $file){

	if(move_uploaded_file($file['tmp_name'], $rootdir . $uploaddir . basename($file['name']))) {
		$files[] = './' . $uploaddir . $file['name'];
	}

	$result['data']['files'] = $files;
}

require_once '../includes/backend_final.php';