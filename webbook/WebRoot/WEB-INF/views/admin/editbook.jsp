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
  	<link rel="stylesheet" href="/static/js/redactor/redactor.css">
  	<link rel="stylesheet" href="/static/css/select2.css">
  	<link rel="stylesheet" href="/static/css/datepicker.css">
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

   <div class="content">
        
        <div class="header">

            <h1 class="page-title">Home</h1>
        </div>
        
        <ul class="breadcrumb">
            <li class="active">Home<span class="divider">/</span></li>
            <li class="active">商品系统<span class="divider">/</span></li>
            <li><a href="/admin/product">商品管理</a> <span class="divider">/</span></li>
            <li class="active">修改商品</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">

                <div class="page-header">
                  <h4><i class="icon-plus"></i> 新增商品</h4>
                </div>
                <form class="form-horizontal fm" action="/admin/book/edit" method="post">
                  <div class="control-group">
                    <label class="control-label" for="inputEmail">书籍名称</label>
                    <div class="controls">
                      <input type="hidden" name="id" value="${book.id }">
                      <input type="text" name="bookName" value="${book.bookName }">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputEmail">出版社</label>
                    <div class="controls">
                      <select id="e1" class="span5" name="publishid" >
		                <option value="${book.publish.id}">${book.publish.pubname }</option>
		                <c:forEach var="item" items="${publishList}" >
		                	<option value="${item.id}" >${item.pubname }</option>
		                </c:forEach>
		              </select>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputEmail">作者</label>
                    <div class="controls">
                      <input type="text" name="bookAuthor" value="${book.bookAuthor }">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputEmail">原价</label>
                    <div class="controls">
                      <input type="text" name="salePrice" value="${book.salePrice }">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputEmail">商城价</label>
                    <div class="controls">
                      <input type="text" name="price"  value="${book.price }">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputEmail">所属类别</label>
                    <div class="controls">
                       <select id="e2" class="span5" name="typeid">
		                <option value="${book.type.id}">${book.type.typeName } </option>
		                <c:forEach var="item" items="${typeLisk}" >
		                	<option value="${item.id}">${item.typeName }</option>
		                </c:forEach>
		              </select>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputEmail">出版时间</label>
                    <div class="controls">
                      <input type="text" class="datepicker" id="input01" value="${book.publishDate }" x-webkit-speech="undefined" name="publishDate">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputEmail">页数</label>
                    <div class="controls">
                      <input type="text" name="pageNum" value="${book.pageNum }">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputEmail">入库数量</label>
                    <div class="controls">
                      <input type="text" name="bookNum" value="${book.bookNum }">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputEmail">内容简介</label>
                    <div class="controls">
                      <textarea name="content" id="" class="redactor-text" >${book.content }</textarea>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputEmail" >作者简介</label>
                    <div class="controls">
                      <textarea name="authorContent" id="" class="redactor-text">${book.authorContent }</textarea>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputEmail" ">前言</label>
                    <div class="controls">
                      <textarea name="perface" id="" class="redactor-text" >${book.perface }</textarea>
                    </div>
                  </div>
                  
                  
                  <div class="control-group">
                    <div class="controls">
                      <button type="button" id="add" class="btn btn-primary">添加</button>
                    </div>
                  </div>
                </form>
                    
       			<%@ include file="base/foot.jsp" %>
                    
            </div>
        </div>
    </div>


	<script type="text/javascript" src="/static/js/jquery.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/static/js/select2.min.js"></script>
	<script type="text/javascript" src="/static/js/redactor/redactor.js"></script>
	<script type="text/javascript" src="/static/js/bootstrap-datepicker.js"></script>
 	<script type="text/javascript" src="/static/js/redactor/zh_cn.js"></script>
 	<script type="text/javascript" src="/static/js/validate/jquery.validate.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.datepicker').datepicker();
			$("#e1").select2();
			$("#e2").select2();
			//编辑器
			$('.redactor-text').redactor({ 
		        lang: 'zh_cn',
		        buttons: [ 'bold', 'italic', 'deleted', '|',
				'unorderedlist', 'orderedlist', 'outdent', 'indent', '|', 'link', '|','fontcolor', 'backcolor', '|', 'alignment', '|', 'horizontalrule']
		     });
		     $("#add").click(function(){
		     	$(".fm").submit();
		     });
		     $(".fm").validate({
    			rules:{
    				bookName:{
    					required:true,
    				},
    				publishid:{
    					required:true,
    				},
    				bookAuthor:{
    					required:true,
    				},
    				salePrice:{
    					required:true,
    				},
    				price:{
    					required:true,
    				},
    				typeid:{
    					required:true,
    				},
    				publishDate:{
    					required:true,
    				},
    				pageNum:{
    					required:true,
    				},
    				bookNum:{
    					required:true,
    				},
    				content:{
    					required:true,
    				},
    				authorContent:{
    					required:true,
    				},
    				perface:{
    					required:true,
    				}
    			},
    			messages:{
    				bookName:{
    					required:'请输入书名',
    				},
    				publishid:{
    					required:'请输入出版社',
    				},
    				bookAuthor:{
    					required:'请输入作者名字',
    				},
    				salePrice:{
    					required:'请输入原价',
    				},
    				price:{
    					required:'请输入商城价',
    				},
    				typeid:{
    					required:'请输入书籍类型',
    				},
    				publishDate:{
    					required:'请输入出版时间',
    				},
    				pageNum:{
    					required:'请输入书籍页数',
    				},
    				bookNum:{
    					required:'请输入书籍总数目',
    				},
    				content:{
    					required:'请输入书籍简介',
    				},
    				authorContent:{
    					required:'请输入作者简介',
    				},
    				perface:{
    					required:'请输入序言',
    				}
    			}
    		});
		});
	</script>
</body>
</html>