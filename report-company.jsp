<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Company companyDetails = new Company();
	ArrayList allCompany = companyDetails.getAllCompany();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Company Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Company Name</th>
			  <th>Phone</th>
              <th>Address</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allCompany.size();i++) 
			{ 
				HashMap CompanyDetails = new HashMap();
				CompanyDetails = (HashMap)allCompany.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(CompanyDetails.get("company_name")); %></td>
				  <td><% out.print(CompanyDetails.get("company_phone")); %></td>
				  <td><% out.print(CompanyDetails.get("company_address")); %></td>
				  <td> 
					<a href="company.jsp?company_id=<% out.print(CompanyDetails.get("company_id")); %>">Edit</a>
				  </td>
				</tr>
			<%
			}
			if(allCompany.size() == 0) 
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
