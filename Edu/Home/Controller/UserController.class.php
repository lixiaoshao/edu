<?php
namespace Home\Controller;
use Think\Controller;
use Home\Common\Config;

class UserController extends BaseController {

	public function index() {
		$m_user = M('User');
    	$user = $m_user->where('deleted = null')->select();
    	$this->user = $user;
        $this->display('index');
	}
	public function permissionList() {
		$m_permission = M('Permissions');
		$permission = $m_permission->select();
		$this->permission = $permission;
		$this->display('permission_list');
	}
	public function userOperate() {
		$config = new Config();
		$d_user = D('User');
		if(IS_POST){
			parse_str($_POST['user'], $data);
			$id = intval($data['id']);
			$validate = $d_user->validate($data);
			if($validate['status'] == 0){
				$result = array('code' => 0, 'message' => $validate['msg']);
				echo json_encode($result);
				return;
			}
			if($id){
				$data['updated_at'] = date('Y-m-d H:i:s');
				$res = $d_user->where('id = %d', $id)->save($data);
			}else{
				$data['filled'] = getRandomStr();
				$data['passwd'] = md5(md5($data['passwd']).$data['filled']);
				$data['created_at'] = date('Y-m-d H:i:s');
				$data['updated_at'] = date('Y-m-d H:i:s');
				$res = $d_user->data($data)->add();
			}
			if($res){
				$result = array('code' => 1, 'message' => '用户操作成功！');
			}else{
				$result = array('code' => 0, 'message' => '用户操作失败！');
			}
			echo json_encode($result);
			return;
		}else{
			$user = $d_user->where('id = %d', intval($_GET['id']))->find();
			$this->user = $user;
			$this->form_config = $config->form['user_type'];
			$this->display('user_operate');
		}
	}
	public function roleOperate() {
		
	}
	public function permissionOperate() {
		$m_permission = M('Permissions');
		if(IS_POST){
			parse_str($_POST['permission'], $data);
			$id = intval($data['id']);
			if($id){
				$data['updated_at'] = date('Y-m-d H:i:s');
				$res = $m_permission->where('id = %d', $id)->save($data);
			}else{
				$data['created_at'] = date('Y-m-d H:i:s');
				$data['updated_at'] = date('Y-m-d H:i:s');
				$res = $m_permission->data($data)->add();
			}
			if($res){
				$result = array('code' => 1, 'message' => '权限操作成功！');
			}else{
				$result = array('code' => 0, 'message' => '权限操作失败！');
			}
			echo json_encode($result);
			return;
		}else{
			$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
			if($id){
				$permission = $m_permission->where('id = %d', intval($_GET['id']))->find();
				$this->permission = $permission;
			}
			$this->display('permission_operate');
		}
	}
	public function userView() {
		$m_user = M('User');
		$id = intval($_GET['id']);
		$user_info = $m_user->where('id = %d', $id)->find();
		$this->user_info = $user_info;
		$this->display('view');
	}
}