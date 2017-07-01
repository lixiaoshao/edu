<?php
namespace Home\Controller;
use Think\Controller;
class LoginController extends Controller {
    public function index() {
        $this->display('index');
    }
    public function login() {
    	if(isset($_POST['do_login']) && isset($_POST['name']) && isset($_POST['passwd'])){
    		$name = trim($_POST['name']);
    		$passwd = trim($_POST['passwd']);
    		$type = intval($_POST['type']);

    		if(!empty(cookie('accessFailed'.$name)) && cookie('accessFailed'.$name) > 3){
	    		$message = '您尝试登录次数已超过3次，请3分钟之后再登录！';
	    		$result = array('accessGranted' => 0, 'message' => $message);
	    		echo json_encode($result);
	    		return;
	    	}

    		$m_user = M('User');
    		$user = $m_user->where(array('name' => $name, 'type' => $type))->find();
    		if($user['passwd'] == md5(md5($passwd).$user['filled'])){
    			if($user['is_active'] == 0){
    				$result = array('accessGranted' => 0 , 'message' => '账号还未启用！请联系管理员！');
    			}else{
                    session(array('expire'=>3600));
    				/*权限判断*/
    				if(!$user['is_admin']){
    					$m_role_user = M('RoleUser');
    					$roles = $m_role_user->where(array('user_id' => $user['id']))->getField('role_id',true);
    					if(empty($roles)){
	    					$result = array('accessGranted' => 0, 'message' => '您没有权限！');
	    					echo json_encode($result);
	    					return;
	    				}
    				}else{
    					$roles = '*';
                        session('admin',1);
    				}
					$ip = $_SERVER["REMOTE_ADDR"];
					$m_user->where('id = %d', $user['id'])->setField('ip',$ip);
					session('user_id', $user['id']);
					session('user_name', $user['name']);
					session('role_id', $roles);
					$result = array('accessGranted' => 1, 'message' => '登录成功！');
    				/*权限判断*/
    			}
    		}else{
    			$accessFailed = !empty(cookie('accessFailed'.$name)) ? cookie('accessFailed'.$name) : 0;
	    		$accessFailed++;
	    		cookie('accessFailed'.$name, $accessFailed, 180);
    			$message = '账号或密码错误！您还有 '. (3-$accessFailed).' 次登录机会！';
    			$result = array('accessGranted' => 0, 'message' => $message);
    		}
    	}else{
    		$result = array('accessGranted' => 0, 'message' => '参数错误！');
    	}
    	echo json_encode($result);
    }
}