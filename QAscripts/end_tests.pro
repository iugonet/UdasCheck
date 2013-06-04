;+
;procedure: end_tests
;
; purpose: Terminates testscript
;
;Clears memory in which test output is stored
;and prints the test result to the screen.
;
;
; $LastChangedBy: pcruce $
; $LastChangedDate: 2008-02-08 09:10:34 -0800 (Fri, 08 Feb 2008) $
; $LastChangedRevision: 2362 $
; $URL: svn+ssh://thmsvn@ambrosia.ssl.berkeley.edu/repos/idl_socware/trunk/external/IDL_GEOPACK/trace/ttrace_crib.pro $
;-
pro end_tests

compile_opt idl2

print,"-------------------------------------"
print,"Begin Error Report"

outputs = csvector(0,!output,/read)

tmp = csvector(!output,/free)

for i=0,csvector(outputs,/len)-1L do print,csvector(i,outputs,/read)

print,"-------------------------------------"
print,"End Error Report"

tmp = csvector(outputs,/free)

end