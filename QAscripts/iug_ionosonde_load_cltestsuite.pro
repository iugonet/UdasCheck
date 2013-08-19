
;1 basic
; iug_load_ionosonde_rish
; 
;2 single site
;
; iug_load_ionosonde_rish,site = 'sgk'
;
;3 site array
;
; iug_load_ionosonde_rish,site = ['sgk']
;
;4 caps site
;
; iug_load_ionosonde_rish,site='SGK'
;
;5 load all sites
;
; iug_load_ionosonde_rish,site='all'
;
;6 load * sites
;
; iug_load_ionosonde_rish,site='*'
;
;7 single datatype
;
; iug_load_ionosonde_rish,datatype='troposphere'
;
;8 caps datatype
;
; iug_load_ionosonde_rish,datatype='TROPOSPHERE'
;
;9 * datatype
;
; iug_load_ionosonde_rish,datatype='*'
;
;10 array datatype
;
; iug_load_ionosonde_rish,datatype=['troposphere']
;
; 
;11 verbose
;
; iug_load_ionosonde_rish,site='sgk',/verbose
;
;12 /downloadonly
;
; iug_load_ionosonde_rish,site='sgk',/downloadonly
;
;13 /fixed_freq
;
; iug_load_ionosonde_rish,site='sgk',/fixed_freq
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2012-11-13 (13 Nov 2012) $
; $LastChangedRevision: 2013-02-26 (26 Feb 2013) $
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

qa_timespan[0,*] = ['2011-06-01 00:00', '2011-06-02 00:00']

qa_timespan[1,*] = ['2005-07-29', '2005-07-30']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/hour

qa_timespan[0,*] = ['2011-06-01 00:00', '2011-06-01 23:59']

del_data,'*'

;1 Basic Test
; iug_load_ionosonde_rish

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_ionosonde_rish

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ionosonde_sgk'

  if ~data_exists('iug_ionosonde_sgk_ionogram',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_aws_rish,site = 'ktb'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_ionosonde_rish,site='sgk'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ionosonde_sgk'

  if ~data_exists('iug_ionosonde_sgk_ionogram',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
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

  iug_load_ionosonde_rish,site=['sgk']
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ionosonde_sgk'

  if ~data_exists('iug_ionosonde_sgk_ionogram',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
  
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 caps site
;
; iug_load_ionosonde_rish,site='SGK'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_ionosonde_rish,site='SGK'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ionosonde_sgk'

  if ~data_exists('iug_ionosonde_sgk_ionogram',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
    
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 load all sites
;
; iug_load_aws_rish,site = 'all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_ionosonde_rish,site = 'all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ionosonde_sgk'

  if ~data_exists('iug_ionosonde_sgk_ionogram',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load * sites
;
; iug_load_ionosonde_rish, site='*'
;

t_name='* sites'

catch,err

if err eq 0 then begin

  iug_load_ionosonde_rish, site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ionosonde_sgk'

  if ~data_exists('iug_ionosonde_sgk_ionogram',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
    
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 single datatype
;
; iug_load_ionosonde_rish, datatype = 'troposphere'
;

t_name='single datatype'

catch,err

if err eq 0 then begin

  iug_load_ionosonde_rish, datatype = 'troposphere'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ionosonde_sgk'

  if ~data_exists('iug_ionosonde_sgk_ionogram',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
    
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;8 caps datatype
;
; iug_load_ionosonde_rish,datatype='TROPOSPHERE'
;

t_name='caps datatype'

catch,err

if err eq 0 then begin

  iug_load_ionosonde_rish, datatype = 'TROPOSPHERE'


;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ionosonde_sgk'

  if ~data_exists('iug_ionosonde_sgk_ionogram',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
    
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;9 * datatype
;
; iug_load_ionosonde_rish,datatype='*'
;

t_name='* datatype'

catch,err

if err eq 0 then begin

  iug_load_ionosonde_rish,datatype = '*'
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ionosonde_sgk'

  if ~data_exists('iug_ionosonde_sgk_ionogram',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;10 array datatype
;
; iug_load_ionosonde_rish,datatype = ['ionosphere']
;

t_name='array datatype'

catch,err

if err eq 0 then begin

  iug_load_ionosonde_rish,datatype = ['ionosphere']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'rish_ionosonde_sgk'

  if ~data_exists('iug_ionosonde_sgk_ionogram',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;11 verbose
;
;iug_load_ionosonde_rish,site='sgk',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_ionosonde_rish,site='sgk',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;12 /downloadonly
;
;  iug_load_ionosonde_rish,site='sgk',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_ionosonde_rish,site='sgk',/downloadonly

  if data_exists('iug_ionosonde_sgk_ionogram',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;13 /fixed_freq
;
;  iug_load_ionosonde_rish,site='sgk',/fixed_freq
;

t_name = '/fixed_freq'
catch,err
if err eq 0 then begin
  iug_load_ionosonde_rish,site='sgk',/fixed_freq

  if ~data_exists('iug_ionosonde_sgk_freq_2MHz iug_ionosonde_sgk_freq_3MHz iug_ionosonde_sgk_freq_4MHz iug_ionosonde_sgk_freq_5MHz '+$
                 'iug_ionosonde_sgk_freq_6MHz iug_ionosonde_sgk_freq_7MHz iug_ionosonde_sgk_freq_8MHz iug_ionosonde_sgk_freq_9MHz '+$
                 'iug_ionosonde_sgk_freq_10MHz iug_ionosonde_sgk_freq_11MHz iug_ionosonde_sgk_freq_12MHz iug_ionosonde_sgk_freq_13MHz '+$
                 'iug_ionosonde_sgk_freq_14MHz iug_ionosonde_sgk_freq_15MHz iug_ionosonde_sgk_freq_16MHz iug_ionosonde_sgk_freq_17MHz '+$
                 'iug_ionosonde_sgk_freq_18MHz' ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
