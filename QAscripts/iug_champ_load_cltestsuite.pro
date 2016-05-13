
;1 basic
;
; iug_load_champ_rish
;
;2 verbose
;
; iug_load_champ_rish, ,/verbose
;
;3 /downloadonly
;
; iug_load_champ_rish, ,/downloadonly
;
;
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2016-05-13 (13 May 2016) $
; $LastChangedRevision: 2016-05-13 (13 May 2016) $
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
;	*** set time span ***
qa_timespan = strarr(2,2)

qa_timespan[0,*] = [ '2001-05-18', '2001-05-25']

qa_timespan[1,*] = [ '2004-01-01', '2004-01-08']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/day

del_data,'*'

;1 Basic Test
; iug_load_mf_rish

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_champ_rish

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_champ'

  if ~data_exists('gps_ro_champ_fsi_event gps_ro_champ_fsi_gpsid gps_ro_champ_fsi_leoid gps_ro_champ_fsi_lat gps_ro_champ_fsi_lon '+$
                  'gps_ro_champ_fsi_ref gps_ro_champ_fsi_pres gps_ro_champ_fsi_temp gps_ro_champ_fsi_tan_lat gps_ro_champ_fsi_tan_lon',$
                   qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 verbose
;
;iug_load_champ_rish,/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_champ_rish, /verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 /downloadonly
;
;  iug_load_champ_rish, /downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_champ_rish, /downloadonly

  if data_exists('gps_ro_champ_fsi_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
