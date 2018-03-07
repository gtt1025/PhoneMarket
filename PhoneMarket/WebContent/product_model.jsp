<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.ProductDao"%>
<%@page import="dao.ProductImageDao"%>
<%@page import="vo.ProductVO"%>
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

<script src="js/photo-gallery.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<%
	/* int item = Integer.parseInt(request.getParameter("item")); */
	ProductDao dao = new ProductDao();
	ProductVO product;
	int item = Integer.parseInt(request.getParameter("item"));

	product = dao.getProduct(item);
	if (product == null) {
		response.getWriter().print("<script>alert('没有此商品')</script>");
		response.getWriter().print("<script>history.back()</script>");
	}

	ProductImageDao image_dao = new ProductImageDao();
	ArrayList<String> list = image_dao.getImageList(item);
%>

<body>
	<!--Top-->
	<%@include file="topmenu.jsp" %>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Product Page///////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">主页</a></li>
						<%
						
							
							switch (dao.getProduct(item).getType()) {
								case "p" :
						%><li><a href="cate_huawei_p.jsp">华为P系列</a></li>
						<li><a href="#"><%=product.getItemName()%></a></li>
						<%
							break;
								case "honor" :
						%><li><a href="cate_huawei_honor.jsp">华为荣耀系列</a></li>
						<li><a href="#"><%=product.getItemName()%></a></li>
						<%
							break;
								case "mi" :
						%><li><a href="cate_mi_mi.jsp">小米系列</a></li>
						<li><a href="#"><%=product.getItemName()%></a></li>
						<%
							break;
								case "note" :
						%><li><a href="cate_mi_note.jsp">小米Note系列</a></li>
						<li><a href="#"><%=product.getItemName()%></a></li>
						<%
							break;
								case "pro" :
						%><li><a href="cate_meizu_pro.jsp">魅族PRO系列</a></li>
						<li><a href="#"><%=product.getItemName()%></a></li>
						<%
							break;
								case "mx" :
						%><li><a href="cate_meizu_mx.jsp">魅族MX系列</a></li>
						<li><a href="#"><%=product.getItemName()%></a></li>
						<%
							break;
								case "lan" :
						%><li><a href="cate_meizu_meilan.jsp">魅蓝系列</a></li>
						<li><a href="#"><%=product.getItemName()%></a></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<div class="row">
				<div id="main-content" class="col-md-8">
					<div class="product">
						<div class="col-md-6">
							<div class="image">
								<img src=<%=list.get(0)%>>
								<div class="image-more">
									<ul class="row">
										<%
											for (Iterator iter = list.iterator(); iter.hasNext();) {
										%>
										<li class="col-lg-3 col-sm-3 col-xs-4"><a href="#"><img
												class="img-responsive" src=<%=iter.next().toString()%>></a>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="caption">
								<div class="name">
									<h3><%=product.getItemName()%></h3>
								</div>
								<div class="info">
									<ul>
										<li>品牌: <%=product.getBrand()%></li>
										<li>ID: <%=product.getItemID()%></li>
									</ul>
								</div>
								<div class="price">
									¥<%=product.getUnitPrice()%></div>
								<%-- <div class="options">
									颜色选择 <select>
										<option value="" selected>----请选择----</option>
										<option value="black"><%=product.getColor()%></option>
										<option value="blue">亮蓝</option>
									</select>
								</div> --%>
								<div class="well">
									<form action="AddCartServlet" method="post">
									<label>数量: </label> 
										<input id="quantity" name="quantity" class="form-inline quantity" type="text" value="1"> 
										<input type="hidden" id="itemid" name="itemid" value=<%=product.getItemID() %>>
										<%
											//判断商品是否已经下架
											if(product.getIsOff()==0){%>
												<input type="submit" class="btn btn-2" value="加入购物车">
											<%}
											else if(product.getIsOff()==1){
											%>
												<input type="submit" class="btn btn-2" value="该商品已经下架" disabled>
											<%}
										
										%>
										
									</form>
									
								</div>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="product-desc">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#description">设计</a></li>
							<li><a href="#review">参数</a></li>
						</ul>
						<div class="tab-content">
							<div id="description" class="tab-pane fade in active">
								<p><%=product.getDescription()%></p>
								<!-- <p>小米6 的美，来自于我们对精湛工艺不断的探索。梦幻般的四曲面玻璃机身，<br/>璀璨夺目的四曲面陶瓷，熠熠生辉的不锈钢边框，不仅带来了流光溢彩的视觉体验，<br/>更带来了整机无一丝棱线的绝佳手感。当光影在小米6 的机身上流淌，<br/>犹如一颗宝石，珠圆玉润、璀璨生辉。</p> -->
							</div>
							<div id="review" class="tab-pane fade">
								<div class="review-text">
									<%=product.getParameter()%>
									<!-- <dl>
											<dt>骁龙835</dt>
											<dd>高通旗舰处理器</dd>
										</dl>
										<dl>
											<dt>12MP+12MP</dt>
											<dd>变焦双摄像机</dd>
										</dl>
										<dl>
											<dt>四曲面</dt>
											<dd>高亮玻璃、陶瓷机身</dd>
										</dl>
										<dl>
											<dt>5.15" 护眼屏</dt>
											<dd>有效降低蓝光辐射</dd>
										</dl>
										<dl>
											<dt>全网通4.0</dt>
											<dd>双卡双待 / 4G+</dd>
										</dl>
										<dl>
											<dt>3350mAh(typ)</dt>
											<dd>超长续航</dd>
										</dl> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- IMG-thumb -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body"></div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script>
		$(document).ready(function() {
			$(".nav-tabs a").click(function() {
				$(this).tab('show');
			});
			$('.nav-tabs a').on('shown.bs.tab', function(event) {
				var x = $(event.target).text(); // active tab
				var y = $(event.relatedTarget).text(); // previous tab
				$(".act span").text(x);
				$(".prev span").text(y);
			});
		});
	</script>
</body>
<%@include file="footer.jsp"%>
</html>