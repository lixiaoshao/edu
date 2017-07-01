<include file="Public:header" />
<body class="page-body">
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
						<li><a href="#"><i class="fa-home"></i>权限管理</a></li>
						<li class="active">权限列表</a></li>
					</ol>		
				</div>
			</div>
			<div class="panel panel-default">
				<div class="page-loading-overlay">
					<div class="loader-2"></div>
				</div>
				<div class="panel-heading">
					<a href="/?m=home&c=user&a=permissionOperate" class="btn btn-info">添加</a>
				</div>
				<div class="panel-body">
					<table id="data-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>权限名称</th>
								<th>label(url)</th>
								<th>模块</th>
								<th>修改时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<volist name="permission" id="vo">
							<tr>
								<td>{$vo.name}</td>
								<td>{$vo.label}</td>
								<td>{$vo.module}</td>
								<td>{$vo.updated_at}</td>
								<td>
									<a href="/?m=home&c=user&a=permissionOperate&id={$vo['id']}" class="fa-pencil" title="修改"></a>&nbsp;&nbsp;
								</td>
							</tr>
							</volist>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</div>
<include file="Public:datatables" />
<script type="text/javascript">
jQuery(document).ready(function($){
	edu.dataTable();
});
</script>
<include file="Public:footer" />