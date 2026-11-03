CREATE OR REPLACE PROCEDURE get_patient_details (
    p_patient_id IN patients.patient_id%TYPE
)
AS
    -- 1. Your user-defined record (unchanged)
    TYPE patient_record IS RECORD (
        patient_id    patients.patient_id%TYPE,
        patient_name  patients.patient_name%TYPE,
        date_of_birth patients.date_of_birth%TYPE,
        phone         patients.phone%TYPE
    );

    -- 2. NEW: a collection (nested table) of that record
    TYPE patient_tab IS TABLE OF patient_record;

    -- 3. Variable is now a COLLECTION, not a single record
    v_patients patient_tab;

BEGIN
    -- 4. BULK COLLECT fills the collection
    SELECT patient_id, patient_name, date_of_birth, phone
      BULK COLLECT INTO v_patients
      FROM patients
     WHERE patient_id = p_patient_id;

    DBMS_OUTPUT.PUT_LINE('PATIENT DETAILS');
    DBMS_OUTPUT.PUT_LINE('----------------------');

    -- 5. Handle "not found" via COUNT (BULK COLLECT never raises NO_DATA_FOUND)
    IF v_patients.COUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Patient not found.');
        RETURN;
    END IF;

    -- 6. Loop through the collection
    FOR i IN v_patients.FIRST .. v_patients.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('Patient ID: '    || v_patients(i).patient_id);
        DBMS_OUTPUT.PUT_LINE('Patient Name: '  || v_patients(i).patient_name);
        DBMS_OUTPUT.PUT_LINE('Date of Birth: ' ||
                             TO_CHAR(v_patients(i).date_of_birth, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Phone: '         || v_patients(i).phone);
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/