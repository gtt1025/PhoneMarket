<%@page import="dao.ProductImageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.OrderDetailDao" %>
<%@page import="vo.ProductVO" %>
<%@page import="dao.ProductDao" %>
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

<body>
	<!--Top-->
	<%@include file="topmenu.jsp" %>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////HomePage///////////////////////-->
	<!--//////////////////////////////////////////////////-->
    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
	<div id="page-content" class="home-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Carousel -->
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators hidden-xs">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<a href="product_model.jsp?item=4"><img src="images/main-banner1-1903x600.jpg" alt="First slide"></a>
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
							<div class="item">
								<a href="product_model.jsp?item=4"><img src="images/main-banner2-1903x600.jpg" alt="Second slide"></a>
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
							<div class="item">
							<a href="product_model.jsp?item=4"><img src="images/main-banner3-1903x600.jpg" alt="Third slide"></a>
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div><!-- /carousel -->
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="heading">
						<h2>热卖商品</h2>
					</div>
					<div class="products">
						<%
							//获取产品表中卖的最好的4款产品并显示出来
							OrderDetailDao indexdao = new OrderDetailDao();
							ProductDao pdao = new ProductDao();

							List<Map.Entry<Integer,Integer>> hotitemlist = indexdao.sortMap(indexdao.getProductMap(pdao.getAllProductID()));
							for(int count=0;count<4;count++){
								Map.Entry<Integer,Integer> mapentry = hotitemlist.get(count);
								ProductVO indexvo = pdao.getProduct(mapentry.getKey());
								ProductImageDao indeximagedao = new ProductImageDao();
							%>
								<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
								<div class="product">
									<div class="image">
										<a href="product_model.jsp?item=<%=mapentry.getKey()%>"><img src="<%=indeximagedao.getImageList(mapentry.getKey()).get(0) %>" /></a>
									</div>
									<div class="caption">
										<div class="name">
											<h3>
												<a href="product.html"><%=indexvo.getItemName() %></a>
											</h3>
										</div>
										<div class="price"><%=indexvo.getUnitPrice() %></div>
									</div>
								</div>
							</div>
							<%}
						%>
						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="banner">
					<div class="col-sm-6">
						<img src="images/sub-banner4.jpg" />
					</div>
					<div class="col-sm-6">
						<img src="images/sub-banner5.png" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="heading"><h2>精品手机</h2></div>
					<div class="products">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.html"><img src="images/HW-P9-1.jpg" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.html">华为P9</a></h3></div>
									<div class="price">¥2288</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.html"><img src="images/galaxy-s4.jpg" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.html">Aliquam erat volutpat</a></h3></div>
									<div class="price">$122<span>$98</span></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.html"><img src="images/galaxy-note.jpg" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.html">Aliquam erat volutpat</a></h3></div>
									<div class="price">¥122</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.html"><img src="images/Z1.png" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.html">Aliquam erat volutpat</a></h3></div>
									<div class="price">$122<span>$98</span></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="footer.jsp" %>
</html>
