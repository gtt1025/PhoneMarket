package dao;

import java.sql.SQLException;

import com.DBHelper;

public class DeleteProductDao
{

	private static DBHelper db;
	private static int ret;
	private static String sql;

	public boolean delProduct(int itemID)
	{
		sql = "update item set isOff = 1 where itemID = " + itemID;
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