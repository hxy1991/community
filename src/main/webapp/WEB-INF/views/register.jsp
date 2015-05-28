<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cn" uri="http://community.sinaapp.com/jsp/jstl/common"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>注册</title>
<jsp:include page="common/head.jsp"></jsp:include>

<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin input[type="text"],.form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	padding: 7px 9px;
}

.control-label {
	width: 25% !important;
}

.form-horizontal .controls {
	margin-left: 85px !important;
}
.form-horizontal .controls input[type="text"]{
	width:95%;
}
.form-horizontal .controls input[type="password"]{
	width:95%;
}
.form-horizontal .control-group {
	margin-bottom: 15px !important;
}
</style>
<script type="text/javascript">
	//刷新验证码
	function flush() {
		var pic = document.getElementById("picture");
		pic.src = "identifycode?code=" + Math.random();
	}
</script>
</head>

<body>

	<div class="container">

		<form class="form-signin form-horizontal" method="post" action="register">
			<h3 class="form-signin-heading">注册</h3>
			<div class="control-group">
				<label class="control-label" for="inputEmail" >邮箱：</label>
				<div class="controls">
					<input type="text" id="inputEmail" name="inputEmail" placeholder="Email">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">密码：</label>
				<div class="controls">
					<input type="password" id="inputPassword" name="inputPassword" placeholder="Password">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputConfirmPassword">确认密码：</label>
				<div class="controls">
					<input type="password" id="inputConfirmPassword" name="inputConfirmPassword" placeholder="ConfirmPassword">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputNickname">昵称：</label>
				<div class="controls">
					<input type="text" id="inputNickname" name="inputNickname" placeholder="Nickname">
				</div>
			</div>
			<input type="hidden" id="inputTokenValue" name="inputTokenValue" value="${sessionScope.tokenValue}">
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-large btn-primary" id="registerBtn">注册</button>
					<a class="btn btn-large" href="login">登录</a>
				</div>
			</div>
			<c:if test="${tip != null}">
				<div class="alert alert-error" style="margin-bottom: 0px;">
					<strong>错误！</strong>${tip}
				</div>
			</c:if>
		</form>

	</div>
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/all.js"></script>
	<script src="resources/js/register.js"></script>
</body>
</html>