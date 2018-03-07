package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import dao.UserDao;
import vo.UserVO;
/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		UserDao dao = new UserDao();
		UserVO user = new UserVO();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		user = dao.checkUser(username, password);
		if(user!=null){
			request.getSession().setAttribute("user_status", user);
			response.sendRedirect("index.jsp");
		}
		else{
			
			response.getWriter().print("<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('用户名或密码错误')</script></html>");
			response.getWriter().print("<script>history.back()</script>");
		}
	}

}
