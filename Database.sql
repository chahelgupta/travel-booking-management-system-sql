use grp3_DBMSProject;

CREATE TABLE IF NOT EXISTS CustomerDetails_reneeka (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(10),
    Identity_proof VARCHAR(100)
);

INSERT INTO CustomerDetails_reneeka (CustomerID, FullName, Email, Phone, Identity_proof)
VALUES
    (1, 'Amishi Desai', 'desai014@gmail.com', '9345698768', 'Aadhar'),
    (2, 'Chahel Gupta', 'chx2904@gmail.com', '9876543210', 'Passport'),
    (3, 'Aneri Patel', 'ap2404@gmail.com', '7890123456', 'Driver License'),
    (4, 'Demira Ramnani', 'demram23@gmail.com', '2345678901', 'Aadhar'),
    (5, 'Shloka Arya', 'shloksrain@gmail.com', '8901234567', 'Passport'),
    (6, 'Vansh Mehta', 'vm567@gmail.com', '3456789012', 'Driver License'),
    (7, 'Shital Nagvenkar', 'shtlnad@gmail.com', '9012345678', 'Aadhar'),
    (8, 'Vikram Nadkarni', 'viks01@gmail.com', '4567890123', 'Passport'),
    (9, 'Aryan Shah', 'arshah56@gmail.com', '0123456789', 'Driver License'),
    (10, 'Veer Patil', 'vp3til@gmail.com', '9398631146', 'Aadhar');

CREATE TABLE IF NOT EXISTS Employee_reneeka (
    EmployeeID INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Department VARCHAR(50),
    Emp_salary INT(10),
    Emp_Position VARCHAR(50)
);

INSERT INTO Employee_reneeka (EmployeeID, Emp_name, Department, Emp_salary, Emp_Position)
VALUES
    (1, 'Vivean Arya', 'Bus', 54000, 'Driver'),
    (2, 'Sonia Mascerehnas', 'Car', 55000, 'Guide'),
    (3, 'Vansh Dhoka', 'Train', 60000, 'Supervisor'),
    (4, 'Pratham Vasa', 'Flight', 65000, 'Booking Agent'),
    (5, 'Amit Singh', 'Cruise', 70000, 'Guide'),
    (6, 'Sunita Reddy', 'Bus', 50000, 'Driver'),
    (7, 'Rahul Verma', 'Car', 60000, 'Supervisor'),
    (8, 'Vivek Mishra', 'Flight', 70000, 'Guide'),
    (9, 'Anjali Shah', 'Train', 65000, 'Booking Agent'),
    (10, 'Pooja Gupta', 'Cruise', 75000, 'Supervisor');
    
CREATE TABLE IF NOT EXISTS Destination (
    DestinationID INT PRIMARY KEY,
    DestinationName VARCHAR(50),
    Distance INT,
    Country VARCHAR(50)
);

INSERT INTO Destination (DestinationID, DestinationName, Distance, Country)
VALUES
    (201, 'Mumbai', 0, 'India'), 
    (202, 'Pune', 200, 'India'),
    (203, 'Chennai', 439, 'India'),
    (204, 'Bangalore', 5674, 'India'),
    (205, 'Hyderabad', 7656, 'India'),
    (206, 'Delhi', 987, 'India'),
    (207, 'Kolkata', 0, 'India'),
    (301, 'London', 12768, 'United Kingdom'),
    (302, 'Singapore', 5567, 'Singapore'),
    (303, 'Dubai', 767, 'United Arab Emirates'),
    (304, 'Frankfurt', 7898, 'Germany'),
    (305, 'Sydney', 9783, 'Australia'),
    (101, 'Ahmedabad', 0, 'India'), 
    (102, 'Jaipur', 838, 'India'),
    (103, 'Indore', 595, 'India'),
    (104, 'Lucknow',895,'India');

CREATE TABLE IF NOT EXISTS Trains_reneeka (
    TrainID INT PRIMARY KEY,
    TrainName VARCHAR(50),
    T_DepartureTime TIME,
    T_ArrivalTime TIME,
    T_Origin VARCHAR(50),
    T_Destination VARCHAR(50),
    DestinationID INT,
    FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID)
);

