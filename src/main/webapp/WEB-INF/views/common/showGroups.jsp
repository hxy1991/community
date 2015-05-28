<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section id="thumbnails">
	<c:if test="${fn:length(groups) > 0}" >
		<c:forEach var="group" items="${groups}" varStatus="status">
			<c:if test="${status.index % 3 == 0}" >
				<div class="row-fluid">
					<ul class="thumbnails">
						</c:if>
							<li class="span4">
								<div class="thumbnail">
									<div class="caption">
										<h3>
											<a href="group/${group.id}">${group.name}</a>
										</h3>
										<p class="twentyFontSize">
											<a href="group/${group.id}/posts">${group.postCount}</a>&nbsp;帖子&nbsp;&nbsp;<span>|</span>&nbsp;
											<a href="group/${group.id}/followers">${group.followerCount}</a>&nbsp;粉丝&nbsp;&nbsp;<span>|</span>&nbsp;
											<a href="group/${group.id}/resources">${group.resourceCount}</a>&nbsp;资源
										</p>
										<p class="ellipsis" title="${group.description}">${group.description}</p>
										<p class="userGroup">
											<c:choose>
												<c:when test="${group.followed}">
													<a href="javascript:void(0)" class="btn btn-primary"
														action-type="destroyUserGroup" action-data="gid=${group.id}">取消关注</a>
												</c:when>
												<c:otherwise>
													<a href="javascript:void(0)" class="btn btn-primary"
														action-type="createUserGroup" action-data="gid=${group.id}">加关注</a>
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
	</c:if>
</section>