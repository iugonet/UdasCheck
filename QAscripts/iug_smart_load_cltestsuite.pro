
;1 basic
; iug_load_smart
;
;2 single filter
;
; iug_load_smart,filter='p00'
;
;3 multi filters string
;
; iug_load_smart,filter='p00 m08'
;
;4 multi filters array
;
; iug_load_smart,filter=['p00', 'm08']
;
;5 caps filter
;
; iug_load_smart,filter='P08'
;
;6 load all filters
;
; iug_load_smart,filter='all'
;
;7 load * filters
;
; iug_load_smart,filter='*'
;
;8 single datatype
;
; iug_load_smart,datatype='halpha'
;
;9 caps datatype
;
; iug_load_smart,datatype='HALPHA'
;
;10 load all datatypes
;
; iug_load_smart,datatype='all'
;
;11 * datatype
;
; iug_load_smart,datatype='*'
;
;12 /downloadonly
;
; iug_load_smart,filter='p00',/downloadonly
;
;13 /no_download
;
; iug_load_smart, /no_download
;
; Written by Y.-M. Tanaka, july 24, 2012.
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
qa_timespan = strarr(1,2)
; 0. syo, hus, tjo
qa_timespan[0,*] = ['2005-08-03/05:05', '2005-08-03/05:08']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0], 3, /minute

del_data,'*'

;1 Basic Test
; iug_load_smart

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_smart

;just spot checking cause there are a lot of data types
  print_tvar_info,'smart_t1_p00'

  if ~data_exists('smart_t1_p00',$
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single filter
;
; iug_load_smart,filter='m08'
;

t_name='single filter'

catch,err

if err eq 0 then begin

  iug_load_smart,filter='m08'

;just spot checking cause there are a lot of data types
  print_tvar_info,'smart_t1_m08'

  if ~data_exists('smart_t1_m08', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi filters string
;
; iug_load_smart,filter='p00 m08 m05'
;

t_name='multi filter string'

catch,err

if err eq 0 then begin

  iug_load_smart,filter='p00 m08 m05'

;just spot checking cause there are a lot of data types
  print_tvar_info,'smart_t1_p00 smart_t1_m08 smart_t1_m05'

  if ~data_exists('smart_t1_p00 smart_t1_m08 smart_t1_m05', $
	qa_timespan[qa_t,0],qa_timespan[qa_t,1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi filters array
;
; iug_load_smart,filter=['p00', 'm08', 'm05']
;

t_name='multi filters array'

catch,err

if err eq 0 then begin

  iug_load_smart,filter=['p00', 'm08', 'm05']
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'smart_t1_p00 smart_t1_m08 smart_t1_m05'

  if ~data_exists('smart_t1_p00 smart_t1_m08 smart_t1_m05', $
	qa_timespan[qa_t,0],qa_timespan[qa_t,1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps filter
;
; iug_load_smart,filter='P00'
;

t_name='caps filter'

catch,err

if err eq 0 then begin

  iug_load_smart,filter=['P00']

;just spot checking cause there are a lot of data types
  print_tvar_info,'smart_t1_p00'

  if ~data_exists('smart_t1_p00', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all filters
;
; iug_load_smart,filter='all'
;

t_name='all filters'

catch,err

if err eq 0 then begin

  iug_load_smart,filter='all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'smart_t1_p00 smart_t1_m08 smart_t1_m05 smart_t1_p05 smart_t1_p08'

  if ~data_exists('smart_t1_p00 smart_t1_m08 smart_t1_m05 smart_t1_p05 smart_t1_p08', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * filters
;
; iug_load_smart,filter='*'
;

t_name='* filter'

catch,err

if err eq 0 then begin

  iug_load_smart,filter='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'smart_t1_p00 smart_t1_m08 smart_t1_m05 smart_t1_p05 smart_t1_p08'

  if ~data_exists('smart_t1_p00 smart_t1_m08 smart_t1_m05 smart_t1_p05 smart_t1_p08', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 single datatype
;
; iug_load_smart,datatype='halpha'
;

t_name='single datatype'

catch,err

if err eq 0 then begin

  iug_load_smart,datatype='halpha'

;just spot checking cause there are a lot of data types
  print_tvar_info,'smart_t1_p00'

  if ~data_exists('smart_t1_p00', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;9 caps datatype
;
; iug_load_smart,datatype='HALPHA'
;

t_name='caps datatype'

catch,err

if err eq 0 then begin

  iug_load_smart,datatype=['HALPHA']

;just spot checking cause there are a lot of data types
  print_tvar_info,'smart_t1_p00'

  if ~data_exists('smart_t1_p00', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;10 load all datatypes
;
; iug_load_smart,datatype='all'
;

t_name='all datatypes'

catch,err

if err eq 0 then begin

  iug_load_smart,datatype='all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'smart_t1_p00'

  if ~data_exists('smart_t1_p00', $
                qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;11 * datatype
;
; iug_load_smart,datatype='*'
;

t_name='* datatype'

catch,err

if err eq 0 then begin

  iug_load_smart,datatype = '*'
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'smart_t1_p00'

  if ~data_exists('smart_t1_p00', $
        qa_timespan[qa_t,0],qa_timespan[qa_t,1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;12 /downloadonly
;
;  iug_load_smart,/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_smart,filter='p00',/downloadonly

  if data_exists('smart_t1_p00',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;13 /no_download
;
;iug_load_smart, /no_download
;

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
  iug_load_smart, /no_download

  if data_exists('smart_t1_p00', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
	then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

end_tests

end
