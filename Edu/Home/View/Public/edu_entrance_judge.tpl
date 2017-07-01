<include file="Public:header"/>
<body class="page-body">
	<include file="Public:alert" />
	<script type="text/javascript">
		if('{$data.code}' == 0){
			if('{$data.url}'){
				edu.error('{$data.message}','{$data.url}');
			}else{
				edu.error('{$data.message}','/?m=home&c=index&a=index');
			}
		}
	</script>
</body>
</html>
