-- Create Database
CREATE DATABASE ClinicBooking;

-- Use the Database
USE ClinicBooking;

-- Create Patients Table
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Create Doctors Table
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL
);

-- Create Services Table
CREATE TABLE Services (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(100) UNIQUE NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL
);

-- Create Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    ServiceID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Canceled') DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) ON DELETE CASCADE,
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID) ON DELETE CASCADE
);

-- Create Billing Table
CREATE TABLE Billing (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT UNIQUE NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    PaymentStatus ENUM('Paid', 'Pending', 'Unpaid') DEFAULT 'Pending',
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE
);

--inserting 20 patients
INSERT INTO Patients (FirstName, LastName, DateOfBirth, PhoneNumber, Email)
VALUES 
('John', 'Doe', '1990-05-20', '1234567890', 'john.doe1@example.com'),
('Jane', 'Smith', '1985-08-15', '2345678901', 'jane.smith@example.com'),
('Michael', 'Brown', '1978-11-30', '3456789012', 'michael.brown@example.com'),
('Emily', 'Davis', '1992-03-22', '4567890123', 'emily.davis@example.com'),
('Chris', 'Wilson', '1980-06-10', '5678901234', 'chris.wilson@example.com'),
('Sarah', 'Johnson', '1995-07-18', '6789012345', 'sarah.johnson@example.com'),
('David', 'Martinez', '1983-09-25', '7890123456', 'david.martinez@example.com'),
('Laura', 'Anderson', '1987-04-05', '8901234567', 'laura.anderson@example.com'),
('James', 'Clark', '1991-02-13', '9012345678', 'james.clark@example.com'),
('Sophia', 'Moore', '1989-10-30', '0123456789', 'sophia.moore@example.com'),
('Ethan', 'Taylor', '1993-05-15', '1234509876', 'ethan.taylor@example.com'),
('Olivia', 'Harris', '1982-12-01', '2345609876', 'olivia.harris@example.com'),
('Mason', 'Thompson', '1986-08-08', '3456709876', 'mason.thompson@example.com'),
('Isabella', 'Garcia', '1994-11-19', '4567809876', 'isabella.garcia@example.com'),
('Lucas', 'Martinez', '1981-03-07', '5678909876', 'lucas.martinez@example.com'),
('Ava', 'Robinson', '1996-06-28', '6789009876', 'ava.robinson@example.com'),
('Logan', 'White', '1990-01-16', '7890109876', 'logan.white@example.com'),
('Mia', 'Lee', '1988-02-27', '8901209876', 'mia.lee@example.com'),
('Elijah', 'Walker', '1997-09-09', '9012309876', 'elijah.walker@example.com'),
('Emma', 'Hall', '1999-10-10', '0123409876', 'emma.hall@example.com');

--inserting 15 Doctors
INSERT INTO Doctors (FirstName, LastName, Specialty, PhoneNumber)
VALUES
('Dr. John', 'Smith', 'Dermatology', '0987654321'),
('Dr. Emily', 'Johnson', 'Cardiology', '1234567890'),
('Dr. Michael', 'Brown', 'Neurology', '2345678901'),
('Dr. Sarah', 'Taylor', 'Pediatrics', '3456789012'),
('Dr. David', 'Anderson', 'Orthopedics', '4567890123'),
('Dr. Laura', 'Davis', 'Psychiatry', '5678901234'),
('Dr. Chris', 'Clark', 'Radiology', '6789012345'),
('Dr. Olivia', 'Harris', 'Anesthesiology', '7890123456'),
('Dr. James', 'Garcia', 'Gastroenterology', '8901234567'),
('Dr. Sophia', 'Martinez', 'Oncology', '9012345678'),
('Dr. Ethan', 'Moore', 'Ophthalmology', '0123456789'),
('Dr. Isabella', 'White', 'ENT', '1234509876'),
('Dr. Mason', 'Thompson', 'General Surgery', '2345609876'),
('Dr. Mia', 'Walker', 'Urology', '3456709876'),
('Dr. Lucas', 'Hall', 'Gynecology', '4567809876');


