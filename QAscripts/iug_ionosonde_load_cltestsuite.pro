
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
;7 verbose
;
; iug_load_ionosonde_rish,site='sgk',/verbose
;
;8 /downloadonly
;
; iug_load_ionosonde_rish,site='sgk',/downloadonly
;
;9 /fixed_freq
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

qa_timespan[0,*] = ['2011-05-31', '2011-06-01']

qa_timespan[1,*] = ['2005-07-29', '2005-07-30']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/hour


del_data,'*'

;1 Basic Test
; iug_load_ionosonde_rish

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_ionosonde_rish

;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_ionosonde_sgk_ionogram'

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
  print_tvar_info,'iug_ionosonde_sgk_ionogram'

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
  print_tvar_info,'iug_ionosonde_sgk_ionogram'

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
  print_tvar_info,'iug_ionosonde_sgk_ionogram'

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
  print_tvar_info,'iug_ionosonde_sgk_ionogram'

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
  print_tvar_info,'iug_ionosonde_sgk_ionogram'

  if ~data_exists('iug_ionosonde_sgk_ionogram',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
    
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 verbose
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
;8 /downloadonly
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
;9 /fixed_freq
;
;  iug_load_ionosonde_rish,site='sgk',/fixed_freq
;

t_name = '/fixed_freq'
catch,err
if err eq 0 then begin
  iug_load_ionosonde_rish,site='sgk',/fixed_freq


  ;just spot checking cause there are a lot of data types
  print_tvar_info,'iug_ionosonde_sgk_freq_2MHz'

  if ~data_exists('iug_ionosonde_sgk_freq_2MHz', qa_timespan[qa_t,0], qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
