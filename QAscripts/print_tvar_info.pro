;+
;procedure: print_tvar_info
;
; purpose: this procedure prints some information about a tplot variable to 
; the standard output, most importantly it makes sure the output
; of the help command when used on tvar data makes it into the journal file
;
;
;
; $LastChangedBy: pcruce $
; $LastChangedDate: 2008-02-08 09:10:34 -0800 (Fri, 08 Feb 2008) $
; $LastChangedRevision: 2362 $
; $URL: svn+ssh://thmsvn@ambrosia.ssl.berkeley.edu/repos/idl_socware/trunk/external/IDL_GEOPACK/trace/ttrace_crib.pro $
;-


pro print_tvar_info,name

compile_opt idl2

if not keyword_set(name) then begin
    message,/continue,'ERROR: tplot var name not set'
    return
endif

if strlowcase(name) eq 'all' then begin
  name = '*'
endif 

names = tnames(name)

if names[0] eq '' then begin
    message,/continue,'ERROR: tplot variable: ' + name + ' does not exist'
    return
endif

names = tnames(name) 

for i = 0,n_elements(names)-1 do begin

print,"Name: " + names[i]

get_data,names[i],data=d,dlimits=dl

help,/str,d,output = o

print,"Data Struct: " + o

help,/str,dl,output = o

print,"Dlimits Struct: " + o

help,d.x,output = o

print,"D.x: " + o

help,d.y,output = o

print,"D.y: " + o

print,"Start Time: " + time_string(d.x[0])

print,"End Time: " + time_string(d.x[n_elements(d.x) - 1L])

endfor

end
