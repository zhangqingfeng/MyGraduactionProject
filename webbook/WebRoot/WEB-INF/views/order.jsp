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

	<div class="container" style="margin:20px auto">
		<div class="content">
        	<%@ include file="include/top.jsp" %>
        	<!-- head end-->
        	
        	<ul class="breadcrumb">
	            <li><a href="/user/home">首页</a> <span class="divider">/</span></li>
	            <li class="active">订单详情</li>
	        </ul>

	        <div class="container-fluid">

	        	<div class="page-header">
	        		<h3><i class="icon-cog"></i> 订单信息</h3>
	        	</div>
	        	<form class="myform form-horizontal" action="/order/submit" method="post">
				  <div class="control-group">
				    <label class="control-label" for="inputEmail">收货人姓名：</label>
				    <div class="controls">
				      <input type="text" name="name">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputPassword">收货地址：</label>
				    <div class="controls">
				      <input type="text" name="address">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputPassword">联系电话：</label>
				    <div class="controls">
				      <input type="text"name="tel">
				    </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="inputPassword">备注：</label>
				    <div class="controls">
				      <input type="text" name="content">
				    </div>
				  </div>
				  
				

						<div class="page-header">
			        		<h3><i class="icon-credit-card"></i> 付款信息</h3>
			        	</div>
			        	<div class="control-group">
			        		<label class="control-label" for="inputPassword"></label>
						    <div class="controls">
								<label class="radio">
								  <input type="radio" checked value="货到付款" name="paytype">
								  货到付款
								</label>
								<label class="radio">
								  <input type="radio" value="支付宝" name="paytype">
								  支付宝
								</label>
						    </div>
						</div>
				</form>

	        	<div class="page-header">
	        		<h3><i class="icon-shopping-cart"></i> 购物车信息</h3>
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
						       			<td colspan="5">你的购物车还是空的。</td>
						       		</tr>
						       	</c:when>
						       	<c:otherwise>
						       		<c:forEach items="${sessionScope.shopcar }" var="item">
								        <tr>
								          <td><a href="book.jspx?id=${item.book.id }">${item.book.bookName }</a></td>
								          <td>￥${item.book.price }</td>
								          <td>${item.num }</td>
								          <td>￥${item.totle }</td>
								          <td>
								              <a href="#myModal"><i class="icon-remove"></i></a>
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
					    <a href="/shopCar" class="btn">修改购物车信息</a>
					    <button  id="subbtn"class="btn btn-primary">提交订单</button>
					</div>
					<%@ include file="include/foot.jsp" %>
				                    
	            </div>
	        </div>



	        <!-- -->
        </div>
	</div>
	<script type="text/javascript" src="/static/js/jquery.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#subbtn").click(function(){
				$("form").submit();
			});
		});
	</script>
</body>
</html>