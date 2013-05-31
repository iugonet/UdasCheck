;+
;procedure: init_tests
;
; purpose: Intialize testscript
;
;Mainly sets up the variable in which test output will be stored
;
;
; $LastChangedBy: pcruce $
; $LastChangedDate: 2008-02-08 09:10:34 -0800 (Fri, 08 Feb 2008) $
; $LastChangedRevision: 2362 $
; $URL: svn+ssh://thmsvn@ambrosia.ssl.berkeley.edu/repos/idl_socware/trunk/external/IDL_GEOPACK/trace/ttrace_crib.pro $
;-

pro init_tests

outputs = csvector('')

DEFSYSV,'!output',csvector(outputs)

end