INSERT INTO Trains_reneeka (TrainID, TrainName, T_DepartureTime, T_ArrivalTime, T_Origin, T_Destination, DestinationID)
VALUES
    (1, 'Rajdhani Express', '08:00:00', '15:00:00', 'Delhi', 'Mumbai', 201), 
    (2, 'Shatabdi Express', '09:00:00', '14:00:00', 'Mumbai', 'Pune', 202), 
    (3, 'Duronto Express', '10:00:00', '17:00:00', 'Delhi', 'Chennai', 203), 
    (4, 'Garib Rath Express', '11:00:00', '18:00:00', 'Kolkata', 'Bangalore', 204), 
    (5, 'Shatabdi Express', '12:00:00', '19:00:00', 'Chennai', 'Hyderabad', 205), 
    (6, 'Rajdhani Express', '13:00:00', '20:00:00', 'Bangalore', 'Delhi', 206), 
    (7, 'Duronto Express', '14:00:00', '21:00:00', 'Mumbai', 'Kolkata', 207), 
    (8, 'Garib Rath Express', '15:00:00', '22:00:00', 'Pune', 'Chennai', 203), 
    (9, 'Shatabdi Express', '16:00:00', '23:00:00', 'Delhi', 'Hyderabad', 205), 
    (10, 'Rajdhani Express', '17:00:00', '00:00:00', 'Kolkata', 'Mumbai', 201); 

CREATE TABLE IF NOT EXISTS Flights_amishi (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(10),
    Airline VARCHAR(50),
    FL_DepartureTime DATETIME,
    FL_ArrivalTime DATETIME,
    FL_Origin VARCHAR(50),
    FL_Destination VARCHAR(50),
    DestinationID INT,
    FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID)
);

INSERT INTO Flights_amishi (FlightID, FlightNumber, Airline, FL_DepartureTime, FL_ArrivalTime, FL_Origin, FL_Destination, DestinationID)
VALUES
    (1, 'AI101', 'Air India', '2024-03-18 08:00:00', '2024-03-18 10:00:00', 'Delhi', 'Mumbai', 201), 
    (2, 'AI102', 'Air India', '2024-03-18 10:00:00', '2024-03-18 12:00:00', 'Mumbai', 'Pune', 202),
    (3, 'AI103', 'Air India', '2024-03-18 12:00:00', '2024-03-18 15:00:00', 'Delhi', 'Chennai', 203), 
    (4, 'AI104', 'Air India', '2024-03-18 14:00:00', '2024-03-18 17:00:00', 'Mumbai', 'Bangalore', 204),
    (5, 'BA101', 'British Airways', '2024-03-18 16:00:00', '2024-03-18 18:00:00', 'Delhi', 'London', 301), 
    (6, 'SQ101', 'Singapore Airlines', '2024-03-18 18:00:00', '2024-03-18 20:00:00', 'Mumbai', 'Singapore', 302), 
    (7, 'EK101', 'Emirates', '2024-03-18 20:00:00', '2024-03-19 02:00:00', 'Delhi', 'Dubai', 303),
    (8, 'LH101', 'Lufthansa', '2024-03-18 22:00:00', '2024-03-19 01:00:00', 'Mumbai', 'Frankfurt', 304), 
    (9, 'QF101', 'Qantas', '2024-03-19 01:00:00', '2024-03-19 06:00:00', 'Delhi', 'Sydney', 305), 
    (10, 'SQ104', 'Singapore Airlines', '2024-03-19 03:00:00', '2024-03-19 05:00:00', 'Mumbai', 'Singapore', 302); 

CREATE TABLE IF NOT EXISTS Buses_amishi (
    BusID INT PRIMARY KEY,
    BusNumber VARCHAR(10),
    Operator VARCHAR(50),
    B_DepartureTime DATETIME,
    B_ArrivalTime DATETIME,
    B_Origin VARCHAR(50),
    B_Destination VARCHAR(50),
	DestinationID INT,
    FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID)
);

