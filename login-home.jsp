<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
	    <div style="width: 70%; float:left; margin-right:30px" id="login-home">
		  <h2>Welcome to Pharmacy Management System</h2>
		  
		  <!-- Dashboard For User Section -->
		  <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) { %>		
		  <ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="about-us.jsp">About Us</a></li>
			<li><a href="faq-list.jsp">FAQ</a></li>
			<li><a href="ticket.jsp?ticket_id=0">Add Ticket</a></li>
			<li><a href="report-salary.jsp?emp_id=<%=session.getAttribute("login_emp_id")%>">My Ticket Report</a></li>
			<li><a href="employee.jsp?employee_id=<%=session.getAttribute("login_emp_id")%>">My Account</a></li>
			<li><a href="change-password.jsp">Change Password</a></li>
			<li><a href="login.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		  
		 <!-- Dashboard For Super Admin Section -->
		 <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>		
		  <ul>
		  	<li><a href="employee.jsp?employee_id=0">Add User</a></li>
			<li><a href="sell.jsp">Add Sell</a></li>
			<li><a href="report-medicine.jsp">Manage Medicine</a></li>
			<li><a href="stock.jsp?stock_id=0">Manage Stock</a></li>
			<li><a href="report-sell.jsp?emp_id=0">Manage Sell</a></li>
			<li><a href="report-employee.jsp">Manage User</a></li>
			<li><a href="change-password.jsp">Change Password</a></li>
			<li><a href="login.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		  
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
