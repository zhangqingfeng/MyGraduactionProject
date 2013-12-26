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
	<link rel="stylesheet" href="/static/js/redactor/redactor.css">
</head>
<body>

	<div class="container" style="margin:20px auto">
		<div class="content">
        	<%@ include file="include/top.jsp"%>
        	<!-- head end-->
        	
        	<ul class="breadcrumb">
	            <li><a href="/user/home">首页</a> <span class="divider">/</span></li>
	             <li><a href="index.html">${book.type.typeName }</a> <span class="divider">/</span></li>
	            <li class="active">${book.bookName }</li>
	        </ul>

	        <div class="container-fluid">
	        	<div class="page-header">
	        		<h3><i class="icon-th"></i> ${book.bookName }</h3>
	        	</div>
				<div class="row-fluid">
					
					<div class="span2">
						<img src="/admin/book/showImage/${book.pic }" alt="">
					</div>
					<div class="span10">
						<ul class="unstyled">
							<li>${book.bookAuthor }</li>
							<li>${book.publish.pubname }</li>
							<li>${book.publishDate }</li>
							<li>所属分类：<a href="#">${book.type.typeName }</a></li>
							<li>页　　数：${book.pageNum }</li>
							<li>定　　价：<span class="muted" style="text-decoration: line-through;">￥${book.salePrice }</span></li>
							<li>商  城  价：<span class="text-error">￥${book.price }（${book.price/book.salePrice }折）</span></li>
						</ul>
						
	            		<div>
	            			<a href="/shopCar/add/${book.id}" class="btn btn-primary">放入购物车</a>
	            			<a href="#" class="btn">收藏</a>
	            		</div>
					</div>
					<div class="clearfix"></div>
					<div class="block">
						<p class="block-heading">内容简介</p>
						<div class="block-body">
							<p>${book.content }</p>
						</div>
					</div>
					<div class="block">
						<p class="block-heading">作者简介</p>
						<div class="block-body">
							<p>${book.authorContent }</p>
						</div>
					</div>
					<div class="block">
						<p class="block-heading">前言</p>
						<div class="block-body">
							<p>${book.perface }</p>
						</div>
					</div>

					<div class="block">
						<p class="block-heading">评价</p>
						<div class="block-body">

							<c:choose>
								<c:when test="${empty commentList}">
									<span class="label label-warning">没有评论</span>
								</c:when>
								<c:otherwise>
									<c:forEach items="${commentList }" var="item">
										<hr/>
										<div class="row-fluid" style="margin-top:20px;">
											<div class="span1">
												<img src="/admin/book/showImage/${item.user.pic }" alt="">
											</div>
											<div class="span11">
												<strong>${item.title }</strong><span style="color:#ccc">${item.createTime }</span>
												<p>${item.content }</p>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
								

							<form action="/comment/add" method="post" id="fm">
							  <fieldset>
							    <legend>发表评论</legend>
							    <label>标题</label>
							    <input type="hidden" name="bookid" value="${book.id } ">
							    <input type="text" class="span6" name="title">
							   
							    <label>内容</label>
							    <textarea  id="redactor_content" name="content"></textarea>
							    <div style="margin-top:15px;text-align:right">
							    	<button type="button" class="btn btn-primary">发表</button>
							    </div>
							  </fieldset>
							</form>
							
						</div>
					</div>




					<%@ include file="include/foot.jsp"%>
				                    
	            </div>
	        </div>



	        <!-- -->
        </div>
	</div>

	<script type="text/javascript" src="/static/js/jquery.js"></script>
	<script type="text/javascript" src="/static/js/redactor/redactor.js"></script>
	<script type="text/javascript" src="/static/js/redactor/zh_cn.js"></script>
	<script src="/static/js/validate/jquery.validate.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#redactor_content').redactor({ 
				lang: 'zh_cn',
				buttons: [ 'bold', 'italic', 'deleted', '|',
				'unorderedlist', 'orderedlist', 'outdent', 'indent', '|', 'link', '|','fontcolor', 'backcolor', '|', 'alignment', '|', 'horizontalrule']
			 });
			 $(".btn").click(function(){
			 	$("#fm").submit();
			 });
			 $("#fm").validate({
			 	rules:{
			 		title:{
			 			required:true,
			 		},
			 		content:{
			 			required:true
			 		}
			 	},
			 	message:{
			 		title:{
			 			required:'标题不能为空',
			 		},
			 		content:{
			 			required:'内容不能为空'
			 		}
			 	}
			 });
		});
	</script>
	
</body>
</html>
