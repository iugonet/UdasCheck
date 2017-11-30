
;1 basic
; iug_load_meteor_rish
;
;2 single site
;
; iug_load_meteor_rish,site = 'ktb'
;
;3 multi sites string
;
; iug_load_meteor_rish,site = 'bik ktb sgk srp'
;
;4 multi sites array
;
; iug_load_meteor_rish,site = ['bik','ktb','sgk','srp']
;
;5 caps site
;
; iug_load_meteor_rish,site='KTB'
;
;6 load all sites
;
; iug_load_meteor_rish,site='all'
;
;7 load * sites
;
; iug_load_meteor_rish,site='*'
;
;8 single datatype
;
; iug_load_meteor_rish,datatype='thermosphere'
;
;9 caps datatype
;
; iug_load_meteor_rish,datatype='THERMOSPHERE'
;
;10 * datatype
;
; iug_load_meteor_rish,datatype='*'
;
;11 array datatype
;
; iug_load_meteor_rish,datatype=['thermosphere']
;
;12 single parameter
;
; iug_load_meteor_rish,parameter='h2t60min00'
;
;13 multi parameters string
;
; iug_load_meteor_rish,site = 'h2t60min00 h4t60min00'
;
;14 multi parameters array
;
; iug_load_meteor_rish,site = ['h2t60min00', 'h2t60min30', 'h4t60min00', 'h4t60min30']
;
;15 caps parameter
;
; iug_load_meteor_rish,parameter='H2T60MIN00'
;
;16 * parameter
;
; iug_load_meteor_rish,parameter='*'
;
;17 array parameter
;
; iug_load_meteor_rish,parameter=['h2t60min00']
; 
;18 all parameter
;
; iug_load_meteor_rish,parameter='all'
; 
;19 verbose
;
; iug_load_meteor_rish,site='ktb',/verbose
;
;20 /downloadonly
;
; iug_load_meteor_rish,site='ktb',/downloadonly
;
;
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2013-05-30 (30 May 2013) $
; $LastChangedRevision: 213 $
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

qa_timespan[0,*] = [ '2006-03-01', '2006-03-02']

qa_timespan[1,*] = [ '1992-12-01', '1992-12-02']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/hour

del_data,'*'

;1 Basic Test
; iug_load_meteor_rish

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_meteor_rish

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_meteor_ktb_nc'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00 iug_meteor_ktb_uwnd_h2t60min30 '+$
                  'iug_meteor_ktb_vwnd_h2t60min30 iug_meteor_ktb_uwndsig_h2t60min30 iug_meteor_ktb_vwndsig_h2t60min30 '+$
                  'iug_meteor_ktb_mwnum_h2t60min30 iug_meteor_ktb_uwnd_h4t60min00 iug_meteor_ktb_vwnd_h4t60min00 '+$
                  'iug_meteor_ktb_uwndsig_h4t60min00 iug_meteor_ktb_vwndsig_h4t60min00 iug_meteor_ktb_mwnum_h4t60min00 '+$
                  'iug_meteor_ktb_uwnd_h4t60min30 iug_meteor_ktb_vwnd_h4t60min30 iug_meteor_ktb_uwndsig_h4t60min30 '+$
                  'iug_meteor_ktb_vwndsig_h4t60min30 iug_meteor_ktb_mwnum_h4t60min30', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_meteor_rish,site='ktb'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_meteor_rish,site='ktb'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00 iug_meteor_ktb_uwnd_h2t60min30 '+$
                  'iug_meteor_ktb_vwnd_h2t60min30 iug_meteor_ktb_uwndsig_h2t60min30 iug_meteor_ktb_vwndsig_h2t60min30 '+$
                  'iug_meteor_ktb_mwnum_h2t60min30 iug_meteor_ktb_uwnd_h4t60min00 iug_meteor_ktb_vwnd_h4t60min00 '+$
                  'iug_meteor_ktb_uwndsig_h4t60min00 iug_meteor_ktb_vwndsig_h4t60min00 iug_meteor_ktb_mwnum_h4t60min00 '+$
                  'iug_meteor_ktb_uwnd_h4t60min30 iug_meteor_ktb_vwnd_h4t60min30 iug_meteor_ktb_uwndsig_h4t60min30 '+$
                  'iug_meteor_ktb_vwndsig_h4t60min30 iug_meteor_ktb_mwnum_h4t60min30', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi sites string
