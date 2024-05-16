UPDATE Employee_reneeka SET Emp_Position = 'Driver' WHERE EmployeeID = 2;
SELECT * FROM Employee_reneeka;

CREATE TABLE CustomerTravelDoc AS SELECT CustomerID, FullName, Identity_proof FROM CustomerDetails_reneeka;
SELECT * FROM CustomerTravelDoc;

ALTER TABLE CustomerTravelDoc RENAME TO Customer_documents;
SELECT * FROM Customer_documents;
 
ALTER TABLE CustomerDetails_reneeka
ADD CONSTRAINT CK_email_format CHECK (Email LIKE '%@gmail.com');

ALTER TABLE Booking_chahel
MODIFY COLUMN Booking_status VARCHAR(20) NOT NULL DEFAULT 'Pending';

-- INSERT INTO Payment_chahel (PaymentID, PaymentMethod, PaymentAmount, PaymentDate, CustomerID)
-- VALUES (111, 'Debit Card', 3000.00, NULL , 7)

INSERT INTO Booking_chahel (BookingID, CustomerID, PaymentID, Booking_time, Transport, Origin, Destination) VALUES (11, 7, 111, '2024-03-11 01:00:00', 'AI103', 'Delhi', 'Chennai');
SELECT * FROM Booking_chahel;

UPDATE Payment_chahel SET PaymentAmount = PaymentAmount * 1.1 WHERE CustomerID IN (1, 3, 5) AND PaymentMethod = 'Credit Card';
SELECT * FROM Payment_chahel;

SELECT * FROM Flights_amishi WHERE Airline LIKE 'A%A'

SET SQL_SAFE_UPDATES = 0;
UPDATE Destination SET Distance = 500 WHERE Distance = 0;
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM Destination WHERE Country = 'India' AND Distance BETWEEN 500 AND 1500;

SELECT DISTINCT Country FROM Destination;

DESC Booking_chahel;

-- self join
SELECT b1.BookingID AS BookingID1, b1.CustomerID AS CustomerID1, b1.Booking_status AS BookingStatus1, b2.BookingID AS BookingID2, b2.CustomerID AS CustomerID2, b2.Booking_status AS BookingStatus2 
FROM Booking_chahel b1, Booking_chahel b2 WHERE b1.Origin = b2.Destination;

SELECT DISTINCT d.DestinationName, t.TrainName AS Train, f.FlightNumber AS Flight, b.BusNumber AS Bus, c.CruiseName AS Cruise
FROM Destination d LEFT JOIN Trains_reneeka t ON d.DestinationID = t.DestinationID
LEFT JOIN Flights_amishi f ON d.DestinationID = f.DestinationID
LEFT JOIN Buses_amishi b ON d.DestinationID = b.DestinationID
LEFT JOIN Cruise_amishi c ON d.DestinationID = c.DestinationID
WHERE d.DestinationName = 'Singapore';

-- SELECT 
    d.DestinationName,
    GROUP_CONCAT(DISTINCT t.TrainName) AS Train,
    GROUP_CONCAT(DISTINCT f.FlightNumber) AS Flight,
    GROUP_CONCAT(DISTINCT b.BusNumber) AS Bus,
    GROUP_CONCAT(DISTINCT c.CruiseName) AS Cruise
FROM 
    Destination d
LEFT JOIN 
    Trains_reneeka t ON d.DestinationID = t.DestinationID
LEFT JOIN 
    Flights_amishi f ON d.DestinationID = f.DestinationID
LEFT JOIN 
    Buses_amishi b ON d.DestinationID = b.DestinationID
LEFT JOIN 
    Cruise_amishi c ON d.DestinationID = c.DestinationID
WHERE 
    d.DestinationName = 'Singapore'
GROUP BY 
    d.DestinationName;

SELECT B.BookingID, B.CustomerID, B.Booking_status,B.PaymentID, B.Booking_time, B.Transport, B.Origin, B.Destination, C.FullName,C.Email, C.Phone, C.Identity_proof
FROM Booking_chahel AS B JOIN CustomerDetails_reneeka AS C ON B.CustomerID = C.CustomerID
JOIN Payment_chahel AS P ON B.PaymentID = P.PaymentID
WHERE P.PaymentMethod = 'Credit Card';

SELECT C.CustomerID, C.FullName, C.Email, C.Phone, C.Identity_proof, P.PaymentAmount FROM Payment_chahel AS P
JOIN CustomerDetails_reneeka AS C ON P.CustomerID = C.CustomerID ORDER BY P.PaymentAmount DESC;

SELECT COUNT(*) AS Total_Mumbai_flights FROM Flights_amishi WHERE FL_Origin = 'Mumbai' OR FL_Destination = 'Mumbai';

-- used grouping
SELECT Department, MAX(Emp_salary) AS Max_EmpSalary, MIN(Emp_salary) AS Min_EmpSalary FROM Employee_reneeka GROUP BY Department;

SELECT T_Destination AS Destination FROM Trains_reneeka INTERSECT SELECT FL_Destination AS Destination FROM Flights_amishi;
SELECT B_Destination FROM Buses_amishi WHERE B_Destination NOT IN (SELECT C_Destination FROM Car_chahel);

SELECT CustomerID, COUNT(*) AS CustomerBookings FROM Booking_chahel GROUP BY CustomerID HAVING COUNT(*) >= 2;

SELECT SUM(PaymentAmount) AS Total_Income FROM Payment_chahel;

CREATE VIEW Booking_Summary AS
SELECT COUNT(*) AS TotalBookings,SUM(p.PaymentAmount) AS TotalAmountPaid, AVG(p.PaymentAmount) AS AverageAmount
FROM Booking_chahel b JOIN Payment_chahel p ON b.PaymentID = p.PaymentID;
SELECT * FROM Booking_Summary;

CREATE VIEW DestinationS_Booked AS
SELECT Destination, COUNT(*) AS BookingCount FROM Booking_chahel GROUP BY Destination;
SELECT * FROM DestinationS_Booked;

SELECT Destination.DestinationID, Destination.DestinationName FROM Destination LEFT JOIN Booking_chahel ON Destination.DestinationID = Booking_chahel.Destination WHERE Booking_chahel.Destination IS NULL;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Booking_chahel WHERE Transport IN (SELECT TrainName FROM Trains_reneeka);
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM Booking_chahel;

SELECT Transport, COUNT(*) AS BookingCount
FROM Booking_chahel GROUP BY Transport ORDER BY COUNT(*) DESC LIMIT 1;

SELECT * FROM Destination;





