
;1 basic
; iug_load_eiscat_vief_vief
;
;2 single site
;
; iug_load_eiscat_vief_vief,site='kst'
;
;3 caps site
;
; iug_load_eiscat_vief,site='KST'
;
;4 load all sites
;
; iug_load_eiscat_vief,site='all'
;
;5 load * sites
;
; iug_load_eiscat_vief,site='*'
;
;6 get_support_data: Turn this on to load the supporting data
;
; iug_load_eiscat_vief, site='kst', /get_support_data
;
;7 verbose
;
; iug_load_eiscat_vief,site='kst',/verbose
;
;8 /downloadonly
;
; iug_load_eiscat_vief,site='kst',/downloadonly
;
;9 /no_download
;
; iug_load_eiscat_vief,site='kst',/no_download
;
;
; Written by Y.-M. Tanaka, Aug. 16, 2013 (ytanaka at nipr.ac.jp)
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
; qa_timespan = strarr(2,2)
; 0. syo, hus, tjo
qa_timespan1 = ['2011-02-04', '2011-02-05']
;qa_timespan1 = ['2011-01-10', '2011-01-11']

timespan,qa_timespan1

del_data,'*'

;1 Basic Test
; iug_load_eiscat_vief

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_eiscat_vief

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_kst_pulse eiscat_kst_inttim eiscat_kst_lat '+ $
	'eiscat_kst_long eiscat_kst_alt eiscat_kst_vi eiscat_kst_vierr '+ $  
	'eiscat_kst_E eiscat_kst_Eerr eiscat_kst_q'

  if ~data_exists('eiscat_kst_pulse eiscat_kst_inttim eiscat_kst_lat '+ $
	'eiscat_kst_long eiscat_kst_alt eiscat_kst_vi eiscat_kst_vierr '+ $  
	'eiscat_kst_E eiscat_kst_Eerr eiscat_kst_q', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_eiscat_vief,site='kst'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_eiscat_vief,site='kst'

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_kst_pulse eiscat_kst_inttim eiscat_kst_lat '+ $
	'eiscat_kst_long eiscat_kst_alt eiscat_kst_vi eiscat_kst_vierr '+ $  
	'eiscat_kst_E eiscat_kst_Eerr eiscat_kst_q'

  if ~data_exists('eiscat_kst_pulse eiscat_kst_inttim eiscat_kst_lat '+ $
	'eiscat_kst_long eiscat_kst_alt eiscat_kst_vi eiscat_kst_vierr '+ $  
	'eiscat_kst_E eiscat_kst_Eerr eiscat_kst_q', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 caps site
;
; iug_load_eiscat_vief,site='KST'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_eiscat_vief,site=['KST']

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_kst_pulse eiscat_kst_inttim eiscat_kst_lat '+ $
	'eiscat_kst_long eiscat_kst_alt eiscat_kst_vi eiscat_kst_vierr '+ $  
	'eiscat_kst_E eiscat_kst_Eerr eiscat_kst_q'

  if ~data_exists('eiscat_kst_pulse eiscat_kst_inttim eiscat_kst_lat '+ $
	'eiscat_kst_long eiscat_kst_alt eiscat_kst_vi eiscat_kst_vierr '+ $  
	'eiscat_kst_E eiscat_kst_Eerr eiscat_kst_q', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 load all sites
;
; iug_load_eiscat_vief,site='all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_eiscat_vief,site='all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_kst_pulse eiscat_kst_inttim eiscat_kst_lat '+ $
	'eiscat_kst_long eiscat_kst_alt eiscat_kst_vi eiscat_kst_vierr '+ $  
	'eiscat_kst_E eiscat_kst_Eerr eiscat_kst_q'

  if ~data_exists('eiscat_kst_pulse eiscat_kst_inttim eiscat_kst_lat '+ $
	'eiscat_kst_long eiscat_kst_alt eiscat_kst_vi eiscat_kst_vierr '+ $  
	'eiscat_kst_E eiscat_kst_Eerr eiscat_kst_q', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 load * sites
;
; iug_load_eiscat_vief,site='*'
;

t_name='* sites'

catch,err

if err eq 0 then begin

  iug_load_eiscat_vief,site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_kst_pulse eiscat_kst_inttim eiscat_kst_lat '+ $
	'eiscat_kst_long eiscat_kst_alt eiscat_kst_vi eiscat_kst_vierr '+ $  
	'eiscat_kst_E eiscat_kst_Eerr eiscat_kst_q'

  if ~data_exists('eiscat_kst_pulse eiscat_kst_inttim eiscat_kst_lat '+ $
	'eiscat_kst_long eiscat_kst_alt eiscat_kst_vi eiscat_kst_vierr '+ $  
	'eiscat_kst_E eiscat_kst_Eerr eiscat_kst_q', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 get_support_data: Turn this on to load the supporting data
;
; iug_load_eiscat_vief, sites='kst', /get_support_data
;

t_name='get_support_data'

catch,err

if err eq 0 then begin

  iug_load_eiscat_vief,site='kst', /get_support_data

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_kst_pulse eiscat_kst_inttim eiscat_kst_lat '+ $
	'eiscat_kst_long eiscat_kst_alt eiscat_kst_vi eiscat_kst_vierr '+ $  
	'eiscat_kst_E eiscat_kst_Eerr eiscat_kst_q eiscat_kst_inttimr'

  if ~data_exists('eiscat_kst_pulse eiscat_kst_inttim eiscat_kst_lat '+ $
	'eiscat_kst_long eiscat_kst_alt eiscat_kst_vi eiscat_kst_vierr '+ $  
	'eiscat_kst_E eiscat_kst_Eerr eiscat_kst_q eiscat_kst_inttimr', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 verbose
;
;iug_load_eiscat_vief,site='kst',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_eiscat_vief,site='kst',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 /downloadonly
;
;  iug_load_eiscat_vief,site='kst',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_eiscat_vief,site='kst',/downloadonly

  if data_exists('eiscat_kst_vi',qa_timespan1[0],qa_timespan1[1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;9 /no_download
;
;iug_load_eiscat_vief, /no_download
;

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
  iug_load_eiscat_vief,site='kst',/no_download

  if data_exists('eiscat_kst_vi',qa_timespan1[0],qa_timespan1[1]) $
      then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

end_tests

end

