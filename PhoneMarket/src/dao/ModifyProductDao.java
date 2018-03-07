package dao;

import java.sql.SQLException;

import com.DBHelper;

import vo.ProductVO;

public class ModifyProductDao
{

	private static DBHelper db;
	private static int ret;
	private static String sql;

	public boolean modifyProduct(ProductVO product, int itemID)
	{
		sql = "update item set itemName = '" + product.getItemName() + "',unitPrice = " + product.getUnitPrice()
				+ ",number = " + product.getNumber() + ",description = '" + product.getDescription() + "',parameter = '"
				+ product.getParameter() + "' where itemID = " + itemID;
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