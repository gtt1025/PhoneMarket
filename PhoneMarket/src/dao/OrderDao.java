package dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.catalina.startup.Tomcat;

import com.DBHelper;

import vo.OrderVO;

public class OrderDao {
	private static DBHelper db;
	private static DBHelper subDb;//子查询使用
	private static ResultSet subRet;//子查询使用
	private static ResultSet ret;
	private static String sql;

	public ArrayList<OrderVO> getOrderList(int customerID) {
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();

		sql = "select * from `order` where `customerID`='" + customerID + "'";
		db = new DBHelper(sql);
		try {
			ret = db.pst.executeQuery();
			while (ret.next()) {
				OrderVO order = new OrderVO();
				order.setOrderID(ret.getInt(1));
				order.setCustomerID(ret.getInt(2));
				order.setGenerateTime(ret.getTimestamp(3));
				System.out.println(ret.getTimestamp(3));
				order.setState(ret.getInt(4));
				order.setOrderprice(ret.getFloat(5));
				list.add(order);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList<OrderVO> getAllOrders() {
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();

		sql = "select * from `order` order by orderID DESC";
		db = new DBHelper(sql);
		try {
			ret = db.pst.executeQuery();
			while (ret.next()) {
				OrderVO order = new OrderVO();
				order.setOrderID(ret.getInt(1));
				order.setCustomerID(ret.getInt(2));
				order.setGenerateTime(ret.getTimestamp(3));
				order.setState(ret.getInt(4));
				order.setOrderprice(ret.getFloat(5));

				list.add(order);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<OrderVO> getUnshipOrders() {
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();

		sql = "select * from `order` where state=0 order by orderID DESC";
		db = new DBHelper(sql);
		try {
			ret = db.pst.executeQuery();
			while (ret.next()) {
				OrderVO order = new OrderVO();
				order.setOrderID(ret.getInt(1));
				order.setCustomerID(ret.getInt(2));
				order.setGenerateTime(ret.getTimestamp(3));
				order.setState(ret.getInt(4));
				order.setOrderprice(ret.getFloat(5));

				list.add(order);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<OrderVO> getShipOrders() {
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();

		sql = "select * from `order` where state=1 order by orderID DESC";
		db = new DBHelper(sql);
		try {
			ret = db.pst.executeQuery();
			while (ret.next()) {
				OrderVO order = new OrderVO();
				order.setOrderID(ret.getInt(1));
				order.setCustomerID(ret.getInt(2));
				order.setGenerateTime(ret.getTimestamp(3));
				order.setState(ret.getInt(4));
				order.setOrderprice(ret.getFloat(5));

				list.add(order);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public void insertOrder(int customerID, float totalprice) {
		int state = 0;
		sql = "insert into `order` (customerID,state,orderprice) value(" + customerID + "," + state + "," + totalprice
				+ ")";
		db = new DBHelper(sql);
		try {
			int rows = db.pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void UpdateOrderState(int state, int orderID) {
		sql = "update `order` set state=" + state + " where orderID=" + orderID;
		db = new DBHelper(sql);
		try {
			db.pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public OrderVO getOrder(int orderID){
		OrderVO order = new OrderVO();
		sql = "select * from `order` where orderID="+orderID;
		db = new DBHelper(sql);
		try {
			ret = db.pst.executeQuery();
			ret.next();
			order.setOrderID(ret.getInt(1));
			order.setCustomerID(ret.getInt(2));
			order.setGenerateTime(ret.getTimestamp(3));
			order.setState(ret.getInt(4));
			order.setOrderprice(ret.getFloat(5));
			
			return order;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public ArrayList<OrderVO> getOrderByDate(String startdate,String enddate){
		ArrayList<OrderVO> list = new ArrayList<>();
		
		sql = "select * from `order` where generateTime between '"+startdate+"' and '"+enddate+"'";
		System.out.println(sql);
		db = new DBHelper(sql);
		try {
			ret = db.pst.executeQuery();
			while(ret.next()){
				OrderVO order = new OrderVO();
				order.setOrderID(ret.getInt(1));
				order.setCustomerID(ret.getInt(2));
				order.setGenerateTime(ret.getTimestamp(3));
				order.setState(ret.getInt(4));
				order.setOrderprice(ret.getFloat(5));
				list.add(order);
			}
			
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
	}
	public ArrayList<OrderVO> getOrderByPhone(String phone){
		ArrayList<OrderVO> list = new ArrayList<>();
		ArrayList<Integer> userlist = new ArrayList<>();
		int i = 0;
		String sql1 = "select customerID from customer where telNumber like '" + "%" + phone + "%" + "'";
		
		subDb = new DBHelper(sql1);
		try {
			subRet = subDb.pst.executeQuery();
			while(subRet.next()){
				userlist.add(subRet.getInt(1));
				System.out.println("第"+i+"个用户:"+subRet.getInt(1)+"对应:"+userlist.get(i++));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		//sql = "select * from `order` where customerID=(select customerID from customer where telNumber='"+phone+"')";
		for (int j = 0; j < userlist.size(); j++){
//			customers[i]=4;
		sql = "select * from `order` where customerID = '"+userlist.get(j)+"'";
		db = new DBHelper(sql);
		
		System.out.println("测试语句"+sql);
		try {
			ret = db.pst.executeQuery();
			while(ret.next()){
				OrderVO order = new OrderVO();
				order.setOrderID(ret.getInt(1));
				order.setCustomerID(ret.getInt(2));
				order.setGenerateTime(ret.getTimestamp(3));
				order.setState(ret.getInt(4));
				order.setOrderprice(ret.getFloat(5));
				list.add(order);
			}
//			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		return list;
	}
	public ArrayList<OrderVO> getOrderByDateAndPhone(String phone,String start,String end){
		ArrayList<OrderVO> list = new ArrayList<>();
		sql = "select * from `order` where generateTime between '"+start+"' and '"+end+"' and customerID=(select customerID from customer where telNumber='"+phone+"')";
		
		db = new DBHelper(sql);
		try {
			ret = db.pst.executeQuery();
			while(ret.next()){
				OrderVO order = new OrderVO();
				order.setOrderID(ret.getInt(1));
				order.setCustomerID(ret.getInt(2));
				order.setGenerateTime(ret.getTimestamp(3));
				order.setState(ret.getInt(4));
				order.setOrderprice(ret.getFloat(5));
				
				list.add(order);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	public String getStateStr(int state) {
		if (state == 0) {
			return "已付款";
		} else if (state == 1) {
			return "已发货";
		} else if (state == 2) {
			return "已收货";
		} else {
			return "订单状态错误";
		}
	}

}
