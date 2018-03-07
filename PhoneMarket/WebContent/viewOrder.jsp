<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.ProductVO" %>
<%@ page import="vo.OrderVO" %>
<%@ page import="vo.UserVO" %>
<%@ page import="dao.OrderDao" %>
<%@ page import="dao.UserDao" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <meta name="renderer" content="webkit">
  <title></title>
  <link rel="stylesheet" href="common/css/pintuer.css">
  <link rel="stylesheet" href="common/css/admin.css">
  <script src="js/jquery.js"></script>
  <script src="js/pintuer.js"></script>
</head>
<%@ include file="checkLogin.jsp" %>
<body>
    <div class="panel admin-panel">
      <div class="panel-head"><strong class="icon-reorder">查看订单</strong></div>
			<div class="padding border-bottom">
			<ul class="search">
				<li>
					<form class="form-inline definewidth m20" action="FilterOrderServlet" method="get">
						<input type="date" class="input w50" id="start" name="start"/>&nbsp;
						<input type="date" class="input w50" id="end" name="end"/>&nbsp;
						<input type="text" class="input w50" value="" name="phonenumber" placeholder="订单手机号"/>
						<button type="submit" class="button border-green">查询订单</button>
					</form>
				</li>
			</ul>
		</div>
			<%
				OrderDao vieworderdao = new OrderDao();
				
				String orderstate = request.getParameter("state");
				String type = request.getParameter("type");
				ArrayList<OrderVO> viewlist = null;
				if(orderstate!=null){
					if (orderstate.equals("9")) {
						viewlist = vieworderdao.getAllOrders();
					} else if (orderstate.equals("0")) {
						viewlist = vieworderdao.getUnshipOrders();
					} else if (orderstate.equals("1")) {
						viewlist = vieworderdao.getShipOrders();
					} else {
						//DIALOG
					}
				}
				else if(type!=null){
					if(type.equals("date")){
						String start = request.getParameter("start");
						String end = request.getParameter("end");
						viewlist = vieworderdao.getOrderByDate(start, end);
					}
					else if(type.equals("phone")){
						String phone = request.getParameter("phone");
						viewlist = vieworderdao.getOrderByPhone(phone);
					}
					else if(type.equals("both")){
						String start = request.getParameter("start");
						String end = request.getParameter("end");
						String phone = request.getParameter("phone");
						
						viewlist = vieworderdao.getOrderByDateAndPhone(phone, start, end);
					}
				}
				else{
					viewlist = vieworderdao.getAllOrders();
				}
				
			%>
			<table class="table table-hover text-center">
        <tr>
          <th width="120">订单ID</th>
          <th>下单时间</th>
          <th>收件人</th>
          <th>电话</th>
          <th>收货地址</th>
          <th>订单状态</th>
          <th>操作</th>
          <th>操作</th>
        </tr>
        <%
        	for(Iterator viewiter=viewlist.iterator();viewiter.hasNext();){
        		OrderVO currentOrder = (OrderVO)viewiter.next();
        %>
        		
        		<tr>
                <td><%=currentOrder.getOrderID() %></td>
                <td><%=currentOrder.getGenerateTime() %></td>
                <td><%UserDao viewuserdao = new UserDao();
                	UserVO viewuservo = viewuserdao.getUser(currentOrder.getCustomerID());
                	out.print(viewuservo.getNickname());%></td>
                <td><%=viewuservo.getPhone() %></td>
                <td><%=viewuservo.getAddress() %></td>
                <td><%=vieworderdao.getStateStr(currentOrder.getState()) %></td>
                <td>
                <%
                	int state = currentOrder.getState();
                	if(state==0){
                %>
                		<div class="button-group"> <a class="button border-green" href="OrderShipServlet?orderid=<%=currentOrder.getOrderID() %>&state=<%=orderstate %>"> 发货</a> </div>
                <%}
                %>
                  
                </td>
                <td>
                  <div class="button-group"> <a class="button border-green" href="viewOrderInfo.jsp?orderid=<%=currentOrder.getOrderID()%>">查看订单信息</a> </div>
                </td>
              </tr>
        		
        	<%}
        
        %>
        
       
        <tr>
          <td colspan="8">
          <!-- 此处为分页实现代码 -->
          <%
          	int pagesize = 5;//每一页显示的留言数量
          	int numrows=viewlist.size(); //一共的行数
          	int pages = numrows/pagesize;	//一共的页数
          	int pagenumber;//当前请求的页码数
          	if(numrows%pagesize!=0){
          		//如果有余数 页数增加一页
          		pages++;
          	}
          	//若传来的有nPage参数 则赋值 没有默认为第一页
          	if(request.getParameter("nPage")!=null){
          		pagenumber=Integer.parseInt(request.getParameter("nPage"));//请求的页码
          	}
          	else{
          		pagenumber=1;
          	}
          	if(pagenumber>pages||pagenumber<1){
          		pagenumber=1;
          	}
          	
          	int offset = pagesize*(pagenumber-1);//查询偏移值
          
          %>
            <div class="pagelist">
             <a href="">上一页</a> 
             <%
             	for(int index=0;index<pages;index++){
             %>
                    <a href="viewOrder.jsp?nPage="+index><%out.print(index+1); %></a>
             <%}
             %>
            <!--  <span class="current">1</span> -->
             <a href="">下一页</a>
             <a href="">尾页</a>      
            </div>
          </td>
        </tr>
      </table>
    </div>
  <script type="text/javascript">
    function del(id) {
      if (confirm("您确定要发货吗?")) {

      }
    }

    $("#checkall").click(function () {
      $("input[name='id[]']").each(function () {
        if (this.checked) {
          this.checked = false;
        }
        else {
          this.checked = true;
        }
      });
    })

    function DelSelect() {
      var Checkbox = false;
      $("input[name='id[]']").each(function () {
        if (this.checked == true) {
          Checkbox = true;
        }
      });
      if (Checkbox) {
        var t = confirm("您确认要发货吗？");
        if (t == false) return false;
      }
      else {
        alert("请选择您要发的商品!");
        return false;
      }
    }

  </script>
</body>

</html>