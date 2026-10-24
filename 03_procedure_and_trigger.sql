USE crownfield_eye_hospital;

-- ========================================================
-- QUERY 5: STORED PROCEDURE WITH AN INPUT PARAMETER
-- Purpose: Allows clinical reception staff to quickly retrieve all appointments 
-- scheduled for a specific date given as a parameter input.
-- ========================================================
DELIMITER //
CREATE PROCEDURE GetAppointmentsByDate(IN appointmentDate DATE)
BEGIN
    SELECT AppointmentID, PatientID, ClinicianID, Time, Diagnosis
    FROM Appointments
    WHERE Date = appointmentDate;
END //
DELIMITER ;

-- Example of how to execute this procedure:
-- CALL GetAppointmentsByDate('2026-10-12');


-- ========================================================
-- QUERY 6: DATABASE TRIGGER FOR BUSINESS RULE ENFORCEMENT
-- Purpose: Ensures clinical data integrity by automatically rejecting 
-- any new appointment entry that has an empty or blank Diagnosis string.
-- ========================================================
DELIMITER //
CREATE TRIGGER BeforeAppointmentInsert
BEFORE INSERT ON Appointments
FOR EACH ROW
BEGIN
    IF NEW.Diagnosis IS NULL OR NEW.Diagnosis = '' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Data Integrity Error: An appointment entry must include a preliminary clinical diagnosis statement.';
    END IF;
END //
DELIMITER ;
