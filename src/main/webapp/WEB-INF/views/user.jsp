<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.community.web.UserTab"%>

<c:set var="userTabs" value="<%=UserTab.values()%>"/>
<c:set var="POSTS" value="<%=UserTab.POSTS %>"/>
<c:set var="FRIENDS" value="<%=UserTab.FRIENDS %>"/>
<c:set var="FOLLOWERS" value="<%=UserTab.FOLLOWERS %>"/>
<c:set var="FOLLOWED_GROUPS" value="<%=UserTab.FOLLOWED_GROUPS %>"/>
<c:set var="RESOURCE" value="<%=UserTab.RESOURCE %>"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>用户-${queryUser.nickname }</title>
<jsp:include page="common/head.jsp"></jsp:include>

</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar">
	<jsp:include page="common/navbar.jsp"></jsp:include>
	<div class="container">

		<!-- Docs nav
    ================================================== -->
		<div class="row">
			<div class="span9">
				<section id="">
				<div class="tabbable" style="margin-bottom: 9px;">
					<ul class="nav nav-tabs" style="margin-bottom: 0px;">
						<c:forEach var="userTab" items="${userTabs}">
							<li <c:if test="${userTab == tab}" >class="active"</c:if>>
								<a href="user/${queryUser.id}/${userTab.EName}" style="font-size: 16px;">${userTab.CName}</a>
							</li>
						</c:forEach>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="${tab.EName}">
							<c:choose>
								<c:when test="${tab == POSTS}">
									<jsp:include page="common/showPosts.jsp">
										<jsp:param name="from" value="home" />
			   							<jsp:param name="tab" value="${tab.EName}"/>
									</jsp:include>
								</c:when>
								<c:when test="${tab == FRIENDS}">
									<jsp:include page="common/showUsers.jsp">
			   							<jsp:param name="tab" value="${tab.EName}"/>
									</jsp:include>
								</c:when>
								<c:when test="${tab == FOLLOWERS}">
									<jsp:include page="common/showUsers.jsp">
		    							<jsp:param name="tab" value="${tab.EName}"/>
									</jsp:include>
								</c:when>
								<c:when test="${tab == FOLLOWED_GROUPS}">
									<jsp:include page="common/showGroups.jsp">
										<jsp:param name="from" value="home" />
			   							<jsp:param name="tab" value="${tab.EName}"/>
									</jsp:include>
								</c:when>
								<c:when test="${tab == RESOURCE}">
									<jsp:include page="common/showResources.jsp"></jsp:include>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
				</section>
			</div>

			<div class="span3 bs-docs-sidebar ">
				<section id="">
					<jsp:include page="common/showUser.jsp"></jsp:include>
				</section>
			</div>
		</div>

	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>
	<script src="resources/js/relationship.js"></script>
</body>
</html>