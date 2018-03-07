package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeleteProductDao;

/**
 * Servlet implementation class DeleteItemServlet
 */
/*@WebServlet("/DeleteItemServlet")*/
public class DeleteItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemID = Integer.parseInt(request.getParameter("item"));
		DeleteProductDao deldao = new DeleteProductDao();
		boolean res = deldao.delProduct(itemID);

		if (res)
		{
			response.getWriter().print("<script language='JavaScript'>alert('商品已下架')</script>");
			response.getWriter().print("<script>window.location.href='viewItems.jsp'</script>");
		}
		else
		{
			response.getWriter().print("<script language='JavaScript'>alert('商品下架失败')</script>");
			response.getWriter().print("<script>window.location.href='viewItems.jsp'</script>");
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