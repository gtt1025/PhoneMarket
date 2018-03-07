<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%@page import="vo.CartVO"%>
<%@page import="vo.ProductVO"%>
<%@page import="dao.CartDao"%>
<%@page import="dao.ProductDao"%>
<%@page import="dao.ProductImageDao"%>
<%@page import="java.util.*"%>
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
	<script language = "javascript" type="text/javascript">
		function Calculate(obj) {
			var total = 0;
			var items_price = document.getElementsByClassName("itemprice");
			var items_amount = document.getElementsByClassName("form-inline quantity");
			for (var i = 0; i < items_price.length; i++) {

				if (items_price[i].checked) {
					total += parseFloat(items_price[i].value)*parseInt(items_amount[i].value);
				}

			}
			totaltd.innerText = total;
			tp.innerText = total;
		}


	</script>
</head>

<body>
	<!--Top-->
	<%@include file="topmenu.jsp"%>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Cart Page//////////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">首页</a></li>
						<li><a href="cart.jsp">购物车</a></li>
					</ul>
				</div>
			</div>
			<%
			UserVO cartuser = (UserVO) session.getAttribute("user_status");
			ProductDao productdao = new ProductDao();
			CartDao cartdao = new CartDao();
			ArrayList<CartVO> cartlist = null;
			if(cartuser==null){
				out.print("<script>alert('请先登录')</script>");
				out.print("<script>window.location.href='login.jsp'</script>");
			}
			else{
				
				cartlist = cartdao.getItemList(cartuser.getCustomerid());
			}
				
			%>
			<form name="cartform" id="cartform" method="post"
				action="CartServlet">
				<%
					int count = 1;
					float totalprice = 0.0f;
					for (Iterator<CartVO> cartiter = cartlist.iterator(); cartiter.hasNext();) {
						CartVO cartitem =  cartiter.next();
						ProductVO product = productdao.getProduct(cartitem.getItemID());
				%>

				<div class="row">
					<div class="product well">
						<div class="col-md-3">
						
							<div class="image" name="image">
									<%
										ProductImageDao dao = new ProductImageDao();
										ArrayList<String> pathlist = dao.getImageList(cartitem.getItemID());
									%>
								<a href="product_model.jsp?item=<%=cartitem.getItemID() %>&type=<%=product.getType()%>">
								<input type="checkbox" 
								name="<%=cartitem.getItemID() %>checkbox" 
								class="itemprice" 
								value="<%=product.getUnitPrice()%>"
								onclick="Calculate(this)" >
								<img src=<%=pathlist.get(0) %>>
								</a>
							</div>
						</div>
						<div class="col-md-9">
							<div class="caption">
								<div class="name">
									<h3>
										<a href="product_model.jsp?item=<%=cartitem.getItemID() %>&type=<%=product.getType()%>"><%=product.getItemName()%></a>
									</h3>
								</div>
								<div class="info">
									<ul>
										<li>品牌: <%=product.getBrand()%></li>
										<li>ID: <%=product.getItemID()%></li>
									</ul>
								</div>
								<div class="price">单价：<%=product.getUnitPrice()%></div>
								<label>数量: </label> 

									<input id="itemamount%>"
									name="<%out.print(cartitem.getItemID());%>"
									class="form-inline quantity"
									type="text"
									value="<%=cartitem.getAmount()%>"
									onblur="Calculate(this)">
									<!--<a href="CartUpdateServlet?item=<%=cartitem.getItemID() %>" class="btn btn-2">更新</a>-->
								<hr>
								<a href="RemoveCartItemServlet?item=<%=cartitem.getItemID() %>"
									class="btn btn-default pull-right">删除</a>
							</div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<%
					totalprice += product.getUnitPrice()*cartitem.getAmount();
					count++;}
				%>
				<%
					session.setAttribute("total", totalprice);
				%>

				<div class="row">
					<div class="col-md-4 col-md-offset-8 "></div>
				</div>
				<div class="row">
					<div class="pricedetails">
						<div class="col-md-4 col-md-offset-8">
							<table>
								<h6>价格明细</h6>
								<tr>
									<td>Total</td>
									<td id="totaltd">0.00</td>
								</tr>
								<tr>
									<td>运费</td>
									<td>0.00</td>
								</tr>
								<tr style="border-top: 1px solid #333">
									<td><h5>总价</h5></td>
									<td id="tp">0.00</td>
								</tr>
							</table>
							<!-- <center><a href="checkout.jsp" class="btn btn-1">下单</a></center> -->
							<center>
								<a href="index.jsp" class="btn btn-1">继续购物</a>&nbsp&nbsp&nbsp&nbsp
								<button type="submit" class="btn btn-1">下单</button>
							</center>
						</div>
					</div>
				</div>

			</form>

		</div>
	</div>
</body>

<%@include file="footer.jsp"%>
</html>
