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
            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
            <li class="active">商品系统<span class="divider">/</span></li>
            <li class="active">商品管理</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                <div class="btn-toolbar">
                    <a href="/admin/book/new" class="btn btn-primary"><i class="icon-plus"></i> 新商品</a>
                  <div class="btn-group">
                  </div>
                </div>
                <div class="well">
                    
                      <c:choose>
                      	<c:when test="${empty page.result }">
                      		<p class="text-warning">HI，现在没有任何书籍</p>
                      	</c:when>
                      	<c:otherwise>
                      		<c:forEach items="${page.result }" var="item" varStatus="statu">
                       			<table class="table">
			                      <thead>
			                        <tr>
			                          <th>#</th>
			                          <th>商品名称</th>
			                          <th>所属类别</th>
			                          <th>状态</th>
			                          <th>创建时间</th>
			                          <th>库存</th>
			                          <th style="width: 20px;">修改</th>
			                          <th style="width: 20px;">删除</th>
			                        </tr>
			                      </thead>
			                      <tbody>
                        			<tr>
			                          <td>${statu.count }</td>
			                          <td>${item.bookName }</td>
			                          <td>${item.type.typeName }</td>
			                          <td>${item.statu }</td>
			                          <td>${item.publishDate }</td>
			                          <td>${item.bookNum }</td>
			                          <td>
			                              <a href="/admin/book/edit/${item.id }"  class="edit btn"><i class="icon-pencil"></i></a>
			                          </td> 
			                          <td> 
			                          	
			                              <button class="delete btn" role="button" data-toggle="modal">
			                              	<i class="icon-remove"></i>
			                              </button>
			                              <form action="/admin/book/delete" method="post">	  
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
                <div class="pagination pull-right">
                  <ul>
                    <c:if test="${page.totalPages>1}">
                    	 <c:choose>
       					  	<c:when test="${page.pageNum==1}">
       					  		<li><a class="diable">首页</a></li>
       					  		<li><a class="diable">上一页</a></li>
       					  	</c:when>
       					  	<c:otherwise>
       					  		<li><a href="/admin/book/p/1">首页</a></li>
       					  		<li><a href="/admin/book/p/${page.pageNum-1}">上一页</a></li>
       					  	</c:otherwise>
				          </c:choose>
       					  <c:choose>
       					  	<c:when test="${page.pageNum==page.totalPages}">
       					  		<li><a class="diable">下一页</a></li>
       					  		<li><a class="diable">尾页</a></li>
       					  	</c:when>
       					  	<c:otherwise>
       					  		<li><a href="/admin/book/p/${page.pageNum+1}">下一页</a></li>
       					  		<li><a href="/admin/book/p/${page.totalPages}">尾页</a></li>
       					  	</c:otherwise>
       					  </c:choose>
                    </c:if>
                  </ul>
               </div >

                    
       			<%@ include file="base/foot.jsp" %>
                    
            </div>
        </div>
    </div>


	<script type="text/javascript" src="/static/js/jquery.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".delete").click(function(){
				if(confirm("你确定要删除该类型吗？")){
					$(this).next().submit();
				}
			});
		});
	</script>
</body>
</html>