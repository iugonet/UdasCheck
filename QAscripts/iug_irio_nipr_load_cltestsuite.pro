
;1 basic
; iug_load_irio_nipr
;
;2 single site
;
; iug_load_irio_nipr,site='syo'
;
;3 multi sites string
;
; iug_load_irio_nipr,site='syo hus'
;
;4 multi sites array
;
; iug_load_irio_nipr,site=['syo', 'hus', 'tjo']
;
;5 caps site
;
; iug_load_irio_nipr,site='SYO'
;
;6 load all sites
;
; iug_load_irio_nipr,site='all'
;
;7 load * sites
;
; iug_load_irio_nipr,site='*'
;
;8 single datatype
;
; iug_load_irio_nipr,datatype='30'
;
;9 multi datatype string
;
; iug_load_irio_nipr,datatype='30 38'
;
;10 multi datatype array
;
; iug_load_irio_nipr,datatype=['30', '38']
;
;11 load all datatypes
;
; iug_load_irio_nipr,datatype='all'
;
;12 * datatype
;
; iug_load_irio_nipr,datatype='*'
;
;13 verbose
;
; iug_load_irio_nipr,site='syo',/verbose
;
;14 /downloadonly
;
; iug_load_irio_nipr,site='syo',/downloadonly
;
;15 /no_download
; iug_load_irio_nipr, /no_download
;
;16 /keogram
; iug_load_irio_nipr, site='syo', /keogram
;
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
qa_timespan[0,*] = ['2003-02-09', '2003-02-10']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0]

del_data,'*'

;1 Basic Test
; iug_load_irio_nipr

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc',$
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_irio_nipr,site='syo'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr,site='syo'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi sites string
;
; iug_load_irio_nipr,site='syo hus'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr,site='syo hus tjo'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc', $
	qa_timespan[qa_t,0],qa_timespan[qa_t,1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi sites array
;
; iug_load_irio_nipr,site=['syo', 'hus', 'tjo']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr,site=['syo', 'hus', 'tjo']
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc', $
	qa_timespan[qa_t,0],qa_timespan[qa_t,1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps site
;
; iug_load_irio_nipr,site='SYO'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr,site=['SYO']

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all sites
;
; iug_load_irio_nipr,site='all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr,site='all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * sites
;
; iug_load_irio_nipr,site='*'
;

t_name='*'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr,site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 single datatype
;
; iug_load_irio_nipr,datatype='30'
;

t_name='single datatype'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr,datatype='30'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;9 multi datatype string
;
; iug_load_irio_nipr,datatype='30 38'
;

t_name='multi datatype string'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr,datatype='30 38'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc', $
        qa_timespan[qa_t,0],qa_timespan[qa_t,1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;10 multi datatype array
;
; iug_load_irio_nipr,datatype=['30', '38']
;

t_name='multi datatype array'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr,datatype=['30', '38']
;;      print, '%%%'
;;      tplot_names
;;      print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc', $
        qa_timespan[qa_t,0],qa_timespan[qa_t,1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;11 load all datatypes
;
; iug_load_irio_nipr,datatype='all'
;

t_name='all datatypes'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr,datatype='all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc', $
                qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;12 * datatype
;
; iug_load_irio_nipr,datatype='*'
;

t_name='* datatype'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr,datatype = '*'
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc', $
        qa_timespan[qa_t,0],qa_timespan[qa_t,1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;13 verbose
;
;iug_load_irio_nipr,site='syo',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_irio_nipr,site='syo',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;14 /downloadonly
;
;  iug_load_irio_nipr,site='syo',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_irio_nipr,site='syo',/downloadonly

  if data_exists('nipr_irio30_syo_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;15 /no_download
;
;iug_load_irio_nipr, /no_download
;

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
  iug_load_irio_nipr, /no_download

  if data_exists('nipr_irio30_syo_*', $
		qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
	then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

;
;16 /keogram
;
; iug_load_irio_nipr, site='syo', /keogram
;

t_name='/keogram'

catch,err

if err eq 0 then begin

  iug_load_irio_nipr, site='syo', /keogram
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'nipr_irio30_syo_cna nipr_irio30_syo_qdc ' +$
    'nipr_irio30_syo_cna_N0E0-7 nipr_irio30_syo_cna_N1E0-7 nipr_irio30_syo_cna_N2E0-7 ' +$
    'nipr_irio30_syo_cna_N3E0-7 nipr_irio30_syo_cna_N4E0-7 nipr_irio30_syo_cna_N5E0-7 ' +$
    'nipr_irio30_syo_cna_N6E0-7 nipr_irio30_syo_cna_N7E0-7 nipr_irio30_syo_cna_N0-7E0 ' +$
    'nipr_irio30_syo_cna_N0-7E1 nipr_irio30_syo_cna_N0-7E2 nipr_irio30_syo_cna_N0-7E3 ' +$
    'nipr_irio30_syo_cna_N0-7E4 nipr_irio30_syo_cna_N0-7E5 nipr_irio30_syo_cna_N0-7E6 ' +$
    'nipr_irio30_syo_cna_N0-7E7'

  if ~data_exists('nipr_irio30_syo_cna nipr_irio30_syo_qdc ' +$
    'nipr_irio30_syo_cna_N0E0-7 nipr_irio30_syo_cna_N1E0-7 nipr_irio30_syo_cna_N2E0-7 ' +$
    'nipr_irio30_syo_cna_N3E0-7 nipr_irio30_syo_cna_N4E0-7 nipr_irio30_syo_cna_N5E0-7 ' +$
    'nipr_irio30_syo_cna_N6E0-7 nipr_irio30_syo_cna_N7E0-7 nipr_irio30_syo_cna_N0-7E0 ' +$
    'nipr_irio30_syo_cna_N0-7E1 nipr_irio30_syo_cna_N0-7E2 nipr_irio30_syo_cna_N0-7E3 ' +$
    'nipr_irio30_syo_cna_N0-7E4 nipr_irio30_syo_cna_N0-7E5 nipr_irio30_syo_cna_N0-7E6 ' +$
    'nipr_irio30_syo_cna_N0-7E7', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
