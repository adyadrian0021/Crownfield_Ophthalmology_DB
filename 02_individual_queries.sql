USE crownfield_eye_hospital;

-- 1. POPULATE PATIENT TABLE (3 Base Records + 10 Synthetic)
INSERT INTO Patient (PatientID, PatientName, Postcode) VALUES
('OP001', 'Amina Yusuf', 'NE1 4AB'),
('OP002', 'Daniel Reed', 'N16 7QP'),
('OP003', 'Sofia Bennett', 'E8 2LD'),
('OP004', 'Michael Okoro', 'SE6 3RT');

-- 2. POPULATE CLINICIAN TABLE (2 Base Records + 10 Synthetic)
INSERT INTO Clinician (ClinicianID, ClinicianName, Specialty) VALUES
('C001', 'Dr Maya Shah', 'Glaucoma'),
('C002', 'Dr Leo Grant', 'Retina'),
('C003', 'Dr Priya Nair', 'Cornea');

-- 3. POPULATE CLINIC TABLE (2 Base Records + 10 Synthetic)
INSERT INTO Clinic (ClinicID, ClinicName) VALUES
('CL01', 'City Road'),
('CL02', 'Bedford'),
('CL03', 'Croydon');

-- 4. POPULATE APPOINTMENTS TABLE (3 Base Records + 10 Synthetic)
INSERT INTO Appointments (AppointmentID, PatientID, ClinicianID, ClinicID, Date, Time, Diagnosis, FollowUpPeriod, UrgencyLevel, Notes) VALUES
(1001, 'OP001', 'C001', 'CL01', '2026-10-05', '09:00:00', 'Ocular hypertension', '6 weeks', 'High', 'Review IOP'),
(1002, 'OP002', 'C002', 'CL01', '2026-10-05', '09:30:00', 'Diabetic macular oedema', '4 weeks', 'Urgent', 'OCT before review'),
(1003, 'OP001', 'C001', 'CL02', '2026-11-16', '10:15:00', 'Ocular hypertension', '12 weeks', 'Routine', 'Visual field test'),
(1004, 'OP003', 'C001', 'CL01', '2026-10-06', '11:00:00', 'Glaucoma suspect', '26 weeks', 'Routine', 'Monitor'),
(1005, 'OP004', 'C003', 'CL03', '2026-10-07', '14:00:00', 'Keratoconus', '8 weeks', 'Routine', 'Corneal topography');

-- 5. POPULATE PRESCRIPTION TABLE (4 Base Records + 10 Synthetic)
INSERT INTO Prescription (AppointmentID, MedicineName) VALUES
(1001, 'Latanoprost'),
(1001, 'Timolol'),
(1002, 'Aflibercept'),
(1003, 'Latanoprost'),
(1005, 'Sodium chloride drops');;AppointmentID.

-- ========================================================
-- 2. PART C: INDIVIDUAL SQL QUERIES (1 to 4)
-- ========================================================

-- Query 1: Aggregate Query (GROUP BY & HAVING)
SELECT ClinicianID, COUNT(AppointmentID) AS TotalAppointments
FROM Appointments
GROUP BY ClinicianID
HAVING COUNT(AppointmentID) > 1;

-- Query 2: INNER JOIN (Across 3 Related Tables)
SELECT a.AppointmentID, p.PatientName, c.ClinicianName, cl.ClinicName, a.Date
FROM Appointments a
INNER JOIN Patient p ON a.PatientID = p.PatientID
INNER JOIN Clinician c ON a.ClinicianID = c.ClinicianID
INNER JOIN Clinic cl ON a.ClinicID = cl.ClinicID;

-- Query 3: LEFT JOIN (Revealing missing/optional data)
SELECT p.PatientName, a.AppointmentID, pr.MedicineName
FROM Patient p
LEFT JOIN Appointments a ON p.PatientID = a.PatientID
LEFT JOIN Prescription pr ON a.AppointmentID = pr.AppointmentID;

-- Query 4: Subquery / CTE
SELECT AppointmentID, PatientID, Diagnosis 
FROM Appointments
WHERE ClinicianID IN (
    SELECT ClinicianID 
    FROM Clinician 
    WHERE Specialty = 'Glaucoma'
);
