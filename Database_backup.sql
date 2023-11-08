-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 02, 2022 at 02:39 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `s56124at`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`s56124at`@`localhost` PROCEDURE `DisplayByMonth` (IN `monthNo` VARCHAR(2))   BEGIN
   SELECT full_name,dob FROM National_Insurance_Number WHERE dob LIKE Concat('%/',monthNo,'/%');
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Areas_Of_UK`
--

CREATE TABLE `Areas_Of_UK` (
  `area_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Complaint`
--

CREATE TABLE `Complaint` (
  `complaint_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `complaint_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `complaint_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `emp_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `full_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email_address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `postal_location` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `dept_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_manager_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`dept_id`, `dept_name`, `dept_manager_id`) VALUES
('1', 'HR', '35-7212754'),
('2', 'Packager', '47-3147567'),
('3', 'Driver', '06-2857563'),
('4', 'Manager', '83-4865660');

-- --------------------------------------------------------

--
-- Table structure for table `Department_Information`
--

CREATE TABLE `Department_Information` (
  `dept_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `head_office_location` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number_of_employees` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Department_Information`
--

INSERT INTO `Department_Information` (`dept_name`, `head_office_location`, `number_of_employees`) VALUES
('Driver', 'street 2', '7'),
('HR', 'oxford', '2'),
('Manager', 'street 7', '8'),
('Packager', 'kent', '5');

-- --------------------------------------------------------

--
-- Table structure for table `Driver`
--

