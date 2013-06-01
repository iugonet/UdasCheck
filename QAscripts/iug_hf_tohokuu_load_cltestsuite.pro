;+
;1 basic
;  iug_load_hf_tohokuu
;
;2 single site
;  iug_load_hf_tohokuu,site='iit'
;
;3 array site
;  iug_load_hf_tohokuu,site=['iit']
;
;4 caps site
;  iug_load_hf_tohokuu,site='IIT'
;
;5 single parameter
;  iug_load_hf_tohokuu,parameter='rh'
;
;6 multi parameter string
;  iug_load_hf_tohokuu,parameter='rh lh'
;
;7 multi parameter array
;  iug_load_hf_tohokuu,parameter=['rh','lh']
;
;8 caps parameter
;  iug_load_hf_tohokuu,parameter='RH'
;
;9 * parameter
;  iug_load_hf_tohokuu,parameter='*'
;
;10 /downloadonly
;  iug_load_hf_tohokuu,/downloadonly
;
;11 /no_download
;  iug_load_hf_tohokuu,/no_download
;
; $LastChangeBy: M. Yagi $
; $LastChangeDate: 2013-01-09 $
;
;-


init_tests

t_num=0;

thm_init

qa_timespan=['2004-01-09/22:00:00','2004-01-09/23:00:00']

timespan,qa_timespan

del_data,'*'



; 1 basic

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_hf_tohokuu

  print_tvar_info,'iug_iit_hf_rh'

  if ~data_exists('iug_iit_hf_rh',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'
 


;2 single site
 
t_name='single site'
 
catch,err
 
if err eq 0 then begin
 
  iug_load_hf_tohokuu,site='iit'

  print_tvar_info, 'iug_iit_hf_rh'
  
  if ~data_exists('iug_iit_hf_rh',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
  
endif
  
catch,/cancel
  
handle_error,err,t_name,++t_num
  
del_data,'*'



;3 array site

t_name='array site'
 
catch,err
 
if err eq 0 then begin

  iug_load_hf_tohokuu,site=['iit']

  print_tvar_info, 'iug_iit_hf_rh'
  
  if ~data_exists('iug_iit_hf_rh',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
  
endif
  
catch,/cancel
  
handle_error,err,t_name,++t_num
  
del_data,'*'



;4 caps site

t_name='caps site'
 
catch,err
 
if err eq 0 then begin

  iug_load_hf_tohokuu,site='IIT'

  print_tvar_info, 'iug_iit_hf_rh'
  
  if ~data_exists('iug_iit_hf_rh',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
  
endif
  
catch,/cancel
  
handle_error,err,t_name,++t_num
  
del_data,'*'



;5 single parameter

t_name='single parameter'
 
catch,err
 
if err eq 0 then begin

  iug_load_hf_tohokuu,parameter='rh'

  print_tvar_info, 'iug_iit_hf_rh'
  
  if ~data_exists('iug_iit_hf_rh',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
  
endif
  
catch,/cancel
  
handle_error,err,t_name,++t_num
  
del_data,'*'



;6 multi parameter string

t_name='multi parameter string'
 
catch,err
 
if err eq 0 then begin

  iug_load_hf_tohokuu,parameter='rh lh'

  print_tvar_info, 'iug_iit_hf_rh iug_iit_hf_lh'
  
  if ~data_exists('iug_iit_hf_rh iug_iit_hf_lh',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
  
endif
  
catch,/cancel
  
handle_error,err,t_name,++t_num
  
del_data,'*'



;7 multi parameter array

t_name='multi parameter array'
 
catch,err
 
if err eq 0 then begin

  iug_load_hf_tohokuu,parameter=['rh','lh']

  print_tvar_info, 'iug_iit_hf_rh iug_iit_hf_lh'
  
  if ~data_exists('iug_iit_hf_rh iug_iit_hf_lh',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
  
endif
  
catch,/cancel
  
handle_error,err,t_name,++t_num
  
del_data,'*'



;8 caps parameter

t_name='caps parameter'
 
catch,err
 
if err eq 0 then begin

  iug_load_hf_tohokuu,parameter='RH'

  print_tvar_info, 'iug_iit_hf_rh'
  
  if ~data_exists('iug_iit_hf_rh',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
  
endif
  
catch,/cancel
  
handle_error,err,t_name,++t_num
  
del_data,'*'



;9 * parameter

t_name='* parameter'
 
catch,err
 
if err eq 0 then begin

  iug_load_hf_tohokuu,parameter='*'

  print_tvar_info, 'iug_iit_hf_rh iug_iit_hf_lh'
  
  if ~data_exists('iug_iit_hf_rh iug_iit_hf_lh',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
  
endif
  
catch,/cancel
  
handle_error,err,t_name,++t_num
  
del_data,'*'



;10 /downloadonly

t_name='/downloadonly'

catch,err

if err eq 0 then begin

  iug_load_hf_tohokuu,/downloadonly
 
  if data_exists('iug_iit_hf_rh',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;11 /no_download

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
  iug_load_hf_tohokuu, /no_download

  if data_exists('iug_iit_hf_rh',qa_timespan[0],qa_timespan[1]) $
  then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'



end_tests
  
end
