<?php
include("connection.php")
?>
<?php
   if(isset($_POST['searchdata']))
   {

   	$search = $_POST['emp_id'];

   	$searchquery = "SELECT * from Employee where emp_id = '$search'";
   	$datasearch = mysqli_query($conn, $searchquery);
   	$resultsearch = mysqli_fetch_assoc($datasearch);
   	$ninsearch = $resultsearch['nin'];
   	$dept_id_searched = $resultsearch['dept_id'];

   	$searchquerynin = "SELECT * from National_Insurance_Number where nin = '$ninsearch'";
   	$datasearchnin = mysqli_query($conn, $searchquerynin);
   	$resultsearchnin = mysqli_fetch_assoc($datasearchnin);

   	$searchqueryemergency = "SELECT * from Emergency_Contact where emp_id = '$search'";
   	$datasearchemergency = mysqli_query($conn, $searchqueryemergency);
   	$resultsearchemergency = mysqli_fetch_assoc($datasearchemergency);

   	$searchquery_management = "SELECT * from Management_Department where manager_id = '$search'";
   	$datasearch_management = mysqli_query($conn, $searchquery_management);
   	$resultsearch_management = mysqli_fetch_assoc($datasearch_management);

 
   }
?>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Kilburnazone</title>

<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="center">
		<form action="#" method="POST">
		<h1>Kilburnazone</h1>
		<div class="form">

			<input type="text" name="emp_id" class="textfield" placeholder="Employee ID (Search ID)" value="<?php if(isset($_POST['searchdata'])){echo $resultsearch['emp_id'];}?>">

			<input type="text" name="emp_manager_id" class="textfield" placeholder="Employee Manager ID" value="<?php if(isset($_POST['searchdata'])){echo $resultsearch['emp_manager_id'];}?>">

			<input type="text" name="full_name" class="textfield" placeholder="Employee Name" value="<?php if(isset($_POST['searchdata'])){echo $resultsearchnin['full_name'];}?>">

			<input type="text" name="address" class="textfield" placeholder="Address" value="<?php if(isset($_POST['searchdata'])){echo $resultsearchnin['address'];}?>">

			<input type="text" name="salary" class="textfield" placeholder="Salary" value="<?php if(isset($_POST['searchdata'])){echo $resultsearchnin['salary'];}?>">

			<input type="text" name="dob" class="textfield" placeholder="Birthday" value="<?php if(isset($_POST['searchdata'])){echo $resultsearchnin['dob'];}?>">

			<input type="text" name="nin" class="textfield" placeholder="National Insurance Number" value="<?php if(isset($_POST['searchdata'])){echo $resultsearch['nin'];}?>">

			<select class="textfield" name="dept_name">
				<option>Select Department</option>

				<option value="HR"
				<?php
				if($resultsearch['dept_id'] == '1')
				{
					echo "selected";
				}
				?>
				>HR</option>
				<option value="Packager"
					<?php
				if($resultsearch['dept_id'] == '2')
				{
					echo "selected";
				}
				?>
				>Packager</option>

				<option value="Driver"
					<?php
				if($resultsearch['dept_id'] == '3')
				{
					echo "selected";
				}
				?>
				>Driver</option>

				<option value="Manager"
					<?php
				if($resultsearch['dept_id'] == '4')
				{
					echo "selected";
				}
				?>
				>Manager</option>
			</select>

			<input type="text" name="emergency_name" class="textfield" placeholder="Emergency Name" value="<?php if(isset($_POST['searchdata'])){echo $resultsearchemergency['emergency_name'];}?>">

			<input type="text" name="emergency_relationship" class="textfield" placeholder="Emergency Relationship" value="<?php if(isset($_POST['searchdata'])){echo $resultsearchemergency['emergency_relationship'];}?>">

			<input type="text" name="emergency_phone" class="textfield" placeholder="Emergency Phone" value="<?php if(isset($_POST['searchdata'])){echo $resultsearchemergency['emergency_phone'];}?>">

			<input type="text" name="location" class="textfield" placeholder="Location:(Manchester/London) if department is Management Department" value="<?php if(isset($_POST['searchdata'])){echo $resultsearch_management['location'];}?>">

			<input type="submit" value="Search" name="searchdata" class="btn">

			<input type="submit" name="add" value="Add" name="" class="btn" style="background-color: green;">

			<input type="submit" value="Update" name="update" class="btn" style="background-color: orange;">

			<input type="submit" value="Delete" name="delete" class="btn" style="background-color: red;">

			<input type="submit" value="Display" name="display" formaction="display.php" class="btn" style="background-color:blue;">

			<input type="submit" value="Display By Month" name="month" formaction="birthday.php" class="btn" style="background-color:grey;">
	   </div>
	   </form>
	</div>

