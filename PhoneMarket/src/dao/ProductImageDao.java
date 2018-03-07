package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.DBHelper;

public class ProductImageDao {
	private static DBHelper db;
	private static ResultSet ret;
	private static String sql;
	
	public ArrayList<String> getImageList(int item){
		ArrayList<String> list = new ArrayList<String>();
		sql = "select * from itempicture where itemID="+item;
		db = new DBHelper(sql);
		
		try {
			ret = db.pst.executeQuery();
			while(ret.next()){
				list.add(ret.getString("picturePath"));
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
