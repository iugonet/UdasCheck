
;1 basic
; iug_load_blr_rish
;
;2 single site
;
; iug_load_blr_rish,site = 'ktb'
;
;3 multi sites string
;
; iug_load_blr_rish,site = 'ktb sgk'
;
;4 multi sites array
;
; iug_load_blr_rish,site = ['ktb', 'sgk', 'srp']
;
;5 caps site
;
; iug_load_blr_rish,site='KTB'
;
;6 load all sites
;
; iug_load_blr_rish,site='all'
;
;7 load * sites
;
; iug_load_blr_rish,site='*'
;
;8 single parameter
;
; iug_load_blr_rish,parameter='uwnd'
;
;9 multi parameters string
;
; iug_load_blr_rish,site = 'uwnd vwnd'
;
;10 multi parameters array
;
; iug_load_blr_rish,site = ['uwnd', 'pwr1', 'wdt1']
;
;11 caps parameter
;
; iug_load_blr_rish,parameter='UWND'
;
;12 * parameter
;
; iug_load_blr_rish,parameter='*'
;
;13 array parameter
;
; iug_load_blr_rish,parameter=['uwnd']
; 
;14 all parameter
;
; iug_load_blr_rish,parameter='all'
; 
;15 verbose
;
; iug_load_blr_rish,site='ktb',/verbose
;
;16 /downloadonly
;
; iug_load_blr_rish,site='ktb',/downloadonly
;
;
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2011-10-22 (22 Oct 2011) $
; $LastChangedRevision: 2017-11-29 (29 Nov 2017) $
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

qa_timespan[0,*] = [ '2006-03-01', '2006-03-02']

qa_timespan[1,*] = [ '2011-07-29', '2011-07-30']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1

del_data,'*'

;1 Basic Test
; iug_load_blr_rish

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_blr_rish

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd iug_blr_ktb_vwnd iug_blr_ktb_wwnd '+$
                  'iug_blr_ktb_pwr1 iug_blr_ktb_pwr2 iug_blr_ktb_pwr3 '+$
                  'iug_blr_ktb_pwr4 iug_blr_ktb_pwr5 iug_blr_ktb_wdt1 '+$
                  'iug_blr_ktb_wdt2 iug_blr_ktb_wdt3 iug_blr_ktb_wdt4 '+$
                  'iug_blr_ktb_wdt5', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_blr_rish,site = 'ktb'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_blr_rish,site='ktb'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd iug_blr_ktb_vwnd iug_blr_ktb_wwnd '+$
                  'iug_blr_ktb_pwr1 iug_blr_ktb_pwr2 iug_blr_ktb_pwr3 '+$
                  'iug_blr_ktb_pwr4 iug_blr_ktb_pwr5 iug_blr_ktb_wdt1 '+$
                  'iug_blr_ktb_wdt2 iug_blr_ktb_wdt3 iug_blr_ktb_wdt4 '+$
                  'iug_blr_ktb_wdt5',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi sites string
;
; iug_load_blr_rish,site = 'ktb sgk'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

   iug_load_blr_rish,site='ktb sgk'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd iug_blr_ktb_vwnd iug_blr_ktb_wwnd '+$
                  'iug_blr_ktb_pwr1 iug_blr_ktb_pwr2 iug_blr_ktb_pwr3 '+$
                  'iug_blr_ktb_pwr4 iug_blr_ktb_pwr5 iug_blr_ktb_wdt1 '+$
                  'iug_blr_ktb_wdt2 iug_blr_ktb_wdt3 iug_blr_ktb_wdt4 '+$
                  'iug_blr_ktb_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi sites array
;
; iug_load_blr_rish,site = ['ktb', 'sgk', 'srp']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_blr_rish,site=['ktb', 'sgk', 'srp']
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd iug_blr_ktb_vwnd iug_blr_ktb_wwnd '+$
                  'iug_blr_ktb_pwr1 iug_blr_ktb_pwr2 iug_blr_ktb_pwr3 '+$
                  'iug_blr_ktb_pwr4 iug_blr_ktb_pwr5 iug_blr_ktb_wdt1 '+$
                  'iug_blr_ktb_wdt2 iug_blr_ktb_wdt3 iug_blr_ktb_wdt4 '+$
                  'iug_blr_ktb_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'
  
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps site
;
; iug_load_blr_rish,site = 'KTB'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_blr_rish,site='KTB'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd iug_blr_ktb_vwnd iug_blr_ktb_wwnd '+$
                  'iug_blr_ktb_pwr1 iug_blr_ktb_pwr2 iug_blr_ktb_pwr3 '+$
                  'iug_blr_ktb_pwr4 iug_blr_ktb_pwr5 iug_blr_ktb_wdt1 '+$
                  'iug_blr_ktb_wdt2 iug_blr_ktb_wdt3 iug_blr_ktb_wdt4 '+$
                  'iug_blr_ktb_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all sites
