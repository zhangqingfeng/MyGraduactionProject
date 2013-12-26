<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<div class="container-fluid" style="margin:20px auto">
		<div class="content">
        	<%@ include file="base/top.jsp" %>
        	
        	<ul class="breadcrumb">
	            <li><a href="/admin/home">首页</a> <span class="divider">/</span></li>
	            <li class="active">订单</li>
	        </ul>

	        <div class="container-fluid">
	        	<div class="page-header">
	        		<h3><i class="icon-shopping-cart"></i> 订单处理</h3>
	        	</div>
				<div class="row-fluid">
					<div class="well">
					    <table class="table">
					      <thead>
					        <tr>
					          <th width="60%">书籍名称</th>
					          <th width="10%">单价</th>
					          <th width="10%">数量</th>
					          <th width="10%">总价</th>
					          <th width="10%"></th>
					        </tr>
					      </thead>
					      <tbody>
						       <c:choose>
						       		<c:when test="${empty mypage.result }">
						       			<tr><span class="label label-warning">没有任何成功订单</span></tr>
						       		</c:when>
						       		<c:otherwise>
						       		<c:forEach items="${mypage.result }" var="item">
								       <c:forEach items="${item.orderItems }" var="it" varStatus="statu">
								          <tr>	
								        	<td><a href="javascript:;">${it.bookname }</a></td>
									          <td>￥${it.bookprice }</td>
									          <td>${it.num }</td>
									          <c:if test="${statu.count==1 }">
									          	<td >￥${item.totle }</td>
									          </c:if>
									          <c:if test="${statu.count==1 }">
									          	<td ><span class="label label-success"><a href="/admin/shipments/${item.id }">${item.statu }</a></span></td>
									          </c:if>
								       	   </tr>	
								        </c:forEach>
							        </c:forEach>
					        	</c:otherwise>
					       	</c:choose>
					      </tbody>
					    </table>
					    
					    <div class="pagination pull-right">
			                  <ul>
			                    <c:if test="${mypage.totalPages>1}">
			                    	 <c:choose>
			       					  	<c:when test="${mypage.pageNum==1}">
			       					  		<li><a class="diable">首页</a></li>
			       					  		<li><a class="diable">上一页</a></li>
			       					  	</c:when>
			       					  	<c:otherwise>
			       					  		<li><a href="/admin/neworder/1">首页</a></li>
			       					  		<li><a href="/admin/neworder/${mypage.pageNum-1}">上一页</a></li>
			       					  	</c:otherwise>
							          </c:choose>
			       					  <c:choose>
			       					  	<c:when test="${mypage.pageNum==mypage.totalPages}">
			       					  		<li><a class="diable">下一页</a></li>
			       					  		<li><a class="diable">尾页</a></li>
			       					  	</c:when>
			       					  	<c:otherwise>
			       					  		<li><a href="/admin/neworder/${mypage.pageNum+1}">下一页</a></li>
			       					  		<li><a href="/admin/neworder/${mypage.totalPages}">尾页</a></li>
			       					  	</c:otherwise>
			       					  </c:choose>
			                    </c:if>
			                  </ul>
			               </div >

	        			</div>
					</div>
					
					<%@ include file="base/foot.jsp" %>
				                    
	            </div>
	        </div>



	        <!-- -->
        </div>
	</div>
	
</body>
</html> 