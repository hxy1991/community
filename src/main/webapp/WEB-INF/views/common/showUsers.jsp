<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${fn:length(users) > 0}" >
	<section id="thumbnails">
		<c:forEach var="user" items="${users}" varStatus="status">
			<c:if test="${status.index % 3 == 0}" >
				<div class="row-fluid">
					<ul class="thumbnails">
			</c:if>
			<li class="span4">
				<div class="thumbnail">
					<div class="caption">
						<h4>
							<a href="user/${user.id}">${user.nickname}</a>
						</h4>
						<p class="twentyFontSize">
							<a href="user/${user.id}/myPost">${user.postCount}</a>&nbsp;帖子&nbsp;&nbsp;<span>|</span>&nbsp;
							<a href="user/${user.id}/friends">${user.friendCount}</a>&nbsp;关注&nbsp;&nbsp;<span>|</span>&nbsp;
							<a href="user/${user.id}/followers">${user.followerCount}</a>&nbsp;粉丝
						</p>
						<p class="ellipsis" title="${user.description}">${user.description}</p>
						<p class="friendship">
							<c:choose>
								<c:when test="${sessionScope.myUid == user.id}">
									<button class="btn btn-info">我自己</button>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${user.myFriend}">
											<a href="javascript:void(0)" class="btn btn-primary" 
												action-type="destroyFriendship" action-data="uid=${user.id}&isMyFollower=${user.myFollower}">取消关注</a>
											<c:if test="${user.myFollower}" >
												<button class="btn disabled">互相关注</button>
											</c:if>
										</c:when>
										<c:otherwise>
											<a href="javascript:void(0)" class="btn btn-primary" 
												action-type="createFriendship" action-data="uid=${user.id}&isMyFollower=${user.myFollower}">加关注</a>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</p>
					</div>
				</div>
			</li>
			<c:if test="${(status.index+1) % 3 == 0 || status.last}" >
					</ul>
				</div>
			</c:if>
		</c:forEach>
		<jsp:include page="pagination.jsp">
			<jsp:param value="${pageCount }" name="pageCount"/>
			<jsp:param value="${page }" name="currentPage"/>
			<jsp:param value="${cn:getPageHref(pageHref) }" name="pageHref"/>
		</jsp:include>
	</section>
</c:if>