BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Total appointments: ' ||
        get_patient_appointment_count(333)
    );
END;
/