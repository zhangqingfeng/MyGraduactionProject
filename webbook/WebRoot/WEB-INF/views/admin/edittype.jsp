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
           <!--  <div class="stats">
               <p class="stat"><span class="number">53</span>tickets</p>
               <p class="stat"><span class="number">27</span>tasks</p>
               <p class="stat"><span class="number">15</span>waiting</p>
           </div> -->

            <h1 class="page-title">Home</h1>
        </div>
        
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
            <li class="active">商品系统<span class="divider">/</span></li>
            <li><a href="index.html">类型管理</a> <span class="divider">/</span></li>
            <li class="active">修改类型</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">

                <div class="page-header">
                  <h4><i class="icon-plus"></i> 修改类型</h4>
                </div>
                <form class="form-horizontal" action="/admin/type/edit" method="post">
                  <div class="control-group">
                    <label class="control-label" for="inputEmail">出版社名称</label>
                    <div class="controls">
                      <input type="hidden" name="id" value="${type.id }">
                      <input type="text" name="typeName" placeholder="${type.typeName }">
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                      <button type="submit" class="btn btn-primary">修改</button>
                    </div>
                  </div>
                </form>
                    
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