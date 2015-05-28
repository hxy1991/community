<%--
home.html 我的帖子
user.html XX的帖子
group.html 帖子
search.html 帖子
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${fn:length(posts) > 0}" >
	<c:forEach var="post" items="${posts}" varStatus="status">
		<div class="row show-grid">
			<div class="span1">
				<div class="counts">
					<a href="post/${post.id}">${post.viewCount}</a>
				</div>
				<div>查看</div>
			</div>
			<div class="span1">
				<div class="counts">
					<a href="post/${post.id}/#comments">${post.commentCount}</a>
				</div>
				<div>评论</div>
			</div>
			<div class="span7">
				<div class="topicTitle pull-left">
					<a href="post/${post.id}">${post.title}</a>
				</div>
				<div class="pull-right">
					<c:if test="${sessionScope.myUid == post.author.id}" >
						<a class="deletePost" action-data="pid=${post.id}" href="javascript:void(0)">删除</a>&nbsp;&nbsp;
					</c:if>
					<c:if test="${fn:length(post.tags) > 0}" >
						<i class="icon-tag" title="标签"></i>${post.tags}&nbsp;&nbsp;
					</c:if>
					<c:if test="${post.lastReviewer.id != 0}" >
						<%--最后评论的时间 --%>
						<i class="icon-comment" title="最后评论"></i><a href="user/${post.lastReviewer.id}">${post.lastReviewer.nickname}</a>&nbsp;&nbsp;
					</c:if>
					<c:if test="${param.gid != null || word != null}" >
						<%-- 查看group.html或者search.html --%>
						<i class="icon-user" title="帖子发布者"></i><a style="height: 14px;" href="user/${post.author.id}">${post.author.nickname}</a>
					</c:if>
					<span>${cn:friendlyTime(post.createAt)}</span>&nbsp;&nbsp;
					<c:if test="${param.isGroupPage == null}" >
						<%-- 查看home.html、user.html或者search.html --%>
						来自：<a href="group/${post.group.id}">${post.group.name}</a>&nbsp;&nbsp;
					</c:if>
				</div>
			</div>
		</div>
		<hr />
	</c:forEach>
	<jsp:include page="pagination.jsp">
		<jsp:param value="${pageCount }" name="pageCount"/>
		<jsp:param value="${page }" name="currentPage"/>
		<jsp:param value="${cn:getPageHref(pageHref) }" name="pageHref"/>
	</jsp:include>
</c:if>
