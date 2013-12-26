<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="/static/css/elusive-webfont.css"/>
	<link rel="stylesheet" href="/static/css/style.css"/>
	<style type="text/css">
      body {
        padding-top: 70px;
        background-image: url(/static/img/reg.gif);
        padding-bottom: 40px;
      }

      .form-signin {
        max-width: 430px;
        margin: 0px auto;
      }
	  .form-signin .fm input[type='text'],.form-signin .fm input[type='password'] {
		width: 365px;
	  }
	  input {
	  height:40px;
	  	padding:5px;
	  }
    </style>
</head>
<body>
	
	<div class="container">

    	<div class="widget form-signin  " style="margin-left:450px;margin-top:100px;">
			<h1>网上书店</h1>
			<form action="/user/login" method="post" class="fm" style="width:380px">
				<c:choose>
					<c:when test="${code == '1001' }">
						<div class="alert alert-error">
						  <button type="button" class="close" data-dismiss="alert">&times;</button>
						  账号或密码错误
						</div>
					</c:when>
					<c:when test="${code == '1002' }">
						<div class="alert alert-error">
						  <button type="button" class="close" data-dismiss="alert">&times;</button>
						  审核未通过，请稍后
						</div>
					</c:when>
					<c:when test="${code == '1003' }">
						<div class="alert alert-error">
						  <button type="button" class="close" data-dismiss="alert">&times;</button>
						该账号已被禁用
						</div>
					</c:when>
				</c:choose>
			
				<label><h4>电子邮件</h4></label>
				<input type="text" name="email" style="height:30px;"><br>
				<label><h4>密码</h4></label>
				<input type="password" id="password" name="password" style="height:30px;"><br>
				<button type="button" class="login btn-primary pull-right">进入系统</button>
				<a href="/user/reg" style="color:#000">注册账号</a>
				<div class="clearfix"></div>
			</form>
		</div>
    </div> 
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/validate/jquery.validate.js"></script>
    <script src="/static/js/sha.js"></script>
    <script>
    	$(function(){
    		$(".login").click(function(){
    			$("#password").val(CryptoJS.SHA1($("#password").val()));
    			$(".fm").submit();
    		});
    		$(".fm").validate({
    			rules:{
    				'email':{
    					required:true,
    					email:true
    				},
    				'password':{
    					required:true,
    					minlength:6
    				}
    			},
    			messages:{
    				'email':{
    					required:'请输入电子邮件地址',
    					email:'电子邮件格式错误'
    				},
    				'password':{
    					required:"请输入密码",
    					minlength:"密码至少六位"
    				}

    			}
    		});
    	});
    </script>
</body>
</html>