;
; iug_load_meteor_rish,site = 'bik ktb sgk srp'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

   iug_load_meteor_rish,site = 'bik ktb sgk srp'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00 iug_meteor_ktb_uwnd_h2t60min30 '+$
                  'iug_meteor_ktb_vwnd_h2t60min30 iug_meteor_ktb_uwndsig_h2t60min30 iug_meteor_ktb_vwndsig_h2t60min30 '+$
                  'iug_meteor_ktb_mwnum_h2t60min30 iug_meteor_ktb_uwnd_h4t60min00 iug_meteor_ktb_vwnd_h4t60min00 '+$
                  'iug_meteor_ktb_uwndsig_h4t60min00 iug_meteor_ktb_vwndsig_h4t60min00 iug_meteor_ktb_mwnum_h4t60min00 '+$
                  'iug_meteor_ktb_uwnd_h4t60min30 iug_meteor_ktb_vwnd_h4t60min30 iug_meteor_ktb_uwndsig_h4t60min30 '+$
                  'iug_meteor_ktb_vwndsig_h4t60min30 iug_meteor_ktb_mwnum_h4t60min30', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi sites array
;
; iug_load_meteor_rish,site = ['bik','ktb','sgk','srp']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

  iug_load_meteor_rish,site = ['bik','ktb','sgk','srp']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00 iug_meteor_ktb_uwnd_h2t60min30 '+$
                  'iug_meteor_ktb_vwnd_h2t60min30 iug_meteor_ktb_uwndsig_h2t60min30 iug_meteor_ktb_vwndsig_h2t60min30 '+$
                  'iug_meteor_ktb_mwnum_h2t60min30 iug_meteor_ktb_uwnd_h4t60min00 iug_meteor_ktb_vwnd_h4t60min00 '+$
                  'iug_meteor_ktb_uwndsig_h4t60min00 iug_meteor_ktb_vwndsig_h4t60min00 iug_meteor_ktb_mwnum_h4t60min00 '+$
                  'iug_meteor_ktb_uwnd_h4t60min30 iug_meteor_ktb_vwnd_h4t60min30 iug_meteor_ktb_uwndsig_h4t60min30 '+$
                  'iug_meteor_ktb_vwndsig_h4t60min30 iug_meteor_ktb_mwnum_h4t60min30', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
  
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps site
;
; iug_load_meteor_rish,site='KTB'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_meteor_rish,site='KTB'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00 iug_meteor_ktb_uwnd_h2t60min30 '+$
                  'iug_meteor_ktb_vwnd_h2t60min30 iug_meteor_ktb_uwndsig_h2t60min30 iug_meteor_ktb_vwndsig_h2t60min30 '+$
                  'iug_meteor_ktb_mwnum_h2t60min30 iug_meteor_ktb_uwnd_h4t60min00 iug_meteor_ktb_vwnd_h4t60min00 '+$
                  'iug_meteor_ktb_uwndsig_h4t60min00 iug_meteor_ktb_vwndsig_h4t60min00 iug_meteor_ktb_mwnum_h4t60min00 '+$
                  'iug_meteor_ktb_uwnd_h4t60min30 iug_meteor_ktb_vwnd_h4t60min30 iug_meteor_ktb_uwndsig_h4t60min30 '+$
                  'iug_meteor_ktb_vwndsig_h4t60min30 iug_meteor_ktb_mwnum_h4t60min30', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all sites
;
; iug_load_meteor_rish,site = 'all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_meteor_rish,site = 'all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00 iug_meteor_ktb_uwnd_h2t60min30 '+$
                  'iug_meteor_ktb_vwnd_h2t60min30 iug_meteor_ktb_uwndsig_h2t60min30 iug_meteor_ktb_vwndsig_h2t60min30 '+$
                  'iug_meteor_ktb_mwnum_h2t60min30 iug_meteor_ktb_uwnd_h4t60min00 iug_meteor_ktb_vwnd_h4t60min00 '+$
                  'iug_meteor_ktb_uwndsig_h4t60min00 iug_meteor_ktb_vwndsig_h4t60min00 iug_meteor_ktb_mwnum_h4t60min00 '+$
                  'iug_meteor_ktb_uwnd_h4t60min30 iug_meteor_ktb_vwnd_h4t60min30 iug_meteor_ktb_uwndsig_h4t60min30 '+$
                  'iug_meteor_ktb_vwndsig_h4t60min30 iug_meteor_ktb_mwnum_h4t60min30', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * sites
