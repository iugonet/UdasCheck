;
;1 basic
; iug_load_gmag_nipr_induction
;
;2 single site
;
; iug_load_gmag_nipr_induction,site='syo'
;
;3 multi sites string
;
; iug_load_gmag_nipr_induction,site='syo hus'
;
;4 multi sites array
;
; iug_load_gmag_nipr_induction,site=['syo','hus','tjo','aed','isa']
;
;5 caps site
;
; iug_load_gmag_nipr_induction,site='SYO'
;
;6 load all sites
;
; iug_load_gmag_nipr_induction,site='all'
;
;7 load * sites
;
; iug_load_gmag_nipr_induction,site='*'
;
;8 frequency_dependent
;
; iug_load_gmag_nipr_induction, frequency_dependent=fqd, site='syo'
;
;9 /downloadonly
;
; iug_load_gmag_nipr_induction, site='syo', /downloadonly
;
;10 /no_download
;
; iug_load_gmag_nipr_induction, /no_download
;
;11 /no_server
;
; iug_load_gmag_nipr_induction, /no_server
;
; $LastChangedBy: segawa $
; $LastChangedDate: 2011-07-19 17:00:22 +0900 (Tue, 19 Jul 2011) $
; $LastChangedRevision: 196 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/geomag/erg_gmag_stel_induction_load_cltestsuite.pro $
;-

init_tests

;prepare to run tests
t_num = 0
t_date0 = '2006-04-17/00:00:00'
t_date1 = '2006-04-18/00:00:00'

thm_init
;thm_init, LOCAL_DATA_DIR='/pub/data/', $
;	REMOTE_DATA_DIR="http://gemsis01.stelab.nagoya-u.ac.jp/data/themis/"

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'
;timespan,'2008-02-28',1,/hour
timespan, t_date0, 1 ,/day

del_data,'*'

;1 Basic Test
; iug_load_gmag_nipr_induction

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_gmag_nipr_induction

;just spot checking cause there are a lot of data types
  print_tvar_info, 'nipr_imag_syo_20hz nipr_imag_hus_02hz nipr_imag_tjo_02hz nipr_imag_aed_02hz'

  if ~data_exists('nipr_imag_syo_20hz nipr_imag_hus_02hz nipr_imag_tjo_02hz nipr_imag_aed_02hz', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;2 single site
;
; iug_load_gmag_nipr_induction,site='syo'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_gmag_nipr_induction,site='syo'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'nipr_imag_syo_20hz'

  if ~data_exists('nipr_imag_syo_20hz', t_date0, t_date1) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;3 multi sites string
;
; iug_load_gmag_nipr_induction,site='syo hus'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

  iug_load_gmag_nipr_induction,site='syo hus'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'nipr_imag_syo_20hz nipr_imag_hus_02hz'

  if ~data_exists('nipr_imag_syo_20hz nipr_imag_hus_02hz', t_date0, t_date1) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;4 multi sites array
;
; iug_load_gmag_nipr_induction,site=['syo','hus','tjo','aed','isa']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_gmag_nipr_induction,site=['syo','hus','tjo','aed']

;just spot checking cause there are a lot of data types
  print_tvar_info, 'nipr_imag_syo_20hz nipr_imag_hus_02hz nipr_imag_tjo_02hz nipr_imag_aed_02hz'

  if ~data_exists('nipr_imag_syo_20hz nipr_imag_hus_02hz nipr_imag_tjo_02hz nipr_imag_aed_02hz', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;5 caps site
;
; iug_load_gmag_nipr_induction,site=['SYO']
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_gmag_nipr_induction,site=['SYO']

;just spot checking cause there are a lot of data types
  print_tvar_info, 'nipr_imag_syo_20hz'

  if ~data_exists('nipr_imag_syo_20hz', t_date0, t_date1) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;6 load all sites
;
; iug_load_gmag_nipr_induction,site='all'
;
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_gmag_nipr_induction,site='all'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'nipr_imag_syo_20hz nipr_imag_hus_02hz nipr_imag_tjo_02hz nipr_imag_aed_02hz'

  if ~data_exists('nipr_imag_syo_20hz nipr_imag_hus_02hz nipr_imag_tjo_02hz nipr_imag_aed_02hz', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;7 load * sites
;
; iug_load_gmag_nipr_induction,site='*'
;

t_name='*'

catch,err

if err eq 0 then begin

  iug_load_gmag_nipr_induction,site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'nipr_imag_syo_20hz nipr_imag_hus_02hz nipr_imag_tjo_02hz nipr_imag_aed_02hz'

  if ~data_exists('nipr_imag_syo_20hz nipr_imag_hus_02hz nipr_imag_tjo_02hz nipr_imag_aed_02hz', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;8 frequency_dependent
;
; iug_load_gmag_nipr_induction, frequency_dependent=fqd, site='syo'
;

t_name='frequency_dependent'

catch,err

if err eq 0 then begin

  iug_load_gmag_nipr_induction, frequency_dependent=fqd, site='syo'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'nipr_imag_syo_20hz'

  if ~data_exists('nipr_imag_syo_20hz', t_date0, t_date1) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;9 /downloadonly
;
; iug_load_gmag_nipr_induction, site='syo', /downloadonly
;

t_name = '/downloadonly'

catch,err

if err eq 0 then begin

  iug_load_gmag_nipr_induction, site='syo', /downloadonly

  if data_exists('nipr_imag_syo_20hz', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;10 /no_download
;
; iug_load_gmag_nipr_induction, /no_download

t_name = 'no_download'

catch,err

if err eq 0 then begin

  iug_load_gmag_nipr_induction, /no_download

  if ~data_exists('nipr_imag_syo_20hz', $
	t_date0, t_date1) then message,'invalid data load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;11 /no_server
;
; iug_load_gmag_nipr_induction, /no_server

t_name = 'no_server'

catch,err

if err eq 0 then begin

  iug_load_gmag_nipr_induction, /no_server

  if ~data_exists('nipr_imag_syo_20hz', $
	t_date0, t_date1) then message,'invalid data load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


end_tests

end
