CREATE OR REPLACE FUNCTION get_doctor_fee (
    p_doc_id IN doctors.doc_id%TYPE
)
RETURN NUMBER
AS
    CURSOR c_fee IS
        SELECT consultation_fee
          FROM doctors
         WHERE doc_id = p_doc_id;

    v_fee      doctors.consultation_fee%TYPE;
    v_found    BOOLEAN := FALSE;
BEGIN
    OPEN c_fee;
    FETCH c_fee INTO v_fee;

    IF c_fee%NOTFOUND THEN
        CLOSE c_fee;
        RAISE_APPLICATION_ERROR(-20001, 'Doctor not found.');
    END IF;

    v_found := TRUE;      
    CLOSE c_fee;

    RETURN v_fee;

EXCEPTION
    WHEN OTHERS THEN
        IF c_fee%ISOPEN THEN
            CLOSE c_fee;
        END IF;
        RAISE_APPLICATION_ERROR(-20002, 'Unexpected error: ' || SQLERRM);
END;
/
