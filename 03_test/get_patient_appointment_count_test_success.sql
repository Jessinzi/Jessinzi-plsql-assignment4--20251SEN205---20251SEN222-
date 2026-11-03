DECLARE
    v_total NUMBER;
BEGIN
    v_total := get_patient_appointment_count(1004);

    DBMS_OUTPUT.PUT_LINE(
        'Total appointments: ' || v_total
    );
END;
/