CREATE TABLE `Driver` (
  `emp_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number_of_hours` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vehicle_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Emergency_Contact`
--

CREATE TABLE `Emergency_Contact` (
  `emp_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emergency_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `emergency_relationship` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `emergency_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Emergency_Contact`
--

INSERT INTO `Emergency_Contact` (`emp_id`, `emergency_name`, `emergency_relationship`, `emergency_phone`) VALUES
('05-1128789', 'Bambie Bennell', 'Father', '07411 921 600'),
('06-2857563', 'Joyann Spellessy', 'Husband', '07873 688 139'),
('07-4517183', 'Regan Yarn', 'Mother', '07231 462 728'),
('12-1234567', 'Dan Mathhew', 'Father', '09876 543 678'),
('12-6888959', 'Neila Haimes', 'Girlfriend', '07794 407 646'),
('13-9234597', 'Cull Harraway', 'Mother', '07970 418 060'),
('22-3708071', 'Jereme Slayford', 'Girlfriend', '07721 065 357'),
('30-1322103', 'Bastian Walliker', 'Civil Partner', '07695 349 556'),
('31-9709677', 'Orelie Balasin', 'Civil Partner', '07971 986 560'),
('33-1897506', 'Georgena Clappison', 'Husband', '07584 205 419'),
('35-7212754', 'Amye Brecknock', 'Mother', '07633 415 279'),
('45-1060690', 'Cooper Sillars', 'Husband', '07228 676 244'),
('47-3147567', 'Sigmund McLafferty', 'Wife', '07996 723 103'),
('49-2217652', 'Nessy Panting', 'Civil Partner', '07326 502 172'),
('68-5871521', 'Ernestine Syne', 'Father', '07699 779 427'),
('74-0303597', 'Reed Easterfield', 'Civil Partner', '07523 340 134'),
('75-0958781', 'Lorri Elkington', 'Girlfriend', '07692 074 959'),
('83-4865660', 'Rosabella Howlin', 'Father', '07545 233 448'),
('87-6633787', 'Cassandra Merle', 'Mother', '07220 743 776'),
('87-8002965', 'Reeba Lamartine', 'Mother', '07726 563 483'),
('90-6409982', 'Krissy Clayworth', 'Mother', '07448 190 979'),
('98-1678319', 'Maryjo Elgie', 'Wife', '07007 723 133');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `emp_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nin` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_id` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_manager_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`emp_id`, `nin`, `dept_id`, `emp_manager_id`) VALUES
('05-1128789', 'ds948250k', '3', '33-1897506'),
('06-2857563', 'ya877759r', '4', ''),
('07-4517183', 'rz111360g', '2', '33-1897506'),
('12-1234567', 'hz080623x', '3', '33-1897506'),
('12-6888959', 'yc393041q', '2', '33-1897506'),
('13-9234597', 'he783674o', '2', '87-8002965'),
('22-3708071', 'rb499211c', '1', '74-0303597'),
('30-1322103', 'zw251674d', '2', '33-1897506'),
('31-9709677', 'fp198238e', '3', '87-6633787'),
('33-1897506', 'un133384d', '4', ''),
('35-7212754', 'uw834458r', '4', ''),
('45-1060690', 'vr974451g', '1', '87-8002965'),
('47-3147567', 'yz717919v', '4', ''),
('49-2217652', 'ht175666x', '2', '74-0303597'),
('68-5871521', 'vg613456a', '3', '87-8002965'),
('74-0303597', 'tx085395s', '4', ''),
('75-0958781', 'of014519k', '3', '87-8002965'),
('83-4865660', 'ak984038n', '4', ''),
('87-6633787', 'sm423704x', '4', ''),
('87-8002965', 'rp358778t', '4', ''),
('90-6409982', 'ms059474n', '3', '87-8002965'),
('98-1678319', 'wh660279o', '3', '87-6633787');

-- --------------------------------------------------------

--
-- Table structure for table `Employee_Left`
--

CREATE TABLE `Employee_Left` (
  `emp_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `dept_manager_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Employee_Left`
--

INSERT INTO `Employee_Left` (`emp_id`, `dept_manager_id`, `date_time`) VALUES
('55-3623151', '06-2857563', '2022-12-01 23:25:13'),
('71-7374760', '47-3147567', '2022-12-01 22:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `Employee_Manager`
--

CREATE TABLE `Employee_Manager` (
  `emp_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_manager_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dept_manager_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Employee_Manager`
--

INSERT INTO `Employee_Manager` (`emp_id`, `emp_manager_id`, `dept_manager_id`) VALUES
('05-1128789', '33-1897506', '06-2857563'),
('06-2857563', '', '83-4865660'),
('07-4517183', '33-1897506', ''),
('12-1234567', '33-1897506', '06-2857563'),
('12-6888959', '33-1897506', '47-3147567'),
('13-9234597', '87-8002965', '47-3147567'),
('22-3708071', '74-0303597', '35-7212754'),
('30-1322103', '33-1897506', '47-3147567'),
('31-9709677', '87-6633787', '06-2857563'),
('33-1897506', '', '83-4865660'),
('35-7212754', '', '83-4865660'),
('45-1060690', '87-8002965', '35-7212754'),
('47-3147567', '', '83-4865660'),
('49-2217652', '74-0303597', '47-3147567'),
('68-5871521', '87-8002965', '06-2857563'),
('74-0303597', '', '83-4865660'),
('75-0958781', '87-8002965', '06-2857563'),
('83-4865660', '', '83-4865660'),
('87-6633787', '', '83-4865660'),
('87-8002965', '', '83-4865660'),
('90-6409982', '87-8002965', '06-2857563'),
('98-1678319', '87-6633787', '06-2857563');

--
-- Triggers `Employee_Manager`
--
DELIMITER $$
CREATE TRIGGER `delete_employee` AFTER DELETE ON `Employee_Manager` FOR EACH ROW BEGIN
       INSERT INTO Employee_Left(emp_id, dept_manager_id, date_time)
       VALUES (OLD.emp_id,OLD.dept_manager_id, NOW());
   END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `HR`
--

CREATE TABLE `HR` (
  `emp_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Management_Department`
--

CREATE TABLE `Management_Department` (
  `manager_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Management_Department`
--

INSERT INTO `Management_Department` (`manager_id`, `location`) VALUES
('06-2857563', 'Manchester'),
('33-1897506', 'London'),
('35-7212754', 'London'),
('47-3147567', 'London'),
('74-0303597', 'Manchester'),
('83-4865660', 'Manchester'),
('87-6633787', 'Manchester'),
('87-8002965', 'London');

-- --------------------------------------------------------

--
-- Table structure for table `National_Insurance_Number`
--

CREATE TABLE `National_Insurance_Number` (
  `nin` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `full_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dob` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salary` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `National_Insurance_Number`
--

INSERT INTO `National_Insurance_Number` (`nin`, `full_name`, `dob`, `address`, `salary`) VALUES
('ak984038n', 'Jase Fulk', '29/03/1984', '80 Pennsylvania Center', '90,529.95'),
('ds948250k', 'Paulita Casewell', '15/06/1995', '18 Riverside Trail', '73,099.76 '),
('fp198238e', 'Heda Cathersides', '05/10/1995', '7 Laurel Park', '32,079.57'),
('he783674o', 'Katya Ilewicz', '21/08/1977', '68697 Sutteridge Road', '62,528.81'),
('ht175666x', 'Georas Divisek', '10/05/1951', '25 Moulton Lane', '87,452.13'),
('hz080623x', 'Hazel Roxx', '08/06/2002', 'H88 5BX, Oxford Road', '87,452.13'),
('ms059474n', 'Irv Tomsen', '05/08/1995', '0 Harper Way', '66,852.98'),
('of014519k', 'Velvet Carbine', '12/04/1987', '682 Kensington Drive', '31,440.81'),
('rb499211c', 'Rab Feast', '01/04/1986', '9503 Buell Drive', '30,397.56'),
('rp358778t', 'Fredericka Mathivat', '17/04/1989', '370 Mendota Court', '68,554.76'),
('rz111360g', 'Rochell ODoohaine', '08/11/1973', '1802 Hayes Court', '33,027.23'),
('sm423704x', 'Vivie Jagels', '06/12/1964', '77 Dovetail Drive', '41,830.50'),
('tx085395s', 'Bria Thomkins', '01/04/1952', '7 Homewood Road', '88,871.61'),
('un133384d', 'Verla Seacroft', '18/05/2000', '0134 Fieldstone Trail', '52,928.18'),
('uw834458r', 'Dorian Claringbold', '18/11/1955', '7422 Crownhardt Avenue', '13,347.31'),
('vg613456a', 'Bearnard Parysowna', '08/09/1985', '60052 Monument Alley', '85,175.33 '),
('vr974451g', 'Morgen Shortland', '17/08/2002', '3 Doe Crossing Trail', '81,649.14'),
('wh660279o', 'Lamar Chesters', '01/02/1952', '2234 Heffernan Place', '97,090.47'),
('ya877759r', 'Osgood Sutherby', '20/08/1990', '88855 Merrick Road', '27,045.62'),
('yc393041q', 'Benoit Collman', '12/12/1982', '827 Erie Junction', '74,922.96'),
('yz717919v', 'Britta Northin', '22/01/2003', '757 Ramsey Terrace', '74,080.45'),
('zw251674d', 'Earl Wagerfield', '05/04/1998', '34 Lillian Center', '91,770.28');

-- --------------------------------------------------------

--
-- Table structure for table `Ordered_Products`
--

CREATE TABLE `Ordered_Products` (
  `order_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity_ordered` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Order_Table`
--

CREATE TABLE `Order_Table` (
  `order_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `purchase_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Packager`
--

CREATE TABLE `Packager` (
  `emp_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `product_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Route`
--

CREATE TABLE `Route` (
  `route_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vehicle_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_location` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `end_location` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Stops`
--

CREATE TABLE `Stops` (
  `route_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_arrival` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Vehicles`
--

CREATE TABLE `Vehicles` (
  `vehicle_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `area_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `route_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Warehouse`
--

CREATE TABLE `Warehouse` (
  `warehouse_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `area_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `purpose` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Warehouse_Product`
--

CREATE TABLE `Warehouse_Product` (
  `warehouse_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity_stored` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Areas_Of_UK`
--
ALTER TABLE `Areas_Of_UK`
  ADD PRIMARY KEY (`area_name`);

--
-- Indexes for table `Complaint`
--
ALTER TABLE `Complaint`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `emp_id_complaint_fk` (`emp_id`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `order_id_customer_fk` (`order_id`),
  ADD KEY `emp_id_customer_fk` (`emp_id`);

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`dept_id`),
  ADD KEY `dept_name_department_fk` (`dept_name`);

--
-- Indexes for table `Department_Information`
--
ALTER TABLE `Department_Information`
  ADD PRIMARY KEY (`dept_name`);

--
-- Indexes for table `Driver`
--
ALTER TABLE `Driver`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `warehouse_id_driver_fk` (`warehouse_id`),
  ADD KEY `vehicle_id_driver_fk` (`vehicle_id`),
  ADD KEY `emp_id_driver_fk` (`emp_id`);

--
-- Indexes for table `Emergency_Contact`
--
ALTER TABLE `Emergency_Contact`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `emp_id_emergency_fk` (`emp_id`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `dept_id_employee_fk` (`dept_id`),
  ADD KEY `nin_employee_fk` (`nin`);

--
-- Indexes for table `Employee_Left`
--
ALTER TABLE `Employee_Left`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `Employee_Manager`
--
ALTER TABLE `Employee_Manager`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `emp_id_employeemanager_fk` (`emp_id`);

--
-- Indexes for table `HR`
--
ALTER TABLE `HR`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `emp_id_HR_fk` (`emp_id`);

--
-- Indexes for table `Management_Department`
--
ALTER TABLE `Management_Department`
  ADD PRIMARY KEY (`manager_id`),
  ADD KEY `emp_id_managementdept_fk` (`manager_id`);

--
-- Indexes for table `National_Insurance_Number`
--
ALTER TABLE `National_Insurance_Number`
  ADD PRIMARY KEY (`nin`);

--
-- Indexes for table `Ordered_Products`
--
ALTER TABLE `Ordered_Products`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id_orderedpdt_fk` (`product_id`),
  ADD KEY `order_id_orderedpdt_fk` (`order_id`);

--
-- Indexes for table `Order_Table`
--
ALTER TABLE `Order_Table`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `Packager`
--
ALTER TABLE `Packager`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `warehouse_id_packager_fk` (`warehouse_id`),
  ADD KEY `emp_id_packager_fk` (`emp_id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `Route`
--
ALTER TABLE `Route`
  ADD PRIMARY KEY (`route_name`),
  ADD KEY `vehicle_id_route_fk` (`vehicle_id`);

--
-- Indexes for table `Stops`
--
ALTER TABLE `Stops`
  ADD PRIMARY KEY (`route_name`),
  ADD KEY `route_name_stops_fk` (`route_name`);

--
-- Indexes for table `Vehicles`
--
ALTER TABLE `Vehicles`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD KEY `area_name_vehicles_fk` (`area_name`),
  ADD KEY `route_name_vehicles_fk` (`route_name`);

--
-- Indexes for table `Warehouse`
--
ALTER TABLE `Warehouse`
  ADD PRIMARY KEY (`warehouse_id`),
  ADD KEY `area_name_warehouse_fk` (`area_name`);

--
-- Indexes for table `Warehouse_Product`
--
ALTER TABLE `Warehouse_Product`
  ADD PRIMARY KEY (`warehouse_id`,`product_id`),
  ADD KEY `product_id_warehousepdt_fk` (`product_id`),
  ADD KEY `warehouse_id_warehousepdt_fk` (`warehouse_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Complaint`
--
ALTER TABLE `Complaint`
  ADD CONSTRAINT `emp_id_complaint_fk` FOREIGN KEY (`emp_id`) REFERENCES `Employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `emp_id_customer_fk` FOREIGN KEY (`emp_id`) REFERENCES `Employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_id_customer_fk` FOREIGN KEY (`order_id`) REFERENCES `Order_Table` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Department`
--
ALTER TABLE `Department`
  ADD CONSTRAINT `dept_name_department_fk` FOREIGN KEY (`dept_name`) REFERENCES `Department_Information` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Driver`
--
ALTER TABLE `Driver`
  ADD CONSTRAINT `emp_id_driver_fk` FOREIGN KEY (`emp_id`) REFERENCES `Employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vehicle_id_driver_fk` FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicles` (`vehicle_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_id_driver_fk` FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse` (`warehouse_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Emergency_Contact`
--
ALTER TABLE `Emergency_Contact`
  ADD CONSTRAINT `emp_id_emergency_fk` FOREIGN KEY (`emp_id`) REFERENCES `Employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `dept_id_employee_fk` FOREIGN KEY (`dept_id`) REFERENCES `Department` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nin_employee_fk` FOREIGN KEY (`nin`) REFERENCES `National_Insurance_Number` (`nin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Employee_Manager`
--
ALTER TABLE `Employee_Manager`
  ADD CONSTRAINT `emp_id_employeemanager_fk` FOREIGN KEY (`emp_id`) REFERENCES `Employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `HR`
--
ALTER TABLE `HR`
  ADD CONSTRAINT `emp_id_HR_fk` FOREIGN KEY (`emp_id`) REFERENCES `Employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Management_Department`
--
ALTER TABLE `Management_Department`
  ADD CONSTRAINT `emp_id_managementdept_fk` FOREIGN KEY (`manager_id`) REFERENCES `Employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Ordered_Products`
--
ALTER TABLE `Ordered_Products`
  ADD CONSTRAINT `order_id_orderedpdt_fk` FOREIGN KEY (`order_id`) REFERENCES `Order_Table` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id_orderedpdt_fk` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Packager`
--
ALTER TABLE `Packager`
  ADD CONSTRAINT `emp_id_packager_fk` FOREIGN KEY (`emp_id`) REFERENCES `Employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_id_packager_fk` FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse` (`warehouse_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Route`
--
ALTER TABLE `Route`
  ADD CONSTRAINT `vehicle_id_route_fk` FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicles` (`vehicle_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Stops`
--
ALTER TABLE `Stops`
  ADD CONSTRAINT `route_name_stops_fk` FOREIGN KEY (`route_name`) REFERENCES `Route` (`route_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Vehicles`
--
ALTER TABLE `Vehicles`
  ADD CONSTRAINT `area_name_vehicles_fk` FOREIGN KEY (`area_name`) REFERENCES `Areas_Of_UK` (`area_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `route_name_vehicles_fk` FOREIGN KEY (`route_name`) REFERENCES `Route` (`route_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Warehouse`
--
ALTER TABLE `Warehouse`
  ADD CONSTRAINT `area_name_warehouse_fk` FOREIGN KEY (`area_name`) REFERENCES `Areas_Of_UK` (`area_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Warehouse_Product`
--
ALTER TABLE `Warehouse_Product`
  ADD CONSTRAINT `product_id_warehousepdt_fk` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_id_warehousepdt_fk` FOREIGN KEY (`warehouse_id`) REFERENCES `Warehouse` (`warehouse_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
