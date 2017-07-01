<include file="Public:header" />
<body class="page-body">
	<include file="Public:alert" />
	<div class="page-container">
	<include file="Public:menu" />
		<div class="main-content">
			<include file="Public:user_tips"/>
			<div class="page-title">
				<div class="title-env">
					<h1 class="title">用户管理</h1>
					<p class="description"></p>
				</div>
				<div class="breadcrumb-env">
					<ol class="breadcrumb bc-1">
						<li><a href="#"><i class="fa-home"></i>用户编辑</a></li>
						<li class="active">用户编辑</a></li>
					</ol>		
				</div>
			</div>
			<div class="panel panel-default">
				<div class="page-loading-overlay">
					<div class="loader-2"></div>
				</div>
				<div class="panel-heading"></div>
				<div class="panel-body">
					<form role="form" class="form-horizontal" id="user">
						<input type="hidden" name="id" value="{$user.id|default='0'}" />
						<div class="form-group">
							<label class="col-sm-2 control-label" for="name">姓名:</label>
							<div class="col-sm-4">
								<input type="text" name="name" class="form-control" placeholder="姓名" value="{$user.name|default=''}" />
							</div>
							<label class="col-sm-2 control-label" for="field-1">身份:</label>
							<div class="col-sm-4">
								<select class="form-control" name="type">
									<foreach name="form_config" item="type">
										<option value="{$key}" <if condition="$user['type'] eq $key">selected</if>>{$type}</option>
									</foreach>
								</select>
							</div>
						</div>
						<if condition="$user['id'] eq null">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="passwd">密码:</label>
							<div class="col-sm-4">
								<input type="password" name="passwd" class="form-control" id="passwd" placeholder="密码" value="123456">
							</div>
							<label class="col-sm-2 control-label" for="repasswd">重复密码:</label>
							<div class="col-sm-4">
								<input type="password" name="repasswd" class="form-control" id="repasswd" placeholder="重复密码" value="123456">
							</div>
						</div>
						</if>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="phone">联系方式:</label>
							<div class="col-sm-4">
								<input type="text" name="phone" class="form-control" id="phone" placeholder="联系方式" value="{$user.phone|default=''}">
							</div>
							<label class="col-sm-2 control-label" for="email">Email:</label>
							<div class="col-sm-4">
								<input type="text" name="email" class="form-control" id="email" placeholder="Email" value="{$user.email|default=''}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="phone">年龄:</label>
							<div class="col-sm-4">
								<input type="text" name="age" class="form-control" id="age" placeholder="年龄" value="{$user.age|default=''}">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-4 pull-right">
								<button class="btn btn-secondary" onclick="user.doSubmit()" type="button">提交</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var user = {
			doSubmit: function(){
				var form_data = $('#user').serialize();
				$.post("/?m=home&c=user&a=userOperate",{user:form_data}, function(data){
					if(data.code == 0){
						edu.error(data.message);
					}else{
						edu.success(data.message, '/?m=home&c=user&a=index');
					}
				},"json");
			}
		}
	</script>
<include file="Public:footer" />