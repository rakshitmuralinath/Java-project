<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	int order_id = Integer.parseInt(request.getParameter ("order_id"));
	Sell sellDetails = new Sell();
	ArrayList allSell = sellDetails.getAllSell(order_id);
	HashMap customerDetails = new HashMap();
	customerDetails = (HashMap)allSell.get(0);
%>
<style>
table {
	margin-bottom:0px;
}
#comments input, #comments textarea {
	padding:5px;
}
.my_button {
	cursor: pointer;
    display: inline-block;
    margin: 0;
    padding: 4px 5px;
    width: auto;
	background-color: #ac1212;
    color: #ffffff;
    font-weight: bold;
}
</style>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Medicine Receipt</h2>
        <form action="model/sell.jsp" method="post">
		  <div id="empl_id" class="half_width" style="color:#000000">
           <b>Customer Name : <% out.print(customerDetails.get("order_customer_name")); %></b>
          </div>
		  <div class="half_width" style="color:#000000; clear:both">
            <b>Mobile Number : <% out.print(customerDetails.get("order_customer_mobile")); %></b>
          </div>
		  <div class="input_fields_wrap" style="clear:both">
				<table>
					<tr>
						<th>Medicine</th>
						<th>Quantity</th>
						<th>Unit Price</th>
						<th>Total</th>
					</tr>
					<% 
					for(int i=0;i<allSell.size();i++) 
					{ 
						HashMap SellDetails = new HashMap();
						SellDetails = (HashMap)allSell.get(i);
					%>
					<tr>
						<td><% out.print(SellDetails.get("medicine_title")); %></td>
						<td><% out.print(SellDetails.get("sell_units")); %></td>
						<td><% out.print(SellDetails.get("sell_price_per_unit")); %></td>
						<td>&#8377; <% out.print(SellDetails.get("sell_total_cost")); %></td>
					</tr>
					<%
					}
					%>
					<tr style="font-weight:bold;">
						<td colspan="3" style="text-align:right">Total</td>
						<td>&#8377; <% out.print(customerDetails.get("order_total")); %></td>
				</table>
          </div>
          <div class="block clear"></div>
		  <input type="hidden" name="act" value="Save" />
        </form>
        </div>
        <div style="float: left">
        	<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
        	<div><img src="images/save_2.jpg" style="width: 250px"></div>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
