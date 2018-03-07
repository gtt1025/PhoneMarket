package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.DBHelper;

import vo.CartVO;
import vo.OrderDetailVO;
import vo.ProductVO;

public class OrderDetailDao {
	private static DBHelper db;
	private static ResultSet ret;
	private static String sql;
	
	public ArrayList<OrderDetailVO> getOrderDetailList(int orderID){
		ArrayList<OrderDetailVO> list = new ArrayList<>();
		
		sql = "select * from orderdetail where orderID="+orderID;
		System.out.println(sql);
		db = new DBHelper(sql);
		
		try {
			ret = db.pst.executeQuery();
			while(ret.next()){
				OrderDetailVO detail = new OrderDetailVO();
				System.out.println("ITEMID  "+ret.getInt(2));
				detail.setOrderID(ret.getInt(1));
				detail.setItemID(ret.getInt(2));
				detail.setAmount(ret.getInt(3));
				detail.setUnitPrice(ret.getFloat(4));
				detail.setTotalPrice(ret.getFloat(5));
				list.add(detail);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	public int getCurrentID(){
		sql = "select max(orderID) from `order`";
		db = new DBHelper(sql);
		try {
			ret = db.pst.executeQuery();
			if(ret.next()){
				return ret.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
		
	}
	public void generateOrderDetail(ArrayList<CartVO> list){
		for(Iterator<CartVO> iter=list.iterator(); iter.hasNext();){
			CartVO cartvo = (CartVO)iter.next();
			ProductDao productdao = new ProductDao();
			ProductVO productvo = productdao.getProduct(cartvo.getItemID());
			
			float unitprice = productvo.getUnitPrice();
			float totalprice = unitprice*cartvo.getAmount();
			int orderid = getCurrentID();
			System.out.println("===========================================================");
			sql = "insert into orderdetail (orderID,itemID,amount,unitprice,totalprice) value("+orderid+","+cartvo.getItemID()+","+cartvo.getAmount()+","+unitprice+","+totalprice+")";
			System.out.println(sql);
			db = new DBHelper(sql);
			try {
				int rows = db.pst.executeUpdate();
				System.out.println(rows);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public int getProductAmount(int itemid){
		sql = "select sum(amount) from orderdetail where itemID="+itemid;
		db = new DBHelper(sql);
		
		try {
			ret = db.pst.executeQuery();
			ret.next();
			return ret.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap<Integer,Integer> map = new HashMap<>();
		
		return 1;
	}
	
	public HashMap<Integer,Integer> getProductMap(ArrayList<Integer> itemlist){
		HashMap<Integer,Integer> map = new HashMap<>();
		for(Iterator<Integer> iter=itemlist.iterator();iter.hasNext();){
			int id = iter.next();
			int amount = getProductAmount(id);
			map.put(id, amount);
		}
		
		return map;
	}
	
	public List<Map.Entry<Integer, Integer>> sortMap(HashMap<Integer,Integer> map){
		
		List<Map.Entry<Integer, Integer>> infoIds =
			    new ArrayList<Map.Entry<Integer, Integer>>(map.entrySet());
		
		//排序前
		for (int i = 0; i < infoIds.size(); i++) {
		    String id = infoIds.get(i).toString();
		    System.out.println(id);
		}
		Collections.sort(infoIds, new Comparator<Map.Entry<Integer, Integer>>() {   
		    public int compare(Map.Entry<Integer, Integer> o1, Map.Entry<Integer, Integer> o2) {      
		        return (o2.getValue() - o1.getValue()); 
		    }
		}); 
		//排序后
		for (int i = 0; i < infoIds.size(); i++) {
		    String id = infoIds.get(i).toString();
		    System.out.println(id);
		}
		
		
		return infoIds;
	}
	
	public static void main(String[] args){
		OrderDetailDao dao = new OrderDetailDao();
		ProductDao pdao = new ProductDao();
		
		dao.sortMap(dao.getProductMap(pdao.getAllProductID()));
		
	}
	
	
	
	

}
