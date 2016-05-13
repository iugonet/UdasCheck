;+
;1 basic
; iug_load_lfrto
; 
;2 single site
; iug_load_lfrto,site='ath'
;     
;3 multi sites string
; iug_load_lfrto,site='ath nal'
;       
;4 multi sites array
; iug_load_lfrto,site=['ath','nal']
;
;5 caps site 
; iug_load_lfrto,site='ATH'
;
;6 load all sites
; iug_load_lfrto,site='all'
;
;7 load * sites
; iug_load_lfrto,site='*' 
;
;8 single trans
; iug_load_lfrto,site='ath',trans='wwvb'
;
;9 multi trans string
; iug_load_lfrto,site='ath',trans='wwvb ndk'
;
;10 multi trans array
; iug_load_lfrto,site='ath',trans=['wwvb','ndk']
;
;11 caps trans
; iug_load_lfrto,site='ath',trans='WWVB'
;
;12 load all trans
; iug_load_lfrto,site='ath',trans='all'
;
;13 load * trans
; iug_load_lfrto,site='ath',trans='*'
;
;14 single parameter
; iug_load_lfrto,parameter='power'
;
;15 multi parameter string
; iug_load_lfrto,parameter='power phase'
;
;16 multi parameter array
; iug_load_lfrto,parameter=['power','phase']
;
;17 caps parameter
; iug_load_lfrto,parameter='POWER'
;
;18 all parameter
; iug_load_lfrto,parameter='all'
;
;19 * parameter
; iug_load_lfrto,parameter='*'
;
;20 single datatype
; iug_load_lfrto,datatype='30sec'
;
;21 datatype array
; iug_load_lfrto,datatype=['30sec']
;
;22 caps datatype
; iug_load_lfrto,datatype=['30SEC']
;
;23 all datatype
; iug_load_lfrto,datatype='all'
;
;24 * datatype
; iug_load_lfrto,datatype='*'
;
;25 /verbose
; iug_load_lfrto,/verbose
;
;26 /downloadonly
; iug_load_lfrto,/downloadonly
;
;27 /no_download
; iug_load_lfrto,/no_download
;
; $LastChangeBy: M. Yagi $
; $LastChangeDate: 2013-01-09 $
;-

init_tests

;prepare to run tests
t_num=0

thm_init

qa_timespan=['2011-05-29/00:00:00','2011-05-30/00:00:00']

timespan,qa_timespan



; 1 basic
del_data,'*'

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_lfrto
 
  print_tvar_info,'lfrto_ath_wwvb_pow30s'
 
  if ~data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



; 2 single site

t_name='single site'
 
catch,err
 
if err eq 0 then begin
 
  iug_load_lfrto,site='ath'
  
  print_tvar_info, 'lfrto_ath_wwvb_pow30s'
  
  if ~data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
  
endif
  
catch,/cancel
  
handle_error,err,t_name,++t_num
  
del_data,'*'



;3 multi sites string
  
t_name='multi sites string'
  
catch,err
  
if err eq 0 then begin
  
  iug_load_lfrto,site='ath nal'
   
  print_tvar_info,'lfrto_ath_wwvb_pow30s lfrto_nal_dcf_pow30s'
   
  if ~data_exists('lfrto_ath_wwvb_pow30s lfrto_nal_dcf_pow30s',qa_timespan[0], qa_timespan[1]) $
  then message, 'invalid load'
   
endif
   
catch,/cancel
   
handle_error,err,t_name,++t_num
   
del_data,'*'
      


;4 multi sites array

t_name='multi sites string'
  
catch,err
  
if err eq 0 then begin
  
  iug_load_lfrto,site=['ath','nal']
   
  print_tvar_info,'lfrto_ath_wwvb_pow30s lfrto_nal_dcf_pow30s'
   
  if ~data_exists('lfrto_ath_wwvb_pow30s lfrto_nal_dcf_pow30s',qa_timespan[0], qa_timespan[1]) $
  then message, 'invalid load'
   
endif
   
catch,/cancel
   
handle_error,err,t_name,++t_num
   
del_data,'*'



; 5 caps site

t_name='caps site'

catch,err
  
if err eq 0 then begin
  
  iug_load_lfrto,site='ATH'
   
  print_tvar_info,'lfrto_ath_wwvb_pow30s'

  if ~data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
   
endif
   
catch,/cancel
   
handle_error,err,t_name,++t_num
   
del_data,'*'

      

;6 load all sites

t_name='load all sites'

catch,err

