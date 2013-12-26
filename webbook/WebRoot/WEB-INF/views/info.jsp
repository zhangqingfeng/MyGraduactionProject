<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css">
	<link rel="stylesheet" href="/static/css/elusive-webfont.css">
	<link rel="stylesheet" href="/static/css/style.css">
	<style type="text/css">
      body {
        padding-top: 70px;
        background-image: url(/static/img/bg.png);
        padding-bottom: 40px;
      }

      .form-signin {
        max-width: 430px;
        margin: 0px auto;
      }
	  .form-signin .fm input[type='text'],.form-signin .fm input[type='password'] {
		width: 365px;
	  }
    </style>
</head>
<body>
	
	<div class="container">

    	<div class="widget form-signin">
			<h3><i class="icon-lock-alt"></i>${mestitle }</h3>
			<div style="text-align:center;padding-bottom:15px;">
				<h4><i class="icon-ok"></i>${mesbody } </h4>
				<a href="/user/index">返回</a>
			</div>
		</div>
    </div> 
</body>
</html>

