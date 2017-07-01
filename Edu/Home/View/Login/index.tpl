<include file="Public:header" />
<body class="page-body login-page login-light">
<include file="Public:alert" />
	<div class="login-container">
		<div class="row">	
			<div class="col-sm-6">
				<!-- Add class "fade-in-effect" for login form effect -->
				<form method="post" role="form" id="login" class="login-form fade-in-effect">					
					<div class="login-header">
						<a href="dashboard-1.html" class="logo">
							<img src="__PUBLIC__/assets/images/logo-white-bg@2x.png" alt="" width="80" />
							<span>log in</span>
						</a>						
						<p>Dear user, log in to access the admin area!</p>
					</div>					
					<div class="form-group">
						<label class="control-label" for="username">用户名:</label>
						<input type="text" class="form-control" name="name" id="name" autocomplete="off" />
					</div>
										
					<div class="form-group">
						<label class="control-label" for="passwd">密码:</label>
						<input type="password" class="form-control" name="passwd" id="passwd" autocomplete="off" />
					</div>
					<div class="form-group">
						<div class="col-sm-3" style="font-weight: bold; margin-top: 2px;">账号类型:</div>				
						<div class="col-sm-9" style="margin-bottom: 10px;">
							<label>
								<input type="radio" name="type" value="1" checked />
								管理员
							</label>&nbsp;&nbsp;
							<label>
								<input type="radio" name="type" value="2" />
								教师
							</label>&nbsp;&nbsp;
							<label>
								<input type="radio" name="type" value="3" />
								学生
							</label>&nbsp;&nbsp;
						</div>
					</div>
		
					<div class="form-group">
						<button type="submit" class="btn btn-primary  btn-block text-left">
							<i class="fa-lock"></i>
							Log In
						</button>
					</div>
					
					<div class="login-footer">
						<a href="#">忘记密码？</a>
					</div>					
				</form>				
			</div>			
		</div>
	</div>
	<script type="text/javascript">
	jQuery(document).ready(function($)
	{
		// Reveal Login form
		setTimeout(function(){ $(".fade-in-effect").addClass('in'); }, 1);
		
		
		// Validation and Ajax action
		$("form#login").validate({
			rules: {
				username: {
					required: true
				},
				
				passwd: {
					required: true
				}
			},
			
			messages: {
				username: {
					required: 'Please enter your username.'
				},
				
				passwd: {
					required: 'Please enter your password.'
				}
			},
			
			// Form Processing via AJAX
			submitHandler: function(form)
			{
				show_loading_bar(70); // Fill progress bar to 70% (just a given value)
				
				var opts = {
					"closeButton": true,
					"debug": false,
					"positionClass": "toast-top-full-width",
					"onclick": null,
					"showDuration": "300",
					"hideDuration": "1000",
					"timeOut": "5000",
					"extendedTimeOut": "1000",
					"showEasing": "swing",
					"hideEasing": "linear",
					"showMethod": "fadeIn",
					"hideMethod": "fadeOut"
				};
					
				$.ajax({
					url: "/?m=home&c=login&a=login",
					method: 'POST',
					dataType: 'json',
					async: false,
					data: {
						do_login: true,
						name: $(form).find('#name').val(),
						passwd: $(form).find('#passwd').val(),
						type: $(form).find('[name="type"]:checked').val(),
					},
					success: function(data)
					{
						show_loading_bar({
							delay: .5,
							pct: 100,
							finish: function(){
								
								// Redirect after successful login page (when progress bar reaches 100%)
								if(data.accessGranted){
									url = '?a=home&c=index&a=index';
									edu.success(data.message,url);
								}
							}
						});
						
						// Show errors
						if(data.accessGranted == false){
							edu.error(data.message);baseparam
						}
					}
				});
				
			}
		});
		
		// Set Form focus
		$("form#login .form-group:has(.form-control):first .form-control").focus();
	});
</script>
<include file="Public:footer" />