<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.CartVO" %>
<%@page import="vo.OrderVO" %>
<%@page import="vo.ProductVO" %>
<%@page import="vo.OrderDetailVO" %>
<%@page import="dao.ProductDao" %>
<%@page import="dao.UserDao" %>
<%@page import="vo.UserVO" %>
<%@page import="dao.ProductImageDao" %>
<%@page import="dao.CartDao" %>
<%@page import="dao.OrderDao" %>
<%@page import="dao.OrderDetailDao" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>Mobile Shop</title>
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css">
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
	
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"  type="text/css">
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
<%@ include file="checkLogin.jsp" %>
<%
	String orderid = request.getParameter("orderid");
	OrderDao orderinfodao = new OrderDao();
	//获取了当前订单
	OrderVO orderinfo = orderinfodao.getOrder(Integer.parseInt(orderid));
		
	//获取订单人信息
	int customerID = orderinfo.getCustomerID();
	UserDao userinfodao = new UserDao();
	UserVO userinfovo = userinfodao.getUser(customerID);
	

%>
<body>
	<!--Top-->
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Cart Page//////////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="product well">
					<div class="col-md-9">
						<div class="caption">
							<div class="info">	
								<ul>
									<li>收货人：<%=userinfovo.getNickname() %></li>
									<li>电话：<%=userinfovo.getPhone() %></li>
									<li>收货地址：<%=userinfovo.getAddress() %></li>
								</ul>
							</div>
							<hr>
						</div>
					</div>
					<div class="clear"></div>
				</div>	
			</div>
			<%
				OrderDetailDao orderdetaildao = new OrderDetailDao();
				ArrayList<OrderDetailVO> orderdetaillist = orderdetaildao.getOrderDetailList(orderinfo.getOrderID());
				float totalprice = 0.0f;
				for(Iterator viewiter = orderdetaillist.iterator();viewiter.hasNext();){
					OrderDetailVO detailvo = (OrderDetailVO)viewiter.next();
					ProductDao viewproductdao = new ProductDao();
					ProductVO viewproduct = viewproductdao.getProduct(detailvo.getItemID());
					ProductImageDao imagedao = new ProductImageDao();
			%>
					<div class="row">
					<div class="product well">
						<div class="col-md-3">
							<div class="image">
								<img src=<%=imagedao.getImageList(detailvo.getItemID()).get(0) %>>
							</div>
						</div>
					<div class="col-md-9">
						<div class="caption">
							<div class="name">
								<h3>
									<a href="product.html"><%=viewproduct.getItemName() %></a>
								</h3>
							</div>
							<div class="info">
								<ul>
									<li>品牌: <%=viewproduct.getBrand() %></li>
									<li>ID: <%=viewproduct.getItemID() %></li>
									<li>单价: <%=viewproduct.getUnitPrice() %></li>
									<li>数量：<%=detailvo.getAmount() %></li>
								</ul>
							</div>
							<div class="price">
								<%
									out.print(detailvo.getAmount() * viewproduct.getUnitPrice());
										totalprice += detailvo.getAmount() * viewproduct.getUnitPrice();
								%>元
							</div>
							<hr>
						</div>
					</div>
					<div class="clear"></div>
				</div>	
				</div>
					
				<% }
			
			%>
			
			<div class="row">
				<div class="pricedetails">
					<div class="col-md-4 col-md-offset-8">
						<table>
							<h6>价格明细</h6>
							<tr>
								<td>Total</td>
								<td><%=totalprice %></td>
							</tr>
							<tr>
								<td>运费</td>
								<td>0.00</td>
							</tr>
							<tr style="border-top: 1px solid #333">
								<td><h5>总价</h5></td>
								<td><%=totalprice %></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>
