
;1 basic
; iug_load_ltr_rish
;
;2 single site
;
; iug_load_ltr_rish,site = 'sgk'
;
;3 site array
;
; iug_load_ltr_rish,site = ['sgk']
;
;4 caps site
;
; iug_load_ltr_rish,site='SGK'
;
;5 load all sites
;
; iug_load_ltr_rish,site='all'
;
;6 load * sites
;
; iug_load_ltr_rish,site='*'
;
;7 single parameter
;
; iug_load_ltr_rish,parameter='uwnd'
;
;8 multi parameters string
;
; iug_load_ltr_rish,site = 'uwnd vwnd'
;
;9 multi parameters array
;
; iug_load_ltr_rish,site = ['uwnd', 'pwr1', 'wdt1']
;
;10 caps parameter
;
; iug_load_ltr_rish,parameter='UWND'
;
;11 * parameter
;
; iug_load_ltr_rish,parameter='*'
;
;12 array parameter
;
; iug_load_ltr_rish,parameter=['uwnd']
; 
;13 all parameter
;
; iug_load_ltr_rish,parameter='all'
; 
;14 verbose
;
; iug_load_ltr_rish,site='sgk',/verbose
;
;15 /downloadonly
;
; iug_load_ltr_rish,site='sgk',/downloadonly
;
;
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2011-10-22 (22 Oct 2011) $
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

qa_timespan[0,*] = [ '2004-03-30', '2004-03-31']

qa_timespan[1,*] = [ '2005-07-29', '2005-07-30']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/hour

del_data,'*'

