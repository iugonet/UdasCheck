
;1 basic
;
; iug_load_gps_ro_rish
;
;2 single site
;
; iug_load_gps_ro_rish, site = 'champ'
;
;3 multi sites string
;
; iug_load_gps_ro_rish, site = 'champ cosmic'
;
;4 multi sites array
;
; iug_load_gps_ro_rish, site = ['champ','cosmic']
;
;5 caps site
;
; iug_load_gps_ro_rish, site = 'CHAMP'
;
;6 load all sites
;
; iug_load_gps_ro_rish, site = 'all'
;
;7 load * sites
;
; iug_load_gps_ro_rish, site = '*'
;
;8 verbose
;
; iug_load_gps_ro_rish, site = 'champ',/verbose
;
;9 /downloadonly
;
; iug_load_gps_ro_rish, site = 'champ',/downloadonly
;
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2016-05-14 (14 May 2016) $
; $LastChangedRevision: 2016-05-14 (14 May 2016) $
; $URL: $
;-

init_tests

;prepare to run tests
t_num = 0

thm_init
;;thm_init, LOCAL_DATA_DIR='/pub/data/',REMOTE_DATA_DIR="http://gemsis01.stelab.nagoya-u.ac.jp/data/themis/"

;set to somewhere appropriate, if needed
;!themis.local_data_dir = '/disks/themisdata/'
;timespan,'2008-02-22',1,/hour
; *** set time span ***
qa_timespan = strarr(2,2)

qa_timespan[0,*] = [ '2006-05-01', '2006-05-02']

qa_timespan[1,*] = [ '2006-11-01', '2006-11-02']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/day

del_data,'*'

;1 Basic Test
; iug_load_gps_ro_rish

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_gps_ro_rish

  ;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_gps_ro'

  if ~data_exists('gps_ro_champ_fsi_* gps_ro_cosmic_fsi_*',$
    qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;2 single site
; iug_load_gps_ro_rish, site = 'champ'

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_gps_ro_rish, site = 'champ'

  ;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_gps_ro'

  if ~data_exists('gps_ro_champ_fsi_*',$
    qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi sites string
; iug_load_gps_ro_rish, site = 'champ cosmic'

t_name='multi sites string'

catch,err

if err eq 0 then begin

  iug_load_gps_ro_rish, site = 'champ cosmic'

  ;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_gps_ro'

  if ~data_exists('gps_ro_champ_fsi_* gps_ro_cosmic_fsi_*',$
    qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi sites array
; iug_load_gps_ro_rish, site = ['champ','cosmic']

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_gps_ro_rish, site = ['champ','cosmic']

  ;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_gps_ro'

  if ~data_exists('gps_ro_champ_fsi_* gps_ro_cosmic_fsi_*',$
    qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps site
; iug_load_gps_ro_rish, site = 'CHAMP'

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_gps_ro_rish, site = 'CHAMP'

  ;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_gps_ro'

  if ~data_exists('gps_ro_champ_fsi_*',$
    qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all sites
; iug_load_gps_ro_rish, site = 'all'

t_name='load all sites'

catch,err

if err eq 0 then begin

  iug_load_gps_ro_rish, site = 'all'

  ;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_gps_ro'

  if ~data_exists('gps_ro_champ_fsi_* gps_ro_cosmic_fsi_*',$
    qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * sites
; iug_load_gps_ro_rish, site = '*'

t_name='load * sites'

catch,err

if err eq 0 then begin

  iug_load_gps_ro_rish, site = '*'

  ;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_gps_ro'

  if ~data_exists('gps_ro_champ_fsi_* gps_ro_cosmic_fsi_*',$
    qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 verbose
;
;iug_load_gps_ro_rish, /verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

  iug_load_gps_ro_rish, /verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 /downloadonly
;
;  iug_load_gps_ro_rish, /downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_gps_ro_rish, /downloadonly

  if data_exists('gps_ro_*_fsi_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