--inserting 15 servises
INSERT INTO Services (ServiceName, Cost)
VALUES
('Consultation', 50.00),
('General Checkup', 30.00),
('Blood Test', 20.00),
('X-Ray', 100.00),
('MRI Scan', 500.00),
('CT Scan', 450.00),
('Vaccination', 25.00),
('Physical Therapy', 60.00),
('Dental Cleaning', 80.00),
('Eye Examination', 40.00),
('Hearing Test', 35.00),
('Skin Treatment', 120.00),
('Orthopedic Surgery', 1500.00),
('Cardiology Consultation', 200.00),
('Neurological Assessment', 250.00),
('Pediatric Checkup', 45.00);


--inserting appointments
INSERT INTO Appointments (PatientID, DoctorID, ServiceID, AppointmentDate, Status)
VALUES
(1, 1, 1, '2025-05-15 10:00:00', 'Scheduled'),
(2, 2, 2, '2025-05-16 11:00:00', 'Scheduled'),
(3, 3, 3, '2025-05-17 12:30:00', 'Scheduled'),
(4, 4, 4, '2025-05-18 09:00:00', 'Scheduled'),
(5, 5, 5, '2025-05-19 14:00:00', 'Scheduled'),
(6, 6, 6, '2025-05-20 15:30:00', 'Scheduled'),
(7, 7, 7, '2025-05-21 08:00:00', 'Scheduled'),
(8, 8, 8, '2025-05-22 10:45:00', 'Scheduled'),
(9, 9, 9, '2025-05-23 13:15:00', 'Scheduled'),
(10, 10, 10, '2025-05-24 16:00:00', 'Scheduled'),
(11, 11, 11, '2025-05-25 09:30:00', 'Scheduled'),
(12, 12, 12, '2025-05-26 14:15:00', 'Scheduled'),
(13, 13, 13, '2025-05-27 11:45:00', 'Scheduled'),
(14, 14, 14, '2025-05-28 08:30:00', 'Scheduled'),
(15, 15, 15, '2025-05-29 10:15:00', 'Scheduled'),
(16, 1, 1, '2025-05-30 13:00:00', 'Scheduled'),
(17, 2, 2, '2025-06-01 11:00:00', 'Scheduled'),
(18, 3, 3, '2025-06-02 15:30:00', 'Scheduled'),
(19, 4, 4, '2025-06-03 09:00:00', 'Scheduled'),
(20, 5, 5, '2025-06-04 12:00:00', 'Scheduled');


--inserting billing info
INSERT INTO Billing (AppointmentID, TotalCost, PaymentStatus)
VALUES
(1, 50.00, 'Paid'),
(2, 30.00, 'Pending'),
(3, 20.00, 'Paid'),
(4, 100.00, 'Unpaid'),
(5, 500.00, 'Paid'),
(6, 450.00, 'Pending'),
(7, 25.00, 'Unpaid'),
(8, 60.00, 'Paid'),
(9, 80.00, 'Pending'),
(10, 40.00, 'Unpaid'),
(11, 35.00, 'Paid'),
(12, 120.00, 'Pending'),
(13, 1500.00, 'Paid'),
(14, 200.00, 'Unpaid'),
(15, 250.00, 'Pending'),
(16, 50.00, 'Unpaid'),
(17, 30.00, 'Paid'),
(18, 20.00, 'Pending'),
(19, 100.00, 'Paid'),
(20, 500.00, 'Unpaid');


-- Retrieve all appointments with patient and doctor details
SELECT 
    a.AppointmentID, 
    p.FirstName AS PatientName, 
    d.FirstName AS DoctorName, 
    s.ServiceName, 
    a.AppointmentDate, 
    a.Status
FROM 
    Appointments a
JOIN 
    Patients p ON a.PatientID = p.PatientID
JOIN 
    Doctors d ON a.DoctorID = d.DoctorID
JOIN 
    Services s ON a.ServiceID = s.ServiceID;

-- Retrieve billing details
SELECT 
    b.BillID, 
    b.TotalCost, 
    b.PaymentStatus, 
    p.FirstName AS PatientName, 
    a.AppointmentDate
FROM 
    Billing b
JOIN 
    Appointments a ON b.AppointmentID = a.AppointmentID
JOIN 
    Patients p ON a.PatientID = p.PatientID;
