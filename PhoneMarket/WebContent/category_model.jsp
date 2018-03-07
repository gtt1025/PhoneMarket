<!DOCTYPE html>
<%@page import="com.PageSpliter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.ProductDao"%>
<%@page import="dao.TypeDao"%>
<%@page import="dao.ProductImageDao"%>
<%@page import="vo.ProductVO"%>
<%@page import="java.util.*"%>
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
</head>

<%
	int nPage;
	TypeDao typedao = new TypeDao();
	String TypeStr = request.getParameter("type");
	List<Map> alists = null;
	if(TypeStr!=null){
		System.out.println(TypeStr);
		alists = typedao.getType(TypeStr);
	}
	else{
		//显示对话框
	}
	PageSpliter ps = new PageSpliter();
	String pagestr = request.getParameter("page");//获取请求的页数
	
	if(pagestr!=null){
		nPage = Integer.parseInt(request.getParameter("page"));
	}
	else{
		nPage=1;
	}
	int pages = ps.getPagePara(alists);//获取一共的页数
	List<Map> lists = typedao.getType(TypeStr,ps.getPagesize()*(nPage-1),ps.getPagesize());//从数据库查询分页数据
	
%>

<body>
	<!--Top-->
	<%@include file="topmenu.jsp"%>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Category Page//////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.jsp">首页</a></li>
						<li><a href="category_model.jsp?type=<%=TypeStr %>">系列专页</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div id="main-content" class="col-md-8">
					<div class="row">
						<div class="col-md-12">
							<div class="products">
								<%
									for (int i = 0; i < lists.size(); i++) {
										int item = (int) lists.get(i).get("itemID");

										ProductImageDao image_dao = new ProductImageDao();
										ArrayList<String> list = image_dao.getImageList(item);
								%>
								<div class="col-lg-4 col-xs-12 col-md-3">
									<div class="product">
										<div class="image">
											<a
												href="product_model.jsp?item=<%=lists.get(i).get("itemID")%>"><img
												src=<%=list.get(0)%> /></a>
										</div>
										<div class="caption">
											<div class="name">
												<h3>
													<a
														href="product_model.jsp?type=lan&item=<%=lists.get(i).get("itemID")%>"><%=lists.get(i).get("itemName")%></a>
												</h3>
											</div>
											<div class="price">
												<%=lists.get(i).get("unitPrice")%>
											</div>
										</div>
									</div>
								</div>
								<%
									}
								%>
							</div>
						</div>
					</div>
					<div class="row text-center">
						<ul class="pagination">
							<%
								for (int index = 1; index <= pages; index++) {
									if (index == nPage) {
							%>
							<li class="active"><a
								href="category_model.jsp?type=<%=TypeStr %>&page=<%=index%>"><%=index%></a></li>
							<%
								} else {
							%>
							<li><a href="category_model.jsp?type=<%=TypeStr %>&page=<%=index%>"><%=index%></a></li>
							<%
								}
							%>

							<%
								}
							%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>