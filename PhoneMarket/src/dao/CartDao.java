package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.DBHelper;

import vo.CartVO;

public class CartDao {
	private static DBHelper db;
	private static ResultSet ret;
	private static String sql;

	public ArrayList<CartVO> getItemList(int customerID) {

		ArrayList<CartVO> list = new ArrayList<>();
		sql = "select * from cart where customerID=" + customerID;
		db = new DBHelper(sql);
		try {
			ret = db.pst.executeQuery();
			while (ret.next()) {
				CartVO cart = new CartVO();
				cart.setCustomerID(ret.getInt(1));
				cart.setItemID(ret.getInt(2));
				cart.setAmount(ret.getInt(3));

				list.add(cart);

			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public void clearCart(int customerID, int itemID) {
		sql = "delete from cart where customerID= " + customerID + " and itemID = " + itemID;
		System.out.println(sql);
		db = new DBHelper(sql);
		try {
			db.pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void deleteItem(int itemID, int customerID) {

		sql = "delete from cart where itemID=" + itemID + " and customerID=" + customerID;
		db = new DBHelper(sql);
		try {
			int row = db.pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void insertItem(int customerID, int amount, int itemID) {
		sql = "insert into cart (customerID,itemID,amount) value (" + customerID + "," + itemID + "," + amount + ")";
		System.out.println(sql);
		db = new DBHelper(sql);
		try {
			int rows = db.pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			updateItem(customerID, amount, itemID);
		}
	}

	/*
	 * updateItem()在详情页界面中添加购物车时，如果购物车中已经有该商品，则执行此函数
	 */
	public void updateItem(int customerID, int amount, int itemID) {
		sql = "update cart set amount=amount+" + amount + " where customerID=" + customerID + " and itemID=" + itemID;
		System.out.println(sql);
		db = new DBHelper(sql);
		try {
			db.pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/*
	 * 
	 * updateAmount在购物车界面下单时 执行此函数 更新购物车数据表中的值
	 */
	public void updateAmount(int customerID, int amount, int itemID) {
		sql = "update cart set amount=" + amount + " where customerID=" + customerID + " and itemID=" + itemID;
		System.out.println(sql);
		db = new DBHelper(sql);
		try {
			db.pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
