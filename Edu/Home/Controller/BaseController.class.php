<?php

namespace Home\Controller;
use Think\Controller;

class BaseController extends Controller {

	public function auth($params = '') {
		$result = $this->run($params);
		if($result['code'] == 0){
			$this->data = $result;
			$this->display('public/edu_entrance_judge');
			die;
		}
	}
	protected function run($params = '') {
		$controller = strtolower(CONTROLLER_NAME);
		$action = strtolower(ACTION_NAME);
		$allow = isset($params['allow']) ? $params['allow'] : array();

		$result = array('code' => 0, 'message' => '', 'url' => '');
		if(!session('?user_id') || !session('?user_name')){
			$result['message'] = '请先登录。。。';
			$result['url'] = '/?m=home&c=login&a=index';
			return $result;
		}
		if(session('?admin') || in_array($action, $allow)){
			$result['code'] = 1;
			return $result;
		}
		$d_user_view = D('UserView');
		$label = $controller.'/'.$action;
		$user = $d_user_view->where('user.id = %d and permissions.label = "%s"', session('user_id'), $label)->find();
		if(!empty($user) && intval($user['permission_id']) > 0){
			$result['code'] = 1;
			return $result;
		}else{
			$result['message'] = '您没有权限！';
			return $result;
		}
	}
}