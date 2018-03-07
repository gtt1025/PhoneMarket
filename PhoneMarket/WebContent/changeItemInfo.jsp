<!DOCTYPE html>
<%@page import="dao.ProductDao"%>
<%@page import="vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="common/css/pintuer.css">
<link rel="stylesheet" href="common/css/admin.css">
</head>
<%
	ProductDao prodao = new ProductDao();
	ProductVO provo;
	int item = Integer.parseInt(request.getParameter("item"));
	provo = prodao.getProduct(item);
%>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder">修改商品信息</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x"
				action="ModifyItemServlet?item=<%=item%>">
				<div class="form-group">
					<div class="label">
						<label>商品名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="itemName" value="<%=provo.getItemName()%>"
							required="required">
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>价格：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="unitPrice" value="<%=provo.getUnitPrice()%>"
							required="required">
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>数量：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="number" value="<%=provo.getNumber()%>"
							required="required">
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>图片：</label>
					</div>
					<div class="field">
						<input type="text" id="url1" name="img" class="input tips"
							style="width: 25%; float: left;" value="" data-toggle="hover"
							data-place="right" data-image="" /> <input type="button"
							class="button bg-blue margin-left" id="image1" value="+ 浏览上传"
							style="float: left;">
						<div class="tipss">图片尺寸：500*500</div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea class="input" name="description"
							style="height: 90px; resize: none;"><%=provo.getDescription() %></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="form-group">
					<div class="label">
						<label>参数：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="parameter" value="<%=provo.getParameter()%>"
							required="required">
							<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button type="submit" class="button bg-main icon-check-square-o">提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>