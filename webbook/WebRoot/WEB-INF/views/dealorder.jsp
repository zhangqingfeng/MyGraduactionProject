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

	<div class="container-fluid" style="margin:20px auto">
		<div class="content">
        	<%@ include file="include/top.jsp" %>
        	
        	<ul class="breadcrumb">
	            <li><a href="/user/home">首页</a> <span class="divider">/</span></li>
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
						       		<c:when test="${empty orderPage.result }">
						       			<tr><span class="label label-warning">你没有任何未付款订单</span></tr>
						       		</c:when>
						       		<c:otherwise>
						       			<c:forEach items="${orderPage.result }" var="item">
									       <c:forEach items="${item.orderItems }" var="it" varStatus="statu">
									          <tr>	
									        	<td><a href="javascript:;">${it.bookname }</a></td>
										          <td>￥${it.bookprice }</td>
										          <td>${it.num }</td>
										          <c:if test="${statu.count==1 }">
										          	<td >￥${item.totle }</td>
										          </c:if>
										          <c:if test="${statu.count==1 }">
										          	<td ><a href="/order/pay/${item.id }">付款</a></td>
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
			                    <c:if test="${orderPage.totalPages>1}">
			                    	 <c:choose>
			       					  	<c:when test="${orderPage.pageNum==1}">
			       					  		<li><a class="diable">首页</a></li>
			       					  		<li><a class="diable">上一页</a></li>
			       					  	</c:when>
			       					  	<c:otherwise>
			       					  		<li><a href="/user/dealorder/1">首页</a></li>
			       					  		<li><a href="/user/dealorder/${orderPage.pageNum-1}">上一页</a></li>
			       					  	</c:otherwise>
							          </c:choose>
			       					  <c:choose>
			       					  	<c:when test="${orderPage.pageNum==orderPage.totalPages}">
			       					  		<li><a class="diable">下一页</a></li>
			       					  		<li><a class="diable">尾页</a></li>
			       					  	</c:when>
			       					  	<c:otherwise>
			       					  		<li><a href="/user/dealorder/${orderPage.pageNum+1}">下一页</a></li>
			       					  		<li><a href="/user/dealorder/${orderPage.totalPages}">尾页</a></li>
			       					  	</c:otherwise>
			       					  </c:choose>
			                    </c:if>
			                  </ul>
			               </div >

	        			</div>
					</div>
					
					<%@ include file="include/foot.jsp" %>
				                    
	            </div>
	        </div>



	        <!-- -->
        </div>
	</div>
	
</body>
</html> 