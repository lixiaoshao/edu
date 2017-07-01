<?php
namespace Home\Model;
use Think\Model;

class UserModel extends Model {
	
	protected $_validate = array(
	    array('name|passwd','require','姓名必须！|密码不能为空!'),
	    array('passwd|repasswd','confirm','两次密码输入不一致！'),
	    array('email','unique','该Email已存在！'),
    );
    public function validate($data) {
    	$rule = array_column($this->_validate, 1);
    	foreach($rule as $key => $value){
    		$field = explode('|', $this->_validate[$key][0]);
    		switch($value){
    			case 'require' :
    				$msg = explode('|', $this->_validate[$key][2]);
    				foreach($field as $k => $v){
    					//排除 编辑时密码的情况
    					if($v == 'passwd' && !empty($data['id'])){
    						continue;
    					}
    					if(empty($data[$v])){
    						return array('status' => 0, 'msg' => $msg[$k]);
    					}
    				}
    			break;
    			case 'confirm' :
    				if($data[$field[0]] != $data[$field[1]]){
    					return array('status' => 0, 'msg' => $this->_validate[$key][2]);
    				}
    			break;
    			case 'unique' :
    				$field = $this->_validate[$key][0];
    				if(isset($data['id'])){
    					$where['id'] = array('neq', $data['id']);
    				}
    				$where[$field] = $data[$field];
    				if($data[$field]){
    					$res = M('User')->where($where)->find();
	    				if($res){
	    					return array('status' => 0, 'msg' => $this->_validate[$key][2]);
	    				}
    				}
    			break;
    		}
    	}
    	return array('status' => 1);
    }
}