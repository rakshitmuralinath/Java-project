<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Stock stockDetails = new Stock();
	ArrayList allStock = stockDetails.getAllStock();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Stock Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Medicine Name</th>
			  <th>Stock</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allStock.size();i++) 
			{ 
				HashMap StockDetails = new HashMap();
				StockDetails = (HashMap)allStock.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(StockDetails.get("medicine_title")); %></td>
				  <td><% out.print(StockDetails.get("stock_number")); %></td>
				  <td><a href="stock.jsp?stock_id=<% out.print(StockDetails.get("stock_id")); %>">Edit</a></td>
				</tr>
			<%
			}
			if(allStock.size() == 0) 
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
