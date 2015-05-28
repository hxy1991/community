<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的首页</title>
<jsp:include page="common/head.jsp"></jsp:include>
</head>
<body data-spy="scroll" data-target=".bs-docs-sidebar">
	<jsp:include page="common/navbar.jsp"></jsp:include>
	<div class="container">

		<!-- Docs nav
    ================================================== -->
		<div class="row">
			<jsp:include page="common/leftNavbar.jsp">
				<jsp:param value="myGroup" name="parent"/>
			</jsp:include>
			<div class="span9">
				<jsp:include page="common/showGroups.jsp"></jsp:include>
			</div>
		</div>

	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>