INSERT INTO Buses_amishi (BusID, BusNumber, Operator, B_DepartureTime, B_ArrivalTime, B_Origin, B_Destination, DestinationID)
VALUES
    (1, 'B001', 'ABC Bus Services', '2024-03-18 08:00:00', '2024-03-18 10:00:00', 'Delhi', 'Mumbai', 201), 
    (2, 'B002', 'XYZ Travels', '2024-03-18 10:00:00', '2024-03-18 12:00:00', 'Mumbai', 'Pune', 202), 
    (3, 'B003', 'RST Tours', '2024-03-18 12:00:00', '2024-03-18 15:00:00', 'Delhi', 'Chennai', 203), 
    (4, 'B004', 'PQR Roadways', '2024-03-18 14:00:00', '2024-03-18 17:00:00', 'Mumbai', 'Bangalore', 204), 
    (5, 'B005', 'LMN Travels', '2024-03-18 16:00:00', '2024-03-18 18:00:00', 'Delhi', 'Hyderabad', 205),
    (6, 'B006', 'DEF Bus Lines', '2024-03-18 18:00:00', '2024-03-18 20:00:00', 'Mumbai', 'Kolkata', 206), 
    (7, 'B007', 'GHI Tours', '2024-03-18 20:00:00', '2024-03-19 02:00:00', 'Delhi', 'Lucknow',104), 
    (8, 'B008', 'JKL Bus Services', '2024-03-18 22:00:00', '2024-03-19 01:00:00', 'Mumbai', 'Ahmedabad', 101), 
    (9, 'B009', 'MNO Roadways', '2024-03-19 01:00:00', '2024-03-19 06:00:00', 'Delhi', 'Jaipur', 102), 
    (10, 'B010', 'PQR Travels', '2024-03-19 03:00:00', '2024-03-19 05:00:00', 'Mumbai', 'Indore', 103); 

CREATE TABLE IF NOT EXISTS Cruise_amishi (
    CruiseID INT PRIMARY KEY,
    CruiseName VARCHAR(50),
    CR_DepartureTime DATETIME,
    CR_ArrivalTime DATETIME,
    CR_Origin VARCHAR(50),
    CR_Destination VARCHAR(50),
	DestinationID INT,
    FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID)
);

INSERT INTO Cruise_amishi (CruiseID, CruiseName, CR_DepartureTime, CR_ArrivalTime, CR_Origin, CR_Destination, DestinationID)
VALUES
    (1, 'London to Sydney Cruise', '2024-03-18 08:00:00', '2024-03-18 20:00:00', 'London', 'Sydney', 305), 
    (2, 'Singapore to Dubai Cruise', '2024-03-18 10:00:00', '2024-03-18 22:00:00', 'Singapore', 'Dubai', 303), 
    (3, 'Frankfurt to Sydney Cruise', '2024-03-18 12:00:00', '2024-03-18 23:00:00', 'Frankfurt', 'Sydney', 305), 
    (4, 'Dubai to London Cruise', '2024-03-18 14:00:00', '2024-03-18 23:00:00', 'Dubai', 'London', 301), 
    (5, 'Sydney to Singapore Cruise', '2024-03-18 16:00:00', '2024-03-19 01:00:00', 'Sydney', 'Singapore', 302), 
    (6, 'London to Dubai Cruise', '2024-03-18 18:00:00', '2024-03-19 04:00:00', 'London', 'Dubai', 303), 
    (7, 'Singapore to Sydney Cruise', '2024-03-18 20:00:00', '2024-03-19 08:00:00', 'Singapore', 'Sydney', 305), 
    (8, 'Frankfurt to Dubai Cruise', '2024-03-18 22:00:00', '2024-03-19 10:00:00', 'Frankfurt', 'Dubai', 303), 
    (9, 'Dubai to Singapore Cruise', '2024-03-19 01:00:00', '2024-03-19 10:00:00', 'Dubai', 'Singapore', 302), 
    (10, 'Sydney to London Cruise', '2024-03-19 03:00:00', '2024-03-19 16:00:00', 'Sydney', 'London', 301); 

CREATE TABLE IF NOT EXISTS Car_chahel (
    CarID INT PRIMARY KEY,
    CarModel VARCHAR(50),
    PlateNumber VARCHAR(20),
    Capacity INT,
    C_Origin VARCHAR(50),
    C_Destination VARCHAR(50),
	DestinationID INT,
    FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID)
);

INSERT INTO Car_chahel (CarID, CarModel, PlateNumber, Capacity, C_Origin, C_Destination, DestinationID)
VALUES
    (101, 'Toyota Innova', 'MH01AB1234', 7, 'Mumbai', 'Pune', 202),
    (102, 'Maruti Swift', 'MH02CD5678', 5, 'Pune', 'Mumbai', 201),
    (103, 'Honda City', 'MH03EF9012', 5, 'Chennai', 'Bangalore', 204),
    (104, 'Hyundai i20', 'MH04GH3456', 5, 'Bangalore', 'Hyderabad', 205),
    (105, 'Ford EcoSport', 'MH05IJ6789', 5, 'Hyderabad', 'Chennai', 203),
    (106, 'Volkswagen Polo', 'MH06KL0123', 5, 'Delhi', 'Kolkata', 207),
    (107, 'Toyota Corolla', 'MH07MN3456', 5, 'Kolkata', 'Delhi', 206),
    (108, 'Renault Kwid', 'MH08OP6789', 5, 'Ahmedabad', 'Jaipur', 102),
    (109, 'Honda Civic', 'MH09QR0123', 5, 'Jaipur', 'Indore', 103),
    (110, 'Mahindra Scorpio', 'MH10ST3456', 7, 'Indore', 'Ahmedabad', 101);


