<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<div id="uploadResource" class="modal hide fade" tabindex="-1" role="dialog"
	aria-labelledby="uploadResourceLabel" aria-hidden="true" data-backdrop="static"
	style="display: none;">
	<div class="modal-header">
		<h3 id="uploadResourceLabel">上传资源</h3>
	</div>
	<form id="uploadFrom" method="post" action="resource" enctype="multipart/form-data">
		<input type="hidden" id="gid"
					name="gid" value="${group.id}"/>
		<div class="modal-body">
			<p>
				<label class="pull-left" for="file" style="padding-top: 5px;">选择文件：</label><input type="file" id="file" name="file" />
			</p>
			<p>
				<label class="pull-left" for="name" style="padding-top: 5px;">资源名称：</label><input type="text" id="name" name="name" style="width:400px"/>
			</p>
			<p>
				<label class="pull-left" for="description" style="padding-top: 5px;">资源描述：</label><textarea type="text" id="description"
					name="description" style="width:400px;height:120px;"></textarea>
			</p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" id="closeBt">关闭</button>
			<button class="btn btn-primary" id="ensure">确定</button>
		</div>
	</form>
</div>
<div class="span3 bs-docs-sidebar">
	<section id="">
		<div class="centerTextAlign tenPadding">
			<a href="group/${group.id}#newPost" class="btn btn-large ">发表新帖</a> <a
				data-toggle="modal" href="#uploadResource"
				class="btn btn-large btn-success">上传资源</a>
		</div>
		<div class="thumbnail">
			<div class="caption">
				<h3>
					<a href="group/${group.id}">${group.name}</a>
				</h3>
				<div class="pull-left groupMsg">
					<div class="counts">
						<a href="group/${group.id}/posts">${group.postCount}</a>
					</div>
					<div>帖子</div>
				</div>
				<div class="pull-left groupMsg">
					<div class="counts">
						<a href="group/${group.id}/resources">${group.resourceCount}</a>
					</div>
					<div>资源</div>
				</div>
				<div class="pull-left groupMsg">
					<div class="counts">
						<a href="group/${group.id}/followers">${group.followerCount}</a>
					</div>
					<div>粉丝</div>
				</div>
				<div class="clearfix"></div>
				<p>${group.description}</p>
				
				<p class="userGroup">
					<c:choose>
						<c:when test="${group.followed}">
							<a href="javascript:void(0)" class="btn btn-primary btn-large"
								action-type="destroyUserGroup" action-data="gid=${group.id}">取消关注</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0)" class="btn btn-primary btn-large"
								action-type="createUserGroup" action-data="gid=${group.id}">加关注</a>
						</c:otherwise>
					</c:choose>
				</p>

			</div>
		</div>
	</section>
</div>