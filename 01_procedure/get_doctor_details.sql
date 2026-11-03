CREATE OR REPLACE PROCEDURE get_doctor_details (
    p_doc_id IN doctors.doc_id%TYPE
)
AS
    TYPE t_doctor_tab IS TABLE OF doctors%ROWTYPE
        INDEX BY PLS_INTEGER;          -- associative array

    v_doctors t_doctor_tab;
BEGIN
    DBMS_OUTPUT.PUT_LINE('DOCTOR DETAILS');
    DBMS_OUTPUT.PUT_LINE('------------------------------');

    -- BULK COLLECT fetches all matching rows in one go
    SELECT *
    BULK COLLECT INTO v_doctors
    FROM doctors
    WHERE doc_id = p_doc_id;

    IF v_doctors.COUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Doctor not found.');
        RETURN;
    END IF;

    FOR i IN v_doctors.FIRST .. v_doctors.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('Doctor ID: '        || v_doctors(i).doc_id);
        DBMS_OUTPUT.PUT_LINE('Name: '             || v_doctors(i).doc_name);
        DBMS_OUTPUT.PUT_LINE('Specialty: '        || v_doctors(i).specialty);
        DBMS_OUTPUT.PUT_LINE('Department ID: '    || v_doctors(i).dept_id);
        DBMS_OUTPUT.PUT_LINE('Consultation Fee: ' || v_doctors(i).consultation_fee);
        DBMS_OUTPUT.PUT_LINE('------------------------------');
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/