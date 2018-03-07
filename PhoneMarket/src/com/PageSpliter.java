package com;

import java.util.ArrayList;
import java.util.List;

public class PageSpliter {
	
	private int pagesize=4;//每一页显示的留言数量
	
  	
  	public int getPagesize() {
		return pagesize;
	}


	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}


	public int getPagePara(List list){
  		
  		int numrows = list.size();
  		int pages = numrows/pagesize;
  		if(numrows%pagesize!=0){
  			pages++;
  		}
  		
  		return pages;
  	}
  	
//  	if(numrows%pagesize!=0){
//  		//如果有余数 页数增加一页
//  		pages++;
//  	}
  	//若传来的有nPage参数 则赋值 没有默认为第一页
  	
  


}
