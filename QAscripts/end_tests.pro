;+
;procedure: end_tests
;
; purpose: Terminates testscript
;
;Clears memory in which test output is stored
;and prints the test result to a file 'Result_QA.txt'.
;
;
;-
pro end_tests

compile_opt idl2

openw, lun, 'Result_QA.txt', /get_lun, /append

printf, lun, "Begin Error Report"
printf, lun, "-------------------------------------"

outputs = csvector(0,!output,/read)

tmp = csvector(!output,/free)

for i=0,csvector(outputs,/len)-1L do printf, lun, csvector(i,outputs,/read)

printf, lun, "-------------------------------------"
printf, lun, "End Error Report"
printf, lun, ""

tmp = csvector(outputs,/free)

free_lun, lun

end
