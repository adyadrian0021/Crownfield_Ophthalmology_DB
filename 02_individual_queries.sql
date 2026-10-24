USE crownfield_eye_hospital;

-- 1. POPULATE PATIENT TABLE (3 Base Records + 10 Synthetic)
INSERT INTO Patient (PatientID, PatientName, Postcode) VALUES
('P9012', 'Amina Yusuf', 'E15 4LZ'),
('P4431', 'John Doe', 'NW3 2PF'),
('P7722', 'Clara Oswald', 'SE1 9SG'),
('P0001', 'Liam Smith', 'NW1 8XF'),
('P0002', 'Emma Johnson', 'E1 6AN'),
('P0003', 'Oliver Brown', 'SE1 7PB'),
('P0004', 'Sophia Williams', 'W1A 1AA'),
('P0005', 'James Jones', 'N1 9GU'),
('P0006', 'Isabella Miller', 'SW1A 2AA'),
('P0007', 'Lucas Davis', 'EC1A 1BB'),
('P0008', 'Mia Garcia', 'WC1A 1AA'),
('P0009', 'Benjamin Rodriguez', 'E14 5HQ'),
('P0010', 'Charlotte Wilson', 'SE10 9NF');

-- 2. POPULATE CLINICIAN TABLE (2 Base Records + 10 Synthetic)
INSERT INTO Clinician (ClinicianID, ClinicianName, Specialty) VALUES
('C301', 'Dr. Aris Patel', 'Glaucoma'),
('C102', 'Dr. Sarah Lin', 'Cornea'),
('C001', 'Dr. Maya Shah', 'Glaucoma'),
('C002', 'Dr. Leo Grant', 'Retina'),
('C003', 'Dr. Priya Nair', 'Cornea'),
('C004', 'Dr. Alan Marcus', 'Pediatrics'),
('C005', 'Dr. Elena Rostova', 'Retina'),
('C006', 'Dr. David Kim', 'Cataract'),
('C007', 'Dr. Fiona Gallagher', 'Glaucoma'),
('C008', 'Dr. Robert Chen', 'Neuro-ophthalmology'),
('C009', 'Dr. Sarah Jenkins', 'Retina'),
('C010', 'Dr. Tariq Mahmood', 'Cataract');

-- 3. POPULATE CLINIC TABLE (2 Base Records + 10 Synthetic)
INSERT INTO Clinic (ClinicID, ClinicName) VALUES
('CL10', 'North Clinic'),
('CL20', 'South Clinic'),
('CL01', 'City Road Suite A'),
('CL02', 'Bedford Unit'),
('CL03', 'Croydon Hub'),
('CL04', 'Westminster Ophthalmic'),
('CL05', 'Ealing Eye Centre'),
('CL06', 'Hackney Clinic'),
('CL07', 'Camden Eye Ward'),
('CL08', 'Greenwich Suite'),
('CL09', 'Stratford Clinic'),
('CL11', 'Chelsea Eye Pavilion');

-- 4. POPULATE APPOINTMENTS TABLE (3 Base Records + 10 Synthetic)
INSERT INTO Appointments (AppointmentID, PatientID, ClinicianID, ClinicID, Date, Time, Diagnosis, FollowUpPeriod, UrgencyLevel, Notes) VALUES
(1001, 'P9012', 'C301', 'CL10', '2026-10-12', '09:30:00', 'Open-angle glaucoma', '6 weeks', 'High', 'Check eye pressure'),
(1002, 'P4431', 'C102', 'CL20', '2026-10-12', '10:15:00', 'Corneal abrasion', '1 week', 'Low', 'Clear recovery'),
(1003, 'P7722', 'C301', 'CL10', '2026-10-13', '14:00:00', 'Ocular hypertension', '3 months', 'Routine', 'Monitor fields'),
(1004, 'P0001', 'C002', 'CL01', '2026-10-24', '09:00:00', 'Diabetic macular oedema', '4 weeks', 'Urgent', 'OCT scan completed'),
(1005, 'P0002', 'C003', 'CL03', '2026-10-24', '10:30:00', 'Keratoconus', '8 weeks', 'Routine', 'Corneal topography'),
(1006, 'P0003', 'C001', 'CL01', '2026-10-25', '11:15:00', 'Glaucoma suspect', '26 weeks', 'Routine', 'Visual fields baseline'),
(1007, 'P0004', 'C006', 'CL04', '2026-10-26', '14:00:00', 'Nuclear Cataract', '12 weeks', 'Routine', 'Listed for surgery'),
(1008, 'P0005', 'C005', 'CL05', '2026-10-26', '15:30:00', 'Retinal Detachment', '1 day', 'Emergency', 'Refer to vitreo-retinal theater'),
(1009, 'P0006', 'C008', 'CL02', '2026-10-27', '09:45:00', 'Optic Neuritis', '2 weeks', 'High', 'MRI scheduled'),
(1010, 'P0007', 'C007', 'CL06', '2026-10-27', '11:00:00', 'Ocular hypertension', '6 weeks', 'Routine', 'IOP monitoring'),
(1011, 'P0008', 'C009', 'CL07', '2026-10-28', '13:15:00', 'Dry Macular Degeneration', '6 months', 'Routine', 'Amsler grid provided'),
(1012, 'P0009', 'C010', 'CL08', '2026-10-28', '16:00:00', 'Cataract', '8 weeks', 'Routine', 'Pre-op assessment'),
(1013, 'P0010', 'C003', 'CL09', '2026-10-29', '10:00:00', 'Corneal Ulcer', '3 days', 'Urgent', 'Scrape taken');

-- 5. POPULATE PRESCRIPTION TABLE (4 Base Records + 10 Synthetic)
INSERT INTO Prescription (AppointmentID, MedicineName) VALUES
(1001, 'Latanoprost'),
(1001, 'Timolol'),
(1002, 'Chloramphenicol'),
(1003, 'Brimonidine'),
(1004, 'Aflibercept Injection'),
(1005, 'Sodium chloride drops'),
(1007, 'Prednisolone drops'),
(1008, 'Atropine sulphate'),
(1009, 'Methylprednisolone'),
(1010, 'Latanoprost'),
(1011, 'PreserVision AREDS 2'),
(1013, 'Ofloxacin drops'),
(1013, 'Cyclopentolate');AppointmentID.

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
