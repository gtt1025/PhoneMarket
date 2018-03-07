<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!

public String showDialog(String msg){
	return "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('"+msg+"')</script></html>";
}

%>

<%
	//检查管理员登录状态
	if(session.getAttribute("admin_status")==null){
		out.print(showDialog("请先登录"));
		out.print("<script language='JavaScript' charset='utf-8'>window.location.href='adminlogin.jsp'</script>");
	}
%>
</body>
</html>