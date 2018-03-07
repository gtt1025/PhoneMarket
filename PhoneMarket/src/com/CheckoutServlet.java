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
import dao.OrderDao;
import dao.OrderDetailDao;
import dao.ProductDao;
import vo.CartVO;
import vo.ProductVO;
import vo.UserVO;

/**
 * Servlet implementation class CheckoutServlet
 */
//@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserVO checkout_user = (UserVO)request.getSession().getAttribute("user_status");
		int customerID = checkout_user.getCustomerid();
		System.out.println("USERID:"+customerID);
		
		//获取ID后 得到购物车列表
		CartDao cartdao = new CartDao();
		ArrayList<CartVO> cartlist = (ArrayList)request.getSession().getAttribute("check_cart");
//		ArrayList<CartVO> cartlist = cartdao.getItemList(customerID);
		
		//获取订单价格
		float totalprice = (float)request.getSession().getAttribute("total");
		//在ProductDao中使用checkAmount()判断数量是否可以购买
		ProductDao pdao = new ProductDao();
		ArrayList<ProductVO> unvalidlist = pdao.checkAmount(cartlist);
		//如果可以购买。。
		if(unvalidlist.size()==0){
			//生成订单 
			OrderDao orderdao = new OrderDao();
			orderdao.insertOrder(customerID, totalprice);
			
			//生成订单明细表
			OrderDetailDao detaildao = new OrderDetailDao();
			detaildao.generateOrderDetail(cartlist);
			//从item表减去相应的数量
			for(int i=0;i<cartlist.size();i++){
				pdao.updateProductAmount(cartlist.get(i).getItemID(), cartlist.get(i).getAmount());
			}
			
			//删除购物车列表
			for(Iterator<CartVO> itecart = cartlist.iterator();itecart.hasNext();)
			{
				CartVO cart = itecart.next();
				cartdao.clearCart(cart.getCustomerID(),cart.getItemID());
			}
			
			//跳转到我的订单界面
			response.sendRedirect("orders.jsp");
		}
		else if(unvalidlist.size()!=0){
			//如果不能 提示对应的信息
			
			String msg = "您购买的商品: ";
			for(int i=0;i<unvalidlist.size();i++){
				msg+=unvalidlist.get(i).getItemName()+" ";
			}
			msg+="库存不足";
			System.out.println(msg);
			response.getWriter().print(showDialog(msg));
			response.getWriter().print("<script language='JavaScript' charset='utf-8'>window.location.href='cart.jsp'</script>");
		}
				
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public String showDialog(String msg){
		return "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('"+msg+"')</script></html>";
	}

}