;
; iug_load_meteor_rish, site='*'
;

t_name='* sites'

catch,err

if err eq 0 then begin

  iug_load_meteor_rish, site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00 iug_meteor_ktb_uwnd_h2t60min30 '+$
                  'iug_meteor_ktb_vwnd_h2t60min30 iug_meteor_ktb_uwndsig_h2t60min30 iug_meteor_ktb_vwndsig_h2t60min30 '+$
                  'iug_meteor_ktb_mwnum_h2t60min30 iug_meteor_ktb_uwnd_h4t60min00 iug_meteor_ktb_vwnd_h4t60min00 '+$
                  'iug_meteor_ktb_uwndsig_h4t60min00 iug_meteor_ktb_vwndsig_h4t60min00 iug_meteor_ktb_mwnum_h4t60min00 '+$
                  'iug_meteor_ktb_uwnd_h4t60min30 iug_meteor_ktb_vwnd_h4t60min30 iug_meteor_ktb_uwndsig_h4t60min30 '+$
                  'iug_meteor_ktb_vwndsig_h4t60min30 iug_meteor_ktb_mwnum_h4t60min30', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 single parameter
;
; iug_load_meteor_rish,parameter = 'h2t60min00'
;

t_name='single parameter'

catch,err

if err eq 0 then begin

  iug_load_meteor_rish,parameter = 'h2t60min00'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;9 multi parameters string
;
; iug_load_meteor_rish,parameter = 'h2t60min00 h2t60min30 h4t60min00 h4t60min30'
;

t_name='multi parameters string'

catch,err

if err eq 0 then begin

  iug_load_meteor_rish,parameter = 'h2t60min00 h2t60min30 h4t60min00 h4t60min30'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00 iug_meteor_ktb_uwnd_h2t60min30 '+$
                  'iug_meteor_ktb_vwnd_h2t60min30 iug_meteor_ktb_uwndsig_h2t60min30 iug_meteor_ktb_vwndsig_h2t60min30 '+$
                  'iug_meteor_ktb_mwnum_h2t60min30 iug_meteor_ktb_uwnd_h4t60min00 iug_meteor_ktb_vwnd_h4t60min00 '+$
                  'iug_meteor_ktb_uwndsig_h4t60min00 iug_meteor_ktb_vwndsig_h4t60min00 iug_meteor_ktb_mwnum_h4t60min00 '+$
                  'iug_meteor_ktb_uwnd_h4t60min30 iug_meteor_ktb_vwnd_h4t60min30 iug_meteor_ktb_uwndsig_h4t60min30 '+$
                  'iug_meteor_ktb_vwndsig_h4t60min30 iug_meteor_ktb_mwnum_h4t60min30', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;10 multi parameters array
;
; iug_load_meteor_rish,parameter = ['h2t60min00','h2t60min30','h4t60min00','h4t60min30']
;

t_name='multi parameters array'

catch,err

if err eq 0 then begin

  iug_load_meteor_rish,parameter = ['h2t60min00','h2t60min30','h4t60min00','h4t60min30']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00 iug_meteor_ktb_uwnd_h2t60min30 '+$
                  'iug_meteor_ktb_vwnd_h2t60min30 iug_meteor_ktb_uwndsig_h2t60min30 iug_meteor_ktb_vwndsig_h2t60min30 '+$
                  'iug_meteor_ktb_mwnum_h2t60min30 iug_meteor_ktb_uwnd_h4t60min00 iug_meteor_ktb_vwnd_h4t60min00 '+$
                  'iug_meteor_ktb_uwndsig_h4t60min00 iug_meteor_ktb_vwndsig_h4t60min00 iug_meteor_ktb_mwnum_h4t60min00 '+$
                  'iug_meteor_ktb_uwnd_h4t60min30 iug_meteor_ktb_vwnd_h4t60min30 iug_meteor_ktb_uwndsig_h4t60min30 '+$
                  'iug_meteor_ktb_vwndsig_h4t60min30 iug_meteor_ktb_mwnum_h4t60min30', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;11 caps parameter
;
; iug_load_meteor_rish,parameter='H2T60MIN00'
;

t_name='caps parameter'

catch,err

if err eq 0 then begin

  iug_load_meteor_rish,parameter='H2T60MIN00'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'