</body>

</html>

<!-- TASK1 -->

<?php
if(isset($_POST['add'])){
	$emp_id                 = $_POST['emp_id'];
	$emp_manager_id         = $_POST['emp_manager_id'];
	$full_name              = $_POST['full_name'];
	$address                = $_POST['address'];
	$salary                 = $_POST['salary'];
	$dob                    = $_POST['dob'];
	$nin                    = $_POST['nin'];
	$dept_name              = $_POST['dept_name'];
	$emergency_name         = $_POST['emergency_name'];
	$emergency_relationship = $_POST['emergency_relationship'];
	$emergency_phone        = $_POST['emergency_phone'];
	$location               = $_POST['location'];

	$dept_id = "0";

    //getting dept_id to insert in employee table using dept_name
	if($dept_name == "HR")
		$dept_id = "1";
	if($dept_name == "Packager")
		$dept_id = "2";
	if($dept_name == "Driver")
		$dept_id = "3";
	if($dept_name == "Manager")
		$dept_id = "4";
    
    $failed = false;
    if($emp_id == null){
    	echo "<script> alert('Employee_id field is required. Please enter emp_id to add employee')</script>";
    	$failed = true;

    }
    if($dept_id == 0){
    	echo "<script> alert('Department name field is required. Please enter dept_name to add employee')</script>";
    	$failed = true;

    }
    else{
	    $sqlvalidation = "SELECT * FROM Employee where emp_id = '$emp_id'";
	    $resultvalidation = mysqli_query($conn, $sqlvalidation);
	    $fetchvalidation = mysqli_fetch_assoc($resultvalidation);
	    if($fetchvalidation['emp_id'] == $emp_id){
	    	echo "<script> alert('Employee already exists in database')</script>";
	    	$failed = true;
	    	

	    }
    }

    if($failed == false){
	
		//getting dept_manager_id using dept_id to insert value in employee manager table
	    $sql = "SELECT * FROM Department where dept_id='$dept_id'";
	    $result = mysqli_query($conn,$sql);
	    $fetch = mysqli_fetch_assoc($result);
	    $dept_manager_id = $fetch['dept_manager_id'];

	    //inseritng data into national_insurance_table first because nin is primary key in this table but foreign key in employee
	    $query = "INSERT INTO National_Insurance_Number (nin, full_name, dob, address, salary) VALUES ('$nin', '$full_name', '$dob', '$address', '$salary')";
	    $data = mysqli_query($conn, $query);

	    //inserting data into employee 
	    $queryemp = "INSERT INTO Employee (emp_id, nin, dept_id, emp_manager_id) VALUES ('$emp_id', '$nin', '$dept_id', '$emp_manager_id')";
	    $dataemp = mysqli_query($conn, $queryemp);

	    //Next inseritng data into emergency contact 
	    $queryemergency = "INSERT INTO Emergency_Contact (emp_id, emergency_name, emergency_relationship, emergency_phone) VALUES ('$emp_id', '$emergency_name', '$emergency_relationship', '$emergency_phone')";
	    $dataemergency = mysqli_query($conn, $queryemergency);

	    //Next inserting data into employee manager table
	    $querymanager = "INSERT INTO Employee_Manager (emp_id, emp_manager_id, dept_manager_id) VALUES ('$emp_id', '$emp_manager_id', '$dept_manager_id')";
	    $dataemanager = mysqli_query($conn, $querymanager);

	    //Finally adding employee to management department if employee is manager(i.e if dept_id == 4)
	    $l = true;
	    if($dept_name == "Manager")
			$querymanagementdept = "INSERT INTO Management_Department (manager_id, location) VALUES ('$emp_id', '$location')";
	        $datamanagementdept = mysqli_query($conn, $querymanagementdept);
	        $l = $datamanagementdept;
    }

    if($data && $dataemp && $dataemergency && $dataemanager && l){
    	echo "<script> alert('Record Added')</script>";
    }
    else{
    	echo "<script> alert('Failed to add record')</script>";
    }
    // {
    // 	echo "data added";
    // }
    // else
    // {
    // 	echo "failed";
    // 	printf(mysqli_error($conn));
    // }
}
?>

<!-- TASK2 -->

