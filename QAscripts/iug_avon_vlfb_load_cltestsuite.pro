;+
;1 basic
; iug_load_avon_vlfb
; 
;2 single site
; iug_load_avon_vlfb,site='tnn'
;     
;3 multi sites string
; iug_load_avon_vlfb,site='tnn srb'
;       
;4 multi sites array
; iug_load_avon_vlfb,site=['tnn','srb']
;
;5 caps site 
; iug_load_avon_vlfb,site='TNN'
;
;6 load all sites
; iug_load_avon_vlfb,site='all'
;
;7 load * sites
; iug_load_avon_vlfb,site='*' 
;
;8 single parameter
; iug_load_avon_vlfb,parameter='ch1'
;
;9 multi parameter string
; iug_load_avon_vlfb,parameter='ch1 ch2'
;
;10 multi parameter array
; iug_load_avon_vlfb,parameter=['ch1','ch2']
;
;11 caps parameter
; iug_load_avon_vlfb,parameter='CH1'
;
;12 all parameter
; iug_load_avon_vlfb,parameter='all'
;
;13 * parameter
; iug_load_avon_vlfb,parameter='*'
;
;14 /verbose
; iug_load_avon_vlfb,/verbose
;
;15 /downloadonly
; iug_load_avon_vlfb,/downloadonly
;
;16 /no_download
; iug_load_avon_vlfb,/no_download
;
; $LastChangeBy: M. Yagi $
; $LastChangeDate: 2014-07-07 $
;-

init_tests

;prepare to run tests
t_num=0

thm_init

qa_timespan=['2011-02-20/11:00:00','2011-02-20/11:02:00']

timespan,qa_timespan

cdf_leap_second_init


; 1 basic
del_data,'*'

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_avon_vlfb
 
  print_tvar_info,'avon_vlfb_tnn_ch1'
 
  if ~data_exists('avon_vlfb_tnn_ch1',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



; 2 single site

t_name='single site'
 
catch,err
 
if err eq 0 then begin
 
  iug_load_avon_vlfb,site='tnn'
  
  print_tvar_info, 'avon_vlfb_tnn_ch1'
  
  if ~data_exists('avon_vlfb_tnn_ch1',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
  
endif
  
catch,/cancel
  
handle_error,err,t_name,++t_num
  
del_data,'*'



;3 multi sites string
  
t_name='multi sites string'
  
catch,err
  
if err eq 0 then begin
  
  iug_load_avon_vlfb,site='tnn srb'
   
  print_tvar_info,'avon_vlfb_tnn_ch1 avon_vlfb_srb_ch1'
   
  if ~data_exists('avon_vlfb_tnn_ch1 avon_vlfb_srb_ch2',qa_timespan[0], qa_timespan[1]) $
  then message, 'invalid load'
   
endif
   
catch,/cancel
   
handle_error,err,t_name,++t_num
   
del_data,'*'
      


;4 multi sites array

t_name='multi sites string'
  
catch,err
  
if err eq 0 then begin
  
  iug_load_avon_vlfb,site=['tnn','srb']
   
  print_tvar_info,'avon_vlfb_tnn_ch1 avon_vlfb_srb_ch1'
   
  if ~data_exists('avon_vlfb_tnn_ch1 avon_vlfb_srb_ch1',qa_timespan[0], qa_timespan[1]) $
  then message, 'invalid load'
   
endif
   
catch,/cancel
   
handle_error,err,t_name,++t_num
   
del_data,'*'



; 5 caps site

t_name='caps site'

catch,err
  
if err eq 0 then begin
  
  iug_load_avon_vlfb,site='TNN'
   
  print_tvar_info,'avon_vlfb_tnn_ch1'

  if ~data_exists('avon_vlfb_tnn_ch1',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
   
endif
   
catch,/cancel
   
handle_error,err,t_name,++t_num
   
del_data,'*'

      

;6 load all sites

t_name='load all sites'

catch,err

if err eq 0 then begin

  iug_load_avon_vlfb,site='all'

  print_tvar_info,'avon_vlfb_tnn_ch1 avon_vlfb_srb_ch1'

  if ~data_exists('avon_vlfb_tnn_ch1 avon_vlfb_srb_ch1',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



;7 load * sites

t_name='load * sites'

catch,err

if err eq 0 then begin

  iug_load_avon_vlfb,site='*'

  print_tvar_info,'avon_vlfb_tnn_ch1 avon_vlfb_srb_ch1'

  if ~data_exists('avon_vlfb_tnn_ch1 avon_vlfb_srb_ch1',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'




;8 single parameter

t_name='single parameter'

catch,err

if err eq 0 then begin

  iug_load_avon_vlfb,parameter='ch2'
 
  print_tvar_info,'avon_vlfb_tnn_ch2'
 
  if ~data_exists('avon_vlfb_tnn_ch2',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'




;9 multi parameter string

t_name='multi parameter string'

catch,err

if err eq 0 then begin

  iug_load_avon_vlfb,parameter='ch1 ch2'
 
  print_tvar_info,'avon_vlfb_tnn_ch1 avon_vlfb_tnn_ch2'
 
  if ~data_exists('avon_vlfb_tnn_ch1 avon_vlfb_tnn_ch2',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;10 multi parameter array

t_name='multi parameter array'

catch,err

if err eq 0 then begin

  iug_load_avon_vlfb,parameter=['ch1','ch2']
 
  print_tvar_info,'avon_vlfb_tnn_ch1 avon_vlfb_tnn_ch2'
 
  if ~data_exists('avon_vlfb_tnn_ch1 avon_vlfb_tnn_ch2',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;11 caps parameter

t_name='caps parameter'

catch,err

if err eq 0 then begin

  iug_load_avon_vlfb,parameter='CH2'
 
  print_tvar_info,'avon_vlfb_tnn_ch2'
 
  if ~data_exists('avon_vlfb_tnn_ch2',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;12 all parameter

t_name='all parameter'

catch,err

if err eq 0 then begin

  iug_load_avon_vlfb,parameter='all'
 
  print_tvar_info,'avon_vlfb_tnn_ch1 avon_vlfb_tnn_ch2'
 
  if ~data_exists('avon_vlfb_tnn_ch1 avon_vlfb_tnn_ch2',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;13 * parameter

t_name='* parameter'

catch,err

if err eq 0 then begin

  iug_load_avon_vlfb,parameter='*'
 
  print_tvar_info,'avon_vlfb_tnn_ch1 avon_vlfb_tnn_ch2'
 
  if ~data_exists('avon_vlfb_tnn_ch1 avon_vlfb_tnn_ch2',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;14 /verbose

t_name='/verbose'

catch,err

if err eq 0 then begin

  iug_load_avon_vlfb, /verbose
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;15 /downloadonly

t_name='/downloadonly'

catch,err

if err eq 0 then begin

  iug_load_avon_vlfb, /downloadonly
 
  if data_exists('avon_vlfb_tnn_ch1',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;16 /no_download

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
  iug_load_avon_vlfb, /no_download

  if data_exists('avon_vlfb_tnn_ch1',qa_timespan[0],qa_timespan[1]) $
  then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'


  
end_tests
  
end
