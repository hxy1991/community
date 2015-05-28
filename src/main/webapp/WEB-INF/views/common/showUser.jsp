<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${queryUser != null}" >
	<c:set var="baseHref" value="user/${queryUser.id}"/>
	<c:set var="user" value="${queryUser}"/>
</c:if>
<div class="thumbnail">
	<div class="caption">
		<div style="text-align: center;">
			<img src="${user.avaterURI}" alt="180*180_头像"/>
		</div>
		<h3>
			<a href="${baseHref}">${user.nickname}</a>
		</h3>
		
		<div class="pull-left groupMsg">
			<div class="">
				<c:choose>
					<c:when test="${queryUser != null}">
						<a href="${baseHref}/myPosts">${user.postCount}</a>
					</c:when>
					<c:otherwise>
						<a href="home/myPosts">${user.postCount}</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div>帖子</div>
		</div>
		
		<div class="pull-left groupMsg">
			<div class="">
				<c:choose>
					<c:when test="${queryUser != null}">
						<a href="${baseHref}/friends">${user.friendCount}</a>
					</c:when>
					<c:otherwise>
						<a href="companion/friends">${user.friendCount}</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div>关注</div>
		</div>
		
		<div class="pull-left groupMsg">
			<div class="">
				<c:choose>
					<c:when test="${queryUser != null}">
						<a href="${baseHref}/followers">${user.followerCount}</a>
					</c:when>
					<c:otherwise>
						<a href="companion/followers">${user.followerCount}</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div>粉丝</div>
		</div>
		
		<div class="pull-left groupMsg">
			<div class="">
				<c:choose>
					<c:when test="${queryUser != null}">
						<a href="${baseHref}/followedGroups">${user.groupCount}</a>
					</c:when>
					<c:otherwise>
						<a href="myGroup">${user.groupCount}</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div>社群</div>
		</div>
		
		<div class="pull-left groupMsg">
			<div class="">
				<c:choose>
					<c:when test="${queryUser != null}">
						<a href="${baseHref}/resource">${user.resourceCount}</a>
					</c:when>
					<c:otherwise>
						<a href="resource/uploaded">${user.resourceCount}</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div>资源</div>
		</div>
		<div class="clearfix"></div>
		<!-- 个人简介 -->
		<p style="padding-top: 10px; margin: 0px;">${user.description}</p>
		
		<p class="friendship">
			<c:if test="${queryUser != null}" >
				<c:choose>
					<c:when test="${sessionScope.myUid == user.id}">
						<button class="btn btn-info btn-large">我自己</button>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${user.myFriend}">
								<a href="javascript:void(0)" class="btn btn-primary btn-large" 
									action-type="destroyFriendship" action-data="uid=${user.id}&isMyFollower=${user.myFollower}&btnSize=large">取消关注</a>
								<c:if test="${user.myFollower}" >
									<button class="btn btn-large disabled">互相关注</button>
								</c:if>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0)" class="btn btn-primary btn-large" 
									action-type="createFriendship" action-data="uid=${user.id}&isMyFollower=${user.myFollower}&btnSize=large">加关注</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:if>
		</p>
	</div>
</div>