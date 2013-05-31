;+
;function: data_exists
;
; purpose: Checks to see if a tplot variable exists and if its data passes some minimum tests 
;
;
; set dims to assert the number of dimensions of y (ie dims = 3 implies 3 dimensional vector)
; setting dims means if n_elements(size(d.y,/dimensions)) gt 2 it returns 0
; if you pass multiple names it will return 0 if any of the tests are failed or they don't exist
; if you use globbing it will return 0 if a data type matches your glob, but fails one of the tests
; but it cannot be sure that all the datatypes you expect the glob to match necessarily exist
;
;
;
; $LastChangedBy: pcruce $
; $LastChangedDate: 2008-02-08 09:10:34 -0800 (Fri, 08 Feb 2008) $
; $LastChangedRevision: 2362 $
; $URL: svn+ssh://thmsvn@ambrosia.ssl.berkeley.edu/repos/idl_socware/trunk/external/IDL_GEOPACK/trace/ttrace_crib.pro $
;-

function data_exists,tvarname,start_time,end_time,dims=dims

  compile_opt idl2

  ;function deprecated, calls duplicate version
  return,tdexists(tvarname,start_time,end_time,dims=dims)
  
end

