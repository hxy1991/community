<%--
home.html 好友动态
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${fn:length(posts) > 0}" >
	<c:forEach var="post" items="${posts}" varStatus="status">
		<div class="media tenPadding">
			<div class="pull-left">
				<a href="user/${post.author.id}"> <img class="media-object" alt="80x80" style="width: 80px; height: 80px;" src="${post.author.avaterURI}">
				</a>
			</div>
			<div class="media-body">
				<h4 class="media-heading">
					<a href="user/${post.author.id}">${post.author.nickname}</a>
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
				<i class="icon-hand-right" title="来源"></i><a href="group/${post.group.id }">${post.group.name }</a>&nbsp;&nbsp;	${cn:friendlyTime(post.createAt)}&nbsp;&nbsp;
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