CREATE TABLE IF NOT EXISTS Payment_chahel (
    PaymentID INT PRIMARY KEY,
    PaymentMethod VARCHAR(50),
    PaymentAmount DECIMAL(10, 2),
    PaymentDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES CustomerDetails_reneeka(CustomerID)
);

INSERT INTO Payment_chahel (PaymentID, PaymentMethod, PaymentAmount, PaymentDate, CustomerID)
VALUES
    (101, 'Credit Card', 5000.00, '2023-01-15', 1),
    (102, 'Debit Card', 3000.00, '2023-02-20', 2),
    (103, 'Net Banking', 2000.00, '2023-03-25', 3),
    (104, 'UPI', 4000.00, '2023-04-30', 4),
    (105, 'Cash', 2500.00, '2023-05-05', 5),
    (106, 'Credit Card', 3500.00, '2023-06-10', 6),
    (107, 'Debit Card', 2800.00, '2023-07-15', 7),
    (108, 'Net Banking', 1800.00, '2023-08-20', 8),
    (109, 'UPI', 4200.00, '2023-09-25', 9),
    (110, 'Cash', 2300.00, '2023-10-30', 10);


CREATE TABLE IF NOT EXISTS Booking_chahel (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    Booking_status VARCHAR(20),
    PaymentID INT,
    Booking_time DATETIME,
    Transport VARCHAR(50) NOT NULL,
    Origin VARCHAR(50) NOT NULL,
    Destination VARCHAR(50) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES CustomerDetails_reneeka(CustomerID),
    FOREIGN KEY (PaymentID) REFERENCES Payment_chahel(PaymentID)
);

INSERT INTO Booking_chahel (BookingID, CustomerID, Booking_status, PaymentID, Booking_time, Transport, Origin, Destination)
VALUES
    (1, 1, 'Confirmed', 101, '2024-03-10 08:00:00', (SELECT Operator FROM Buses_amishi WHERE DestinationID = 201), 'Delhi','Mumbai'),
    (2, 2, 'Confirmed', 102, '2024-03-10 10:00:00', (SELECT PlateNumber FROM Car_chahel WHERE DestinationID = 202), 'Mumbai', 'Pune'),
    (3, 3, 'Confirmed', 103, '2024-03-10 12:00:00', (SELECT FlightNumber FROM Flights_amishi WHERE DestinationID = 203), 'Delhi', 'Chennai'),
    (4, 4, 'Confirmed', 104, '2024-03-10 14:00:00', (SELECT FlightNumber FROM Flights_amishi WHERE DestinationID = 204), 'Mumbai', 'Bangalore'),
    (5, 5, 'Confirmed', 105, '2024-03-10 16:00:00', (SELECT CruiseName FROM Cruise_amishi WHERE DestinationID = 303 AND CR_Origin='Singapore'), 'Singapore', 'Dubai'),
    (6, 6, 'Confirmed', 106, '2024-03-10 18:00:00', (SELECT Operator FROM Buses_amishi WHERE DestinationID = 206), 'Mumbai', 'Kolkata'),
    (7, 7, 'Confirmed', 107, '2024-03-10 20:00:00', (SELECT PlateNumber FROM Car_chahel WHERE DestinationID = 103), 'Jaipur', 'Indore' ),
    (8, 8, 'Confirmed', 108, '2024-03-10 22:00:00', (SELECT TrainName FROM Trains_reneeka WHERE DestinationID = 204), 'Kolkata', 'Bangalore'),
    (9, 9, 'Confirmed', 109, '2024-03-11 01:00:00', (SELECT FlightNumber FROM Flights_amishi WHERE DestinationID = 203), 'Delhi', 'Chennai'),
    (10, 10, 'Confirmed', 110, '2024-03-11 03:00:00', (SELECT CruiseName FROM Cruise_amishi WHERE DestinationID = 301 AND CR_Origin='Sydney'), 'Sydney', 'London');

