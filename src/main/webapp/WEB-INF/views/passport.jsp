<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.community.web.PassportTab"%>
<c:set var="passportTabs" value="<%=PassportTab.values()%>"/>
<c:set var="BASCI_MESSAGE" value="<%=PassportTab.BASCI_MESSAGE%>"/>
<c:set var="CHANGE_PASSWORD" value="<%=PassportTab.CHANGE_PASSWORD%>"/>
<c:set var="CHANGE_AVATER" value="<%=PassportTab.CHANGE_AVATER%>"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人资料</title>
<jsp:include page="common/head.jsp"></jsp:include>
<style type="text/css">


.form-horizontal {
	margin-top:20px;
}
.form-horizontal input[type="text"],.form-login input[type="password"] {
	font-size: 16px;
	height: auto;
	padding: 7px 9px;
}
.form-horizontal input[type="radio"]{
	margin:0px !important;
}
.sex-label {
 	display:inline;
 	margin-top:10px;
}
#<%=PassportTab.CHANGE_AVATER.getEName()%>{
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body data-spy="scroll" data-target=".bs-docs-sidebar">
	<jsp:include page="common/navbar.jsp"></jsp:include>
	<div class="container">

		<!-- Docs nav
    ================================================== -->
		<div class="row">
			<div class="span9">
				<section id="">
				<div class="tabbable" style="margin-bottom: 9px;">
					<ul class="nav nav-tabs" style="margin-bottom: 0px;">
					
						<c:forEach var="passportTab" items="${passportTabs}">
							<li <c:if test="${passportTab == tab}" >class="active"</c:if>>
								<a href="passport/${passportTab.EName}" style="font-size: 16px;">${passportTab.CName}</a>
							</li>
						</c:forEach>
					</ul>
					<div class="tab-content" style="overflow: hidden;">
						<div class="tab-pane active" id="${tab.EName}">
						
							<c:choose>
								<c:when test="${tab == BASCI_MESSAGE}">
									<div class="form-horizontal" id="basicMsg">
										<div class="control-group">
											<label class="control-label" for="inputPassword">昵称：</label>
											<div class="controls">
												<input type="text" name="nickname" id="nickname" value="${user.nickname}"/>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="inputPassword">性别：</label>
											<div class="controls" style="padding-top:5px">
												<c:choose>
													<c:when test="${user.sex == 1}">
														<input name="sex" id="sex1" type="radio" checked> 
														<label class="sex-label" for="sex1">男</label>&nbsp;&nbsp;&nbsp;&nbsp;
														<input name="sex" id="sex0" type="radio"> 
														<label class="sex-label" for="sex0">女</label>
													</c:when>
													<c:when test="${user.sex == 0}">
														<input name="sex" id="sex1" type="radio"> 
														<label class="sex-label" for="sex1">男</label>&nbsp;&nbsp;&nbsp;&nbsp;
														<input name="sex" id="sex0" type="radio" checked> 
														<label class="sex-label" for="sex0">女</label>
													</c:when>
												</c:choose> 
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="inputPassword">个人简介：</label>
											<div class="controls">
												<textarea rows="6" id="description" class="span5">${user.description}</textarea>
											</div>
										</div>
										<div class="control-group">
											<div class="controls">
												<button class="btn btn-large btn-primary" id="basicMsgSaveBt">保存</button>
											</div>
										</div>
									</div>
								</c:when>
								<c:when test="${tab == CHANGE_PASSWORD}">
									<div class="form-horizontal" id="passwordMsg">
										<div class="control-group">
											<label class="control-label" for="currentPassword">当前密码：</label>
											<div class="controls">
												<input type="password" id="currentPassword"  name="currentPassword" placeholder="Password">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="inputPassword">新的密码：</label>
											<div class="controls">
												<input type="password" id="inputPassword"  name="inputPassword" placeholder="Password">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="inputConfirmPassword">确认密码：</label>
											<div class="controls">
												<input type="password" id="inputConfirmPassword"  name="inputConfirmPassword" placeholder="Password">
											</div>
										</div>
										
										<div class="control-group">
											<div class="controls">
												<button class="btn btn-large btn-primary" id="passwordMsgSaveBt">保存</button>
											</div>
										</div>
									</div>
								</c:when>
								<c:when test="${tab == CHANGE_AVATER}">
									<div id="altContent"></div>
									<script type="text/javascript" src="http://images1.jyimg.com/w4/register/j/swfobject.js"></script>
									<script type="text/javascript">
										function uploadevent(status){
										     status += '';
											 switch(status){
												case '1':
													alert("上传成功!");
													window.location.href = window.location.href;
												break;
							
												case '2':
													if(confirm('js call upload')){
														return 1;
													}else{
														return 0;
													}
												break;
												case '-1':
													//alert("取消!");
													window.location.href = "passport/avaterMsg";
												break;
												case '-2':
													alert('上传失败!');
													window.location.href = "passport/avaterMsg";
												break;
							
												default:
													alert(typeof(status) + ' ' + status);
											} 
										}
							
										var flashvars = {
											"jsfunc":"uploadevent",
											"imgUrl":"${user.sex == 1 ? 'resources/avater/180/male_default.jpg' : 'resources/avater/180/female_default.jpg.jpg'}",
											"pid":"75642723",
											"uploadSrc":false,
											"showBrow":true,
											"showCame":true,
											"uploadUrl":"avater",
											"pSize":"300|300|180|180|80|80|50|50",
										};
							
										var params = {
											menu: "false",
											scale: "noScale",
											allowFullscreen: "true",
											allowScriptAccess: "always",
											wmode:"transparent",
											bgcolor: "#FFFFFF"
										};
							
										var attributes = {
											id:"FaustCplus"
										};
							
										swfobject.embedSWF("resources/FaustCplus-master/FaustCplus.swf", "altContent", "680", "450", "9.0.0", "expressInstall.swf", flashvars, params, attributes);
							
									</script>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
				</section>
			</div>

			<div class="span3 bs-docs-sidebar ">
				<section id="">
					<jsp:include page="common/showUser.jsp"></jsp:include>
				</section>
			</div>
		</div>

	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>
	<script src="resources/js/passport.js"></script>
</body>
</html>