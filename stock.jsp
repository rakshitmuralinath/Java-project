<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Stock stockDetails = new Stock();
	String stockLabel = "Save";
	int stock_id = Integer.parseInt(request.getParameter ("stock_id"));
	if(stock_id != 0) {
		stockLabel = "Update";
	}
	HashMap Values =  stockDetails.getStockDetails(stock_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Stock Entry Form</h2>
        <form action="model/stock.jsp" method="post">
		  <div id="empl_id">
            <label for="email">Select Medicine<span>*</span></label>
            <select style="height: 40px; width:300px" name = "stock_medicine_id" id = "stock_medicine_id" required>
            	<% out.print(stockDetails.getMedicineOption((Integer) Values.get("stock_medicine_id"))); %>
            </select>
          </div>
		  <div>
            <label for="email">No. of items in Stock<span>*</span></label>
            <input type="text" name="stock_number" id="stock_number" value="<% out.print(Values.get("stock_number")); %>" size="22" style="width:300px;" required>
          </div>
          <div>
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="stock_description" required><% out.print(Values.get("stock_description")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="<% out.print(stockLabel); %> Stock">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="stock_id" value="<% out.print(Values.get("stock_id")); %>"/>
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
