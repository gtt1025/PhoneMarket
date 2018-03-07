<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.AllProductDao"%> 
<%@page import="dao.ProductImageDao"%>
<%@page import="java.util.*"%>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="common/css/pintuer.css">
<link rel="stylesheet" href="common/css/admin.css">
</head>

<%
	AllProductDao allproductdao = new AllProductDao();
	List<Map> lists = allproductdao.getAllProduct();
%>

<body>
	<form method="post" action="">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder">查看商品</strong>
			</div>
			<div class="padding border-bottom">
				<ul class="search">
					<li><input type="text" class="input w50" placeholder="商品名"
						name="searchid" />
						<button type="submit" class="button border-green">搜索商品</button></li>
				</ul>
			</div>

			<table class="table table-hover text-center">
				<tr>
					<th width="120">商品ID</th>
					<th>商品名称</th>
					<th>价格</th>
					<th>描述</th>
					<th>参数</th>
					<th>库存</th>
					<th>操作</th>
					<th>操作</th>
				</tr>
				<%
					for (int i = 0; i < lists.size(); i++)
					{
				%>
				<tr>
					<td><%=lists.get(i).get("itemID")%></td>
					<td width="100"><%=lists.get(i).get("itemName")%></td>
					<td width="100"><%=lists.get(i).get("unitPrice")%></td>
					<td width="100"><%=lists.get(i).get("description")%></td>
					<td width="100"><%=lists.get(i).get("parameter")%></td>
					<td width="100"><%=lists.get(i).get("number")%></td>

					<%
						if ((int) lists.get(i).get("isOff") == 1)
							{
					%>
					<td width="50"><div class="button-group">
							<a class="button border-red"
								href="DeleteItemServlet?item=<%=lists.get(i).get("itemID")%>"
								onclick='return confirm("确定要下架该商品吗？")' disabled="true">下架</a>
						</div></td>
					<%
						}
						else
						{
					%>
					<td width="50"><div class="button-group">
							<a class="button border-red"
								href="DeleteItemServlet?item=<%=lists.get(i).get("itemID")%>"
								onclick='return confirm("确定要下架该商品吗？")'>下架</a>
						</div></td>
					<%
						}
					%>
					<td width="50"><div class="button-group">
							<a class="button border-green"
								href="changeItemInfo.jsp?item=<%=lists.get(i).get("itemID")%>">修改</a>
						</div></td>
				</tr>
				<%
					}
				%>
				<!-- <tr>
					<td colspan="8"><div class="pagelist">
							<a href="">上一页</a> <span class="current">1</span><a href="">2</a><a
								href="">3</a><a href="">下一页</a><a href="">尾页</a>
						</div></td>
				</tr> -->
			</table>
		</div>
	</form>
</body>
</html>