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
 * Servlet implementation class RegisterServlet
 */
//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		UserVO user = new UserVO();
		UserDao dao = new UserDao();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
		user.setPhone(request.getParameter("phone"));
		user.setNickname(request.getParameter("nickname"));
		String confirmPwd = request.getParameter("repassword");
		if(validCheck(user)!=null){
			response.getWriter().print(showDialog(validCheck(user)));
			response.getWriter().print("<script language='JavaScript' charset='utf-8'>history.back()</script>");
		}
		if(!user.getPassword().equals(confirmPwd)){
			response.getWriter().print(showDialog("两次密码不一致"));
			response.getWriter().print("<script language='JavaScript' charset='utf-8'>history.back()</script>");
		}
		else{
			boolean res = dao.InsertUser(user);
			if(res){
				response.getWriter().print("<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('注册成功')</script></html>");
				request.getSession().setAttribute("user_status", user);
				response.getWriter().print("<script language='JavaScript' charset='utf-8'>window.location.href='index.jsp'</script>");
			}
			
		}
		
		
	}
	public String validCheck(UserVO user){
		
		
		if(user.getUsername().length()>=20||user.getUsername().length()<=6){
			return "用户名长度必须大于6位小于20位";
		}
		else if(user.getNickname().length()>=20||user.getNickname().length()<=6){
			return "用户昵称长度必须大于6位小于20位";
		}
		else if(user.getPhone().length()!=11){
			return "用户电话长度必须为11位";
		}
		else if(user.getPassword().length()>=18||user.getPassword().length()<=8){
			return "用户密码长度必须大于8位小于18位";
		}
		else if(!checkPwdValid(user.getPassword())){
			return "用户密码必须同时包含英文数字和特殊字符";
		}
		
		return null;

	}
	public boolean checkPwdValid(String pwd){
//		String pattern = "/^(?=.*\\d)(?=.*[a-zA-Z])(?=.*[~!@#$%^&*])[\\da-zA-Z~!@#$%^&*]{8,}$/";
		String pattern = "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$]).{8,18}$";
		boolean isMatch = Pattern.matches(pattern, pwd);
		
		return isMatch;
	}
	
	public String showDialog(String msg){
		return "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('"+msg+"')</script></html>";
	}

}