if err eq 0 then begin

  iug_load_lfrto,site='all'

  print_tvar_info,'lfrto_ath_wwvb_pow30s lfrto_nal_dcf_pow30s'

  if ~data_exists('lfrto_ath_wwvb_pow30s lfrto_nal_dcf_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



;7 load * sites

t_name='load * sites'

catch,err

if err eq 0 then begin

  iug_load_lfrto,site='*'

  print_tvar_info,'lfrto_ath_wwvb_pow30s lfrto_nal_dcf_pow30s'

  if ~data_exists('lfrto_ath_wwvb_pow30s lfrto_nal_dcf_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



;8 single trans

t_name='single trans'

catch,err

if err eq 0 then begin

  iug_load_lfrto,site='ath',trans='wwvb'

  print_tvar_info,'lfrto_ath_wwvb_pow30s'

  if ~data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



;9 multi trans string

t_name='multi trans string'

catch,err

if err eq 0 then begin

  iug_load_lfrto,site='ath',trans='wwvb ndk'

  print_tvar_info,'lfrto_ath_wwvb_pow30s lfrto_ath_ndk_pow30s'

  if ~data_exists('lfrto_ath_wwvb_pow30s lfrto_ath_ndk_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



;10 multi trans array

t_name='multi trans array'

catch,err

if err eq 0 then begin

  iug_load_lfrto,site='ath',trans=['wwvb','ndk']

  print_tvar_info,'lfrto_ath_wwvb_pow30s lfrto_ath_ndk_pow30s'

  if ~data_exists('lfrto_ath_wwvb_pow30s lfrto_ath_ndk_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



;11 caps trans

t_name='caps trans'

catch,err

if err eq 0 then begin

  iug_load_lfrto,site='ath',trans='WWVB'

  print_tvar_info,'lfrto_ath_wwvb_pow30s'

  if ~data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



;12 load all trans

t_name='load all trans'

catch,err

if err eq 0 then begin

  iug_load_lfrto,site='ath',trans='all'

  print_tvar_info,'lfrto_ath_wwvb_pow30s lfrto_ath_ndk_pow30s'

  if ~data_exists('lfrto_ath_wwvb_pow30s lfrto_ath_ndk_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



;13 load * trans

t_name='load * trans'

catch,err

if err eq 0 then begin

  iug_load_lfrto,site='ath',trans='*'

  print_tvar_info,'lfrto_ath_wwvb_pow30s lfrto_ath_ndk_pow30s'

  if ~data_exists('lfrto_ath_wwvb_pow30s lfrto_ath_ndk_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



;14 single parameter

t_name='single parameter'

catch,err

if err eq 0 then begin

  iug_load_lfrto,parameter='power'
 
  print_tvar_info,'lfrto_ath_wwvb_pow30s'
 
  if ~data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;15 multi parameter string

t_name='multi parameter string'

catch,err

if err eq 0 then begin

  iug_load_lfrto,parameter='power phase'
 
  print_tvar_info,'lfrto_ath_wwvb_pow30s lfrto_ath_wwvb_pha30s'
 
  if ~data_exists('lfrto_ath_wwvb_pow30s lfrto_ath_wwvb_pha30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;16 multi parameter array

t_name='multi parameter array'

catch,err

if err eq 0 then begin

  iug_load_lfrto,parameter=['power','phase']
 
  print_tvar_info,'lfrto_ath_wwvb_pow30s lfrto_ath_wwvb_pha30s'
 
  if ~data_exists('lfrto_ath_wwvb_pow30s lfrto_ath_wwvb_pha30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;17 caps parameter

t_name='caps parameter'

catch,err

if err eq 0 then begin

  iug_load_lfrto,parameter='POWER'
 
  print_tvar_info,'lfrto_ath_wwvb_pow30s'
 
  if ~data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;18 all parameter

t_name='all parameter'

catch,err

if err eq 0 then begin

  iug_load_lfrto,parameter='all'
 
  print_tvar_info,'lfrto_ath_wwvb_pow30s lfrto_ath_wwvb_pha30s'
 
  if ~data_exists('lfrto_ath_wwvb_pow30s lfrto_ath_wwvb_pha30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;19 * parameter

t_name='* parameter'

catch,err

if err eq 0 then begin

  iug_load_lfrto,parameter='*'
 
  print_tvar_info,'lfrto_ath_wwvb_pow30s lfrto_ath_wwvb_pha30s'
 
  if ~data_exists('lfrto_ath_wwvb_pow30s lfrto_ath_wwvb_pha30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;20 single datatype

t_name='single datatype'

catch,err

if err eq 0 then begin

  iug_load_lfrto,datatype='30sec'
 
  print_tvar_info,'lfrto_ath_wwvb_pow30s'
 
  if ~data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;21 datatype array

t_name='datatype array'

catch,err

if err eq 0 then begin

  iug_load_lfrto,datatype=['30sec']
 
  print_tvar_info,'lfrto_ath_wwvb_pow30s'
 
  if ~data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;22 caps datatype

t_name='caps datatype'

catch,err

if err eq 0 then begin

  iug_load_lfrto,datatype=['30SEC']
 
  print_tvar_info,'lfrto_ath_wwvb_pow30s'
 
  if ~data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;23 all datatype

t_name='all datatype'

catch,err

if err eq 0 then begin

  iug_load_lfrto,datatype='all'
 
  print_tvar_info,'lfrto_ath_wwvb_pow30s'
 
  if ~data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;24 * datatype

t_name='* datatype'

catch,err

if err eq 0 then begin

  iug_load_lfrto,datatype='*'
 
  print_tvar_info,'lfrto_ath_wwvb_pow30s'
 
  if ~data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;25 /verbose

t_name='/verbose'

catch,err

if err eq 0 then begin

  iug_load_lfrto,site='ath',/verbose
 
endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;25 /downloadonly

t_name='/downloadonly'

catch,err

if err eq 0 then begin

  iug_load_lfrto,site='ath',/downloadonly
 
  if data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'invalid load'

endif

catch,/cancel
 
handle_error,err,t_name,++t_num
 
del_data,'*'



;26 /no_download

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
  iug_load_lfrto, /no_download

  if data_exists('lfrto_ath_wwvb_pow30s',qa_timespan[0],qa_timespan[1]) $
  then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'


  
end_tests
  
end
