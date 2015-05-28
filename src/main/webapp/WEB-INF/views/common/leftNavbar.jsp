<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<div class="span3 bs-docs-sidebar">
	<ul class="nav nav-list bs-docs-sidenav">
		<li	<c:if test="${'home' eq param.parent}">class='active'</c:if>><a
			href="home"><i class="icon-chevron-right"></i> 我的首页</a></li>
		<li <c:if test="${'myGroup' eq param.parent}">class='active'</c:if>><a
			href="myGroup"><i class="icon-chevron-right"></i> 兴趣社群</a></li>
		<li <c:if test="${'companion' eq param.parent}">class='active'</c:if>><a
			href="companion"><i class="icon-chevron-right"></i> 互动好友</a></li>
		<li <c:if test="${'resource' eq param.parent}">class='active'</c:if>><a
			href="resource"><i class="icon-chevron-right"></i> 资源下载</a></li>
	</ul>
	<section id="">
		<jsp:include page="showUser.jsp"></jsp:include>
	</section>
</div>