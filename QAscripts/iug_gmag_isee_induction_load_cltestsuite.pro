;
;1 basic
; iug_load_gmag_isee_induction
;
;2 single site
;
; iug_load_gmag_isee_induction,site='ath'
;
;3 multi sites string
;
; iug_load_gmag_isee_induction,site='ath msr'
;
;4 multi sites array
;
; iug_load_gmag_isee_induction,site=['ath', 'mgd', 'msr', 'ptk', 'sta']
;
;5 caps site
;
; iug_load_gmag_isee_induction,site='MSR'
;
;6 load all sites
;
; iug_load_gmag_isee_induction,site='all'
;
;7 load * sites
;
; iug_load_gmag_isee_induction,site='*'
;
;8 frequency_dependent
;
; iug_load_gmag_isee_induction, frequency_dependent=fqd, site='msr'
;
;9 get time pulse
;
; iug_load_gmag_isee_induction, /time_pulse, site='msr'
;
;10 /downloadonly
;
; iug_load_gmag_isee_induction, site='msr', /downloadonly
;
;11 /no_download
;
; iug_load_gmag_isee_induction, /no_download
;
;12 /no_server
;
; iug_load_gmag_isee_induction, /no_server
;
; $LastChangedBy: segawa $
; $LastChangedDate: 2011-10-11 17:31:49 +0900 (Tue, 11 Oct 2011) $
; $LastChangedRevision: 213 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/geomag/erg_gmag_stel_induction_load_cltestsuite.pro $
;-

init_tests

;prepare to run tests
t_num = 0
t_dateA = '2008-11-04'
t_date0 = '2008-11-04/00:00:00'
t_date1 = '2008-11-04/01:00:00'

thm_init
;thm_init, LOCAL_DATA_DIR='/pub/data/', $
;	REMOTE_DATA_DIR="http://gemsis01.stelab.nagoya-u.ac.jp/data/themis/"

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'
;timespan,'2008-02-28',1,/hour
timespan, t_dateA, 1 ,/hour

del_data,'*'

;1 Basic Test
; iug_load_gmag_isee_induction

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_induction

;just spot checking cause there are a lot of data types
  print_tvar_info, 'isee_induction_db_dt_ath isee_induction_db_dt_mgd isee_induction_db_dt_ptk isee_induction_db_dt_msr isee_induction_db_dt_sta'

;;  if ~data_exists('isee_induction_db_dt_sta','2008-02-28/00:00:00','2008-02-28/01:00:00') $
  if ~data_exists('isee_induction_db_dt_ath isee_induction_db_dt_mgd isee_induction_db_dt_ptk isee_induction_db_dt_msr isee_induction_db_dt_sta', t_date0, t_date1) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;2 single site
;
; iug_load_gmag_isee_induction,site='ath'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_induction,site='ath'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'isee_induction_db_dt_ath'

  if ~data_exists('isee_induction_db_dt_ath', t_date0, t_date1) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;3 multi sites string
;
; iug_load_gmag_isee_induction,site='ath msr'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_induction,site='ath msr'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'isee_induction_db_dt_ath isee_induction_db_dt_msr'

  if ~data_exists('isee_induction_db_dt_ath isee_induction_db_dt_msr', $
	 t_date0, t_date1) then message,'invalid load'
;;	'2008-02-28/00:00:00','2008-02-28/01:00:00') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;4 multi sites array
;
; iug_load_gmag_isee_induction,site=['ath', 'mgd', 'msr', 'ptk', 'sta']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_induction,site=['ath', 'mgd', 'msr', 'ptk', 'sta']

;just spot checking cause there are a lot of data types
  print_tvar_info, 'isee_induction_db_dt_ath isee_induction_db_dt_mgd isee_induction_db_dt_msr isee_induction_db_dt_ptk isee_induction_db_dt_sta'

  if ~data_exists('isee_induction_db_dt_ath isee_induction_db_dt_mgd isee_induction_db_dt_msr isee_induction_db_dt_ptk isee_induction_db_dt_sta', $
	 t_date0, t_date1) then message,'invalid load'
;;	'2008-02-28/00:00:00','2008-02-28/01:00:00') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;5 caps site
;
; iug_load_gmag_isee_induction,site=['MSR']
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_induction,site=['MSR']

;just spot checking cause there are a lot of data types
  print_tvar_info, 'isee_induction_db_dt_msr'

  if ~data_exists('isee_induction_db_dt_msr', $
	 t_date0, t_date1) then message,'invalid load'
;;	'2008-02-28/00:00:00','2008-02-28/01:00:00') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;6 load all sites
;
; iug_load_gmag_isee_induction,site='all'
;
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_induction,site='all'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'isee_induction_db_dt_ath isee_induction_db_dt_mgd isee_induction_db_dt_msr isee_induction_db_dt_ptk isee_induction_db_dt_sta'

  if ~data_exists('isee_induction_db_dt_ath isee_induction_db_dt_mgd isee_induction_db_dt_msr isee_induction_db_dt_ptk isee_induction_db_dt_sta', $
	 t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;7 load * sites
;
; iug_load_gmag_isee_induction,site='*'
;

t_name='*'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_induction,site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'isee_induction_db_dt_ath isee_induction_db_dt_mgd isee_induction_db_dt_msr isee_induction_db_dt_ptk isee_induction_db_dt_sta'

  if ~data_exists('isee_induction_db_dt_ath isee_induction_db_dt_mgd isee_induction_db_dt_msr isee_induction_db_dt_ptk isee_induction_db_dt_sta', $
	t_date0, t_date1) then message,'invalid load'
;;	'2008-02-22','2008-02-23') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;8 frequency_dependent
;
; iug_load_gmag_isee_induction, frequency_dependent=fqd, site='msr'
;

t_name='frequency_dependent'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_induction, frequency_dependent=fqd, site='msr'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'isee_induction_db_dt_msr'

  if ~data_exists('isee_induction_db_dt_msr', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;9 get time pulse
;
; iug_load_gmag_isee_induction, /time_pulse, site='msr'
;

t_name='time pulse'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_induction, /time_pulse, site='msr'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'isee_induction_db_dt_msr isee_induction_time_pulse_msr'

  if ~data_exists('isee_induction_db_dt_msr isee_induction_time_pulse_msr', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;10 /downloadonly
;
; iug_load_gmag_isee_induction, site='msr', /downloadonly
;

t_name = '/downloadonly'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_induction, site='msr', /downloadonly

  if data_exists('isee_induction_db_dt_msr', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;11 /no_download
;
; iug_load_gmag_isee_induction, /no_download

t_name = 'no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_induction, /no_download

  if data_exists('isee_induction_db_dt_msr', t_date0, t_date1) then $
    message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel

handle_error,err,t_name,++t_num

setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'


;12 /no_server
;
; iug_load_gmag_isee_induction, /no_server

t_name = 'no_server'

catch,err

if err eq 0 then begin

  iug_load_gmag_isee_induction, /no_server

  if ~data_exists('isee_induction_db_dt_msr', $
	t_date0, t_date1) then message,'invalid data load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
