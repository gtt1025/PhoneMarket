package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UploadProductDao;
import vo.ProductVO;

/**
 * Servlet implementation class ModifyItemServlet
 */
public class UploadItemServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadItemServlet()
	{
		super();
	}

	public String showDialog(String msg)
	{
		return "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><script language='JavaScript'>alert('"
				+ msg + "')</script></html>";
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ProductVO pro = new ProductVO();
		UploadProductDao uploadproduct = new UploadProductDao();

		pro.setItemName(request.getParameter("itemName"));
		pro.setUnitPrice(Float.parseFloat(request.getParameter("unitPrice")));
		pro.setNumber(Integer.parseInt(request.getParameter("number")));
		pro.setDescription(request.getParameter("description"));
		pro.setParameter(request.getParameter("parameter"));
		pro.setBrand(request.getParameter("brand"));
		pro.setType(request.getParameter("type"));

		boolean res = uploadproduct.uploadProduct(pro);

		if (res)
		{
			response.getWriter().print(showDialog("上架成功"));
			response.getWriter().print("<script>window.location.href='viewItems.jsp'</script>");
		}
		else
		{
			response.getWriter().print(showDialog("上架失败"));
			response.getWriter().print("<script>window.location.href='addItem.jsp'</script>");
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