<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/base.jsp" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>网上书店</title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css">
	<link rel="stylesheet" href="/static/css/font-awesome.css">
	<link rel="stylesheet" href="/static/css/style2.css">
	<link rel="stylesheet" href="/static/css/pic.css">
	<link rel="stylesheet" href="/static/css/jquery.Jcrop.min.css">
</head>
<body>

	<div class="container-fluid" >&nbsp; 
		<div class="content">
		<%@ include file="include/top.jsp"%>
        	<!-- head end-->
        	<div class="container-fluid">
        		<div class="row-fluid">
					<form class="form-horizontal fm basic-fm" action="/user/portpic" method="post">
						<legend>头像设置</legend>
						<div id="drop_zone">将头像文件拖拽到此处</div>
						<div style="margin-top:20px;text-align:center">
							<input type="button" value="剪裁并上传" class="btn btn-large" disabled="">	
						</div>
					</form>	        			
	        	</div>
	        	<%@ include file="include/foot.jsp"%>
        	</div>
    	</div>
	</div>
	<script type="text/javascript" src="/static/js/jquery.js"></script>
	<script type="text/javascript" src="/static/js/jquery.Jcrop.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var file = null;
			$('#drop_zone').bind('dragover',function(event){
				$("#img").remove();
				$(".jcrop-holder").remove();
				$(".btn").attr('disabled','disabled');
				file = null;

	         	$(event.target).html("你,放开那个图片...");
			   	event.stopPropagation();
			   	event.preventDefault();  
			});
			$('#drop_zone').bind('dragleave',function(event){
	          $(event.target).html("将头像文件拖拽到此处");
			   event.stopPropagation();
			   event.preventDefault();  
			});
			$('#drop_zone').bind('drop',function(event){
			   //$.FileUpload($(event.target).attr('path'),event.originalEvent.dataTransfer.files);
			   event.stopPropagation();
			   event.preventDefault();

			   var files = event.originalEvent.dataTransfer.files;
			   //处理单个文件
			   if(files.length > 0) {
			   		file = files.item(0);
			   		//处理图片
			   		if(file.type.match('image.*')){
			   			if(file.size > 512000) {
			   				$(event.target).html("图片文件最大为500K,请重新选择");
			   				return;
			   			}
			   			var fileReader = new FileReader();
				   		fileReader.onload = function(){
				   			$("#drop_zone").html("").append("<img id='img' src='"+fileReader.result+"'>");
				   			
				   			$("#img").Jcrop({
				   				setSelect:[0,0,100,100],
				   				aspectRatio:1/1,
				   				minSize:[100,100],
				   				maxSize:[200,200],
				   				onChange: showCoords,
								onSelect: showCoords,
								onRelease:function(){
									$(".btn").attr('disabled','disabled');
								}
				   			});
				   			
				   		};		
				   		fileReader.readAsDataURL(file);
				   		$(".btn").removeAttr("disabled");
			   		} else {
			   			$(event.target).html("将头像文件拖拽到此处");
			   		}
			   }
			   
			});
			
			var x1,x2,y1,y2;
			function showCoords(c)
			{
				x1 = c.x;
				y1 = c.y;
				x2 = c.x2;
				y2 = c.y2;
				$(".btn").removeAttr("disabled");
			};

			$(".btn").click(function(){
				if(file != null) {
					var formData = new FormData();
					formData.append("userfile",file);
					formData.append("x1",x1);
					formData.append("x2",x2);
					formData.append("y1",y1);
					formData.append("y2",y2);
					var xmlhttp = new XMLHttpRequest();
					 xmlhttp.open("post",'/user/portpic',true);
					xmlhttp.onreadystatechange = function(){
						if(xmlhttp.status == 200) {
							if(xmlhttp.readyState == 4) {
								if(xmlhttp.responseText == 'suc') {
									window.location.href='/user/home';
								}
							}
						}
					};
					xmlhttp.send(formData);
					$(this).attr('disabled','disabled');
					$(this).val("上传中,请稍后...");
				}
			});
		});
	</script>
</body>
</html>