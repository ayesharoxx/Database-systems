<?php
include("connection.php")
?>
<html>
<form action="#" method="POST">
	<input type="text" name="month_no" class="textfields" formaction="#" placeholder="Current Month Number (2 Characters)">
	
</form>
<head>
	<title>Display</title>
	<style>
		body
		{
			background: #34568B;
		}
		table
		{
			background-color: white;
		}
		.textfields
		{
			width: 40%;
			height: 40px;
		    font-size: 18px;
		    border: 2px solid #34568B;
		    border-radius: 5px;
		    box-sizing: border-box;
		    padding-left: 10PX;
		    margin: 7px 0;
		}
		.back
		{
			width: 5%;
			height: 40px;
		    font-size: 18px;
		    border: 2px solid #34568B;
		    border-radius: 5px;
		    box-sizing: border-box;
		    padding-left: 10PX;
		    margin: 7px 0;
		}

		h2
		{
			color: white;
		}
	</style>
</head>

<form>
	<input type="submit" value="Back" class="back" name="back" formaction="form.php" class="btn" style="background-color:orange;">
</form>
</html>

<?php
$month_no = $_POST['month_no'];
$querydob = "CALL DisplayByMonth('$month_no')";


$datadob = mysqli_query($conn, $querydob);
$total = mysqli_num_rows($datadob);
if($total != 0){
	?>
	<h2 align="center">Displaying All Records</h2>

		<table border="2px" cellspacing="7" width="90%" align="center">
			<tr>
			<th width="50%">Employee Name</th>
			<th width="50%">Date Of Birth</th>
			
		</tr>

			<?php
		while($resultdob = mysqli_fetch_assoc($datadob)){
		    echo "<tr>
			        <td>".$resultdob[full_name]."</td>
			        <td>".$resultdob[dob]."</td>
		        </tr>
		        ";
			
		}
	}
		
	

	



		
		




?>






