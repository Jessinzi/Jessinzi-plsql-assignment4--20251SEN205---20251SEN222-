DECLARE
    v_fee NUMBER;
BEGIN
    v_fee := get_doctor_fee(10009);

    DBMS_OUTPUT.PUT_LINE('Fee: ' || v_fee);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/