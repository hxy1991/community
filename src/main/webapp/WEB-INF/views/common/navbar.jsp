<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Navbar
    ================================================== -->
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".navbar-responsive-collapse"> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</a> <a class="brand" href="home">Community</a>
			<div class="nav-collapse collapse navbar-responsive-collapse">
				<ul class="nav" style="padding-left: 20px;">
					<li class=""><a href="home">首页</a></li>
					<li class=""><a href="groups">社群</a></li>
					<li class=""><a href="users">用户</a></li>
				</ul>
				<ul class="nav pull-right">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="javascript:void(0)">${myNickname == null ? user.nickname : myNickname}
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="passport">个人资料</a></li>
							<li><a href="logout">退出登录</a></li>
						</ul></li>
				</ul>
				<form class="navbar-search pull-right" action="search">
					<input type="text" name="word" class="search-query span3" placeholder="请输入搜索关键词">
				</form>
			</div>
			<!-- /.nav-collapse -->
		</div>
	</div>
	<!-- /navbar-inner -->
</div>