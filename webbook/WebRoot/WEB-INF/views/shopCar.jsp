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
	            <li class="active">购物车</li>
	        </ul>

	        <div class="container-fluid">
	        	<div class="page-header">
	        		<h3><i class="icon-shopping-cart"></i> 购物车</h3>
	        	</div>
				<div class="row-fluid">
					<div class="well">
					    <table class="table">
					      <thead>
					        <tr>
					          <th width="60%">商品名称</th>
					          <th width="10%">单价</th>
					          <th width="10%">数量</th>
					          <th width="10%">总价</th>
					          <th width="10%"></th>
					        </tr>
					      </thead>
					      <tbody>
					        <c:choose>
					        	<c:when test="${empty sessionScope.shopcar }">
						       		<tr>
						       			<td colspan="5"><span class="label label-warning">你的购物车还是空的。</span></td>
						       		</tr>
						       	</c:when>
						       	<c:otherwise>
						       		<c:forEach items="${sessionScope.shopcar }" var="item">
								        <tr>
								          <td><a href="/comment/${item.book.id }">${item.book.bookName }</a></td>
								          <td>￥${item.book.price }</td>
								          <td>${item.num }</td>
								          <td>￥${item.totle }</td>
								          <td>
								              <a href="/shopCar/delete/${item.book.id }"><i class="icon-remove"></i></a>
								          </td>
								        </tr>
								        <c:set var="totle" scope="page" value="${pageScope.totle + item.totle }"></c:set>
							        </c:forEach>
						       	</c:otherwise>
					        </c:choose>
					        
					       	
					      </tbody>
					      <tfoot>
					      	<tr >
					      		<td style="color:#ff7400;text-align:right" colspan="5">
					      			<strong>总价：￥${not empty totle ? totle : 0 }元</strong>	
					      		</td>
					      	</tr>
					      </tfoot>
					    </table>
					</div>
					<div class="btn-toolbar pull-right">
					    <a href="/user/home" class="btn">继续购物</a>
					    <c:choose>
					    	<c:when test="${empty sessionScope.shopcar}">
					    		<button class="btn">提交订单</button>
					    	</c:when>
					    	<c:otherwise>
							    <a href="/order" class=" btn btn-primary">提交订单</a>
					    	</c:otherwise>
					    </c:choose>
					</div>
					<%@ include file="include/foot.jsp" %>
				                    
	            </div>
	        </div>



	        <!-- -->
        </div>
	</div>
	
</body>
</html> 