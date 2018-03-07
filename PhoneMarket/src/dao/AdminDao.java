package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.DBHelper;

import vo.AdminVO;

public class AdminDao
{

	private static DBHelper db;
	private static ResultSet ret;
	private static String sql;

	public boolean checkAdmin(String adminname, String password)
	{
		sql = "select * from administrator where adminName = '" + adminname + "'";
		db = new DBHelper(sql);
		AdminVO admin = new AdminVO();
		try
		{
			ret = db.pst.executeQuery();
			if (ret.next())
			{
				admin.setAdminName(ret.getString(2));
				admin.setPassword(ret.getString(3));
				if (admin.getPassword().equals(password))
				{
					ret.close();
					db.close();
					return true;
				}
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