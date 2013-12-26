<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/static/css/style2.css">
	<link rel="stylesheet" href="/static/css/font-awesome.css">
  <style>

    .content{
       margin-left: 192px; 
       min-height: 700px;
    }
  </style>
</head>
<body>

    <!-- navbar start-->
	<%@ include file="base/top.jsp" %>
    

    <!-- left -->
    <%@ include file="base/left.jsp" %>

    <!--right -->
<div class="content">
        
        <div class="header">
        

            <h1 class="page-title">Home</h1>
        </div>
        
        <ul class="breadcrumb">
            <li class="active">Home<span class="divider">/</span></li>
            <li class="active">home</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                    

        <div class="row-fluid">

            <div class="alert alert-info">
                <button type="button" class="close" data-dismiss="alert">×</button>
                <strong>欢迎你：</strong> ${admin.username }
            </div>

            <div class="block">
                <a href="#page-stats" class="block-heading" data-toggle="collapse">今日信息</a>
                <div id="page-stats" class="block-body collapse in">

                    <div class="stat-widget-container">
                        
                        <div class="stat-widget">
                            <div class="stat-button span5">
                                <p class="title">${size }</p>
                                <p class="detail">下单数量</p>
                            </div>
                        </div>

                        
                       

                    </div>
                </div>
            </div>
        </div>


                    
       <%@ include file="base/foot.jsp" %>
                    
            </div>
        </div>
    </div>


	<script type="text/javascript" src="/static/js/jquery.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){

		});
	</script>
</body>
</html>