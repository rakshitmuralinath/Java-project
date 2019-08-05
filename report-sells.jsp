<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Sell sellDetails = new Sell();
	ArrayList allSell = sellDetails.getAllOrder();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Sell Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Customer Name</th>
			  <th>Mobile</th>
              <th>Total Order</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allSell.size();i++) 
			{ 
				HashMap SellDetails = new HashMap();
				SellDetails = (HashMap)allSell.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(SellDetails.get("order_customer_name")); %></td>
				  <td><% out.print(SellDetails.get("order_customer_mobile")); %></td>
				  <td>&#8377; <% out.print(SellDetails.get("order_total")); %>.00</td>
				  <td><a href="print-receipt.jsp?order_id=<% out.print(SellDetails.get("order_id")); %>">View Details</a></td>
				</tr>
			<%
			}
			if(allSell.size() == 0) 
			{
			%>
				<tr>
					<td colspan="5">No Records Found !!!</td>
				</tr>
			<%
			}
			%>
			</tbody>
        </table>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