;1 Basic Test
; iug_load_ltr_rish

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_ltr_rish

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ltr_sgk'

  if ~data_exists('iug_ltr_sgk_uwnd iug_ltr_sgk_vwnd iug_ltr_sgk_wwnd '+$
                  'iug_ltr_sgk_pwr1 iug_ltr_sgk_pwr2 iug_ltr_sgk_pwr3 '+$
                  'iug_ltr_sgk_pwr4 iug_ltr_sgk_pwr5 iug_ltr_sgk_wdt1 '+$
                  'iug_ltr_sgk_wdt2 iug_ltr_sgk_wdt3 iug_ltr_sgk_wdt4 '+$
                  'iug_ltr_sgk_wdt5', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_ltr_rish,site = 'ktb'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_ltr_rish,site='sgk'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ltr_sgk'

  if ~data_exists('iug_ltr_sgk_uwnd iug_ltr_sgk_vwnd iug_ltr_sgk_wwnd '+$
                  'iug_ltr_sgk_pwr1 iug_ltr_sgk_pwr2 iug_ltr_sgk_pwr3 '+$
                  'iug_ltr_sgk_pwr4 iug_ltr_sgk_pwr5 iug_ltr_sgk_wdt1 '+$
                  'iug_ltr_sgk_wdt2 iug_ltr_sgk_wdt3 iug_ltr_sgk_wdt4 '+$
                  'iug_ltr_sgk_wdt5', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 site array
;
; iug_load_ltr_rish,site = ['sgk']
;

t_name='site array'

catch,err

if err eq 0 then begin

  iug_load_ltr_rish,site=['sgk']
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ltr_sgk'

  if ~data_exists('iug_ltr_sgk_uwnd iug_ltr_sgk_vwnd iug_ltr_sgk_wwnd '+$
                  'iug_ltr_sgk_pwr1 iug_ltr_sgk_pwr2 iug_ltr_sgk_pwr3 '+$
                  'iug_ltr_sgk_pwr4 iug_ltr_sgk_pwr5 iug_ltr_sgk_wdt1 '+$
                  'iug_ltr_sgk_wdt2 iug_ltr_sgk_wdt3 iug_ltr_sgk_wdt4 '+$
                  'iug_ltr_sgk_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'
  
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 caps site
;
; iug_load_ltr_rish,site='SGK'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_ltr_rish,site='SGK'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ltr_sgk'

  if ~data_exists('iug_ltr_sgk_uwnd iug_ltr_sgk_vwnd iug_ltr_sgk_wwnd '+$
                  'iug_ltr_sgk_pwr1 iug_ltr_sgk_pwr2 iug_ltr_sgk_pwr3 '+$
                  'iug_ltr_sgk_pwr4 iug_ltr_sgk_pwr5 iug_ltr_sgk_wdt1 '+$
                  'iug_ltr_sgk_wdt2 iug_ltr_sgk_wdt3 iug_ltr_sgk_wdt4 '+$
                  'iug_ltr_sgk_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 load all sites
;
; iug_load_ltr_rish,site = 'all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_ltr_rish,site = 'all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ltr_sgk'

  if ~data_exists('iug_ltr_sgk_uwnd iug_ltr_sgk_vwnd iug_ltr_sgk_wwnd '+$
                  'iug_ltr_sgk_pwr1 iug_ltr_sgk_pwr2 iug_ltr_sgk_pwr3 '+$
                  'iug_ltr_sgk_pwr4 iug_ltr_sgk_pwr5 iug_ltr_sgk_wdt1 '+$
                  'iug_ltr_sgk_wdt2 iug_ltr_sgk_wdt3 iug_ltr_sgk_wdt4 '+$
                  'iug_ltr_sgk_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load * sites
;
; iug_load_ltr_rish, site='*'
;

t_name='* sites'

catch,err

if err eq 0 then begin

  iug_load_ltr_rish, site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ltr_sgk'

  if ~data_exists('iug_ltr_sgk_uwnd iug_ltr_sgk_vwnd iug_ltr_sgk_wwnd '+$
                  'iug_ltr_sgk_pwr1 iug_ltr_sgk_pwr2 iug_ltr_sgk_pwr3 '+$
                  'iug_ltr_sgk_pwr4 iug_ltr_sgk_pwr5 iug_ltr_sgk_wdt1 '+$
                  'iug_ltr_sgk_wdt2 iug_ltr_sgk_wdt3 iug_ltr_sgk_wdt4 '+$
                  'iug_ltr_sgk_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 single parameter
;
; iug_load_ltr_rish,parameter = 'uwnd'
;

t_name='single parameter'

catch,err

if err eq 0 then begin

  iug_load_ltr_rish,parameter = 'uwnd'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ltr_sgk'

  if ~data_exists('iug_ltr_sgk_uwnd',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;8 multi parameters string
;
; iug_load_ltr_rish,parameter = 'uwnd vwnd'
;

t_name='multi parameters string'

catch,err

if err eq 0 then begin

  iug_load_ltr_rish,parameter = 'uwnd vwnd'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ltr_sgk'

  if ~data_exists('iug_ltr_sgk_uwnd iug_ltr_sgk_vwnd',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;9 multi parameters array
;
; iug_load_ltr_rish,parameter = ['uwnd', 'pwr1', 'wdt1']
;

t_name='multi parameters array'

catch,err

if err eq 0 then begin

  iug_load_ltr_rish,parameter = ['uwnd', 'pwr1', 'wdt1']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ltr_sgk'

  if ~data_exists('iug_ltr_sgk_uwnd iug_ltr_sgk_pwr1 iug_ltr_sgk_wdt1'$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;10 caps parameter
;
; iug_load_ltr_rish,parameter='UWND'
;

t_name='caps parameter'

catch,err

if err eq 0 then begin

  iug_load_ltr_rish,parameter='UWND'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ltr_sgk'

  if ~data_exists('iug_ltr_sgk_uwnd',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



;
;11 * parameter
;
; iug_load_ltr_rish,parameter='*'
;

t_name='* parameter'

catch,err

if err eq 0 then begin

   iug_load_ltr_rish, parameter= '*'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ltr_sgk'

  if ~data_exists('iug_ltr_sgk_uwnd iug_ltr_sgk_vwnd iug_ltr_sgk_wwnd '+$
                  'iug_ltr_sgk_pwr1 iug_ltr_sgk_pwr2 iug_ltr_sgk_pwr3 '+$
                  'iug_ltr_sgk_pwr4 iug_ltr_sgk_pwr5 iug_ltr_sgk_wdt1 '+$
                  'iug_ltr_sgk_wdt2 iug_ltr_sgk_wdt3 iug_ltr_sgk_wdt4 '+$
                  'iug_ltr_sgk_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;12 all parameter
;
; iug_load_ltr_rish,parameter= 'all'
;

t_name='all parameter'

catch,err

if err eq 0 then begin

   iug_load_ltr_rish, parameter= 'all'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ltr_sgk'

  if ~data_exists('iug_ltr_sgk_uwnd iug_ltr_sgk_vwnd iug_ltr_sgk_wwnd '+$
                  'iug_ltr_sgk_pwr1 iug_ltr_sgk_pwr2 iug_ltr_sgk_pwr3 '+$
                  'iug_ltr_sgk_pwr4 iug_ltr_sgk_pwr5 iug_ltr_sgk_wdt1 '+$
                  'iug_ltr_sgk_wdt2 iug_ltr_sgk_wdt3 iug_ltr_sgk_wdt4 '+$
                  'iug_ltr_sgk_wdt5 ',qa_timespan[qa_t,0],qa_timespan[qa_t,1])$
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;13 verbose
;
;iug_load_ltr_rish,site='sgk',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_ltr_rish,site='sgk',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;14 /downloadonly
;
;  iug_load_ltr_rish,site='sgk',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_ltr_rish,site='sgk',/downloadonly

  if data_exists('iug_ltr_sgk_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
