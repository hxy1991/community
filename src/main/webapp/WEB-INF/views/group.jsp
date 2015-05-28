<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.community.web.GroupTab"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
	
%>
<c:set var="groupTabs" value="<%=GroupTab.values()%>"/>
<c:set var="FOLLOWERS" value="<%=GroupTab.FOLLOWERS%>"/>
<c:set var="RESOURCES" value="<%=GroupTab.RESOURCES %>"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>社群-${group.name}</title>
<jsp:include page="common/head.jsp"></jsp:include>
<style type="text/css">
.div-horizontal {
}
.div-horizontal .control-label {
	float: left;
	padding-top: 5px;
	width:42px;
}
.div-horizontal input {
	width:93%;
}
.div-horizontal textArea {
	width:93%;
	overflow: hidden;
}
</style>
<link rel="stylesheet" href="resources/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="resources/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="resources/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="resources/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="resources/kindeditor/plugins/code/prettify.js"></script>
<script>
 	var postContentEditor = null;
	KindEditor.ready(function(K) {
		postContentEditor = K.create('textarea[name="content"]', {
			cssPath : '<%=basePath%>/resources/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=basePath%>/upload',
			fileManagerJson : '<%=basePath%>/fileManager',
			allowFileManager : true,
			items : [ 'code', '|', 'undo', 'redo', '|', 'fontname', 'fontsize',
						'|', 'textcolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'emoticons', 'image', 'flash', '|',
						 'fullscreen', '|', 'about' ],
		});
		prettyPrint();
	});
</script>
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
						<c:forEach var="groupTab" items="${groupTabs}">
							<li <c:if test="${groupTab == tab}" >class="active"</c:if>>
								<a href="group/${group.id}/${groupTab.EName}" style="font-size: 16px;">${groupTab.CName}</a>
							</li>
						</c:forEach>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active">
							<c:choose>
								<c:when test="${tab == FOLLOWERS}">
									<jsp:include page="common/showUsers.jsp">
										<jsp:param name="gid" value="${group.id}" />
										<jsp:param name="tab" value="followers" />
									</jsp:include>
								</c:when>
								<c:when test="${tab == RESOURCES}">
									<jsp:include page="common/showResources.jsp">
										<jsp:param name="gid" value="${group.id}" />
										<jsp:param name="tab" value="resources" />
									</jsp:include>
								</c:when>
								<c:otherwise>
									<jsp:include page="common/showPosts.jsp">
										<jsp:param name="isGroupPage" value="true" />
									</jsp:include>
									<div id="newPost">
											<label class="control-label span1" for="title">标题：</label>
											<input class="span8" type="text" id="title"
												name="title">
											<label class="control-label span1" for="tags">标签：</label>
											<input class="span8" type="text" id="tags"
												name="tags" placeholder="以半角分号分割">
											<label class="control-label span1" for="content">内容：</label>
											<textarea rows="12" id="content"
														name="content"></textarea>
										<br/>
											<button class="btn btn-primary btn-large pull-right"
												action-data="gid=${group.id}">发表</button>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				</section>
			</div>
			<jsp:include page="common/groupMsg.jsp"></jsp:include>
		</div>

	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>
	<script src="resources/js/post.js"></script>
	<script src="resources/js/userGroup.js"></script>
	<script src="resources/js/resource.js"></script>
</body>
</html>