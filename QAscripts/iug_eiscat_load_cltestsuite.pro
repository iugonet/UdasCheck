
;1 basic
; iug_load_eiscat
;
;2 single site
;
; iug_load_eiscat,site='esr_42m'
;
;3 multi sites string
;
; iug_load_eiscat,site='esr_32m esr_42m tro_uhf'
;
;4 multi sites array
;
; iug_load_eiscat,site=['esr_32m', 'esr_42m', 'tro_uhf']
;
;5 caps site
;
; iug_load_eiscat,site='ESR_42m'
;
;6 load all sites
;
; iug_load_eiscat,site='all'
;
;7 load * sites
;
; iug_load_eiscat,site='*'
;
;8 single ydatatype
;
; iug_load_eiscat,site='esr_42m',ydatatype='lat'
;
;9 get_support_data: Turn this on to load the supporting data
;
; iug_load_eiscat, site='esr_42m', /get_support_data
;
;10 verbose
;
; iug_load_eiscat,site='esr_42m',/verbose
;
;11 /downloadonly
;
; iug_load_eiscat,site='esr_42m',/downloadonly
;
;12 /no_download
;
; iug_load_eiscat,site='esr_42m',/no_download
;
;
; Written by Y.-M. Tanaka, Oct. 20, 2011 (ytanaka at nipr.ac.jp)
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
qa_timespan1 = ['2011-02-01', '2011-02-02']
;qa_timespan1 = ['2011-01-10', '2011-01-11']

timespan,qa_timespan1,24,/hour

del_data,'*'

;1 Basic Test
; iug_load_eiscat

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_eiscat

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_esr32m_ne eiscat_esr42m_ne eiscat_trouhf_ne'

  if ~data_exists('eiscat_esr32m_ne eiscat_esr42m_ne eiscat_trouhf_ne',$
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_eiscat,site='esr_42m'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_eiscat,site='esr_42m'

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_esr42m_ne'

  if ~data_exists('eiscat_esr42m_ne',qa_timespan1[0],qa_timespan1[1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi sites string
;
; iug_load_eiscat,site='esr_32m esr_42m tro_uhf'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

  iug_load_eiscat,site='esr_32m esr_42m tro_uhf'

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_esr32m_ne eiscat_esr42m_ne eiscat_trouhf_ne'

  if ~data_exists('eiscat_esr32m_ne eiscat_esr42m_ne eiscat_trouhf_ne', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi sites array
;
; iug_load_eiscat,site=['esr_32m', 'esr_42m', 'tro_uhf']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_eiscat,site=['esr_32m', 'esr_42m', 'tro_uhf']
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_esr32m_ne eiscat_esr42m_ne eiscat_trouhf_ne'

  if ~data_exists('eiscat_esr32m_ne eiscat_esr42m_ne eiscat_trouhf_ne', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'* sites'

;
;5 caps site
;
; iug_load_eiscat,site='SYO'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_eiscat,site=['ESR_42m']

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_esr42m_ne'

  if ~data_exists('eiscat_esr42m_ne',qa_timespan1[0],qa_timespan1[1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all sites
;
; iug_load_eiscat,site='all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_eiscat,site='all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_esr32m_ne eiscat_esr42m_ne eiscat_trouhf_ne'

   if ~data_exists('eiscat_esr32m_ne eiscat_esr42m_ne eiscat_trouhf_ne', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * sites
;
; iug_load_eiscat,site='*'
;

t_name='* sites'

catch,err

if err eq 0 then begin

  iug_load_eiscat,site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_esr32m_ne eiscat_esr42m_ne eiscat_trouhf_ne'

   if ~data_exists('eiscat_esr32m_ne eiscat_esr42m_ne eiscat_trouhf_ne', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 single ydatatype
;
; iug_load_eiscat,site='esr_42m',ydatatype='lat'
;

t_name='single ydatatype'

catch,err

if err eq 0 then begin

  iug_load_eiscat,site='esr_42m',ydatatype='lat'

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_esr42m_ne'

  if ~data_exists('eiscat_esr42m_ne', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;9 get_support_data: Turn this on to load the supporting data
;
; iug_load_eiscat, sites='esr_42m', /get_support_data
;

t_name='get_support_data'

catch,err

if err eq 0 then begin

  iug_load_eiscat,site='esr_42m', /get_support_data

;just spot checking cause there are a lot of data types
  print_tvar_info,'eiscat_esr42m_pulse'

  if ~data_exists('eiscat_esr42m_pulse', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


timespan,qa_timespan1,24,/hour

;
;10 verbose
;
;iug_load_eiscat,site='esr_42m',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_eiscat,site='esr_42m',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;11 /downloadonly
;
;  iug_load_eiscat,site='esr_42m',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_eiscat,site='esr_42m',/downloadonly

  if data_exists('eiscat_esr42m_ne',qa_timespan1,qa_timespan1) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;12 /no_download
;
;iug_load_eiscat, /no_download
;

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
  iug_load_eiscat,site='esr_42m',/no_download

  if data_exists('eiscat_esr42m_ne',qa_timespan1,qa_timespan1) $
      then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

end_tests

end

