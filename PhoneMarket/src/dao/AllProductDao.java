package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.DBHelper;


public class AllProductDao
{
	private static DBHelper db;
	private static ResultSet ret;
	private static String sql;

	@SuppressWarnings(
	{ "unchecked", "rawtypes" })
	public List<Map> getAllProduct()
	{
		List<Map> lists = new ArrayList<Map>();
		sql = "select * from item";
		db = new DBHelper(sql);
		try
		{
			ret = db.pst.executeQuery();
			while (ret.next())
			{
				Map map = new HashMap();
				map.put("itemID", ret.getInt("itemID"));
				map.put("itemName", ret.getString("itemName"));
				map.put("description", ret.getString("description"));
				map.put("unitPrice", ret.getString("unitPrice"));
				map.put("number", ret.getInt("number"));
				map.put("parameter", ret.getString("parameter"));
				map.put("isOff", ret.getInt("isOff"));
				lists.add(map);
			}
			return lists;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}
}