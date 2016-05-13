
;1 basic
; iug_load_wpr_rish
;
;2 single site
;
; iug_load_wpr_rish,site = 'bik'
;
;3 multi sites string
;
; iug_load_wpr_rish,site = 'bik mnd'
;
;4 multi sites array
;
; iug_load_wpr_rish,site = ['bik', 'mnd', 'pon']
;
;5 caps site
;
; iug_load_wpr_rish,site='BIK'
;
;6 load all sites
;
; iug_load_wpr_rish,site='all'
;
;7 load * sites
;
; iug_load_wpr_rish,site='*'
;
;8 single parameter
;
; iug_load_wpr_rish,parameter='uwnd'
;
;9 multi parameters string
;
; iug_load_wpr_rish,site = 'uwnd vwnd'
;
;10 multi parameters array
;
; iug_load_wpr_rish,site = ['uwnd', 'pwr1', 'wdt1']
;
;11 caps parameter
;
; iug_load_wpr_rish,parameter='UWND'
;
;12 * parameter
;
; iug_load_wpr_rish,parameter='*'
;
;13 array parameter
;
; iug_load_wpr_rish,parameter=['uwnd']
; 
;14 all parameter
;
; iug_load_wpr_rish,parameter='all'
; 
;15 verbose
;
; iug_load_wpr_rish,site='bik',/verbose
;
;16 /downloadonly
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
;	*** set time span ***
qa_timespan = strarr(2,2)

qa_timespan[0,*] = ['2009-01-19', '2009-01-20']

qa_timespan[1,*] = ['2009-03-01', '2009-03-02']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/hour

del_data,'*'

