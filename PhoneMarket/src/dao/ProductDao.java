package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.DBHelper;

import vo.CartVO;
import vo.ProductVO;

public class ProductDao {
	
	private static DBHelper db;
	private static ResultSet ret;
	private static String sql;
	
	public ProductVO getProduct(int itemID){
		ProductVO product = new ProductVO();
		sql = "select * from item where itemID=\""+itemID+"\"";
		System.out.println(sql);
		db = new DBHelper(sql);
		try {
			ret = db.pst.executeQuery();
			if(ret.next()){
				product.setItemID(ret.getInt(1));
				product.setItemName(ret.getString(2));
				product.setDescription(ret.getString(3));
				product.setUnitPrice(ret.getFloat(4));
				product.setNumber(ret.getInt(5));
				product.setIsOff(ret.getInt(7));
				product.setBrand(ret.getString(8));
				product.setType(ret.getString(9));
				product.setParameter(ret.getString(10));
				
				return product;
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
	public ArrayList<Integer> getAllProductID(){
		ArrayList<Integer> list = new ArrayList<>();
		sql = "select itemID from item";
		db = new DBHelper(sql);
		
		try {
			ret = db.pst.executeQuery();
			while(ret.next()){
				list.add(ret.getInt(1));
			}
			
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	public void updateProductAmount(int itemID,int number){
		sql = "update item set number=number-"+number+" where itemID="+itemID;
		System.out.println(sql);
		
		db = new DBHelper(sql);
		try {
			db.pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public ArrayList<ProductVO> checkAmount(ArrayList<CartVO> list){
		ArrayList<ProductVO> unvalidlist = new ArrayList<>();
		for(Iterator<CartVO> iter=list.iterator();iter.hasNext();){
			CartVO cartitem = iter.next();
			if(getProduct(cartitem.getItemID()).getNumber()-cartitem.getAmount()<0){
				unvalidlist.add(getProduct(cartitem.getItemID()));
			}
			
		}
		return unvalidlist;
	}

}
