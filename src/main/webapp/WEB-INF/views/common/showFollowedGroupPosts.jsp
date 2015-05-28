<%--
home.html 社群动态
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.media {
	margin-top: 10px;
}
</style>
<c:if test="${fn:length(posts) > 0}" >
	<c:forEach var="post" items="${posts}" varStatus="status">
		<div class="media tenPadding">
			<div class="media-body">
				<h4 class="media-heading">
					<a href="group/${post.group.id}" data-original-title="">${post.group.name}</a>
				</h4>
				<a href="post/${post.id}">${post.title}</a>
			</div>
			<div class="pull-right">
				<c:if test="${fn:length(post.tags) > 0}" >
					<i class="icon-tag" title="标签"></i>${post.tags}&nbsp;&nbsp;
				</c:if>
				<c:if test="${post.lastReviewer.id != 0}" >
					<i class="icon-comment" title="最后评论"></i><a href="user/${post.lastReviewer.id}">${post.lastReviewer.nickname}</a><%--最后评论的时间 --%>&nbsp;&nbsp;
				</c:if>
				<i class="icon-user" title="帖子发布者"></i><a	style="height: 14px;" href="user/${post.author.id}">${post.author.nickname}</a>&nbsp;&nbsp;
				${cn:friendlyTime(post.createAt)}&nbsp;&nbsp;
				<c:if test="${sessionScope.myUid == post.author.id}">
					<a class="deletePost" action-data="pid=${post.id }" href="javascript:void(0);">删除</a>&nbsp;&nbsp;
				</c:if>
				<a href="post/${post.id}#comments">评论(${post.commentCount })</a>&nbsp;&nbsp;<a href="post/${post.id}">查看(${post.viewCount })</a>
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