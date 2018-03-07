package com;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import vo.UserVO;

/**
 * Servlet implementation class PasswordServlet
 */
//@WebServlet("/PasswordServlet")
public class PasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserVO vo =(UserVO) request.getSession().getAttribute("user_status");
		UserDao dao =new UserDao();
		
		
		if(validCheck(request.getParameter("password"))!=null)
		{
			System.out.println(request.getParameter("password"));
			response.getWriter().print(showDialog(validCheck(request.getParameter("password"))));
			response.getWriter().print("<script>history.back()</script>");
		}
		else if(!request.getParameter("oldpassword").equals(vo.getPassword()))
		{
			response.getWriter().print("<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('与原密码不一致！')</script></html>");
			response.getWriter().print("<script>history.back()</script>");
		}
		else if(!request.getParameter("password").equals(request.getParameter("repassword")))
		{
			response.getWriter().print("<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('两次输入的密码不一致！')</script></html>");
			response.getWriter().print("<script>history.back()</script>");
		}
		else
		{
			vo.setPassword(request.getParameter("password"));
			dao.UpdateUser(vo);
			response.getWriter().print("<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('修改成功')</script></html>");
			response.getWriter().print("<script language='JavaScript'>window.location.href='index.jsp'</script>");
		}
	}
	
	public String validCheck(String password) {

		if (password.length() >= 18 || password.length() <= 8) {
			return "用户密码长度必须大于8位小于18位";
		} else if (!checkPwdValid(password)) {
			return "用户密码必须同时包含英文数字和特殊字符";
		}

		return null;

	}

	public boolean checkPwdValid(String pwd) {
		// String pattern =
		// "/^(?=.*\\d)(?=.*[a-zA-Z])(?=.*[~!@#$%^&*])[\\da-zA-Z~!@#$%^&*]{8,}$/";
		String pattern = "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$]).{8,18}$";
		boolean isMatch = Pattern.matches(pattern, pwd);

		return isMatch;
	}

	public String showDialog(String msg) {
		return "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('"
				+ msg + "')</script></html>";
	}

}
