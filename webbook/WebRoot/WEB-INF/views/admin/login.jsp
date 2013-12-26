<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<!-- Always force latest IE rendering engine or request Chrome Frame -->
  <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
	<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
  <link rel="stylesheet" href="/static/css/bootstrap.min.css">
  <link rel="stylesheet" href="/static/css/animate.min.css">
	<title>首页</title>
  <style type="text/css">
    body{
      background: url("/static/img/bg-login.jpg") fixed;
      background-size: 100%;
      margin: 0px;
      padding: 0px;
    }
    .login-bg{
      margin: 200px auto 0 auto;
      height: 300px;
      background: rgba(0,0,0,.7);
      vertical-align: baseline;
    }
    .form-signin {
      max-width: 300px;
      padding: 19px 29px 29px;
      margin: 0 auto 20px;
      color:#fff;
      -webkit-border-radius: 5px;
         -moz-border-radius: 5px;
              border-radius: 5px;
      -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
         -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
              box-shadow: 0 1px 2px rgba(0,0,0,.05);
    }
    .form-signin .form-signin-heading,
    .form-signin .checkbox {
      margin-bottom: 10px;
    }
    .form-signin input[type="text"],
    .form-signin input[type="password"] {
      font-size: 16px;
      height: auto;
      margin-bottom: 15px;
      padding: 7px 9px;
    }
    .login-form{
      -vendor-animation-duration: 2s;
      -vendor-animation-delay: 3s;
      -vendor-animation-iteration-count: infinite;
    }
  </style>
</head>
<body>


  <div class="login-bg">
    <form id="fm" class="form-signin login-form" action="admin/home" method="post">
        <h2 class="form-signin-heading">
         	 网上书店
        </h2>
        <input type="text" class="input-block-level" placeholder="账号" x-webkit-speech="undefined" name="username">
        <input type="password" class="input-block-level" placeholder="密码" name="password">
        <button class="btn btn-large btn-block btn-success" type="button">登录</button>
    </form>
  </div>

  <script type="text/javascript" src="/static/js/jquery.js"></script>
  <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      $(".login-form").addClass("animated fadeInDown");
      $(".btn").click(function(){

        $("#fm").submit();
      });
    });
  </script>

</body>
</html>