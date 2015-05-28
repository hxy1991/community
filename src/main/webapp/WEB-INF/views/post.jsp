<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${post.title }</title>
<jsp:include page="common/head.jsp"></jsp:include>
<style type="text/css">
.hidden {
	display:inline; 
	visibility:visible;
}
</style>

<link rel="stylesheet" href="resources/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="resources/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="resources/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="resources/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="resources/kindeditor/plugins/code/prettify.js"></script>
<script>
 	var commentContentEditor = null;
	KindEditor.ready(function(K) {
		commentContentEditor = K.create('textarea[name="content"]', {
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
					<div class="topicTitle oneSolidBorder ">
						<a href="group/${post.group.id}">${post.group.name}</a>—<a href="post/${post.id}">${post.title}</a>
						[${post.commentCount}<span><i class="icon-comment " title="${post.commentCount}个评论"></i></span>&nbsp;
						${post.viewCount}<span><i class="icon-eye-open" title="${post.viewCount}人查看"></i></span>
						<c:if test="${fn:length(post.tags) > 0}" >
							<span>${post.tags}<i class="icon-tag" title="标签：${post.tags}"></i></span>
							<i class="icon-tag" title="标签"></i>${post.tags}&nbsp;&nbsp;
						</c:if>
					</div>
					<div class="media oneSolidBorder tenPadding">
						<div class="pull-left">
							<a href="user/${post.author.id}"> <img class="media-object" alt="80x80"
								style="width: 80px; height: 80px;"
								src="${post.author.avaterURI}">
							</a>
						</div>
						<div class="media-body">
							<h4 class="media-heading"><a href="user/${post.uid}">${post.author.nickname}</a></h4>
							<p>${post.content}</p>
						</div>
						<div class="pull-right">
							${cn:friendlyTime(post.createAt)}&nbsp;&nbsp;
							<c:if test="${sessionScope.myUid == post.uid}" >
								<a class="deletePost" action-data="pid=${post.id}>&gid=${post.gid}" href="javascript:void(0)">删除</a>&nbsp;&nbsp;
							</c:if>
							<a href="javascript:void(0)" class="reply">回复</a>
						</div>
					</div>
					<jsp:include page="common/showComments.jsp"></jsp:include>
				</section>
				<div id="reply">
					<textarea rows="10" id="content"
						name="content"></textarea>
					<br />
					<button class="btn btn-primary btn-large pull-right" action-data="pid=${post.id}">发表</button>
					<div class="clearfix"></div>
				</div>		
			</div>
			<jsp:include page="common/groupMsg.jsp"></jsp:include>
		</div>

	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>
	<script src="resources/js/comment.js"></script>
	<script src="resources/js/post.js"></script>
</body>
</html>