<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/base.jsp"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Book store</title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css">
	<link rel="stylesheet" href="/static/css/font-awesome.css">
	<link rel="stylesheet" href="/static/css/style2.css">
</head>
<body>

	<div class="container" style="margin:20px auto">
		<div class="content">
        	<%@ include file="include/top.jsp" %>
        	<!-- head end-->
        	

	        <div class="container-fluid">

	        	
	        	<div class="row-fluid">
				    <div class="http-error">
				        <div class="http-error-message">
				            <div class="error-caption">
				                <p ><i class="icon-thumbs-up"></i></p>
				            </div>
				            <div class="error-message">
				                <p>订单提交成功</p>
				                <p class="return-home"><a href="/user/home">返回首页</a></p>
				            </div>
				        </div>
				    </div>
				</div>
				<%@ include file="include/foot.jsp" %>
				                    
	        
	        </div>



	        <!-- -->
        </div>
	</div>
	
</body>
</html>