<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="vo.UserVO" %>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="">
<meta name="author" content="">

<title>Mobile Shop</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">

<!-- Custom Fonts -->
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="fonts/font-slider.css" type="text/css">

<!-- jQuery and Modernizr-->
<script src="js/jquery-2.1.1.js"></script>

<!-- Core JavaScript Files -->
<script src="js/bootstrap.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!--Top-->
	<%@include file="topmenu.jsp"%>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Account Page///////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">首页</a></li>
						<li><a href="modifyinfo.jsp">修改个人信息</a></li>
					</ul>
				</div>
			</div>
			<%
			  UserVO vo = (UserVO)session.getAttribute("user_status");
			  String username=vo.getUsername();
			 // out.print(username);
			%>
			<div class="row">
				<div class="col-md-6">
					<div class="heading">
						<h2>修改个人信息</h2>
					</div>
					<form name="form2" id="ff2" method="post" action="ModifyServlet">
						<div class="form-group">
						    <p>昵称</p>
							<input type="text" class="form-control" value=<%=vo.getNickname() %>
								name="nickname" id="nickname" required>
						</div>
						<div class="form-group">
						    <p>Email</p>
							<input type="email" class="form-control" value=<%=vo.getEmail() %>
								name="email" id="email" required>
						</div>
						<div class="form-group">
						    <p>Phone</p>
							<input type="tel" class="form-control" value=<%=vo.getPhone() %>
								name="phone" id="phone" required>
						</div>
						<div class="form-group">
						    <p>收货地址</p>
							<input type="tel" class="form-control" value=<%=vo.getAddress() %>
								name="address" id="address" required>
						</div>
						<button type="submit" class="btn btn-1">确认修改</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>