
;1 basic
; iug_load_aws_rish
;
;2 single site
;
; iug_load_aws_rish,site = 'bik'
;
;3 multi sites string
;
; iug_load_aws_rish,site = 'bik mnd'
;
;4 multi sites array
;
; iug_load_aws_rish,site = ['bik', 'mnd', 'pon']
;
;5 caps site
;
; iug_load_aws_rish,site='BIK'
;
;6 load all sites
;
; iug_load_aws_rish,site='all'
;
;7 load * sites
;
; iug_load_aws_rish,site='*'
;
;8 verbose
;
; iug_load_wpr_rish,site='bik',/verbose
;
;9 /downloadonly
;
; iug_load_wpr_rish,site='bik',/downloadonly
;
;
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2013-03-04 (04 Mar 2013) $
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
; *** set time span ***
qa_timespan = strarr(2,2)

qa_timespan[0,*] = ['2009-01-19', '2009-01-20']

qa_timespan[1,*] = ['2009-03-01', '2009-03-02']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/hour

del_data,'*'

;1 Basic Test
; iug_load_aws_rish

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_aws_rish

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_aws_bik rish_aws_mnd rish_aws_pon rish_aws_sgk'

  if ~data_exists('iug_aws_bik_* iug_aws_mnd_* iug_aws_pon_* '+$
                  'iug_aws_sgk_* ', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_aws_rish,site='bik'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_aws_rish,site='bik'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_aws_bik'

  if ~data_exists('iug_aws_bik_* ', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi sites string
;
; iug_load_aws_rish,site = 'bik mnd'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

   iug_load_aws_rish,site='bik mnd'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_aws_bik rish_aws_mnd'

  if ~data_exists('iug_aws_bik_* iug_aws_mnd_* ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi sites array
;
; iug_load_aws_rish,site = ['bik', 'mnd', 'pon']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_aws_rish,site = ['bik', 'mnd', 'pon']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_aws_bik rish_aws_mnd rish_aws_pon'

  if ~data_exists('iug_aws_bik_* iug_aws_mnd_* iug_aws_pon_* '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'
  
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps site
;
; iug_load_aws_rish,site = 'BIK'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_aws_rish,site = 'BIK'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_aws_bik'

  if ~data_exists('iug_aws_bik_* ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all sites
;
; iug_load_aws_rish,site = 'all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_aws_rish,site = 'all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_aws_bik rish_aws_mnd rish_aws_mnd rish_aws_pon rish_aws_sgk'

  if ~data_exists('iug_aws_bik_* iug_aws_mnd_* iug_aws_pon_* '+$
                  'iug_aws_sgk_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * sites
;
; iug_load_aws_rish, site='*'
;

t_name='* sites'

catch,err

if err eq 0 then begin

  iug_load_aws_rish, site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_aws_bik rish_aws_mnd rish_aws_mnd rish_aws_pon rish_aws_sgk'

  if ~data_exists('iug_aws_bik_* iug_aws_mnd_* iug_aws_pon_* '+$
                  'iug_aws_sgk_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'
  
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 verbose
;
;iug_load_aws_rish,site='bik',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_aws_rish,site='bik',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;9 /downloadonly
;
;  iug_load_aws_rish,site='bik',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_aws_rish,site='bik',/downloadonly
endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end