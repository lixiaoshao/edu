<?php
/*
 * @params $a array
 * @return array
*/
function dd($a) {
	echo '<pre>';
	print_r($a);
	echo '</pre>';
	die;
}
/* 
 * 生成随机字符串
 * @params $figures
 * @return string
*/
function getRandomStr($figures = 6){
	// a-z
	$arr = array();
	for($i = 97; $i <= 122; $i++){
		$arr[] = chr($i);
	}
	//A-Z
	for($i = 65; $i <= 90; $i++){
		$arr[] = chr($i);
	}
	// 0-9
	for($i = 0; $i <= 9; $i++){
		$arr[] = $i;
	}
	// _
	$arr[] = '_';
	$len = count($arr);
	$str = '';
	$new_arr = array();
	for($i = 0; $i < $figures; $i++){
		$index = rand(0,$len);
		$new_arr[] = $arr[$index];
	}
	$str = implode('', $new_arr);
	return $str;
}