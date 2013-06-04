
;+
;function: assert dlimits
;
; purpose:returns true if a requested element of dlimits exists
;if value is set then it also expects that element to have a specific value
;if substruct is set then this is only true if the element of the substructure exists(this only works up to depth 1)
;if substruct and value are set then value is expected of the element of the substruct
;if limits is set then this will work on limits not dlimits
;
;
; $LastChangedBy: pcruce $
; $LastChangedDate: 2008-02-08 09:10:34 -0800 (Fri, 08 Feb 2008) $
; $LastChangedRevision: 2362 $
; $URL: svn+ssh://thmsvn@ambrosia.ssl.berkeley.edu/repos/idl_socware/trunk/external/IDL_GEOPACK/trace/ttrace_crib.pro $
;-

function assert_dlimits,tvarname,element,value=value,substruct=substruct,limits=limits

if tnames(tvarname) eq '' then return, 0

get_data,tvarname,dlimits=dl,limits = l

if keyword_set(limits) then lim = l else lim = dl

if ~is_struct(lim) then return,0

if keyword_set(substruct) then begin

  str_element,lim,substruct,success=s
  
  if ~s then return,0
  
  str_element,lim,substruct,v
  
  if ~is_struct(v) then return,0
  
  lim = v
  
endif

str_element,lim,element,success=s

if ~s then return,0

if keyword_set(value) then begin

  str_element,lim,element,v
  
  if v ne value then return,0
  
endif

return, 1

end