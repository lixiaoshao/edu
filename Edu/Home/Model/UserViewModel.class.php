<?php 
namespace Home\Model;
use Think\Model\ViewModel;

class UserViewModel extends ViewModel {
	public $viewFields = array(
		'user' => array('id','name','age','phone','email','type','is_active','created_at', '_type' => 'LEFT'),
		'role_user' => array('role_id','user_id', '_on' => 'user.id = role_user.user_id', '_type' => 'LEFT'),
		'permission_role' => array('permission_id', '_on' => 'role_user.role_id = permission_role.role_id', '_type' => 'LEFT'),
		'permissions' => array('name' => 'permission_name','label', '_on' => 'permission_role.permission_id = permissions.id')
	);
}