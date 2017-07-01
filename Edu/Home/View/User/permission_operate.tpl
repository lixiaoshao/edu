<include file="Public:header" />
<body class="page-body">
	<include file="Public:alert" />
	<div class="page-container">
	<include file="Public:menu" />
		<div class="main-content">
			<include file="Public:user_tips"/>
			<div class="page-title">
				<div class="title-env">
					<h1 class="title">权限管理</h1>
					<p class="description"></p>
				</div>
				<div class="breadcrumb-env">
					<ol class="breadcrumb bc-1">
						<li><a href="#"><i class="fa-home"></i>权限操作</a></li>
						<li class="active">权限操作</a></li>
					</ol>		
				</div>
			</div>
			<div class="panel panel-default">
				<div class="page-loading-overlay">
					<div class="loader-2"></div>
				</div>
				<div class="panel-heading"></div>
				<div class="panel-body">
					<form role="form" class="form-horizontal" id="permission">
						<input type="hidden" name="id" value="{$permission.id|default='0'}" />
						<div class="form-group">
							<label class="col-sm-2 control-label" for="name">权限名称:</label>
							<div class="col-sm-4">
								<input type="text" name="name" class="form-control" placeholder="权限名称" value="{$permission.name|default=''}" />
							</div>
							<label class="col-sm-2 control-label" for="label">label(url):</label>
							<div class="col-sm-4">
								<input type="text" name="label" class="form-control" placeholder="c=index&a=index" value="{$permission.name|default='c=index&a=index'}" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="module">模块:</label>
							<div class="col-sm-4">
								<input type="text" name="module" class="form-control" placeholder="home" value="{$permission.name|default='home'}" />
							</div>
							<label class="col-sm-2 control-label" for="label">描述:</label>
							<div class="col-sm-4">
								<input type="text" name="name" class="form-control" placeholder="描述权限" value="{$permission.name|default=''}" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-4 pull-right">
								<button class="btn btn-secondary" onclick="permission.doSubmit()" type="button">提交</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var permission = {
			doSubmit: function(){
				var form_data = $('#permission').serialize();
				$.post("/?m=home&c=user&a=permissionOperate",{permission:form_data}, function(data){
					if(data.code == 0){
						edu.error(data.message);
					}else{
						edu.success(data.message, '/?m=home&c=user&a=permissionList');
					}
				},"json");
			}
		}
	</script>
<include file="Public:footer" />