CREATE OR REPLACE PROCEDURE register_patients_bulk (
    p_patient_ids    IN SYS.ODCINUMBERLIST,       
    p_patient_names  IN SYS.ODCIVARCHAR2LIST,     
    p_dobs           IN SYS.ODCIDATELIST,        
    p_phones         IN SYS.ODCIVARCHAR2LIST     
)
AS
    v_failed NUMBER := 0;
BEGIN
    FORALL i IN 1 .. p_patient_ids.COUNT
        INSERT INTO patients (patient_id, patient_name, date_of_birth, phone)
        VALUES (p_patient_ids(i),
                p_patient_names(i),
                p_dobs(i),
                p_phones(i));

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Patients registered successfully!');
    DBMS_OUTPUT.PUT_LINE('Rows inserted: ' || SQL%ROWCOUNT);

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      
        DBMS_OUTPUT.PUT_LINE('Error: One or more patient IDs/phones already exist.');
        DBMS_OUTPUT.PUT_LINE('Rows inserted before failure: ' || SQL%ROWCOUNT);

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
