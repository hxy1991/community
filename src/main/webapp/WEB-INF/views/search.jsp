<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.community.web.SearchTab"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人资料</title>
<jsp:include page="common/head.jsp"></jsp:include>
</head>
<c:set var="searchTabs" value="<%=SearchTab.values()%>"/>
<c:set var="POST" value="<%=SearchTab.POST %>"/>
<c:set var="GROUP" value="<%=SearchTab.GROUP %>"/>
<c:set var="USER" value="<%=SearchTab.USER %>"/>
<body data-spy="scroll" data-target=".bs-docs-sidebar">
	<jsp:include page="common/navbar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="span9">
				<section id="">
				<div class="tabbable" style="margin-bottom: 9px;">
					<ul class="nav nav-tabs" style="margin-bottom: 0px;">
						<c:forEach var="searchTab" items="${searchTabs}">
							<li <c:if test="${searchTab == tab}" >class="active"</c:if>>
								<a href="search/${searchTab.EName}?word=${word}" style="font-size: 16px;">${searchTab.CName}</a>
							</li>
						</c:forEach>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="${tab.EName}">
							<c:choose>
								<c:when test="${tab == POST}">
									<jsp:include page="common/showPosts.jsp"/>
								</c:when>
								<c:when test="${tab == GROUP}">
									<jsp:include page="common/showGroups.jsp"/>
								</c:when>
								<c:when test="${tab == USER}">
									<jsp:include page="common/showUsers.jsp"/>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
				</section>
			</div>

			<div class="span3 bs-docs-sidebar ">
				<section id="">
					<div class="thumbnail">
						<div class="caption">
							这里放置搜索排行榜吧！
						</div>
					</div>
				</section>
			</div>
		</div>

	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>