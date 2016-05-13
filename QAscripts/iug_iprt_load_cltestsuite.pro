;+
; 1 Basic
; 
;2 Single polarization component
;     
;3 Both circular polarization component
;
;4 All circular polarization component
;
;5 Data type
;
;6 Verbose
;
;7 Onlydownload
;
; $WrittenBy: M. Yoneda $
; $LastChangedBy: M. Yagi $
; $LastChangedDate: (22 Jan, 2014) $
;-


init_tests

t_num=0;

thm_init

qa_timespan=['2010-11-01','2010-11-02']

timespan,qa_timespan,10,/min


; 1 Basic
del_data,'*'

t_name='basic'


catch,err

if err eq 0 then begin

 iug_load_iprt
 
 
 print_tvar_info,'iprt_sun_L'
 
 
 if ~data_exists('iprt_sun_L',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
 endif
 catch,/cancel
 
 handle_error,err,t_name,++t_num
 
 del_Data,'*'
 
 ;2 Single polarization component
 
 t_name='single polarization component'
 
 catch,err
 
 if err eq 0 then begin
 
  iug_load_iprt
  
  print_tvar_info, 'iprt_sun_L'
  
  if ~data_exists('iprt_sun_L',qa_timespan[0],qa_timespan[1]) $
   then message, 'invalid load'
  
  endif
  
  catch,/cancel
  
  handle_error,err,t_name,++t_num
  
  del_data,'*'
  
  ;3 Two circular polarization component 
  
  t_name='two circular polarization components'
  
  catch,err
  
  if err eq 0 then begin
  
   iug_load_iprt
   
   print_tvar_info,'iprt_sun_L iprt_sun_R'
   
   if ~data_exists('iprt_sun_L iprt_sun_R',qa_timespan[0], qa_timespan[1]) $
    then message, 'invalid load'
   
   endif
   
   catch,/cancel
   
   handle_error,err,t_name,++t_num
   
   del_data,'*'
      

;4 All polarization components

t_name='All polarization components'
  
  catch,err
  
  if err eq 0 then begin
  
   iug_load_iprt
   
   print_tvar_info,'iprt_sun_*'
   
   if ~data_exists('iprt_sun_*',qa_timespan[0], qa_timespan[1]) $
    then message, 'invalid load'
   
   endif
   
   catch,/cancel
   
   handle_error,err,t_name,++t_num
   
   del_data,'*'

; 5 Datatype
t_name='datatype'


 catch,err
  
  if err eq 0 then begin
  
   iug_load_iprt,datatype='Sun'
   
   print_tvar_info,'Sun'
   

      if ~data_exists('iprt_sun_*',qa_timespan[0],qa_timespan[1]) $
   then message, 'invalid load'
   
   endif
   
   catch,/cancel
   
   handle_error,err,t_name,++t_num
   
   del_data,'*'

      



;6 verbose
;
;iug_load_mu,/verbose


t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_iprt,/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



; 7 Download only

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
 iug_load_iprt, /downloadonly
  if data_exists('iug_sun_*', qa_timespan[0],qa_timespan[1]) $ 
  then message,'invalid load'
  
  
  endif
  catch,/cancel
  handle_error,err,t_name,++t_num
  
  del_data,'*'
  
  end_tests
  
  end
