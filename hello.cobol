      * COBOL Hello world code. 
      * Borrowed from: http://ibmmainframes.com/about36158.html
       IDENTIFICATION DIVISION. 
       PROGRAM-ID.     HLWRLD.

      * Program setup
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-370.
       OBJECT-COMPUTER. IBM-370.

       DATA DIVISION.
       FILE SECTION.

       PROCEDURE DIVISION.

       MAIN-LOGIC SECTION.
       BEGIN.
           DISPLAY "Hello world from COBOL!".
           STOP RUN.
       MAIN-LOGIC-EXIT.
           EXIT.