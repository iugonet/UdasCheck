;
;1 basic
;
; iug_load_sdfit 
;
;2 single site
;
; iug_load_sdfit, sites='hok'
;
;3 multi sites string
;
; iug_load_sdfit, sites='hok ksr'
;
;4 multi sites array
;
; iug_load_sdfit, sites=['hok', 'ksr', 'sye', 'sys']
;
;5 caps site
;
; iug_load_sdfit, sites=['HOK']
;
;6 load all sites
;
; iug_load_sdfit, sites='all'
;
;7 load * sites
;
; iug_load_sdfit, sites='*'
;
;8 get_support_data: Turn this on to load the supporting data
;
; iug_load_sdfit, sites='hok', /get_support_data
;
;9 noacknowledgment
;
; iug_load_sdfit, sites='hok', /get_support_data, /noacknowledgment
;
;10 /downloadonly
;
; iug_load_sdfit, site='hok', /get_support_data, /downloadonly
;
;11 /no_download
;
; iug_load_sdfit, site='hok', /get_support_data, /no_download
;
;12 /no_server
;
; iug_load_gmag_stel_induction, /no_server
;
; $LastChangedBy: segawa $
; $LastChangedDate: 2011-10-14 09:44:01 +0900 (Fri, 14 Oct 2011) $
; $LastChangedRevision: 214 $
; $URL: http://gemsissc.stelab.nagoya-u.ac.jp/svn/ergsc_cdf/trunk/qatests/radar/erg_sdfit_load_cltestsuite.pro $
;-

init_tests

;prepare to run tests
t_num = 0
t_dateA = '2007-06-21'
t_date0 = '2007-06-21/00:00:00'
t_date1 = '2007-06-22/00:00:00'

thm_init

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'
timespan, t_dateA, 1 ,/hour

del_data,'*'

;1 Basic Test
; iug_load_sdfit

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_sdfit
;	print, '%%%'
;	tplot_names
;	print, '%%%'

;just spot checking cause there are a lot of data types

  if data_exists('sd_hok_azim_no_1', $
	t_date0, t_date1) then message,'invalid data load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;2 single site