;
; iug_load_blr_rish,site = 'all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_blr_rish,site = 'all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd iug_blr_ktb_vwnd iug_blr_ktb_wwnd '+$
                  'iug_blr_ktb_pwr1 iug_blr_ktb_pwr2 iug_blr_ktb_pwr3 '+$
                  'iug_blr_ktb_pwr4 iug_blr_ktb_pwr5 iug_blr_ktb_wdt1 '+$
                  'iug_blr_ktb_wdt2 iug_blr_ktb_wdt3 iug_blr_ktb_wdt4 '+$
                  'iug_blr_ktb_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * sites
;
; iug_load_blr_rish, site='*'
;

t_name='* sites'

catch,err

if err eq 0 then begin

  iug_load_blr_rish, site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd iug_blr_ktb_vwnd iug_blr_ktb_wwnd '+$
                  'iug_blr_ktb_pwr1 iug_blr_ktb_pwr2 iug_blr_ktb_pwr3 '+$
                  'iug_blr_ktb_pwr4 iug_blr_ktb_pwr5 iug_blr_ktb_wdt1 '+$
                  'iug_blr_ktb_wdt2 iug_blr_ktb_wdt3 iug_blr_ktb_wdt4 '+$
                  'iug_blr_ktb_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 single parameter
;
; iug_load_blr_rish,parameter = 'uwnd'
;

t_name='single parameter'

catch,err

if err eq 0 then begin

  iug_load_blr_rish,parameter = 'uwnd'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;9 multi parameters string
;
; iug_load_blr_rish,parameter = 'uwnd vwnd'
;

t_name='multi parameters string'

catch,err

if err eq 0 then begin

  iug_load_blr_rish,parameter = 'uwnd vwnd'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd iug_blr_ktb_vwnd',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;10 multi parameters array
;
; iug_load_blr_rish,parameter = ['uwnd', 'pwr1', 'wdt1']
;

t_name='multi parameters array'

catch,err

if err eq 0 then begin

  iug_load_blr_rish,parameter = ['uwnd', 'pwr1', 'wdt1']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd iug_blr_ktb_pwr1 iug_blr_ktb_wdt1'$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;11 caps parameter
;
; iug_load_blr_rish,parameter='UWND'
;

t_name='caps parameter'

catch,err

if err eq 0 then begin

  iug_load_blr_rish,parameter='UWND'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



;
;12 * parameter
;
; iug_load_blr_rish,parameter='UWND'
;

t_name='* parameter'

catch,err

if err eq 0 then begin

   iug_load_blr_rish, parameter= '*'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd iug_blr_ktb_vwnd iug_blr_ktb_wwnd '+$
                  'iug_blr_ktb_pwr1 iug_blr_ktb_pwr2 iug_blr_ktb_pwr3 '+$
                  'iug_blr_ktb_pwr4 iug_blr_ktb_pwr5 iug_blr_ktb_wdt1 '+$
                  'iug_blr_ktb_wdt2 iug_blr_ktb_wdt3 iug_blr_ktb_wdt4 '+$
                  'iug_blr_ktb_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;13 array parameter
;
; iug_load_blr_rish,parameter=['uwnd', 'vwnd', 'wwnd']
;

t_name='array parameter'

catch,err

if err eq 0 then begin

   iug_load_blr_rish, parameter = 'all'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'
  
  if ~data_exists('iug_blr_ktb_uwnd iug_blr_ktb_vwnd iug_blr_ktb_wwnd'$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;14 all parameter
;
; iug_load_blr_rish,parameter= 'all'
;

t_name='all parameter'

catch,err

if err eq 0 then begin

   iug_load_blr_rish,parameter= 'all'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_blr_*'

  if ~data_exists('iug_blr_ktb_uwnd iug_blr_ktb_vwnd iug_blr_ktb_wwnd '+$
                  'iug_blr_ktb_pwr1 iug_blr_ktb_pwr2 iug_blr_ktb_pwr3 '+$
                  'iug_blr_ktb_pwr4 iug_blr_ktb_pwr5 iug_blr_ktb_wdt1 '+$
                  'iug_blr_ktb_wdt2 iug_blr_ktb_wdt3 iug_blr_ktb_wdt4 '+$
                  'iug_blr_ktb_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;15 verbose
;
;iug_load_blr_rish,site='ktb',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_blr_rish,site='ktb',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;16 /downloadonly
;
;  iug_load_blr_rish,site='ktb',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_blr_rish,site='ktb',/downloadonly

  if data_exists('iug_blr_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
