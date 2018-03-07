package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDao;
import vo.UserVO;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
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
		String itemid = request.getParameter("itemid");
		String quantity = request.getParameter("quantity");
		System.out.println(itemid+"  "+quantity);
		//检查登录状态
		if(request.getSession().getAttribute("user_status")==null){
			response.getWriter().print("<script language='JavaScript' charset='utf-8'>window.location.href='login.jsp'</script>");
		}
		else{
			UserVO user = (UserVO)request.getSession().getAttribute("user_status");
			int customerID = user.getCustomerid();
			CartDao dao = new CartDao();
			dao.insertItem(customerID, Integer.parseInt(quantity), Integer.parseInt(itemid));
			response.sendRedirect("cart.jsp");
		}
		
	}
	public String showDialog(String msg){
		return "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('"+msg+"')</script></html>";
	}

}
