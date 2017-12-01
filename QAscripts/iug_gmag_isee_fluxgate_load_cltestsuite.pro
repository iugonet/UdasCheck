;
;1 basic
; iug_load_gmag_isee_fluxgate
;
;2 single site
;
; iug_load_gmag_isee_fluxgate,site='kag'
;
;3 multi sites string
;
; iug_load_gmag_isee_fluxgate,site='msr kag'
;
;4 multi sites array
;
; iug_load_gmag_isee_fluxgate,site=['mdm', 'tew', 'rik', 'ktb']
;
;5 caps site
;
; iug_load_gmag_isee_fluxgate,site='MSR'
;
;6 load all sites
;
; iug_load_gmag_isee_fluxgate,site='all'
;
;7 load * sites
;
; iug_load_gmag_isee_fluxgate,site='*'
;
;8 single datatype
;
; iug_load_gmag_isee_fluxgate, datatype='1min', site='msr'
;
;9 caps datatype
;
; iug_load_gmag_isee_fluxgate, datatype='1MIN'
;
;10 * datatype
;
; iug_load_gmag_isee_fluxgate, datatype='*', site='kag'
;
;11 array datatype
;
; iug_load_gmag_isee_fluxgate, datatype=['1MIN', '1sec']
;
;12 /downloadonly
;
; iug_load_gmag_isee_fluxgate, site='msr', /downloadonly
;
;13 /no_download
;
; iug_load_gmag_isee_fluxgate, /no_download
;
;14 /no_server
;
; iug_load_gmag_isee_fluxgate, /no_server
;
; $LastChangedBy: segawa $
; $LastChangedDate: 2014-01-24 15:53:15 +0900 (Fri, 24 Jan 2014) $
; $LastChangedRevision: 409 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/geomag/erg_gmag_stel_fluxgate_load_cltestsuite.pro $
;-

init_tests

;prepare to run tests
t_num = 0
qa_timespan = strarr(1,2)
;;qa_timespan[0,*] = [ '2006-11-20', '2006-11-21']
qa_timespan[0,*] = [ '2012-11-20', '2012-11-21']
qa_t = 0

thm_init

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'

timespan,qa_timespan[qa_t]

del_data,'*'

;1 Basic Test
; iug_load_gmag_isee_fluxgate

t_name='basic'
cmp_TName = $
	'isee_fluxgate_mag_msr_1sec_hdz isee_fluxgate_mag_msr_1min_hdz isee_fluxgate_mag_msr_1h_hdz isee_fluxgate_mag_rik_1sec_hdz isee_fluxgate_mag_rik_1min_hdz isee_fluxgate_mag_rik_1h_hdz isee_fluxgate_mag_kag_1sec_hdz isee_fluxgate_mag_kag_1min_hdz isee_fluxgate_mag_kag_1h_hdz isee_fluxgate_mag_ktb_1sec_hdz isee_fluxgate_mag_ktb_1min_hdz isee_fluxgate_mag_ktb_1h_hdz isee_fluxgate_mag_mdm_1min_hdz isee_fluxgate_mag_mdm_1h_hdz isee_fluxgate_mag_tew_1min_hdz isee_fluxgate_mag_tew_1h_hdz'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate

  ; just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, $
	qa_timespan[qa_t,0],qa_timespan[qa_t,1]) THEN message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;2 single site
;
; iug_load_gmag_isee_fluxgate,site='kag'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate,site='kag'

