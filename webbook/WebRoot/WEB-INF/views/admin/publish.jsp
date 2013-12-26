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
            <li><a href="javascript:;">Home</a> <span class="divider">/</span></li>
            <li class="active">商品系统<span class="divider">/</span></li>
            <li class="active">出版社管理</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="btn-toolbar">
                    <a href="/admin/publish/new" class="btn btn-primary"><i class="icon-plus"></i> 新类别</a>
                  <div class="btn-group">
                  </div>
                </div>
                <div class="well">
                    	
                        <c:choose>
                        	<c:when test="${empty list }">
                        		<p class="text-warning">HI，现在没有添加任何出版社</p>
                        	</c:when>
                        	<c:otherwise>
                        		<table class="table">
		                      <thead>
		                        <tr>
		                          <th>#</th>
		                          <th>出版社名称</th>
		                          <th style="width: 100px;">修改</th>
		                          <th style="width: 100px;">删除</th>
		                        </tr>
		                      </thead>
		                      <tbody>
                        		<c:forEach items="${list }" var="item" varStatus="statu">
                        			<tr>
			                          <td>${statu.count }</td>
			                          <td>${item.pubname }</td>
			                          <td>
			                              <a href="/admin/publish/edit/${item.id }"  class="edit btn"><i class="icon-pencil"></i></a>
			                          </td> 
			                          <td> 
			                          	
			                              <button class="delete btn" role="button" data-toggle="modal">
			                              	<i class="icon-remove"></i>
			                              </button>
			                              <form action="/admin/publish/delete" method="post">	  
			                              	<input type="hidden" value="${item.id }" name="id"/>
			                             </form> 
			                          </td>
			                        </tr>
                        		</c:forEach>
                        	</c:otherwise>
                        </c:choose>
                        
                        
                       
                      </tbody>
                    </table>
                    
                </div>

                    
       			<%@ include file="base/foot.jsp" %>
                    
            </div>
        </div>
    </div>


	<script type="text/javascript" src="/static/js/jquery.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".delete").click(function(){
				if(confirm("你确定要删除该出版社吗？")){
					$(this).next().submit();
				}
			});
		});
	</script>
</body>
</html>