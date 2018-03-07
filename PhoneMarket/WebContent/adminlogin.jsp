<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>首页</title>

<link rel="stylesheet" href="common/layui/css/layui.css">
<link rel="stylesheet" href="common/css/sccl.css">
</head>

<body class="login-bg">
	<div class="login-box">
		<header>
			<h1>CUBE手机商城系统后台管理</h1>
		</header>
		<div class="login-main">
			<form action="AdminLoginServlet" class="layui-form" method="post">
				<div class="layui-form-item">
					<input type="text" class="layui-input" placeholder="这里输入登录名"
						name="adminname" id="adminname" required="required">
				</div>
				<div class="layui-form-item">
					<input type="password" class="layui-input" placeholder="这里输入密码"
						name="password" id="password" required="required">
				</div>
				<div class="pull-right">
					<button type="submit" class="layui-btn layui-btn-primary"
						name="login" id="login">&nbsp;登录&nbsp;</button>
				</div>
				<div class="layui-form-item">
					<!-- <div class="pull-left login-remember">
						<label>记住帐号？</label> <input type="checkbox" name="rememberMe"
							value="true" lay-skin="switch" title="记住帐号">
						<div class="layui-unselect layui-form-switch">
							<i></i>
						</div>
					</div> -->
					<!-- <div class="pull-right">
						<button type="submit" class="layui-btn layui-btn-primary"
							name="login" id="login">&nbsp;登录&nbsp;</button>
					</div> -->
				</div>
			</form>
		</div>
	</div>
</body>
</html>