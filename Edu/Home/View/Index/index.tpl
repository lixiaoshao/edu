<include file="Public:header" />
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
						<li class="active">用户列表</a></li>
					</ol>		
				</div>
			</div>
			<div class="panel panel-default">
				<div class="page-loading-overlay">
					<div class="loader-2"></div>
				</div>
				<div class="panel-heading">
					<a href="/?m=home&c=user&a=user_operate" class="btn btn-info">添加</a>
				</div>
				<div class="panel-body">
					<table id="data-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>姓名</th>
								<th>年龄</th>
								<th>联系方式</th>
								<th>email</th>
								<th>最后登录ip</th>
								<th>创建日期</th>
								<th>身份</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
					
						<!-- <tfoot>
							<tr>
								<th>Name</th>
								<th>Position</th>
								<th>Office</th>
								<th>Age</th>
								<th>Start date</th>
								<th>Salary</th>
							</tr>
						</tfoot> -->
					
						<tbody>
							<volist name="user" id="vo">
							<tr>
								<td>{$vo.name}</td>
								<td>{$vo.age}</td>
								<td>{$vo.phone}</td>
								<td>{$vo.email}</td>
								<td>{$vo.ip}</td>
								<td>{$vo.created_at}</td>
								<td>
									<switch name="vo.type">
										<case value="1">管理员</case>
										<case value="2">教师</case>
										<case value="3">学生</case>
									</switch>
								</td>
								<td>
									<if condition="$vo['is_active'] eq 1">
										禁用
										<else/>
										启用
									</if>
								</td>
								<td>
									<a href="/?m=home&c=user&a=user_operate&id={$vo['id']}" class="fa-pencil" title="修改"></a>&nbsp;&nbsp;
									<a href="/?m=home&c=user&a=userView&id={$vo['id']}" class="fa-bars" title="详情"></a>
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