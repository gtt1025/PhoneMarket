package dao;

import java.sql.SQLException;

import com.DBHelper;

import vo.ProductVO;

public class UploadProductDao
{

	private static DBHelper db;
	private static int ret;
	private static String sql;

	public boolean uploadProduct(ProductVO product)
	{
		sql = "insert into item (itemName,unitPrice,number,description,parameter,brand,type) values ('"
				+ product.getItemName() + "'," + product.getUnitPrice() + "," + product.getNumber() + ",'"
				+ product.getDescription() + "','" + product.getParameter() + "','" + product.getBrand() + "','"
				+ product.getType() + "')";
		db = new DBHelper(sql);
		try
		{
			ret = db.pst.executeUpdate();
			if (ret == 1)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return false;
	}
}