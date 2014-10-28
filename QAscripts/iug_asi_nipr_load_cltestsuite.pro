
;1 basic
; iug_load_asi_nipr
;
;2 single site
;
; iug_load_asi_nipr,site='syo'
;
;3 multi sites string
;
; iug_load_asi_nipr,site='hus tjo'
;
;4 multi sites array
;
; iug_load_asi_nipr,site=['hus', 'tjo']
;
;5 caps site
;
; iug_load_asi_nipr,site='HUS'
;
;6 load all sites
;
; iug_load_asi_nipr,site='all'
;
;7 load * sites
;
; iug_load_asi_nipr,site='*'
;
;8 single wavelength
;
; iug_load_asi_nipr,site='hus',wavelength='0000'
;
;9 * wavelength
;
; iug_load_asi_nipr,site='hus',wavelength='*'
;
;10 array wavelength
;
; iug_load_asi_nipr,site='hus',wavelength=['0000','4278']
;
;11 verbose
;
; iug_load_asi_nipr,site='hus',/verbose
;
;12 /downloadonly
;
; iug_load_asi_nipr,site='hus',/downloadonly
;
;13 /no_download
; iug_load_asi_nipr, /no_download
;
; Written by Y.-M. Tanaka, October 27, 2014.
;-

init_tests

;prepare to run tests
t_num = 0

thm_init
;;thm_init, LOCAL_DATA_DIR='/pub/data/',REMOTE_DATA_DIR="http://gemsis01.stelab.nagoya-u.ac.jp/data/themis/"

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'
;	*** set time span ***
qa_timespan = strarr(1,2)
; 0. syo, hus, tjo
qa_timespan[0,*] = [ '2012-01-10/00', '2012-01-10/01']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t, *]

del_data,'*'

;1 Basic Test
; iug_load_asi_nipr

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_asi_nipr

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_asi_hus_0000 nipr_asi_tjo_0000'

  if ~data_exists('nipr_asi_hus_0000 nipr_asi_tjo_0000',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_asi_nipr,site='hus'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_asi_nipr,site='hus'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_asi_hus_0000'

  if ~data_exists('nipr_asi_hus_0000',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi sites string
;
; iug_load_asi_nipr,site='hus tjo'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

  iug_load_asi_nipr,site='hus tjo'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_asi_hus_0000 nipr_asi_tjo_0000'

  if ~data_exists('nipr_asi_hus_0000 nipr_asi_tjo_0000',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi sites array
;
; iug_load_asi_nipr,site=['hus', 'tjo']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_asi_nipr,site=['hus', 'tjo']
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_asi_hus_0000 nipr_asi_tjo_0000'

  if ~data_exists('nipr_asi_hus_0000 nipr_asi_tjo_0000',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps site
;
; iug_load_asi_nipr,site='HUS'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_asi_nipr,site=['HUS']

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_asi_hus_0000'

  if ~data_exists('nipr_asi_hus_0000',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all sites
;
; iug_load_asi_nipr,site='all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_asi_nipr,site='all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_asi_hus_0000 nipr_asi_tjo_0000'

  if ~data_exists('nipr_asi_hus_0000 nipr_asi_tjo_0000',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * sites
;
; iug_load_asi_nipr,site='*'
;

t_name='*'

catch,err

if err eq 0 then begin

  iug_load_asi_nipr,site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_asi_hus_0000 nipr_asi_tjo_0000'

  if ~data_exists('nipr_asi_hus_0000 nipr_asi_tjo_0000',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 single wavelength
;
; iug_load_asi_nipr,site='hus',wavelength='0000'
;

t_name='single wavelength'

catch,err

if err eq 0 then begin

  iug_load_asi_nipr,site='hus',wavelength='0000'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_asi_hus_0000'

  if ~data_exists('nipr_asi_hus_0000',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;9 * wavelength
;
; iug_load_asi_nipr,site='hus',avelength='*'
;

t_name='* wavelength'

catch,err

if err eq 0 then begin

  iug_load_asi_nipr,site='hus',wavelength = '*'
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_asi_hus_0000'

  if ~data_exists('nipr_asi_hus_0000',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;10 array wavelength
;
; iug_load_asi_nipr,site='hus',wavelength=['0000','4278']
;

t_name='array wavelength'

catch,err

if err eq 0 then begin

  iug_load_asi_nipr,site='hus',wavelength=['0000','4278']

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_asi_hus_0000'

  if ~data_exists('nipr_asi_hus_0000',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;11 verbose
;
;iug_load_asi_nipr,site='hus',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_asi_nipr,site='hus',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;12 /downloadonly
;
;  iug_load_asi_nipr,site='hus',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_asi_nipr,site='hus',/downloadonly

  if data_exists('nipr_asi_hus_0000',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;13 /no_download
;
;iug_load_asi_nipr, /no_download
;

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
  iug_load_asi_nipr, /no_download

  if data_exists('nipr_asi_hus_0000',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
	then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'


end_tests

end
