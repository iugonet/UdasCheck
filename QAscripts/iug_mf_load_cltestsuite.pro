
;1 basic
; iug_load_mf_rish
;
;2 single site
;
; iug_load_mf_rish,site = 'pam'
; 
;3 multi sites
;
; iug_load_mf_rish,site = 'pam pon'
; 
;4 multi sites array
;
; iug_load_mf_rish,site = ['pam','pon']
;
;5 caps site
;
; iug_load_mf_rish,site='PAM'
;
;6 load all sites
;
; iug_load_mf_rish,site='all'
;
;7 load * sites
;
; iug_load_mf_rish,site='*'
;
;8 verbose
;
; iug_load_mf_rish,site='pam',/verbose
;
;9 /downloadonly
;
; iug_load_mf_rish,site='pam',/downloadonly
;
;
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2011-11-08 (08 Nov 2011) $
; $LastChangedRevision: 2014-01-11 (11 Jan 2014) $
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

qa_timespan[0,*] = [ '2010-02-12', '2010-02-13']

qa_timespan[1,*] = [ '2005-07-29', '2005-07-30']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/day

del_data,'*'

;1 Basic Test
; iug_load_mf_rish

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_mf_rish

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_mf'

  if ~data_exists('iug_mf_pam_uwnd iug_mf_pam_vwnd iug_mf_pam_wwnd '+$
                  'iug_mf_pon_uwnd iug_mf_pon_vwnd iug_mf_pon_wwnd', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_mf_rish,site='pam'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_mf_rish,site='pam'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_mf'

  if ~data_exists('iug_mf_pam_uwnd iug_mf_pam_vwnd iug_mf_pam_wwnd',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;3 multi sites
;
; iug_load_mf_rish,site = 'pam pon'

t_name='multi sites'

catch,err

if err eq 0 then begin

  iug_load_mf_rish,site = 'pam pon'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_mf'

  if ~data_exists('iug_mf_pam_uwnd iug_mf_pam_vwnd iug_mf_pam_wwnd '+$
                  'iug_mf_pon_uwnd iug_mf_pon_vwnd iug_mf_pon_wwnd'$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;4 multi sites array
;
; iug_load_mf_rish,site=['pam','pon']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_mf_rish,site=['pam','pon']
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_mf'

  if ~data_exists('iug_mf_pam_uwnd iug_mf_pam_vwnd iug_mf_pam_wwnd '+$
                  'iug_mf_pon_uwnd iug_mf_pon_vwnd iug_mf_pon_wwnd'$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps site
;
; iug_load_mf_rish,site='PAM'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_mf_rish,site='PAM'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_mf'

  if ~data_exists('iug_mf_pam_uwnd iug_mf_pam_vwnd iug_mf_pam_wwnd',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all sites
;
; iug_load_mf_rish,site = 'all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_mf_rish,site = 'all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_mf'

  if ~data_exists('iug_mf_pam_uwnd iug_mf_pam_vwnd iug_mf_pam_wwnd '+$
                  'iug_mf_pon_uwnd iug_mf_pon_vwnd iug_mf_pon_wwnd'$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * sites
;
; iug_load_mf_rish, site='*'
;

t_name='* sites'

catch,err

if err eq 0 then begin

  iug_load_mf_rish, site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_mf'

  if ~data_exists('iug_mf_pam_uwnd iug_mf_pam_vwnd iug_mf_pam_wwnd '+$
                  'iug_mf_pon_uwnd iug_mf_pon_vwnd iug_mf_pon_wwnd'$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 verbose
;
;iug_load_mf_rish,site='pam',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_mf_rish,site='pam',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;9 /downloadonly
;
;  iug_load_mf_rish,site='pam',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_mf_rish,site='pam',/downloadonly

  if data_exists('iug_mf_pam_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
