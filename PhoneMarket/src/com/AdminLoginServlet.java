package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AdminDao;

/**
 * Servlet implementation class LoginServlet
 */
public class AdminLoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLoginServlet()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		AdminDao admindao = new AdminDao();
		String adminname = request.getParameter("adminname");
		String password = request.getParameter("password");
		boolean res = admindao.checkAdmin(adminname, password);
		if (res)
		{
			request.getSession().setAttribute("admin_status", 1);
			request.getSession().removeAttribute("user_status");
			response.sendRedirect("adminIndex.jsp");
		}
		else
		{
			String message = "登录失败";
			response.getWriter().print("<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('登录失败')</script></html>");
			response.getWriter().print("<script>history.back()</script>");
		}
	}

}