;just spot checking cause there are a lot of data types
  print_tvar_info, $
    'isee_fluxgate_mag_kag_1sec_hdz isee_fluxgate_mag_kag_1min_hdz isee_fluxgate_mag_kag_1h_hdz'

  IF ~data_exists( $
    'isee_fluxgate_mag_kag_1sec_hdz isee_fluxgate_mag_kag_1min_hdz isee_fluxgate_mag_kag_1h_hdz', $
    qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;3 multi sites string
;
; iug_load_gmag_isee_fluxgate,site='msr kag'
;

t_name='multi site string'
cmp_TName = 'isee_fluxgate_mag_msr_1sec_hdz isee_fluxgate_mag_msr_1min_hdz isee_fluxgate_mag_msr_1h_hdz isee_fluxgate_mag_kag_1sec_hdz isee_fluxgate_mag_kag_1min_hdz isee_fluxgate_mag_kag_1h_hdz'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate,site='msr kag'

;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;4 multi sites array
;
; iug_load_gmag_isee_fluxgate,site=['mdm', 'tew', 'rik', 'ktb']
;

t_name='multi sites array'
cmp_TName = $
    'isee_fluxgate_mag_rik_1sec_hdz isee_fluxgate_mag_rik_1min_hdz isee_fluxgate_mag_rik_1h_hdz isee_fluxgate_mag_ktb_1sec_hdz isee_fluxgate_mag_ktb_1min_hdz isee_fluxgate_mag_ktb_1h_hdz isee_fluxgate_mag_mdm_1min_hdz isee_fluxgate_mag_mdm_1h_hdz isee_fluxgate_mag_tew_1min_hdz isee_fluxgate_mag_tew_1h_hdz'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate,site=['mdm', 'tew', 'rik', 'ktb']

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;5 caps site
;
; iug_load_gmag_isee_fluxgate,site=['MSR']
;

t_name='caps site'
cmp_TName = 'isee_fluxgate_mag_msr_1sec_hdz isee_fluxgate_mag_msr_1min_hdz isee_fluxgate_mag_msr_1h_hdz'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate,site=['MSR']

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;6 load all sites
;
; iug_load_gmag_isee_fluxgate,site='all'
;
;

t_name='all sites'
cmp_TName = $
	'isee_fluxgate_mag_msr_1sec_hdz isee_fluxgate_mag_msr_1min_hdz isee_fluxgate_mag_msr_1h_hdz isee_fluxgate_mag_rik_1sec_hdz isee_fluxgate_mag_rik_1min_hdz isee_fluxgate_mag_rik_1h_hdz isee_fluxgate_mag_kag_1sec_hdz isee_fluxgate_mag_kag_1min_hdz isee_fluxgate_mag_kag_1h_hdz isee_fluxgate_mag_ktb_1sec_hdz isee_fluxgate_mag_ktb_1min_hdz isee_fluxgate_mag_ktb_1h_hdz isee_fluxgate_mag_mdm_1min_hdz isee_fluxgate_mag_mdm_1h_hdz isee_fluxgate_mag_tew_1min_hdz isee_fluxgate_mag_tew_1h_hdz'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate,site='all'

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;7 load * sites
;
; iug_load_gmag_isee_fluxgate,site='*'
;

t_name='*'
cmp_TName = $
	'isee_fluxgate_mag_msr_1sec_hdz isee_fluxgate_mag_msr_1min_hdz isee_fluxgate_mag_msr_1h_hdz isee_fluxgate_mag_rik_1sec_hdz isee_fluxgate_mag_rik_1min_hdz isee_fluxgate_mag_rik_1h_hdz isee_fluxgate_mag_kag_1sec_hdz isee_fluxgate_mag_kag_1min_hdz isee_fluxgate_mag_kag_1h_hdz isee_fluxgate_mag_ktb_1sec_hdz isee_fluxgate_mag_ktb_1min_hdz isee_fluxgate_mag_ktb_1h_hdz isee_fluxgate_mag_mdm_1min_hdz isee_fluxgate_mag_mdm_1h_hdz isee_fluxgate_mag_tew_1min_hdz isee_fluxgate_mag_tew_1h_hdz'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate,site='*'

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;8 datatype
;
; iug_load_gmag_isee_fluxgate, datatype='1min', site='msr'
;

t_name='datatype'
cmp_TName = 'isee_fluxgate_mag_msr_1min_hdz'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate, datatype='1min', site='msr'

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;9 caps datatype
;
; iug_load_gmag_isee_fluxgate, datatype='1MIN'
;

t_name='caps datatype'
cmp_TName = 'isee_fluxgate_mag_msr_1min_hdz isee_fluxgate_mag_rik_1min_hdz isee_fluxgate_mag_kag_1min_hdz isee_fluxgate_mag_ktb_1min_hdz isee_fluxgate_mag_mdm_1min_hdz isee_fluxgate_mag_tew_1min_hdz'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate, datatype='1MIN'

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;10 * datatype
;
; iug_load_gmag_isee_fluxgate, datatype='*', site='kag'
;

t_name='* datatype'
cmp_TName = 'isee_fluxgate_mag_kag_1sec_hdz isee_fluxgate_mag_kag_1min_hdz isee_fluxgate_mag_kag_1h_hdz'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate, datatype='*', site='kag'

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;11 array datatype
;
; iug_load_gmag_isee_fluxgate, datatype=['1MIN', '1sec']
;

t_name='array datatype'
cmp_TName = $
    'isee_fluxgate_mag_msr_1sec_hdz isee_fluxgate_mag_msr_1min_hdz isee_fluxgate_mag_rik_1sec_hdz isee_fluxgate_mag_rik_1min_hdz isee_fluxgate_mag_kag_1sec_hdz isee_fluxgate_mag_kag_1min_hdz isee_fluxgate_mag_ktb_1sec_hdz isee_fluxgate_mag_ktb_1min_hdz isee_fluxgate_mag_mdm_1min_hdz isee_fluxgate_mag_tew_1min_hdz'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate, datatype=['1MIN', '1sec']

  ;just spot checking cause there are a lot of data types
  print_tvar_info, cmp_TName

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;12 /downloadonly
;
; iug_load_gmag_isee_fluxgate, site='msr', /downloadonly
;

t_name = '/downloadonly'
cmp_TName = $
	'isee_fluxgate_mag_msr_1sec_hdz isee_fluxgate_mag_msr_1min_hdz isee_fluxgate_mag_msr_1h_hdz isee_fluxgate_mag_rik_1sec_hdz isee_fluxgate_mag_rik_1min_hdz isee_fluxgate_mag_rik_1h_hdz isee_fluxgate_mag_kag_1sec_hdz isee_fluxgate_mag_kag_1min_hdz isee_fluxgate_mag_kag_1h_hdz isee_fluxgate_mag_ktb_1sec_hdz isee_fluxgate_mag_ktb_1min_hdz isee_fluxgate_mag_ktb_1h_hdz isee_fluxgate_mag_mdm_1min_hdz isee_fluxgate_mag_mdm_1h_hdz isee_fluxgate_mag_tew_1min_hdz isee_fluxgate_mag_tew_1h_hdz'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate, site='msr', /downloadonly

  IF data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
	message,'existed data'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;13 /no_download
;
; iug_load_gmag_isee_fluxgate, /no_download

t_name = 'no_download'
cmp_TName = $
	'isee_fluxgate_mag_msr_1sec_hdz isee_fluxgate_mag_msr_1min_hdz isee_fluxgate_mag_msr_1h_hdz isee_fluxgate_mag_rik_1sec_hdz isee_fluxgate_mag_rik_1min_hdz isee_fluxgate_mag_rik_1h_hdz isee_fluxgate_mag_kag_1sec_hdz isee_fluxgate_mag_kag_1min_hdz isee_fluxgate_mag_kag_1h_hdz isee_fluxgate_mag_ktb_1sec_hdz isee_fluxgate_mag_ktb_1min_hdz isee_fluxgate_mag_ktb_1h_hdz isee_fluxgate_mag_mdm_1min_hdz isee_fluxgate_mag_mdm_1h_hdz isee_fluxgate_mag_tew_1min_hdz isee_fluxgate_mag_tew_1h_hdz'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate, /no_download

  IF data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
    message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel

handle_error,err,t_name,++t_num

setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'


;14 /no_server
;
; iug_load_gmag_isee_fluxgate, /no_server

t_name = 'no_server'
cmp_TName = $
	'isee_fluxgate_mag_msr_1sec_hdz isee_fluxgate_mag_msr_1min_hdz isee_fluxgate_mag_msr_1h_hdz isee_fluxgate_mag_rik_1sec_hdz isee_fluxgate_mag_rik_1min_hdz isee_fluxgate_mag_rik_1h_hdz isee_fluxgate_mag_kag_1sec_hdz isee_fluxgate_mag_kag_1min_hdz isee_fluxgate_mag_kag_1h_hdz isee_fluxgate_mag_ktb_1sec_hdz isee_fluxgate_mag_ktb_1min_hdz isee_fluxgate_mag_ktb_1h_hdz isee_fluxgate_mag_mdm_1min_hdz isee_fluxgate_mag_mdm_1h_hdz isee_fluxgate_mag_tew_1min_hdz isee_fluxgate_mag_tew_1h_hdz'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_fluxgate, /no_server

  IF ~data_exists(cmp_TName, qa_timespan[qa_t,0], qa_timespan[qa_t,1]) THEN $
    message,'invalid data load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
