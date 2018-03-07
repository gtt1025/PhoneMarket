<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>首页</title>
<link rel="stylesheet" href="common/css/sccl.css">
<link rel="stylesheet" type="text/css"
	href="common/skin/qingxin/skin.css" id="layout-skin" />

<script type="text/javascript">
	window.onload = function() {
		document.getElementById("loginOff").onclick = function() {
			if (confirm("确定注销帐号吗?")) {
				//获取到用户输入的原密码。

			}
		}
	};
</script>
</head>
<%@ include file="checkLogin.jsp" %>
<body>
	<div class="layout-admin">
		<header class="layout-header">
			<span class="header-logo">CUBE手机商城</span> <a class="header-menu-btn"
				href="javascript:;"><i class="icon-font">&#xe600;</i></a>
			<ul class="header-bar">
				<li class="header-bar-role"><a href="javascript:;">管理员</a></li>
				<li class="header-bar-nav"><a href="javascript:;">admin<i
						class="icon-font" style="margin-left: 5px;">&#xe60c;</i></a>
					<ul class="header-dropdown-menu">
						<!-- <li><a href="adminlogin.jsp" onclick='return confirm("确定要退出当前账号吗？")'>切换账户</a></li> -->
						<li><a href="AdminLogoutServlet" onclick='return confirm("确定要退出吗？")'>退出</a></li>
					</ul></li>
				<li class="header-bar-nav"><a href="javascript:;" title="换肤"><i
						class="icon-font">&#xe608;</i></a>
					<ul class="header-dropdown-menu right dropdown-skin">
						<li><a href="javascript:;" data-val="qingxin" title="清新">清新</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="molv" title="墨绿">墨绿</a></li>
					</ul></li>
			</ul>
		</header>
		<aside class="layout-side">
			<ul class="side-menu">
			</ul>
		</aside>
		<div class="layout-side-arrow">
			<div class="layout-side-arrow-icon">
				<i class="icon-font">&#xe60d;</i>
			</div>
		</div>
		<section class="layout-main">
			<div class="layout-main-tab">
				<button class="tab-btn btn-left">
					<i class="icon-font">&#xe60e;</i>
				</button>
				<nav class="tab-nav">
					<div class="tab-nav-content">
						<a href="javascript:;" class="content-tab active"
							data-id="viewItems.jsp">查看商品</a>
					</div>
				</nav>
				<button class="tab-btn btn-right">
					<i class="icon-font">&#xe60f;</i>
				</button>
			</div>
			<div class="layout-main-body">
				<iframe class="body-iframe" name="iframe0" width="100%" height="99%"
					src="viewItems.jsp" frameborder="0" data-id="viewItems.jsp"
					seamless></iframe>
			</div>
		</section>
	</div>
	<script type="text/javascript" src="common/lib/jquery-1.9.0.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="common/js/sccl.js" charset="utf-8"></script>
	<script type="text/javascript" src="common/js/sccl-util.js" charset="utf-8"></script>
</body>
</html>