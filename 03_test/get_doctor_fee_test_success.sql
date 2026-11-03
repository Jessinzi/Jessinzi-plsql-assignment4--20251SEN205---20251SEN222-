DECLARE
    v_fee NUMBER;
BEGIN
    v_fee := get_doctor_fee(1002);

   DBMS_OUTPUT.PUT_LINE(
        'Doctor consultation fee: ' || v_fee
    );
END;
/