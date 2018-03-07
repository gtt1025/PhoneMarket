<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.CartVO" %>
<%@page import="vo.ProductVO" %>
<%@page import="dao.ProductDao" %>
<%@page import="dao.ProductImageDao" %>
<%@page import="dao.CartDao" %>
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
	UserVO checkoutuservo = (UserVO)session.getAttribute("user_status");
	if(checkoutuservo.getAddress()==null){
		out.print("<script>alert('请完善收货地址后下单')</script>");
		out.print("<script>window.location.href='modifyinfo.jsp'</script>");
		
	}
	

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
						<li><a href="cart.jsp">确认订单</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="product well">
					<div class="col-md-9">
						<div class="caption">
							<div class="info">	
								<ul>
									<li>收货人：<%=checkoutuservo.getNickname() %></li>
									<li>电话：<%=checkoutuservo.getPhone() %></li>
									<li>收货地址：<%=checkoutuservo.getAddress() %></li>
								</ul>
							</div>
							<hr>
						</div>
					</div>
					<div class="clear"></div>
				</div>	
			</div>
			<%
				CartVO checkcart = new CartVO();
				CartDao cartdao = new CartDao();
				/* ArrayList<CartVO> cartlist = cartdao.getItemList(checkoutuservo.getCustomerid()); */
				ArrayList<CartVO> cartlist = (ArrayList)session.getAttribute("check_cart");
				ProductDao productdao = new ProductDao();
				float totalprice = 0.0f;
				for(Iterator cartiter = cartlist.iterator();cartiter.hasNext();){
					CartVO cartitem = (CartVO)cartiter.next();
					ProductVO checkproduct = productdao.getProduct(cartitem.getItemID());
					ProductImageDao imagedao = new ProductImageDao();
			%>
					<div class="row">
					<div class="product well">
						<div class="col-md-3">
							<div class="image">
								<img src=<%=imagedao.getImageList(cartitem.getItemID()).get(0) %>>
							</div>
						</div>
					<div class="col-md-9">
						<div class="caption">
							<div class="name">
								<h3>
									<a href="product.html"><%=checkproduct.getItemName() %></a>
								</h3>
							</div>
							<div class="info">
								<ul>
									<li>品牌: <%=checkproduct.getBrand() %></li>
									<li>ID: <%=checkproduct.getItemID() %></li>
									<li>单价: <%=checkproduct.getUnitPrice() %></li>
									<li>数量：<%=cartitem.getAmount() %></li>
								</ul>
							</div>
							<div class="price">
								<%
									out.print(cartitem.getAmount() * checkproduct.getUnitPrice());
										totalprice += cartitem.getAmount() * checkproduct.getUnitPrice();
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
						<center><a href="CheckoutServlet" class="btn btn-1">确认支付</a></center>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
<%@include file="footer.jsp" %>
</html>
