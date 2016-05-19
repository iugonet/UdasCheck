
;1 basic
; iug_load_radiosonde_rish
;
;2 single datatype
;
; iug_load_radiosonde_rish, datatype = 'dawex'
; 
;3 multi datatypes string
;
; iug_load_radiosonde_rish = 'dawex misc'
;
;4 multi datatypes array
;
; iug_load_radiosonde_rish = ['dawex','misc']
;
;5 caps datatype
;
; iug_load_radiosonde_rish, datatype = 'DAWEX'
;
;6 load all datatypes
;
; iug_load_radiosonde_rish, datatype = 'all'
;
;7 load * datatypes
;
; iug_load_radiosonde_rish, datatype = '*'
; 
;8 single site
;
; iug_load_radiosonde_rish, site = 'drw'
;
;9 multi sites string
;
; iug_load_radiosonde_rish, site = 'drw gpn'
;
;10 multi sites array
;
; iug_load_radiosonde_rish, site = ['drw','gpn']
;
;11 caps site
;
; iug_load_radiosonde_rish, site = 'DRW'
;
;12 load all sites
;
; iug_load_radiosonde_rish, site = 'all'
;
;13 load * sites
;
; iug_load_radiosonde_rish, site = '*'
; 
;14 verbose
;
; iug_load_radiosonde_rish,/verbose
;
;15 /downloadonly
;
; iug_load_radiosonde_rish,/downloadonly
;
;
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2013-05-30 (30 May 2013) $
; $LastChangedRevision: 2014-01-11 (11 Jan 2014) $
; $URL: $
;-

init_tests

;prepare to run tests
t_num = 0

thm_init
;;thm_init, LOCAL_DATA_DIR='/pub/data/',REMOTE_DATA_DIR="http://gemsis01.stelab.nagoya-u.ac.jp/data/themis/"

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'
;timespan,'2008-02-22',1,/hour
; *** set time span ***
qa_timespan = strarr(2,2)

qa_timespan[0,*] = [ '2001-11-15', '2001-11-16']

qa_timespan[1,*] = [ '2001-11-16', '2001-11-17']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/day

del_data,'*'

;1 Basic Test
; iug_load_radiosonde_rish

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_radiosonde_rish

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_* iug_radiosonde_gpn_* iug_radiosonde_ktr_* iug_radiosonde_ktb_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single datatype
;
; iug_load_radiosonde_rish, datatype = 'dawex'
;

t_name='single datatype'

catch,err

if err eq 0 then begin

  iug_load_radiosonde_rish,datatype='dawex'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_* iug_radiosonde_gpn_* iug_radiosonde_ktr_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi datatypes string
;
; iug_load_radiosonde_rish,datatype= 'dawex misc'
;

t_name='multi datatypes string'

catch,err

if err eq 0 then begin

   iug_load_radiosonde_rish, datatype = 'dawex misc'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_* iug_radiosonde_gpn_* iug_radiosonde_ktr_* iug_radiosonde_ktb_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi datatypes array
;
; iug_load_radiosonde_rish, datatype = ['dawex','misc']
;

t_name='multi datatypes array'

catch,err

if err eq 0 then begin

  iug_load_radiosonde_rish, datatype = ['dawex','misc']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_* iug_radiosonde_gpn_* iug_radiosonde_ktr_* iug_radiosonde_ktb_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
  
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps datatype
;
; iug_load_radiosonde_rish, datatype = 'DAWEX'
;

t_name='caps datatype'

catch,err

if err eq 0 then begin

  iug_load_radiosonde_rish, datatype = 'DAWEX'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_* iug_radiosonde_gpn_* iug_radiosonde_ktr_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all datatypes
;
; iug_load_radiosonde_rish, datatype = 'all'
;

t_name='all datatypes'

catch,err

if err eq 0 then begin

  iug_load_radiosonde_rish, datatype = 'all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_* iug_radiosonde_gpn_* iug_radiosonde_ktr_* iug_radiosonde_ktb_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * datatypes
;
; iug_load_radiosonde_rish, datatype = '*'
;

t_name='* datatypes'

catch,err

if err eq 0 then begin

  iug_load_radiosonde_rish, datatype = '*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_* iug_radiosonde_gpn_* iug_radiosonde_ktr_* iug_radiosonde_ktb_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
    
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 single site
;
; iug_load_radiosonde_rish, site = 'drw'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_radiosonde_rish, site = 'drw'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;9 multi sites string
;
; iug_load_radiosonde_rish, site = 'drw gpn'
;

t_name='multi sites string'

catch,err

if err eq 0 then begin

  iug_load_radiosonde_rish, site = 'drw gpn'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_* iug_radiosonde_gpn_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;10 multi sites array
;
; iug_load_radiosonde_rish, site = ['drw','gpn']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_radiosonde_rish, site = ['drw','gpn']

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_* iug_radiosonde_gpn_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;11 caps site
;
; iug_load_radiosonde_rish, site = 'DRW'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_radiosonde_rish, site = 'DRW'
  print, tnames('*')

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;12 load all sites
;
; iug_load_radiosonde_rish, site = 'all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_radiosonde_rish, site = 'all'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_* iug_radiosonde_gpn_* iug_radiosonde_ktr_* iug_radiosonde_ktb_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;13 load * sites
;
; iug_load_radiosonde_rish, site = '*'
;

t_name='* sites'

catch,err

if err eq 0 then begin

  iug_load_radiosonde_rish, site = '*'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_radiosonde'

  if ~data_exists('iug_radiosonde_drw_* iug_radiosonde_gpn_* iug_radiosonde_ktr_* iug_radiosonde_ktb_*', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;14 verbose
;
;iug_load_radiosonde_rish, site ='drw',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_radiosonde_rish, site ='drw',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;20 /downloadonly
;
;  iug_load_radiosonde_rish, /downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_radiosonde_rish,/downloadonly

  if data_exists('iug_radiosonde_drw_* iug_radiosonde_gpn_* iug_radiosonde_ktr_* iug_radiosonde_ktb_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