; iug_load_sdfit, sites='hok'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_sdfit, sites='hok'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'sd_hok_azim_no_1 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_hok_spec_width_1 sd_hok_spec_width_err_1 sd_hok_vlos_1 sd_hok_vlos_err_1 sd_hok_echo_flag_1 sd_hok_quality_1 sd_hok_quality_flag_1 sd_hok_vnorth_1 sd_hok_veast_1 sd_hok_vlos_iscat_1 sd_hok_vlos_gscat_1 sd_hok_vnorth_iscat_1 sd_hok_vnorth_gscat_1 sd_hok_veast_iscat_1 sd_hok_veast_gscat_1'

  if ~data_exists('sd_hok_azim_no_1 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_hok_spec_width_1 sd_hok_spec_width_err_1 sd_hok_vlos_1 sd_hok_vlos_err_1 sd_hok_echo_flag_1 sd_hok_quality_1 sd_hok_quality_flag_1 sd_hok_vnorth_1 sd_hok_veast_1 sd_hok_vlos_iscat_1 sd_hok_vlos_gscat_1 sd_hok_vnorth_iscat_1 sd_hok_vnorth_gscat_1 sd_hok_veast_iscat_1 sd_hok_veast_gscat_1', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;3 multi sites string
;
; iug_load_sdfit, sites='hok ksr'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

  iug_load_sdfit, sites='hok ksr'
	print, '%%%'
	tplot_names
	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'sd_hok_pwr_1 sd_ksr_pwr_0 sd_ksr_pwr_err_0 sd_ksr_spec_width_0 sd_ksr_spec_width_err_0 sd_ksr_vlos_0 sd_ksr_vlos_err_0 sd_ksr_echo_flag_0 sd_ksr_quality_0 sd_ksr_quality_flag_0 sd_ksr_vnorth_0 sd_ksr_veast_0 sd_ksr_vlos_iscat_0 sd_ksr_vlos_gscat_0'

  if ~data_exists('sd_hok_pwr_1 sd_ksr_pwr_0 sd_ksr_pwr_err_0 sd_ksr_spec_width_0 sd_ksr_spec_width_err_0 sd_ksr_vlos_0 sd_ksr_vlos_err_0 sd_ksr_echo_flag_0 sd_ksr_quality_0 sd_ksr_quality_flag_0 sd_ksr_vnorth_0 sd_ksr_veast_0 sd_ksr_vlos_iscat_0 sd_ksr_vlos_gscat_0', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;4 multi sites array
;
; iug_load_sdfit, sites=['hok', 'ksr', 'sye', 'sys']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_sdfit, sites=['ksr', 'hok', 'sye', 'sys']
	print, '%%%'
	tplot_names
	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info, $
    'sd_ksr_pwr_0 sd_ksr_pwr_err_0 sd_ksr_spec_width_0 sd_ksr_spec_width_err_0 sd_ksr_vlos_0 sd_ksr_vlos_err_0 sd_ksr_echo_flag_0 sd_ksr_quality_0 sd_ksr_quality_flag_0 sd_ksr_vnorth_0 sd_ksr_veast_0 sd_ksr_vlos_iscat_0 sd_ksr_vlos_gscat_0 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_sye_pwr_0 sd_sye_spec_width_0 sd_sys_pwr_0 sd_sys_spec_width_err_0'

  if ~data_exists('sd_ksr_pwr_0 sd_ksr_pwr_err_0 sd_ksr_spec_width_0 sd_ksr_spec_width_err_0 sd_ksr_vlos_0 sd_ksr_vlos_err_0 sd_ksr_echo_flag_0 sd_ksr_quality_0 sd_ksr_quality_flag_0 sd_ksr_vnorth_0 sd_ksr_veast_0 sd_ksr_vlos_iscat_0 sd_ksr_vlos_gscat_0 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_sye_pwr_0 sd_sye_spec_width_0 sd_sys_pwr_0 sd_sys_spec_width_err_0', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;5 caps site
;
; iug_load_sdfit, sites=['HOK']
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_sdfit, sites=['HOK']

;just spot checking cause there are a lot of data types
  print_tvar_info, 'sd_hok_azim_no_1 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_hok_spec_width_1 sd_hok_spec_width_err_1 sd_hok_vlos_1 sd_hok_vlos_err_1 sd_hok_echo_flag_1 sd_hok_quality_1 sd_hok_quality_flag_1 sd_hok_vnorth_1 sd_hok_veast_1 sd_hok_vlos_iscat_1 sd_hok_vlos_gscat_1 sd_hok_vnorth_iscat_1 sd_hok_vnorth_gscat_1 sd_hok_veast_iscat_1 sd_hok_veast_gscat_1'

  if ~data_exists('sd_hok_azim_no_1 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_hok_spec_width_1 sd_hok_spec_width_err_1 sd_hok_vlos_1 sd_hok_vlos_err_1 sd_hok_echo_flag_1 sd_hok_quality_1 sd_hok_quality_flag_1 sd_hok_vnorth_1 sd_hok_veast_1 sd_hok_vlos_iscat_1 sd_hok_vlos_gscat_1 sd_hok_vnorth_iscat_1 sd_hok_vnorth_gscat_1 sd_hok_veast_iscat_1 sd_hok_veast_gscat_1', $
	 t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;6 load all sites
;
; iug_load_sdfit, sites='all'
;
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_sdfit, sites='all'

;just spot checking cause there are a lot of data types
  print_tvar_info, $
    'sd_ksr_pwr_0 sd_ksr_pwr_err_0 sd_ksr_spec_width_0 sd_ksr_spec_width_err_0 sd_ksr_vlos_0 sd_ksr_vlos_err_0 sd_ksr_echo_flag_0 sd_ksr_quality_0 sd_ksr_quality_flag_0 sd_ksr_vnorth_0 sd_ksr_veast_0 sd_ksr_vlos_iscat_0 sd_ksr_vlos_gscat_0 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_sye_pwr_0 sd_sye_spec_width_0 sd_sys_pwr_0 sd_sys_spec_width_err_0'

  if ~data_exists('sd_ksr_pwr_0 sd_ksr_pwr_err_0 sd_ksr_spec_width_0 sd_ksr_spec_width_err_0 sd_ksr_vlos_0 sd_ksr_vlos_err_0 sd_ksr_echo_flag_0 sd_ksr_quality_0 sd_ksr_quality_flag_0 sd_ksr_vnorth_0 sd_ksr_veast_0 sd_ksr_vlos_iscat_0 sd_ksr_vlos_gscat_0 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_sye_pwr_0 sd_sye_spec_width_0 sd_sys_pwr_0 sd_sys_spec_width_err_0', $
	 t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;7 load * sites
;
; iug_load_sdfit, sites='*'
;

t_name='*'

catch,err

if err eq 0 then begin

  iug_load_sdfit, sites='*'

;just spot checking cause there are a lot of data types
  print_tvar_info, $
    'sd_ksr_pwr_0 sd_ksr_pwr_err_0 sd_ksr_spec_width_0 sd_ksr_spec_width_err_0 sd_ksr_vlos_0 sd_ksr_vlos_err_0 sd_ksr_echo_flag_0 sd_ksr_quality_0 sd_ksr_quality_flag_0 sd_ksr_vnorth_0 sd_ksr_veast_0 sd_ksr_vlos_iscat_0 sd_ksr_vlos_gscat_0 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_sye_pwr_0 sd_sye_spec_width_0 sd_sys_pwr_0 sd_sys_spec_width_err_0'

  if ~data_exists('sd_ksr_pwr_0 sd_ksr_pwr_err_0 sd_ksr_spec_width_0 sd_ksr_spec_width_err_0 sd_ksr_vlos_0 sd_ksr_vlos_err_0 sd_ksr_echo_flag_0 sd_ksr_quality_0 sd_ksr_quality_flag_0 sd_ksr_vnorth_0 sd_ksr_veast_0 sd_ksr_vlos_iscat_0 sd_ksr_vlos_gscat_0 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_sye_pwr_0 sd_sye_spec_width_0 sd_sys_pwr_0 sd_sys_spec_width_err_0', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;8 get_support_data
;
; iug_load_sdfit, sites='hok', /get_support_data
;

t_name='get_support_data'

catch,err

if err eq 0 then begin

 iug_load_sdfit, sites='hok', /get_support_data
	print, '%%%'
	tplot_names
	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info, 'sd_hok_azim_no_1 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_hok_spec_width_1 sd_hok_spec_width_err_1 sd_hok_vlos_1 sd_hok_vlos_err_1 sd_hok_echo_flag_1 sd_hok_quality_1 sd_hok_quality_flag_1 sd_hok_vnorth_1 sd_hok_veast_1 sd_hok_vlos_iscat_1 sd_hok_vlos_gscat_1 sd_hok_vnorth_iscat_1 sd_hok_vnorth_gscat_1 sd_hok_veast_iscat_1 sd_hok_veast_gscat_1 sd_hok_position_tbl_1 sd_hok_positioncnt_tbl_1'

  if ~data_exists('sd_hok_azim_no_1 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_hok_spec_width_1 sd_hok_spec_width_err_1 sd_hok_vlos_1 sd_hok_vlos_err_1 sd_hok_echo_flag_1 sd_hok_quality_1 sd_hok_quality_flag_1 sd_hok_vnorth_1 sd_hok_veast_1 sd_hok_vlos_iscat_1 sd_hok_vlos_gscat_1 sd_hok_vnorth_iscat_1 sd_hok_vnorth_gscat_1 sd_hok_veast_iscat_1 sd_hok_veast_gscat_1', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;9 noacknowledgment
;
; iug_load_sdfit, sites='hok', /get_support_data, /noacknowledgment
;

t_name='noacknowledgement'

catch,err

if err eq 0 then begin

  iug_load_sdfit, sites='hok', /get_support_data, /noacknowledgment

;just spot checking cause there are a lot of data types
  print_tvar_info, 'sd_hok_azim_no_1 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_hok_spec_width_1 sd_hok_spec_width_err_1 sd_hok_vlos_1 sd_hok_vlos_err_1 sd_hok_echo_flag_1 sd_hok_quality_1 sd_hok_quality_flag_1 sd_hok_vnorth_1 sd_hok_veast_1 sd_hok_vlos_iscat_1 sd_hok_vlos_gscat_1 sd_hok_vnorth_iscat_1 sd_hok_vnorth_gscat_1 sd_hok_veast_iscat_1 sd_hok_veast_gscat_1 sd_hok_position_tbl_1 sd_hok_positioncnt_tbl_1'

  if ~data_exists('sd_hok_azim_no_1 sd_hok_pwr_1 sd_hok_pwr_err_1 sd_hok_spec_width_1 sd_hok_spec_width_err_1 sd_hok_vlos_1 sd_hok_vlos_err_1 sd_hok_echo_flag_1 sd_hok_quality_1 sd_hok_quality_flag_1 sd_hok_vnorth_1 sd_hok_veast_1 sd_hok_vlos_iscat_1 sd_hok_vlos_gscat_1 sd_hok_vnorth_iscat_1 sd_hok_vnorth_gscat_1 sd_hok_veast_iscat_1 sd_hok_veast_gscat_1', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;10 /downloadonly
;
; iug_load_sdfit, site='hok', /get_support_data, /downloadonly
;

t_name = '/downloadonly'

catch,err

if err eq 0 then begin

  iug_load_sdfit, site='hok', /get_support_data, /downloadonly

  if data_exists('sd_hok_azim_no_1', $
	t_date0, t_date1) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;11 /no_download
;
; iug_load_sdfit, site='hok', /get_support_data, /no_download
;

t_name = 'no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin

  iug_load_sdfit, site='hok', /get_support_data, /no_download

  if data_exists('sd_hok_azim_no_1', $
	t_date0, t_date1) then message, 'Unexpected data in temporary directory'+ root_data_dir()

endif

catch,/cancel

handle_error,err,t_name,++t_num

setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

end_tests

end
