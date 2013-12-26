<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>账号注册</title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css">
	<link rel="stylesheet" href="/static/css/elusive-webfont.css">
	<link rel="stylesheet" href="/static/css/style.css">
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
	  .form-signin .fm input[type='text'],.form-signin .fm input[type='email'],.form-signin .fm input[type='password'] {
		width: 365px;
	  }
	  .help-block{
	  	text-align: right;
	  	color:#888;
	  }
    </style>
</head>
<body>
	
	<div class="container">

    	<div class="widget form-signin" style="margin-top:40px;margin-left:410px;width:380px;">
			<h3><i class="icon-lock-alt"></i> 网上书店-账号注册</h3>
			<form action="/user/reg" method="post" class="fm">
				<label>电子邮件</label>
				<input type="text" name="email">
				<label>昵称</label>
				<input type="text" name="userName">
				<span class="help-block">注册成功后不能修改</span>
				<label>密码</label>
				<input type="password" id="password" name="password">
				<label>确认密码</label>
				<input type="password" name="repassword"><br>
				<button class="btn pull-right" type="button">注册</button>
				
				<div class="clearfix"></div>
			</form>
		</div>
    </div> 
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/validate/jquery.validate.js"></script>
    <script>
    	$(function(){
    		$(".fm").validate({
    			rules:{
    				email:{
    					required:true,
    					email:true,
    					remote:'/user/validate/email'
    				},
    				userName:{
    					required:true,
    					remote:'/user/validate/userName'
    				},
    				password:{
    					required:true,
    					rangelength:[6,18]
    				},
    				repassword:{
    					required:true,
    					rangelength:[6,18],
    					equalTo:'#password'
    				}
    			},
    			messages:{
    				email:{
    					required:'请输入电子邮件账号',
    					email:'电子邮件格式错误',
    					remote:'该电子邮件已注册'
    				},
    				userName:{
    					required:'请输入昵称',
    					remote:'该昵称已被占用'
    				},
    				password:{
    					required:'请输入密码',
    					rangelength:'密码长度6~18位'
    				},
    				repassword:{
    					required:'请输入确认密码',
    					rangelength:'密码长度6~18位',
    					equalTo:'两次密码不一致'
    				}
    			}
    		});
    		$(".btn").click(function(){
    			$(".fm").submit();
    		});
    		
    	});
    </script>
</body>
</html>

