<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Sell sellObj = new Sell();
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
<script>
	$(document).ready(function() {
		var max_fields      = 10; //maximum input boxes allowed
		var wrapper         = $(".input_fields_wrap"); //Fields wrapper
		var add_button      = $(".add_field_button"); //Add button ID
		var add_more_html;
		var x = 1; //initlal text box count
		$(add_button).click(function(e){ //on add input button click
			e.preventDefault();
			if(x < max_fields){ //max input box allowed
				x++; //text box increment
				add_more_html = $("#add_more_fields").html();
				$(wrapper).append(add_more_html); //add input box
			}
		});
		
		$(wrapper).on("click",".remove_field", function(e){ //user click on remove text
			e.preventDefault(); $(this).closest('table').remove(); x--;
			calculateTotal();
		})
	});
	function calculateTotal() {
		var total = 0;
		$('.medicine_total').each(function(i, obj) {
			if($(this).val()) 
			{
				total = total + parseInt($(this).val());
			}
		});
		$('#total_cost').val(total);
	}
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Sell Medicine</h2>
        <form action="model/sell.jsp" method="post">
		  <div id="empl_id" class="half_width">
            <label for="email">Customer Name<span>*</span></label>
            <input type = "text" name = "customer_name" id="customer_name" style="width:300px;" required>
          </div>
		  <div class="half_width">
            <label for="email">Mobile Number<span>*</span></label>
            <input type = "text" name = "customer_mobile" id="customer_mobile" style="width:300px;" required>
          </div>
		  <div class="input_fields_wrap">
			<div style="margin-bottom:15px; clear:both; text-align: right;">
				<button class="add_field_button my_button">Add More Medicine</button>
			</div>
				<table>
					<tr>
						<th>Medicine</th>
						<th>Quantity</th>
						<th>Unit Price</th>
						<th>Total</th>
						<th>Action</th>
					</tr>
					<tr>
						<td>
							<select name="medicine_name" id="medicine_name" required>
								<% out.print(sellObj.getMedicineOption(0)); %>
							</select>
						</td>
						<td><input type="text" name="medicine_quantity" id="medicine_quantity" required></td>
						<td><input type="text" name="medicine_price_per_unit" id="medicine_price_per_unit" required></td>
						<td><input type="text" name="medicine_total" class="medicine_total" required onkeyup="calculateTotal()"></td>
						<td style="width:100px;"> &nbsp; </td>
					</tr>
				</table>
          </div>
		  <div style="float:right"><b>Total Cost: </b><input type="text" style=" width:300px" id="total_cost" name="total_cost"></div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Sales">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
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
<!-- Add More HTML Block -->
<div id = "add_more_fields" style="display:none">
	<table>
		<tr style="background-color:#ffffff">
			<td>
				<select name="medicine_name" id="medicin_name" required>
					<% out.print(sellObj.getMedicineOption(0)); %>
				</select>
			</td>
			<td><input type="text" name="medicine_quantity" required></td>
			<td><input type="text" name="medicine_price_per_unit" required></td>
			<td><input type="text" name="medicine_total" class="medicine_total" required onkeyup="calculateTotal()"></td>
			<td style="width:100px; text-align:center; vertical-align:middle; font-weight:bold; font-size:11px;"><a href="#" class="remove_field">Remove</a></td>
		</tr>
	</table>
</div>
<%@ include file="includes/footer.jsp" %>
