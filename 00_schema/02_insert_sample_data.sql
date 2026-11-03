INSERT INTO departments (dept_id, dept_name, location)
VALUES (1000, 'Cardiology', 'Block A');

INSERT INTO departments (dept_id, dept_name, location)
VALUES (1001, 'Pediatrics', 'Block B');

INSERT INTO departments (dept_id, dept_name, location)
VALUES (1002, 'Neurology', 'Block C');

INSERT INTO departments (dept_id, dept_name, location)
VALUES (1003, 'Orthopedics', 'Block D');

INSERT INTO departments (dept_id, dept_name, location)
VALUES (1004, 'Dermatology', 'Block E');

COMMIT;

INSERT INTO doctors
(doc_id, doc_name, specialty, dept_id, consultation_fee)
VALUES (1000, 'Dr. John', 'Heart Specialist', 1000, 15000);

INSERT INTO doctors
(doc_id, doc_name, specialty, dept_id, consultation_fee)
VALUES (1001, 'Dr. Alice', 'Child Specialist', 1001, 12000);

INSERT INTO doctors
(doc_id, doc_name, specialty, dept_id, consultation_fee)
VALUES (1002, 'Dr. Peter', 'Neurologist', 1002, 18000);

INSERT INTO doctors
(doc_id, doc_name, specialty, dept_id, consultation_fee)
VALUES (1003, 'Dr. Mary', 'Orthopedic Surgeon', 1003, 20000);

INSERT INTO doctors
(doc_id, doc_name, specialty, dept_id, consultation_fee)
VALUES (1004, 'Dr. James', 'Skin Specialist', 1004, 10000);

COMMIT;

INSERT INTO patients
(patient_id, patient_name, date_of_birth, phone)
VALUES (1000, 'Ritha Mukamana', DATE '2002-05-12', '0788123456');

INSERT INTO patients
(patient_id, patient_name, date_of_birth, phone)
VALUES (1001, 'Jessica Niyonzima', DATE '1998-08-20', '0788234567');

INSERT INTO patients
(patient_id, patient_name, date_of_birth, phone)
VALUES (1002, 'Rena Uwase', DATE '2005-03-15', '0788345678');

INSERT INTO patients
(patient_id, patient_name, date_of_birth, phone)
VALUES (1003, 'David Rubaza', DATE '1995-11-09', '0788456789');

INSERT INTO patients
(patient_id, patient_name, date_of_birth, phone)
VALUES (1004, 'Diane Ingabire', DATE '2000-07-25', '0788567890');

COMMIT;

INSERT INTO appointments
(appointment_id, patient_id, doc_id, appt_date, diagnosis, status)
VALUES (1000, 1000, 1000, DATE '2026-11-02',
        'Heart checkup', 'SCHEDULED');

INSERT INTO appointments
(appointment_id, patient_id, doc_id, appt_date, diagnosis, status)
VALUES (1001, 1001, 1001, DATE '2026-11-03',
        'Child health examination', 'SCHEDULED');

INSERT INTO appointments
(appointment_id, patient_id, doc_id, appt_date, diagnosis, status)
VALUES (1002, 1002, 1002, DATE '2026-11-04',
        'Headache examination', 'COMPLETED');

INSERT INTO appointments
(appointment_id, patient_id, doc_id, appt_date, diagnosis, status)
VALUES (1003, 1003, 1003, DATE '2026-11-05',
        'Bone examination', 'SCHEDULED');

INSERT INTO appointments
(appointment_id, patient_id, doc_id, appt_date, diagnosis, status)
VALUES (1004, 1004, 1004, DATE '2026-11-06',
        'Skin examination', 'COMPLETED');

COMMIT;

INSERT INTO medications
(med_id, med_name, med_cost, stock_qty)
VALUES (1000, 'Paracetamol', 500, 200);

INSERT INTO medications
(med_id, med_name, med_cost, stock_qty)
VALUES (1001, 'Amoxicillin', 1500, 100);

INSERT INTO medications
(med_id, med_name, med_cost, stock_qty)
VALUES (1002, 'Ibuprofen', 800, 150);

INSERT INTO medications
(med_id, med_name, med_cost, stock_qty)
VALUES (1003, 'Vitamin C', 1000, 120);

INSERT INTO medications
(med_id, med_name, med_cost, stock_qty)
VALUES (1004, 'Cetirizine', 700, 80);

COMMIT;

INSERT INTO prescriptions
(prescription_id, appointment_id, med_id, dosage, quantity)
VALUES (1000, 1000, 1000, '500mg twice daily', 10);

INSERT INTO prescriptions
(prescription_id, appointment_id, med_id, dosage, quantity)
VALUES (1001, 1001, 1001, '250mg three times daily', 15);

INSERT INTO prescriptions
(prescription_id, appointment_id, med_id, dosage, quantity)
VALUES (1002, 1002, 1002, '400mg twice daily', 10);

INSERT INTO prescriptions
(prescription_id, appointment_id, med_id, dosage, quantity)
VALUES (1003, 1003, 1003, 'One tablet daily', 20);

INSERT INTO prescriptions
(prescription_id, appointment_id, med_id, dosage, quantity)
VALUES (1004, 1004, 1004, '10mg once daily', 7);

COMMIT;