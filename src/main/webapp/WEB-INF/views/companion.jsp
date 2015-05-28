<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.community.web.CompanionTab"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的首页</title>
<jsp:include page="common/head.jsp"></jsp:include>
</head>
<c:set var="companionTabs" value="<%=CompanionTab.values()%>"/>
<body data-spy="scroll" data-target=".bs-docs-sidebar">
	<jsp:include page="common/navbar.jsp"></jsp:include>
	<div class="container">
		<!-- Docs nav
    ================================================== -->
		<div class="row">
			<jsp:include page="common/leftNavbar.jsp">
				<jsp:param value="companion"
					name="parent" />
			</jsp:include>
			<div class="span9">
				<section>
					<div class="tabbable" style="margin-bottom: 9px;">
						<ul class="nav nav-tabs" style="margin-bottom: 0px;">
							<c:forEach var="companionTab" items="${companionTabs}">
								<li <c:if test="${companionTab == tab}" >class="active"</c:if>>
									<a href="companion/${companionTab.EName}" style="font-size: 16px;">${companionTab.CName}</a>
								</li>
							</c:forEach>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="${tab.EName}">
								<jsp:include page="common/showUsers.jsp"></jsp:include>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>

	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>
	<script src="resources/js/relationship.js"></script>
</body>
</html>