<?php
if(isset($_POST['update'])){

    //getting old nin so that we can update values of the searched employee in table nin

	$emp_id                 = $_POST['emp_id'];

	$searchquery_new = "SELECT * from Employee where emp_id = '$emp_id'";
   	$datasearch_new = mysqli_query($conn, $searchquery_new);
   	$resultsearch_new = mysqli_fetch_assoc($datasearch_new);
   	$ninsearch_new = $resultsearch_new['nin'];

 
    //fetching the new values
	$emp_manager_id         = $_POST['emp_manager_id'];
	$full_name              = $_POST['full_name'];
	$address                = $_POST['address'];
	$salary                 = $_POST['salary'];
	$dob                    = $_POST['dob'];
	$nin                    = $_POST['nin'];
	$dept_name              = $_POST['dept_name'];
	$emergency_name         = $_POST['emergency_name'];
	$emergency_relationship = $_POST['emergency_relationship'];
	$emergency_phone        = $_POST['emergency_phone'];
	$location               = $_POST['location'];

	//getting dept_id to insert in employee table using dept_name
	if($dept_name == "HR")
		$dept_id = "1";
	if($dept_name == "Packager")
		$dept_id = "2";
	if($dept_name == "Driver")
		$dept_id = "3";
	if($dept_name == "Manager")
		$dept_id = "4";

	
     //updating records in all tables with given emp_id

    $newquery_nin = "UPDATE National_Insurance_Number SET nin = '$nin', full_name = '$full_name', dob = '$dob', address = '$address', salary = '$salary' WHERE nin = '$ninsearch_new'";

	$newquery_employee = "UPDATE Employee SET emp_id = '$emp_id', nin = '$nin', dept_id = '$dept_id', emp_manager_id = '$emp_manager_id' WHERE emp_id = '$emp_id'";

	$newquery_emergency = "UPDATE Emergency_Contact SET emp_id = '$emp_id', emergency_name = '$emergency_name', emergency_relationship = '$emergency_relationship', emergency_phone = '$emergency_phone' WHERE emp_id = '$emp_id'";

	$newquery_employee_manager = "UPDATE Employee_Manager SET emp_id = '$emp_id', emp_manager_id = '$emp_manager_id', dept_manager_id = '$dept_manager_id' WHERE emp_id = '$emp_id'";

	$newquery_management = "UPDATE Management_Department SET manager_id = '$emp_id', location = '$location' WHERE manager_id = '$emp_id'";
 
	$data_newquery_nin              = mysqli_query($conn, $newquery_nin);
	$data_newquery_employee         = mysqli_query($conn, $newquery_employee);
	$data_newquery_emergency        = mysqli_query($conn, $newquery_emergency);
	$data_newquery_employee_manager = mysqli_query($conn, $newquery_employee_manager);
	$data_newquery_management       = mysqli_query($conn, $newquery_management);

	if($data_newquery_nin && $data_newquery_employee && $data_newquery_emergency && $data_newquery_employee_manager && $data_newquery_management)
	{
		echo "<script> alert('Record Updated')</script>";
	}
	else{
		echo "<script> alert('Failed to Update')</script>";

	}



}

?>

<!-- TASK3 -->
<?php
if(isset($_POST['delete']))
{
	$get_emp_id = $_POST['emp_id'];


	$sqlValidationDel = "SELECT * FROM Employee where emp_id = '$get_emp_id'";
    $resultValidationDel = mysqli_query($conn, $sqlValidationDel);
    $fetchValidationDel = mysqli_fetch_assoc($resultValidationDel);
    if($fetchValidationDel['emp_id'] != $get_emp_id){
    	echo "<script> alert('Employee does not exist')</script>";

    }
    else{
	    $searchquery_delete = "SELECT * from Employee where emp_id = '$get_emp_id'";
	   	$datasearch_delete = mysqli_query($conn, $searchquery_delete);
	   	$resultsearch_delete = mysqli_fetch_assoc($datasearch_delete);
	   	$nindelete = $resultsearch_delete['nin'];
		$query_empdel = "DELETE FROM Employee_Manager WHERE emp_id = '$get_emp_id'";
		$query_del = "DELETE FROM National_Insurance_Number WHERE nin = '$nindelete'";
		$data_del_emp = mysqli_query($conn, $query_empdel);
		$data_del = mysqli_query($conn, $query_del);

		if($data_del && $data_del_emp)
		{
			echo "<script> alert('Record Deleted')</script>";
		}

		else
		{
			echo "<script> alert('Failed to Delete')</script>";
		}

    }

	
} 
?>


<!-- TASK4 -->
<?php
if(isset($_POST['display'])){
	

	header("location:display.php");
}

?>

<!-- TASK5
IN birthday.php -->


