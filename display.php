<html>
<head>
	<title>Display</title>
	<form action="form.php">
			<input type="submit" value="Back" name="back" class="btn" style="background-color:white;">
	</form>
	<style>
		body
		{
			background: #34568B;
		}
		table
		{
			background-color: white;
		}
		h2
		{
			color: white;
		}
	</style>
</head>
</html>
<?php
include("connection.php");
	$dept_name              = $_POST['dept_name'];
	$emergency_relationship = $_POST['emergency_relationship'];
	$querydisplay = "SELECT National_Insurance_Number.full_name, Department.dept_name, Emergency_Contact.emergency_relationship, Employee.emp_manager_id FROM National_Insurance_Number, Department, Emergency_Contact, Employee WHERE Department.dept_name = '$dept_name' AND Emergency_Contact.emergency_relationship = '$emergency_relationship' AND Department.dept_id = Employee.dept_id AND National_Insurance_Number.nin = Employee.nin AND Emergency_Contact.emp_id = Employee.emp_id";

	$datadisplay = mysqli_query($conn, $querydisplay);
	$total = mysqli_num_rows($datadisplay);


	$totalm = mysqli_num_rows($datam);
	
	// $resultm = mysqli_fetch_assoc($datam);
	if($total != 0){
		?>
		<h2 align="center">Displaying All Records</h2>

		<table border="2px" cellspacing="7" width="90%" align="center">
			<tr>
			<th width="24%">Employee Name</th>
			<th width="23%">Department Name</th>
			<th width="30%">Emergency Relationship</th>
			<th width="23%">Manager Name</th>
		</tr>

		



		<?php
		while($resultdisplay = mysqli_fetch_assoc($datadisplay)){
			$querymanagername = "SELECT National_Insurance_Number.full_name FROM National_Insurance_Number, Employee WHERE Employee.emp_id = '$resultdisplay[emp_manager_id]' AND Employee.nin = National_Insurance_Number.nin";
		    $datam = mysqli_query($conn, $querymanagername);
		    $resultm = mysqli_fetch_assoc($datam);
		    echo "<tr>
			        <td>".$resultdisplay[full_name]."</td>
			        <td>".$resultdisplay[dept_name]."</td>
			        <td>".$resultdisplay[emergency_relationship]."</td>
			        <td>".$resultm[full_name]."</td>
		        </tr>
		        ";
			
		}
		
	}

	else{
		echo "no";
	}

		
		




?>
</table>
