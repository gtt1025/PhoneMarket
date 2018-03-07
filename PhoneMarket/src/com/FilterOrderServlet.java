package com;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDao;
import vo.OrderVO;

/**
 * Servlet implementation class FilterOrderServlet
 */
@WebServlet("/FilterOrderServlet")
public class FilterOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilterOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String phonenumber = request.getParameter("phonenumber");
		if(phonenumber==null||phonenumber.equals("")){
			System.out.println("START"+start+"\nEND"+end);
			response.sendRedirect("viewOrder.jsp?type=date&start="+start+"&end="+end);
		}
		else if(phonenumber!=null&&!phonenumber.equals("")&&(start.equals("")||end.equals(""))){
			System.out.println("PHONE"+phonenumber);
			response.sendRedirect("viewOrder.jsp?type=phone&phone="+phonenumber);
		}
		else if(!phonenumber.equals("")&&!start.equals("")&&!end.equals("")){
			System.out.println("我是联合查询~~~~~~~~~~~~~~~~~");
			response.sendRedirect("viewOrder.jsp?type=both&phone="+phonenumber+"&start="+start+"&end="+end);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
