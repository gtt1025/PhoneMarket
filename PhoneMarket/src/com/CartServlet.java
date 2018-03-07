package com;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDao;
import vo.CartVO;
import vo.UserVO;

/**
 * Servlet implementation class CartServlet
 */
//@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
		CartDao dao = new CartDao();
		int customerID = ((UserVO)request.getSession().getAttribute("user_status")).getCustomerid();
		ArrayList<CartVO> list = dao.getItemList(customerID);
		ArrayList<CartVO> checklist =new ArrayList<CartVO>();
		request.getSession().setAttribute("check_cart", checklist);
		int count=0;
		for(Iterator iter=list.iterator();iter.hasNext();){
			CartVO cartitem = (CartVO)iter.next();
			//从表单中获取与itemid相同的 数量值
			String value = request.getParameter(cartitem.getItemID()+"");
			String checkboxvalue = request.getParameter(cartitem.getItemID()+"checkbox");
			if(checkboxvalue!=null)
			{
			 count++;
			 checklist.add(cartitem);
			 dao.updateAmount(customerID, Integer.parseInt(value), cartitem.getItemID());
			}
		}
		if(count==0)
		{
			response.getWriter().print("<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('请选择要下单的商品！')</script></html>");
			response.getWriter().print("<script language='JavaScript'>history.back()</script>");
		}
		else
		{
			request.getSession().setAttribute("check_cart", checklist);
			response.sendRedirect("checkout.jsp");
		}
			
	}

}
