<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>社群</title>
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
				<jsp:include page="common/showGroups.jsp"></jsp:include>
			</div>
			<div class="span3 bs-docs-sidebar">
				<section>
					<div id="createGroupDiv" class="modal hide fade" tabindex="-1" role="dialog"
						aria-labelledby="createGroupLabel" aria-hidden="true"
						style="display: none;">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3 id="createGroupLabel">创建社群</h3>
						</div>
						<div class="modal-body">
							<p>
								<label class="pull-left" for="groupName" style="padding-top: 5px;">社群名称：</label><input type="text" id="groupName" name="groupName" style="width:400px"/>
							</p>
							<p>
								<label class="pull-left" for="description" style="padding-top: 5px;">社群描述：</label><textarea type="text" id="description"
									name="description" style="width:400px;height:120px;"></textarea>
							</p>
						</div>
						<div class="modal-footer">
							<button class="btn" data-dismiss="modal">关闭</button>
							<button class="btn btn-primary" id="ensure">确定</button>
						</div>
					</div>
					<p><a data-toggle="modal" href="#createGroupDiv"
						class="btn btn-large btn-success">创建社群</a></p>
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
											<th style="font-weight: normal;">社群</th>
											<th style="font-weight: normal;">帖子数</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="group" items="${topPostCount}" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><a href="group/${group.id}">${group.name}</a></td>
												<td>${group.postCount}</td>
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
											<th style="font-weight: normal;">社群</th>
											<th style="font-weight: normal;">资源数</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="group" items="${topResourceCount}" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><a href="group/${group.id}">${group.name}</a></td>
												<td>${group.resourceCount}</td>
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
											<th style="font-weight: normal;">社群</th>
											<th style="font-weight: normal;">粉丝数</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="group" items="${topFollowerCount}" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><a href="group/${group.id}">${group.name}</a></td>
												<td>${group.followerCount}</td>
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
	<script src="resources/js/userGroup.js"></script>
	<script src="resources/js/group.js"></script>
</body>
</html>