;
;12 * parameter
;
; iug_load_meteor_rish,parameter='*'
;

t_name='* parameter'

catch,err

if err eq 0 then begin

   iug_load_meteor_rish, parameter= '*'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00 iug_meteor_ktb_uwnd_h2t60min30 '+$
                  'iug_meteor_ktb_vwnd_h2t60min30 iug_meteor_ktb_uwndsig_h2t60min30 iug_meteor_ktb_vwndsig_h2t60min30 '+$
                  'iug_meteor_ktb_mwnum_h2t60min30 iug_meteor_ktb_uwnd_h4t60min00 iug_meteor_ktb_vwnd_h4t60min00 '+$
                  'iug_meteor_ktb_uwndsig_h4t60min00 iug_meteor_ktb_vwndsig_h4t60min00 iug_meteor_ktb_mwnum_h4t60min00 '+$
                  'iug_meteor_ktb_uwnd_h4t60min30 iug_meteor_ktb_vwnd_h4t60min30 iug_meteor_ktb_uwndsig_h4t60min30 '+$
                  'iug_meteor_ktb_vwndsig_h4t60min30 iug_meteor_ktb_mwnum_h4t60min30', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;13 array parameter
;
; iug_load_meteor_rish,parameter=['h2t60min00','h2t60min30','h4t60min00','h4t60min30']
;

t_name='array parameter'

catch,err

if err eq 0 then begin

   iug_load_meteor_rish,parameter=['h2t60min00','h2t60min30','h4t60min00','h4t60min30']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00 iug_meteor_ktb_uwnd_h2t60min30 '+$
                  'iug_meteor_ktb_vwnd_h2t60min30 iug_meteor_ktb_uwndsig_h2t60min30 iug_meteor_ktb_vwndsig_h2t60min30 '+$
                  'iug_meteor_ktb_mwnum_h2t60min30 iug_meteor_ktb_uwnd_h4t60min00 iug_meteor_ktb_vwnd_h4t60min00 '+$
                  'iug_meteor_ktb_uwndsig_h4t60min00 iug_meteor_ktb_vwndsig_h4t60min00 iug_meteor_ktb_mwnum_h4t60min00 '+$
                  'iug_meteor_ktb_uwnd_h4t60min30 iug_meteor_ktb_vwnd_h4t60min30 iug_meteor_ktb_uwndsig_h4t60min30 '+$
                  'iug_meteor_ktb_vwndsig_h4t60min30 iug_meteor_ktb_mwnum_h4t60min30', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;14 all parameter
;
; iug_load_meteor_rish,parameter= 'all'
;

t_name='all parameter'

catch,err

if err eq 0 then begin

   iug_load_meteor_rish,parameter= 'all'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_meteor_*'

  if ~data_exists('iug_meteor_ktb_uwnd_h2t60min00 iug_meteor_ktb_vwnd_h2t60min00 iug_meteor_ktb_uwndsig_h2t60min00 '+$
                  'iug_meteor_ktb_vwndsig_h2t60min00 iug_meteor_ktb_mwnum_h2t60min00 iug_meteor_ktb_uwnd_h2t60min30 '+$
                  'iug_meteor_ktb_vwnd_h2t60min30 iug_meteor_ktb_uwndsig_h2t60min30 iug_meteor_ktb_vwndsig_h2t60min30 '+$
                  'iug_meteor_ktb_mwnum_h2t60min30 iug_meteor_ktb_uwnd_h4t60min00 iug_meteor_ktb_vwnd_h4t60min00 '+$
                  'iug_meteor_ktb_uwndsig_h4t60min00 iug_meteor_ktb_vwndsig_h4t60min00 iug_meteor_ktb_mwnum_h4t60min00 '+$
                  'iug_meteor_ktb_uwnd_h4t60min30 iug_meteor_ktb_vwnd_h4t60min30 iug_meteor_ktb_uwndsig_h4t60min30 '+$
                  'iug_meteor_ktb_vwndsig_h4t60min30 iug_meteor_ktb_mwnum_h4t60min30',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;15 verbose
;
;iug_load_meteor_rish,site='ktb',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_meteor_rish,site='ktb',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;16 /downloadonly
;
;  iug_load_meteor_rish,site='ktb',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_meteor_rish,site='ktb',/downloadonly

  if data_exists('iug_meteor_ktb_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
