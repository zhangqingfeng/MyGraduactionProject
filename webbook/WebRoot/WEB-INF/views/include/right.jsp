<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="span3">
	<div class=" block">
	<p class="block-heading"><i class="icon-paper-clip"></i> 图书分类</p>
	  <div class="block-body">
			<ul class="nav nav-tabs nav-stacked">
		     	<c:forEach items="${typeList }" var="item">
		     		<li><a href="/user/type/${item.id }">${item.typeName }</a></li>
		     	</c:forEach>
	     </ul>
	 </div>
	
	 
</div>