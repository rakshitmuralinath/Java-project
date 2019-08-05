<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Medicine medicineDetails = new Medicine();
	String medicineLabel = "Save";
	int medicine_id = Integer.parseInt(request.getParameter ("medicine_id"));
	if(medicine_id != 0) {
		medicineLabel = "Update";
	}
	HashMap Values =  medicineDetails.getMedicineDetails(medicine_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Medicine Entry Form</h2>
        <form action="model/medicine.jsp" method="post">
		  <div id="empl_id">
            <label for="email">Medicine Type<span>*</span></label>
            <select style="height: 40px; width:300px" name = "medicine_type_id" id = "medicine_type_id" required>
            	<% out.print(medicineDetails.getMedicineTypeOption((Integer) Values.get("medicine_type_id"))); %>
            </select>
          </div>
		  <div>
            <label for="email">Medicine Company<span>*</span></label>
            <select style="height: 40px; width:300px" name = "medicine_company_id" id = "medicine_company_id" required>
            	<% out.print(medicineDetails.getCompanyOption((Integer) Values.get("medicine_company_id"))); %>
            </select>
          </div>
		  <div id="medicine_status_row">
            <label for="email">Medicine Name<span>*</span></label>
			<input type="text" name="medicine_title" id="medicine_title" value="<% out.print(Values.get("medicine_title")); %>" size="22" style="width:300px;" required>
          </div>
          <div>
            <label for="email">Medicine Units (mg)<span>*</span></label>
            <input type="text" name="medicine_unit" id="medicine_unit" value="<% out.print(Values.get("medicine_unit")); %>" size="22" style="width:300px;" required>
          </div>
		  <div>
            <label for="email">Medicine Price Per Unit<span>*</span></label>
            <input type="text" name="medicine_price_per_unit" id="medicine_price_per_unit" value="<% out.print(Values.get("medicine_price_per_unit")); %>" size="22" style="width:300px;" required>
          </div>
          <div>
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="medicine_description" required><% out.print(Values.get("medicine_description")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="<% out.print(medicineLabel); %> Medicine">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="medicine_id" value="<% out.print(Values.get("medicine_id")); %>"/>
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
