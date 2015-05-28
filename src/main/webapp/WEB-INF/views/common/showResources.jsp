<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${resources != null && fn:length(resources) > 0}">
		<c:forEach var="resource" items="${resources}" varStatus="status">
			<div class="row show-grid">
				<div class="span1">
					<div class="counts">${resource.downloadCount}</div>
					<div>
						<a href="download/${resource.id}">下载</a>
					</div>
				</div>
				<div class="span8">
					<div class="topicTitle pull-left">
						<a href="download/${resource.id}">${resource.name}.${resource.fileExtension}</a>
						<p>${resource.description}</p>
					</div>
					<div class="pull-right">
						<c:choose>
							<c:when test="${sessionScope.myUid == resource.user.id}">
								<a class="deleteResource" action-data="rid=${resource.id}" href="javascript:void(0)">删除</a>&nbsp;
							</c:when>
							<c:otherwise>
								&nbsp;<i class="icon-upload" title="上传者"></i><a href="user/${resource.user.id}">${resource.user.nickname}</a>
							</c:otherwise>
						</c:choose>
						<i class="icon-file" title="大小"></i><span>${cn:getFileSizeStr(resource.size)}</span>
						<c:if test="${fn:indexOf(pageHref,'group') == -1}">
							&nbsp;<i class="icon-hand-right" title="来源"></i><a href="group/${resource.group.id}">${resource.group.name}</a>
						</c:if>
						<span>${cn:friendlyTime(resource.uploadTime)}</span>&nbsp;&nbsp;
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<hr />
		</c:forEach>
		<jsp:include page="pagination.jsp">
			<jsp:param value="${pageCount }" name="pageCount"/>
			<jsp:param value="${page }" name="currentPage"/>
			<jsp:param value="${cn:getPageHref(pageHref) }" name="pageHref"/>
		</jsp:include>
	</c:when>
	<c:when test="${resourceDonwloads != null && fn:length(resourceDonwloads) > 0}">
		<c:forEach var="resourceDonwload" items="${resourceDonwloads}" varStatus="status">
			<div class="row show-grid">
				<div class="span1">
					<div class="counts">${resourceDonwload.resource.downloadCount}</div>
					<div>
						<a href="download/${resourceDonwload.resource.id}">下载</a>
					</div>
				</div>
				<div class="span8">
					<div class="topicTitle pull-left">
						<a href="download/${resourceDonwload.resource.id}">${resourceDonwload.resource.name}.${resourceDonwload.resource.fileExtension}</a>
						<p>${resourceDonwload.resource.description}</p>
					</div>
					<div class="pull-right">
						<a class="deleteResourceDownload" action-data="rdid=${resourceDownloads.id}" href="javascript:void(0)">删除</a>&nbsp;
						<i class="icon-file" title="大小"></i><span>${cn:getFileSizeStr(resourceDonwload.resource.size)}</span>
						&nbsp;<i class="icon-hand-right" title="来源"></i><a href="group/${resourceDonwload.resource.group.id}">${resourceDonwload.resource.group.name}</a>
						<span>${cn:friendlyTime(resourceDonwload.createAt)}</span>&nbsp;&nbsp;
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<hr />
		</c:forEach>
		<jsp:include page="pagination.jsp">
			<jsp:param value="${pageCount }" name="pageCount"/>
			<jsp:param value="${page }" name="currentPage"/>
			<jsp:param value="${cn:getPageHref(pageHref) }" name="pageHref"/>
		</jsp:include>
	</c:when>
</c:choose>