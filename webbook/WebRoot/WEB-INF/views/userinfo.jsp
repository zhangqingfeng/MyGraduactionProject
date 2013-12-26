<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/base.jsp" %>
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

	<div class="container-fluid">
		<div class="content">
        	<%@ include file="include/top.jsp" %>
        	
        	<ul class="breadcrumb">
	            <li><a href="/user/home">首页</a> <span class="divider">/</span></li>
	            <li><a href="/user/userinfo">用户中心</a> <span class="divider">/</span></li>
	        </ul>

	        <div class="container-fluid">

	        	<div class="row-fluid">
	        		<%@ include file="include/left.jsp" %>
	        		<div class="span9">
	        			<h1>${user.userName }:欢迎你的到来</h1>
	        	</div>
	        	
				<%@ include file="include/foot.jsp" %>
				                    
	        
	        </div>


		 </div>
	      
        </div>
	</div>
	
</body>
</html>