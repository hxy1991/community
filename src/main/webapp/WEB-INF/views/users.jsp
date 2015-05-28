<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户</title>
<jsp:include page="common/head.jsp"></jsp:include>
</head>
<body data-spy="scroll" data-target=".bs-docs-sidebar">
	<jsp:include page="common/navbar.jsp"></jsp:include>
	<div class="container">

		<!-- Docs nav
    ================================================== -->
		<div class="row">
			<div class="span9">
				<!-- 显示当前页的群组 -->
				<jsp:include page="common/showUsers.jsp"></jsp:include>
			</div>
			<div class="span3 bs-docs-sidebar">
				<section>
					<div class="tabbable" style="margin-bottom: 9px;">
						<ul class="nav nav-tabs" style="margin-bottom: 0px;">
							<li class="active"><a href="#topPostCount" data-toggle="tab"
								style="font-size: 16px;">帖子榜</a></li>
							<li class=""><a href="#topResourceCount" data-toggle="tab"
								style="font-size: 16px;">资源榜</a></li>
							<li class=""><a href="#topFollowerCount" data-toggle="tab"
								style="font-size: 16px;">粉丝榜</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="topPostCount">
								<table class="table">
									<thead>
										<tr>
											<th style="font-weight: normal;">排名</th>
											<th style="font-weight: normal;">用户</th>
											<th style="font-weight: normal;">帖子数</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${topPostCount}" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><a href="user/${user.id}">${user.nickname}</a></td>
												<td>${user.postCount}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="tab-pane" id="topResourceCount">
								<table class="table">
									<thead>
										<tr>
											<th style="font-weight: normal;">排名</th>
											<th style="font-weight: normal;">用户</th>
											<th style="font-weight: normal;">资源数</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${topResourceCount}" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><a href="user/${user.id}">${user.nickname}</a></td>
												<td>${user.resourceCount}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="tab-pane" id="topFollowerCount">
								<table class="table">
									<thead>
										<tr>
											<th style="font-weight: normal;">排名</th>
											<th style="font-weight: normal;">用户</th>
											<th style="font-weight: normal;">粉丝数</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${topFollowerCount}" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><a href="user/${user.id}">${user.nickname}</a></td>
												<td>${user.followerCount}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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