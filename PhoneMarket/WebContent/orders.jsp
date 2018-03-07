<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.UserVO" %>
<%@page import="vo.OrderVO" %>
<%@page import="vo.OrderDetailVO" %>
<%@page import="dao.OrderDao" %>
<%@page import="dao.OrderDetailDao" %>
<%@page import="dao.ProductDao" %>
<%@page import="vo.ProductVO" %>
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
<%
	UserVO user = (UserVO)session.getAttribute("user_status");
	int customerID = user.getCustomerid();
	
	ArrayList<OrderVO> orderlist = new ArrayList<>();
	
	OrderDao orderdao = new OrderDao();
	OrderDetailDao detaildao = new OrderDetailDao();
	
	orderlist = orderdao.getOrderList(customerID);
	String stateStr = orderdao.getStateStr(0);
	
%>
<body>
	<!--Top-->
	<%@include file="topmenu.jsp" %>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Cart Page//////////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">首页</a></li>
						<li><a href="orders.jsp">我的订单</a></li>
					</ul>
				</div>
			</div>
			<%
				int size = orderlist.size();
				for(int count=size-1;count>=0;count--){
					//倒序 依次获取订单VO
					OrderVO order = orderlist.get(count);
			
			%>
			<div class="row">
				<div class="product well">
					<div class="col-md-12">
						<div class="caption">
							<div class="name"><h3>&nbsp&nbsp&nbsp<%out.print(orderdao.getStateStr(order.getState())); %></h3></div>
							<div class="col-md-4">下单时间  ：<%=order.getGenerateTime() %></div>
							<div class="col-md-4">订单编号  ： <a href="#"><%=order.getOrderID() %></a></div>
							<hr size="30">
							<div class="info">	
								<ul>
								<%
									int OrderID = order.getOrderID();
									ArrayList<OrderDetailVO> detaillist = detaildao.getOrderDetailList(OrderID);
									//获取订单ID后 循环获取订单内的商品
									for(Iterator detail = detaillist.iterator(); detail.hasNext(); ){
										//获取ItemID 后查询商品的名称
										OrderDetailVO orderdetail = (OrderDetailVO)detail.next();
										ProductVO product;
										ProductDao productdao = new ProductDao();
										product = productdao.getProduct(orderdetail.getItemID());
								%>
										<li>
										<div class="col-md-2"><a href="product_model.jsp?item=<%=orderdetail.getItemID() %>&type=<%=product.getType()%>"><% out.print(product.getItemName()); %></a></div>
										<div class="col-md-2"><%=orderdetail.getUnitPrice() %> * <%out.print(orderdetail.getAmount()); %></div>
									</li><br>
									<%}
								%>
									
								</ul>
							</div><br>
							<hr>
							<div class="price">&nbsp&nbsp总价：<%out.print(order.getOrderprice());%></div>
							<%
								if(order.getState()==1){
							%>
									<div class="col-md-8"> <a href="OrderConfirmServlet?orderid=<%=order.getOrderID()%>" class="btn btn-1">确认收货</a></div>
							<%
							}
							%>
							
							
						</div>
					</div>
					<div class="clear"></div>
				</div>	
			</div>
			<%} %>
			<!-- <div class="row">
				<div class="product well">
					<div class="col-md-3">
						<div class="image">
							<img src="images/Z1.png" />
						</div>
					</div>
					<div class="col-md-9">
						<div class="caption">
							<div class="name"><h3><a href="product.html">Aliquam erat volutpat</a></h3></div>
							<div class="info">
								<ul>
									<li>Brand: text</li>
									<li>ID: 0122222</li>
								</ul>
							</div>
							<div class="price">$122<span>$98</span></div>
							<label>Qty: </label> <input class="form-inline quantity" type="text" value="1"><a href="#" class="btn btn-2 ">Update</a>
							<hr>
							<a href="#" class="btn btn-default pull-right">REMOVE</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>	
			</div> -->
			

		</div>
	</div>	
</body>
<%@include file="footer.jsp" %>
</html>
