
;1 basic
; iug_load_gmag_icswse_iaga
;
;2 single site
;
; iug_load_gmag_icswse_iaga,site='asb'
;
;3 multi sites string
;
; iug_load_gmag_icswse_iaga,site='asb onw kuj'
;
;4 multi sites array
;
; iug_load_gmag_icswse_iaga,site=['asb', 'onw', 'kuj']
;
;5 caps site
;
; iug_load_gmag_icswse_iaga,site='ASB'
;
;6 load all sites
;
; iug_load_gmag_icswse_iaga,site='all'
;
;7 load * sites
;
; iug_load_gmag_icswse_iaga,site='*'
;
;8 single datatype
;
; iug_load_gmag_icswse_iaga,resolution='1sec'
;
;9 caps datatype
;
; iug_load_gmag_icswse_iaga,resolution='1SEC'
;
;10 * datatype
;
; iug_load_gmag_icswse_iaga,resolution='*'
;
;11 array datatype
;
; iug_load_gmag_icswse_iaga,resolution=['1sec']
;
;12 verbose
;
; iug_load_gmag_icswse_iaga,site='asb',/verbose
;
;13 /downloadonly
;
; iug_load_gmag_icswse_iaga,site='asb',/downloadonly
;
;14 /no_download
; iug_load_gmag_icswse_iaga, /no_download
;
;
; Written by S. Abe, Feb 02, 2018.
;-

init_tests

;prepare to run tests
t_num = 0

thm_init
;;thm_init, LOCAL_DATA_DIR='/pub/data/',REMOTE_DATA_DIR="http://gemsis01.stelab.nagoya-u.ac.jp/data/themis/"

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'
timespan,'2013-01-01'

del_data,'*'

;1 Basic Test
; iug_load_gmag_icswse_iaga

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_gmag_icswse_iaga

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyumag_mag_asb_1sec_hdzf'

  if ~data_exists('kyumag_mag_asb_1sec_hdzf','2013-01-01','2013-01-02') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_gmag_icswse_iaga,site='asb'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_gmag_icswse_iaga,site='asb'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyumag_mag_asb_1sec_hdzf'

  if ~data_exists('kyumag_mag_asb_1sec_hdzf','2013-01-01','2013-01-02') $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi sites string
;
; iug_load_gmag_icswse_iaga,site='asb onw kuj'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

  iug_load_gmag_icswse_iaga,site='asb onw kuj'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf'

  if ~data_exists('kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf', $
	'2013-01-01','2013-01-02') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi sites array
;
; iug_load_gmag_icswse_iaga,site=['asb', 'onw', 'kuj']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_gmag_icswse_iaga,site=['asb', 'onw', 'kuj']
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf'

  if ~data_exists('kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf', $
	'2013-01-01','2013-01-02') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps site
;
; iug_load_gmag_icswse_iaga,site='ASB'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_gmag_icswse_iaga,site=['ASB']

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyumag_mag_asb_1sec_hdzf'

  if ~data_exists('kyumag_mag_asb_1sec_hdzf','2013-01-01','2013-01-02') $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all sites
;
; iug_load_gmag_icswse_iaga,site='all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_gmag_icswse_iaga,site='all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf'

  if ~data_exists('kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf', $
	'2013-01-01','2013-01-02') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * sites
;
; iug_load_gmag_icswse_iaga,site='*'
;

t_name='*'

catch,err

if err eq 0 then begin

  iug_load_gmag_icswse_iaga,site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf'

  if ~data_exists('kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf', $
	'2013-01-01','2013-01-02') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 single datatype
;
; iug_load_gmag_icswse_iaga,resolution='1sec'
;

t_name='single datatype'

catch,err

if err eq 0 then begin

  iug_load_gmag_icswse_iaga,resolution='1sec'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf'

  if ~data_exists('kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf', $
	'2013-01-01','2013-01-02') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;9 caps datatype
;
; iug_load_gmag_icswse_iaga,resolution='1SEC'
;

t_name='caps datatype'

catch,err

if err eq 0 then begin

  iug_load_gmag_icswse_iaga,resolution='1SEC'
	print, tnames('*')

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf'

  if ~data_exists('kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf', $
	'2013-01-01','2013-01-02') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;10 * datatype
;
; iug_load_gmag_icswse_iaga,resolution='*'
;

t_name='* datatype'

catch,err

if err eq 0 then begin

  iug_load_gmag_icswse_iaga,resolution = '*'
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf'

  if ~data_exists('kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf', $
	'2013-01-01','2013-01-02') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;11 array datatype
;
; iug_load_gmag_icswse_iaga,resolution=['1sec']
;

t_name='array datatype'

catch,err

if err eq 0 then begin

  iug_load_gmag_icswse_iaga,resolution=['1sec']

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf'

  if ~data_exists('kyumag_mag_asb_1sec_hdzf kyumag_mag_onw_1sec_hdzf kyumag_mag_kuj_1sec_hdzf', $
	'2013-01-01','2013-01-02') then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;12 verbose
;
;iug_load_gmag_icswse_iaga,site='asb',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_gmag_icswse_iaga,site='asb',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;13 /downloadonly
;
;  iug_load_gmag_icswse_iaga,site='asb',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_gmag_icswse_iaga,site='asb',/downloadonly

  if data_exists('kyumag_mag_asb_1sec_hdzf','2013-01-01','2013-01-02') $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;14 /no_download
;
;iug_load_gmag_icswse_iaga, /no_download
;

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
  iug_load_gmag_icswse_iaga, /no_download

  if data_exists('kyumag_mag_asb_1sec_hdzf','2013-01-01','2013-01-02') $
	then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

end_tests

end
