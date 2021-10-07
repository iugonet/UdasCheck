
;1 basic
;
; iug_load_gps_isee
;
;2 single datatype
;
; iug_load_gps_isee, datatype = 'atec'
;
;3 multi datatypes array
;
; iug_load_gps_isee, datatype = ['atec']
;
;4 caps datatype
;
; iug_load_gps_isee, datatype = 'ATEC'
;
;5 load all datatypes
;
; iug_load_gps_isee, datatype = 'all'
;
;6 load * datatypes
;
; iug_load_gps_isee, datatype = '*'
; 
;7 verbose
;
; iug_load_gps_isee, datatype = 'atec',/verbose
;
;8 /downloadonly
;
; iug_load_gps_isee, datatype = 'atec',/downloadonly
;
;
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2021-10-06 (06 Oct 2021) $
; $LastChangedRevision:  $
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
;	*** set time span ***
qa_timespan = strarr(2,2)

qa_timespan[0,*] = [ '2006-03-01', '2006-03-02']

qa_timespan[1,*] = [ '2011-07-29', '2011-07-30']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1

del_data,'*'

;1 Basic Test
; iug_load_blr_rish

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_gps_isee

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_gps_*'

  if ~data_exists('iug_gps_atec', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_blr_rish,site = 'ktb'
;

t_name='single datatype'

catch,err

if err eq 0 then begin

  iug_load_gps_isee, datatype = 'atec'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_gps_*'

  if ~data_exists('iug_gps_atec', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi datatypes array
;
; iug_load_gps_isee, datatype = ['atec']
;

t_name='multi datatype string'

catch,err

if err eq 0 then begin

   iug_load_gps_isee, datatype = ['atec']

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_gps_*'

  if ~data_exists('iug_gps_atec', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 caps datatype
;
; iug_load_gps_isee, datatype = 'ATEC'
;

t_name='caps datatype'

catch,err

if err eq 0 then begin

  iug_load_gps_isee, datatype = 'ATEC'
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_gps_*'

  if ~data_exists('iug_gps_atec', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
  
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 load all datatypes
;
; iug_load_gps_isee, datatype = 'all'
;

t_name='all datatypes'

catch,err

if err eq 0 then begin

  iug_load_gps_isee, datatype = 'all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_gps_*'

  if ~data_exists('iug_gps_atec', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load * datatypes
;
; iug_load_gps_isee, datatype = '*'
;

t_name='* datatypes'

catch,err

if err eq 0 then begin

  iug_load_gps_isee, datatype = '*'

  ;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_gps_*'

  if ~data_exists('iug_gps_atec', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 verbose
;
; iug_load_gps_isee, datatype = 'atec',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

  iug_load_gps_isee, datatype = 'atec',/verbose

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_gps_*'

  if ~data_exists('iug_gps_atec', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 /downloadonly
;
; iug_load_gps_isee, datatype = 'atec',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_gps_isee, datatype = 'atec',/downloadonly

  if data_exists('iug_gps_atec', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
