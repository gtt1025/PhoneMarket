<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%@page import="vo.CartVO"%>
<%@page import="dao.CartDao"%>
<%@page import="java.util.*"%>

<nav id="top">
	<div class="container">
		<div class="row">
			<div class="col-xs-6"></div>
			<div class="col-xs-6">
				<ul class="top-link">
					<%
						if (session.getAttribute("user_status") != null)
						{
					%>
					<li><a href="LogoutServlet"><span
							class="glyphicon glyphicon-user"></span> 注销：<%
						UserVO toptemp = (UserVO) session.getAttribute("user_status");
							out.print(toptemp.getUsername());
					%></a></li>
					<%
						}
						else
						{
					%>
					<li><a href="login.jsp"><span
							class="glyphicon glyphicon-user"></span> 登录</a></li>
					<li><a href="register.jsp"><span
							class="glyphicon glyphicon-envelope"></span> 注册</a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
</nav>
<!--Header-->
<header class="container">
	<div class="row">
		<div class="col-md-4">
			<div id="logo">
				<img src="images/logo.png" />
			</div>
		</div>
		<div class="col-md-4">
			<!-- <form class="form-search">  
					<input type="text" class="input-medium search-query">  
					<button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>  
				</form> -->
		</div>
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<%
				if (session.getAttribute("user_status") != null)
				{
					UserVO userw = (UserVO) session.getAttribute("user_status");
			%>
			<div id="cart">
				<%
					CartDao topdao = new CartDao();
						ArrayList<CartVO> toplist = topdao.getItemList(userw.getCustomerid());
				%>
				<a class="btn btn-1" href="cart.jsp"><span
					class="glyphicon glyphicon-shopping-cart"></span>购物车: <%=toplist.size()%></a>
			</div>
			<%
				}
			%>

		</div>
	</div>
</header>
<!--Navigation-->
<nav id="menu" class="navbar">
	<div class="container">
		<div class="navbar-header">
			<span id="heading" class="visible-xs">Categories</span>
			<button type="button" class="btn btn-navbar navbar-toggle"
				data-toggle="collapse" data-target=".navbar-ex1-collapse">
				<i class="fa fa-bars"></i>
			</button>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">首页</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">华为手机</a>
					<div class="dropdown-menu">
						<div class="dropdown-inner">
							<ul class="list-unstyled">
								<li><a href="category_model.jsp?type=p">P系列</a></li>
								<li><a href="category_model.jsp?type=honor">荣耀系列</a></li>
							</ul>
						</div>
					</div></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">小米手机</a>
					<div class="dropdown-menu">
						<div class="dropdown-inner">
							<ul class="list-unstyled">
								<li><a href="category_model.jsp?type=mi">小米系列</a></li>
								<li><a href="category_model.jsp?type=note">小米NOTE系列</a></li>
							</ul>
						</div>
					</div></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">魅族手机</a>
					<div class="dropdown-menu">
						<div class="dropdown-inner">
							<ul class="list-unstyled">
								<li><a href="category_model.jsp?type=mx">魅族MX系列</a></li>
								<li><a href="category_model.jsp?type=pro">魅族PRO系列</a></li>
								<li><a href="category_model.jsp?type=lan">魅蓝系列</a></li>
							</ul>
						</div>
					</div></li>
				<%
					if (session.getAttribute("user_status") != null)
					{
				%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">个人中心</a>
					<div class="dropdown-menu">
						<div class="dropdown-inner">
							<ul class="list-unstyled">
								<li><a href="orders.jsp">我的订单</a></li>
								<li><a href="modifyinfo.jsp">修改个人信息</a></li>
								<li><a href="passwordinfo.jsp">修改密码</a></li>
							</ul>
						</div>
					</div></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</nav>