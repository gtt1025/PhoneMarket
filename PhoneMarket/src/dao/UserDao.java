package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.DBHelper;

import vo.UserVO;

public class UserDao {

	private static DBHelper db;
	private static ResultSet ret;
	private static String sql;
	private static String pwd;

	public UserVO checkUser(String username, String password) {
		sql = "select * from customer where customerName=\"" + username + "\"";
		db = new DBHelper(sql);
		
		try {
			ret = db.pst.executeQuery();
			if(ret.next()){
				if (ret.getString(4).equals(password)) {
					UserVO user = new UserVO();
					user.setCustomerid(ret.getInt(1));
					user.setUsername(ret.getString(2));
					user.setNickname(ret.getString(3));
					user.setPassword(ret.getString(4));
					user.setPhone(ret.getString(5));
					user.setEmail(ret.getString(6));
					user.setAddress(ret.getString(7));
					ret.close();
					db.close();
					
					return user;

				}
				else{
					return null;
				}
			}
			else{
				return null;
			}

			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return null;
	}

	public boolean InsertUser(UserVO user) {
		sql = "insert customer (customerName, customerNickname, password,telNumber,email) values (\""
				+ user.getUsername() + "\",\"" + user.getNickname() + "\",\"" + user.getPassword() + "\",\""
				+ user.getPhone() + "\",\"" + user.getEmail() + "\")";
		System.out.println(sql);
		db = new DBHelper(sql);

		try {
			db.pst.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}
	public boolean UpdateUser(UserVO user) {
		sql = "update customer set customerNickname = \""+user.getNickname()+ "\",password =\""+user.getPassword()+ "\",telNumber= \""+user.getPhone()+
				"\",email=\""+user.getEmail()+"\"where customerName =\""+user.getUsername()+"\"" ;
		System.out.println(sql);
		db = new DBHelper(sql);

		try {
			db.pst.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			
		}
		return false;

	}
	
	public UserVO getUser(int customerID){
		sql = "select * from customer where customerID="+customerID;
		db = new DBHelper(sql);
		try {
			UserVO user = new UserVO();
			ret = db.pst.executeQuery();
			while(ret.next()){
				user.setCustomerid(ret.getInt(1));
				user.setUsername(ret.getString(2));
				user.setNickname(ret.getString(3));
				user.setPassword(ret.getString(4));
				user.setPhone(ret.getString(5));
				user.setEmail(ret.getString(6));
				user.setAddress(ret.getString(7));
			}
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}


}
