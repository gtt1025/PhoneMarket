package vo;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderVO {
	private int orderID;
	private int customerID;
	private Timestamp generateTime;
	private int state;
	private float orderprice;
	
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public Timestamp getGenerateTime() {
		return generateTime;
	}
	public void setGenerateTime(Timestamp generateTime) {
		this.generateTime = generateTime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public float getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(float orderprice) {
		this.orderprice = orderprice;
	}
	
	

}
