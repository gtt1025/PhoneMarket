package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.DBHelper;

public class TypeDao
{
	private static DBHelper db;
	private static ResultSet ret;
	private static String sql;
	
	

	public List<Map> getType(String type) {
		List<Map> lists = new ArrayList<Map>();
		if (type.equals("honor")) {
			sql = "SELECT * FROM item WHERE brand = '华为' AND type = 'honor'";

		} else if (type.equals("p")) {
			sql = "SELECT * FROM item WHERE brand = '华为' AND type = 'p'";

		} else if (type.equals("mi")) {
			sql = "SELECT * FROM item WHERE brand = '小米' AND type = 'mi'";

		} else if (type.equals("note")) {
			sql = "SELECT * FROM item WHERE brand = '小米' AND type = 'note'";

		} else if (type.equals("pro")) {
			sql = "SELECT * FROM item WHERE brand = '魅族' AND type = 'pro'";

		} else if (type.equals("mx")) {
			sql = "SELECT * FROM item WHERE brand = '魅族' AND type = 'mx'";

		} else if (type.equals("lan")) {
			sql = "SELECT * FROM item WHERE brand = '魅族' AND type = 'lan'";

		} else {
			// 显示错误对话框
		}
		db = new DBHelper(sql);
		try
		{
			ret = db.pst.executeQuery();
			while (ret.next())
			{
				Map map = new HashMap();
				map.put("itemID", ret.getInt("itemID"));
				map.put("itemName", ret.getString("itemName"));
				map.put("unitPrice", ret.getFloat("unitPrice"));
				map.put("type", ret.getString("type"));
				lists.add(map);
			}
			return lists;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		return lists;
	}
	public List<Map> getType(String type,int offset,int pagesize)
	{
		List<Map> lists = new ArrayList<Map>();
		if (type.equals("honor")) {
			sql = "SELECT * FROM item WHERE brand = '华为' AND type = 'honor' limit "+offset+","+pagesize;

		} else if (type.equals("p")) {
			sql = "SELECT * FROM item WHERE brand = '华为' AND type = 'p' limit "+offset+","+pagesize;

		} else if (type.equals("mi")) {
			sql = "SELECT * FROM item WHERE brand = '小米' AND type = 'mi' limit "+offset+","+pagesize;

		} else if (type.equals("note")) {
			sql = "SELECT * FROM item WHERE brand = '小米' AND type = 'note' limit "+offset+","+pagesize;

		} else if (type.equals("pro")) {
			sql = "SELECT * FROM item WHERE brand = '魅族' AND type = 'pro' limit "+offset+","+pagesize;

		} else if (type.equals("mx")) {
			sql = "SELECT * FROM item WHERE brand = '魅族' AND type = 'mx' limit "+offset+","+pagesize;

		} else if (type.equals("lan")) {
			sql = "SELECT * FROM item WHERE brand = '魅族' AND type = 'lan' limit "+offset+","+pagesize;

		} else {
			// 显示错误对话框
		}
		db = new DBHelper(sql);
		try
		{
			ret = db.pst.executeQuery();
			while (ret.next())
			{
				Map map = new HashMap();
				map.put("itemID", ret.getInt("itemID"));
				map.put("itemName", ret.getString("itemName"));
				map.put("unitPrice", ret.getFloat("unitPrice"));
				lists.add(map);
			}
			return lists;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		return lists;
	}
}