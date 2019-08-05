<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Medicine medicineDetails = new Medicine();
	String employeeID = "0";
	ArrayList allMedicine = medicineDetails.getAllMedicine();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Medicine Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Medicine Name</th>
			  <th>Type</th>
              <th>Company</th>
              <th>Units (mg)</th>
			  <th>Price Per Unit</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allMedicine.size();i++) 
			{ 
				HashMap MedicineDetails = new HashMap();
				MedicineDetails = (HashMap)allMedicine.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(MedicineDetails.get("medicine_title")); %></td>
				  <td><% out.print(MedicineDetails.get("type_title")); %></td>
				  <td><% out.print(MedicineDetails.get("company_name")); %></td>
				  <td><% out.print(MedicineDetails.get("medicine_unit")); %></td>
				  <td><% out.print(MedicineDetails.get("medicine_price_per_unit")); %></td>
				  <td> 
					<a href="medicine.jsp?medicine_id=<% out.print(MedicineDetails.get("medicine_id")); %>">Edit</a>
				  </td>
				</tr>
			<%
			}
			if(allMedicine.size() == 0) 
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
