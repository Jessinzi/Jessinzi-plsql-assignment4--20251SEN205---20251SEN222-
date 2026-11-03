## 1. Project Overview

The Hospital Records Management System was developed using Oracle SQL and PL/SQL to manage departments, doctors, patients, appointments, medications, and prescriptions.
## 2. Database Implementation

The project uses six main tables connected through primary keys and foreign keys. Constraints help maintain data accuracy and consistency.
## 3. PL/SQL Concepts

The project demonstrates:

- Records using `%ROWTYPE` and user-defined records.
    
- Collections for handling multiple records.
    
- Implicit and explicit cursors.
    
- Bulk processing using `BULK COLLECT` and `FORALL`.
    
- Stored procedures and functions.
    
- Exception handling.
    

## 4. Challenges Faced

- Identity columns did not generate IDs as expected, so IDs were inserted manually.
    
- Foreign key constraints required records to be inserted in the correct order.
    
- PL/SQL procedures required testing and error handling.
    
- SQL errors required troubleshooting.
    

## 5. AI Assistance

An AI assistant helped us understand PL/SQL concepts, troubleshoot errors, write and test code, and organize documentation. We reviewed and tested the work and remain responsible for the final project.

## 6. Testing

We use success and error test scripts to check whether procedures and functions work correctly. Screenshots provide evidence of the test results.

## 7. Conclusion

This project demonstrates how Oracle SQL and PL/SQL can be used to organize and manage hospital records.

Note: Keep the PL/SQL concepts listed only if they are actually implemented and tested in your project.