;1 Basic Test
; iug_load_wpr_rish

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_wpr_rish

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik rish_wpr_mnd rish_wpr_pon rish_wpr_sgk'

  if ~data_exists('iug_wpr_bik_* iug_wpr_mnd_* iug_wpr_pon_* '+$
                  'iug_wpr_sgk_* ', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_wpr_rish,site='bik'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_wpr_rish,site='bik'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik'

  if ~data_exists('iug_wpr_bik_uwnd iug_wpr_bik_vwnd iug_wpr_bik_wwnd '+$
                  'iug_wpr_bik_pwr1 iug_wpr_bik_pwr2 iug_wpr_bik_pwr3 '+$
                  'iug_wpr_bik_pwr4 iug_wpr_bik_pwr5 iug_wpr_bik_wdt1 '+$
                  'iug_wpr_bik_wdt2 iug_wpr_bik_wdt3 iug_wpr_bik_wdt4 '+$
                  'iug_wpr_bik_wdt5 ', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi sites string
;
; iug_load_wpr_rish,site = 'bik mnd'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

   iug_load_wpr_rish,site='bik mnd'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik rish_wpr_mnd'

  if ~data_exists('iug_wpr_bik_* iug_wpr_mnd_* ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi sites array
;
; iug_load_wpr_rish,site = ['bik', 'mnd', 'pon']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_wpr_rish,site = ['bik', 'mnd', 'pon']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik rish_wpr_mnd rish_wpr_pon'

  if ~data_exists('iug_wpr_bik_* iug_wpr_mnd_* iug_wpr_pon_* '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'
  
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps site
;
; iug_load_wpr_rish,site = 'BIK'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_wpr_rish,site = 'BIK'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik'

  if ~data_exists('iug_wpr_bik_uwnd iug_wpr_bik_vwnd iug_wpr_bik_wwnd '+$
                  'iug_wpr_bik_pwr1 iug_wpr_bik_pwr2 iug_wpr_bik_pwr3 '+$
                  'iug_wpr_bik_pwr4 iug_wpr_bik_pwr5 iug_wpr_bik_wdt1 '+$
                  'iug_wpr_bik_wdt2 iug_wpr_bik_wdt3 iug_wpr_bik_wdt4 '+$
                  'iug_wpr_bik_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all sites
;
; iug_load_wpr_rish,site = 'all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_wpr_rish,site = 'all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik rish_wpr_mnd rish_wpr_mnd rish_wpr_pon rish_wpr_sgk'

  if ~data_exists('iug_wpr_bik_* iug_wpr_mnd_* iug_wpr_pon_* '+$
                  'iug_wpr_sgk_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * sites
;
; iug_load_wpr_rish, site='*'
;

t_name='* sites'

catch,err

if err eq 0 then begin

  iug_load_wpr_rish, site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik rish_wpr_mnd rish_wpr_mnd rish_wpr_pon rish_wpr_sgk'

  if ~data_exists('iug_wpr_bik_* iug_wpr_mnd_* iug_wpr_pon_* '+$
                  'iug_wpr_sgk_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'
  
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 single parameter
;
; iug_load_wpr_rish,parameter = 'uwnd'
;

t_name='single parameter'

catch,err

if err eq 0 then begin

  iug_load_wpr_rish,parameter = 'uwnd'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik'

  if ~data_exists('iug_wpr_bik_uwnd ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;9 multi parameters string
;
; iug_load_wpr_rish,parameter = 'uwnd vwnd'
;

t_name='multi parameters string'

catch,err

if err eq 0 then begin

  iug_load_wpr_rish,parameter = 'uwnd vwnd'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik'

  if ~data_exists('iug_wpr_bik_uwnd iug_wpr_bik_vwnd ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;10 multi parameters array
;
; iug_load_wpr_rish,parameter = ['uwnd', 'pwr1', 'wdt1']
;

t_name='multi parameters array'

catch,err

if err eq 0 then begin

  iug_load_wpr_rish,parameter = ['uwnd', 'pwr1', 'wdt1']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik'

  if ~data_exists('iug_wpr_bik_uwnd iug_wpr_bik_pwr1 iug_wpr_bik_wdt1 '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;11 caps parameter
;
; iug_load_wpr_rish,parameter='UWND'
;

t_name='caps parameter'

catch,err

if err eq 0 then begin

  iug_load_wpr_rish,parameter='UWND'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik'

  if ~data_exists('iug_wpr_bik_uwnd ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;12 * parameter
;
; iug_load_wpr_rish,parameter='UWND'
;

t_name='* parameter'

catch,err

if err eq 0 then begin

   iug_load_wpr_rish, parameter= '*'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik

  if ~data_exists('iug_wpr_bik_uwnd iug_wpr_bik_vwnd iug_wpr_bik_wwnd '+$
                  'iug_wpr_bik_pwr1 iug_wpr_bik_pwr2 iug_wpr_bik_pwr3 '+$
                  'iug_wpr_bik_pwr4 iug_wpr_bik_pwr5 iug_wpr_bik_wdt1 '+$
                  'iug_wpr_bik_wdt2 iug_wpr_bik_wdt3 iug_wpr_bik_wdt4 '+$
                  'iug_wpr_bik_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;13 array parameter
;
; iug_load_wpr_rish,parameter=['uwnd', 'vwnd', 'wwnd']
;

t_name='array parameter'

catch,err

if err eq 0 then begin

   iug_load_wpr_rish,parameter=['uwnd', 'vwnd', 'wwnd']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik'
  
  if ~data_exists('iug_wpr_bik_uwnd iug_wpr_bik_vwnd iug_wpr_bik_wwnd '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;14 all parameter
;
; iug_load_wpr_rish,parameter= 'all'
;

t_name='all parameter'

catch,err

if err eq 0 then begin

   iug_load_wpr_rish,parameter= 'all'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_wpr_bik

  if ~data_exists('iug_wpr_bik_uwnd iug_wpr_bik_vwnd iug_wpr_bik_wwnd '+$
                  'iug_wpr_bik_pwr1 iug_wpr_bik_pwr2 iug_wpr_bik_pwr3 '+$
                  'iug_wpr_bik_pwr4 iug_wpr_bik_pwr5 iug_wpr_bik_wdt1 '+$
                  'iug_wpr_bik_wdt2 iug_wpr_bik_wdt3 iug_wpr_bik_wdt4 '+$
                  'iug_wpr_bik_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;15 verbose
;
;iug_load_wpr_rish,site='bik',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_wpr_rish,site='bik',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;16 /downloadonly
;
;  iug_load_wpr_rish,site='bik',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_wpr_rish,site='bik',/downloadonly
endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end