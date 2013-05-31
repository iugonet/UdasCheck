;+
;procedure: handle_error
;
; purpose: Properly prints and stores the result of a testscript test,
;          regardless of whether a test succeeded or failed
;
;
; $LastChangedBy: pcruce $
; $LastChangedDate: 2008-02-08 09:10:34 -0800 (Fri, 08 Feb 2008) $
; $LastChangedRevision: 2362 $
; $URL: svn+ssh://thmsvn@ambrosia.ssl.berkeley.edu/repos/idl_socware/trunk/external/IDL_GEOPACK/trace/ttrace_crib.pro $
;-

pro handle_error, e, t_name, t_num

compile_opt idl2

  ;bwahahahahha
  outputs = csvector(0,!output,/read)
  
  tmp = csvector(!output,/free)

  if(e ne 0) then begin
          

    outputs = csvector("Test" + strcompress(string(t_num)) + " Failed: " + t_name,outputs)
    outputs=  csvector("ERROR: "+ strcompress(string(e)),outputs)
    Help, /Last_Message, Output=theErrorMessage
    for i=0,n_elements(theErrorMessage)-1 do outputs=csvector("ERROR: "+theErrorMessage[i],outputs)

    outputs = csvector('',outputs)
    
    print, "Test" + strcompress(string(t_num)) + " Failed: " + t_name
    print, "ERROR: ", e
    Help, /Last_Message, Output=theErrorMessage
    print, "ERROR: ",theErrorMessage

  endif else begin

      outputs=csvector("Test" + strcompress(string(t_num)) + " Succeeded: " + t_name,outputs)

      print, "Test" + strcompress(string(t_num)) + " Succeeded: " + t_name

  endelse

  !output = csvector(outputs)

end
