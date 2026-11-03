CREATE OR REPLACE PROCEDURE display_patient_appointments (
    p_patient_id IN patients.patient_id%TYPE
)
AS
    v_found BOOLEAN := FALSE;

    CURSOR c_appointments IS
        SELECT a.appointment_id,
               a.appt_date,
               a.diagnosis,
               a.status,
               d.doc_name,
               d.specialty
        FROM appointments a
        JOIN doctors d
          ON a.doc_id = d.doc_id
        WHERE a.patient_id = p_patient_id
        ORDER BY a.appt_date;

    v_appt  c_appointments%ROWTYPE;   

BEGIN
    DBMS_OUTPUT.PUT_LINE('PATIENT APPOINTMENTS');
    DBMS_OUTPUT.PUT_LINE('------------------------------');

    OPEN c_appointments;              

    LOOP
        FETCH c_appointments INTO v_appt;   
        EXIT WHEN c_appointments%NOTFOUND;  

        v_found := TRUE;

        DBMS_OUTPUT.PUT_LINE('Appointment ID: ' || v_appt.appointment_id);
        DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(v_appt.appt_date, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Diagnosis: ' || NVL(v_appt.diagnosis, 'Not specified'));
        DBMS_OUTPUT.PUT_LINE('Doctor: ' || v_appt.doc_name);
        DBMS_OUTPUT.PUT_LINE('Specialty: ' || v_appt.specialty);
        DBMS_OUTPUT.PUT_LINE('Status: ' || v_appt.status);
        DBMS_OUTPUT.PUT_LINE('------------------------------');
    END LOOP;

    CLOSE c_appointments;            

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No appointments found for this patient.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
     
        IF c_appointments%ISOPEN THEN
            CLOSE c_appointments;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
