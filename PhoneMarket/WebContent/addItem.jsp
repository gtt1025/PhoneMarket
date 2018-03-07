<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script language="JavaScript" type="text/javascript">
	var type = [ [ "mi", "note" ], [ "p", "honor" ], [ "mx", "pro", "lan" ] ];
	function getType() {
		var sltBrand = document.form1.brand;
		var sltType = document.form1.type;
		var brandType = type[sltBrand.selectedIndex - 1];
		sltType.length = 1;
		for (var i = 0; i < brandType.length; i++) {
			sltType[i + 1] = new Option(brandType[i], brandType[i]);
		}
	}
</script>
</head>

<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>上架商品</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" name="form1"
				action="UploadItemServlet">
				<div class="form-group">
					<div class="label">
						<label>商品名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="itemName"
							required="required" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>价格：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="unitPrice" required="required"/>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>数量：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="number" required="required"/>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>品牌系列： </label>
					</div>
					<select name="brand" onchange="getType()">
						<option value="0">----请选择----</option>
						<option value="小米">小米</option>
						<option value="华为">华为</option>
						<option value="魅族">魅族</option>
					</select> <select name="type">
						<option value="0">----请选择----</option>
					</select>
				</div>
				<div class="form-group">
					<div class="label">
						<label>描述：</label>
					</div>
					<div class="field">
						<textarea class="input" name="description"
							style="height: 90px; resize: none;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="form-group">
					<div class="label">
						<label>参数：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="parameter" required="required"/>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">提交</button>
					</div>
				</div>
			</form>
			<form method="post" class="form-x" name="form2"
				action="UploadImageServlet" enctype="multipart/form-data">
				<div class="form-group">
					<div class="label">
						<label>图片：</label>
					</div>
					<div class="field">
						<input type="file" name="uploadImage"><input type="submit"
							value="上传"/>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>