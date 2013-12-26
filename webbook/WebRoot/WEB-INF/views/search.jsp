<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/base.jsp" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>网上书店</title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css">
	<link rel="stylesheet" href="/static/css/font-awesome.css">
	<link rel="stylesheet" href="/static/css/style2.css">
</head>
<body>

	<div class="container-fluid" >&nbsp; 
		<div class="content">
		<%@ include file="include/top.jsp"%>
        	<!-- head end-->
        	<div class="container-fluid">
        		<div class="row-fluid">
	        		<div class="span9 block">
	        			<p class="block-heading">
	        				<i class="icon-list"></i>
	        				商品列表
	        			</p>
	        			<div class="block-body">
	        				<div class="search-well">
				                <form class="form-inline" action="/user/search" method="post">
				                    <input class="input-xlarge" placeholder="请输入书籍名称" type="text" name="q_like_bookName">
				                    <button class="btn" type="submit">搜索</button>
				                </form>
				            </div>

				            <table class="table list">
				            	<tbody>
				            		<c:forEach items="${searchpage.result }" var="b">
				            		<tr>
				            			<td width="130"><img src="/admin/book/showImage/${b.pic }" alt=" " class=""></td>
				            			<td>
				            				<strong><a href="/comment/${b.id }">${b.bookName }</a></strong>
						            		<p>
						            			作　　者：${b.bookAuthor }<br/>
						            			出 版 社：${b.publish.pubname }<br>
						            			定　 价：<span class="muted" style="text-decoration: line-through;">￥${b.salePrice }</span> <br>
												商  城  价：<span class="text-error">￥${b.price }</span><br>
						            		</p>
						            		<div>
						            			<a href="/shopCar/add/${b.id}" class="btn btn-mini btn-primary">放入购物车</a>
						            		</div>
						            	</td>
				            		</tr> 
				            		</c:forEach>
				            	</tbody>
				            </table>
							
							<div class="pagination pull-right">
			                  <ul>
			                    <c:if test="${searchpage.totalPages>1}">
			                    	 <c:choose>
			       					  	<c:when test="${searchpage.pageNum==1}">
			       					  		<li><a class="diable">首页</a></li>
			       					  		<li><a class="diable">上一页</a></li>
			       					  	</c:when>
			       					  	<c:otherwise>
			       					  		<li><a href="/user/search/1">首页</a></li>
			       					  		<li><a href="/user/search/${searchpage.pageNum-1}">上一页</a></li>
			       					  	</c:otherwise>
							          </c:choose>
			       					  <c:choose>
			       					  	<c:when test="${searchpage.pageNum==searchpage.totalPages}">
			       					  		<li><a class="diable">下一页</a></li>
			       					  		<li><a class="diable">尾页</a></li>
			       					  	</c:when>
			       					  	<c:otherwise>
			       					  		<li><a href="/user/search/${searchpage.pageNum+1}">下一页</a></li>
			       					  		<li><a href="/user/search/${searchpage.totalPages}">尾页</a></li>
			       					  	</c:otherwise>
			       					  </c:choose>
			                    </c:if>
			                  </ul>
			               </div >

	        			</div>
	        		</div>
	        		<%@ include file="include/right.jsp"%>
	        	</div>
	        	<%@ include file="include/foot.jsp"%>
        	</div>
        	
        	
    	</div>
	</div>
	
</body>
</html>