<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.community.web.HomeTab"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的首页</title>
<jsp:include page="common/head.jsp"></jsp:include>
</head>

<c:set var="homeTabs" value="<%=HomeTab.values()%>"/>
<c:set var="FOLLOWED_GROUP_POSTS" value="<%=HomeTab.FOLLOWED_GROUP_POSTS %>"/>
<c:set var="FRIEND_POSTS" value="<%=HomeTab.FRIEND_POSTS %>"/>
<c:set var="MY_POSTS" value="<%=HomeTab.MY_POSTS %>"/>

<body data-spy="scroll" data-target=".bs-docs-sidebar">
	<jsp:include page="common/navbar.jsp"></jsp:include>
	<div class="container">

		<!-- Docs nav
    ================================================== -->
		<div class="row">
			
			<jsp:include page="common/leftNavbar.jsp">
				<jsp:param value="home" name="parent"/>
			</jsp:include>
			
			<div class="span9">
				<section id="">
					<div class="tabbable" style="margin-bottom: 9px;">
						<ul class="nav nav-tabs" style="margin-bottom: 0px;">
							<c:forEach var="homeTab" items="${homeTabs}">
								<li <c:if test="${homeTab == tab}" >class="active"</c:if>>
									<a href="home/${homeTab.EName}" style="font-size: 16px;">${homeTab.CName}</a>
								</li>
							</c:forEach>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="${tab.EName }">
								<c:choose>
									<c:when test="${tab == FRIEND_POSTS}">
										<jsp:include page="common/showFriendPosts.jsp"></jsp:include>
									</c:when>
									<c:when test="${tab == FOLLOWED_GROUP_POSTS}">
										<jsp:include page="common/showFollowedGroupPosts.jsp"></jsp:include>
									</c:when>
									<c:when test="${tab == MY_POSTS}">
										<jsp:include page="common/showPosts.jsp"></jsp:include>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>

	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>
	<script src="resources/js/post.js"></script>
</body>
</html>