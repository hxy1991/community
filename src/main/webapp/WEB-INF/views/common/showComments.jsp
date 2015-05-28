<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${fn:length(comments) > 0}" >
	<c:forEach var="comment" items="${comments}" varStatus="status">
		<div class="media oneSolidBorder tenPadding">
			<div class="pull-left">
				<a href="user/${comment.reviewer.id}"> <img class="media-object" alt="80x80" style="width: 80px; height: 80px;" src="${comment.reviewer.avaterURI}">
				</a>
			</div>
			<div class="media-body">
				<h4 class="media-heading"><a href="user/${comment.reviewer.id}">${comment.reviewer.nickname}</a></h4>
				<p>${comment.content}</p>
			</div>
			<div class="pull-right">
				${cn:getFloor(page, status.index)}楼&nbsp;&nbsp;${cn:friendlyTime(comment.createAt)}&nbsp;&nbsp;
				<c:if test="${sessionScope.myUid == comment.reviewer.id}">
					<a class="deleteComment" action-data="cid=${comment.id }" href="javascript:void(0)">删除</a>&nbsp;&nbsp;
				</c:if>
				
				<a href="javascript:void(0)" class="reply">回复</a>
			</div>
		</div>
	</c:forEach>
	<jsp:include page="pagination.jsp">
		<jsp:param value="${pageCount }" name="pageCount"/>
		<jsp:param value="${page }" name="currentPage"/>
		<jsp:param value="${cn:getPageHref(pageHref) }" name="pageHref"/>
	</jsp:include>
</c:if>