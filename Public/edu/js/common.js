	
var edu = {
	success: function(msg,url) {
		var success_alert = `
			<div class="alert alert-success">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">×</span>
					<span class="sr-only">Close</span>
				</button>		
				<div class="alert-content">`+msg+`</div>
			</div>
		`;
		$('.alert-container').html(success_alert);
		$(".alert-container .alert").hide().slideDown();				
		setTimeout(function(){
			$(".alert-container .alert").slideUp();
			if(url){
				window.location.href = url;
			}
		},3000);
	},
	error: function(msg,url) {
		var error_alert = `
			<div class="alert alert-danger">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				<div class="alert-content">`+msg+`</div>
			</div>
		`;
		$('.alert-container').html(error_alert);
		$(".alert-container .alert").hide().slideDown();				
		setTimeout(function(){
			$(".alert-container .alert").slideUp();
			if(url){
				window.location.href = url;
			}
		},5000);
	},
	dataTable: function() {
		$("#data-table").dataTable({
			"oLanguage": {
				"sLengthMenu": "每页显示 _MENU_ 条记录",
				"sZeroRecords": "抱歉， 没有找到",
				"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
				"sInfoEmpty": "没有数据",
				"sInfoFiltered": "(从 _MAX_ 条数据中检索)",
				"oPaginate": {
					"sFirst": "首页",
					"sPrevious": "上一页",
					"sNext": "下一页",
					"sLast": "末页"
				},	
				"sZeroRecords": "没有相关数据"
			}
		});
	}
}