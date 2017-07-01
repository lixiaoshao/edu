<include file="Public:header" />
<style type="text/css">
	.panel-edu{
		padding: 0 15px;
		background-color: #009788;
		color: #fff;
		font-size: 16px;
		line-height: 40px;
	}
</style>
<body class="page-body">
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
						<li><a href="#"><i class="fa-home"></i>用户管理</a></li>
						<li class="active">用户详情</a></li>
					</ol>		
				</div>
			</div>
			<div class="panel panel-default">
				<div class="page-loading-overlay">
					<div class="loader-2"></div>
				</div>
				<div class="panel-edu">用户详情</div>
				<div class="panel-body view">
					<div class="form-group">
						<label class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-4">{$user_info.name}</div>
						<label class="col-sm-2 control-label">年龄</label>
						<div class="col-sm-4">{$user_info.age}</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">联系方式</label>
						<div class="col-sm-4">{$user_info.phone}</div>
						<label class="col-sm-2 control-label">email</label>
						<div class="col-sm-4">{$user_info.email}</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">最后登录ip</label>
						<div class="col-sm-4">{$user_info.ip}</div>
						<label class="col-sm-2 control-label">创建日期</label>
						<div class="col-sm-4">{$user_info.created_at}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<include file="Public:footer" />