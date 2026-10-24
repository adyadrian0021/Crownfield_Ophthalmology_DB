-- 1. Create and select the database
CREATE DATABASE IF NOT EXISTS crownfield_eye_hospital;
USE crownfield_eye_hospital;

-- 2. Create the Patient table
CREATE TABLE Patient (
    PatientID VARCHAR(10) PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Postcode VARCHAR(10) NOT NULL
);

-- 3. Create the Clinician table
CREATE TABLE Clinician (
    ClinicianID VARCHAR(10) PRIMARY KEY,
    ClinicianName VARCHAR(100) NOT NULL,
    Specialty VARCHAR(50) NOT NULL
);

-- 4. Create the Clinic table
CREATE TABLE Clinic (
    ClinicID VARCHAR(10) PRIMARY KEY,
    ClinicName VARCHAR(100) NOT NULL
);

-- 5. Create the Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID VARCHAR(10),
    ClinicianID VARCHAR(10),
    ClinicID VARCHAR(10),
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Diagnosis VARCHAR(255),
    FollowUpPeriod VARCHAR(50),
    UrgencyLevel VARCHAR(20),
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (ClinicianID) REFERENCES Clinician(ClinicianID),
    FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID)
);

-- 6. Create the Prescription table
CREATE TABLE Prescription (
    AppointmentID INT,
    MedicineName VARCHAR(100),
    PRIMARY KEY (AppointmentID, MedicineName),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

