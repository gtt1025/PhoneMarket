package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ModifyProductDao;
import vo.ProductVO;

/**
 * Servlet implementation class ModifyItemServlet
 */
public class ModifyItemServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModifyItemServlet()
	{
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int itemID = Integer.parseInt(request.getParameter("item"));
		ProductVO product = new ProductVO();
		ModifyProductDao modifyproductdao = new ModifyProductDao();

		product.setItemName(request.getParameter("itemName"));
		product.setUnitPrice(Float.parseFloat(request.getParameter("unitPrice")));
		product.setNumber(Integer.parseInt(request.getParameter("number")));
		product.setDescription(request.getParameter("description"));
		product.setParameter(request.getParameter("parameter"));

		boolean res = modifyproductdao.modifyProduct(product, itemID);

		if (res)
		{
			response.getWriter().print("<script language='JavaScript'>alert('商品信息修改成功')</script>");
			response.getWriter().print("<script>window.location.href='viewItems.jsp'</script>");
		}
		else
		{
			response.getWriter().print("<script language='JavaScript'>alert('商品信息修改失败')</script>");
			response.getWriter().print("<script>window.location.href='changeItemInfo.jsp'</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}
}