
;1 basic
;
;  iug_load_gaia_cpl_nc, uname = 'realion', passwd ='DataDL01'
;  iug_load_gaia_gcm_nc, uname = 'realion', passwd ='DataDL01'
; 
;2 single parameter
;
;  iug_load_gaia_cpl_nc, parameter = 'xoi',uname = 'realion', passwd ='DataDL01'
;  iug_load_gaia_gcm_nc, parameter = 'gu',uname = 'realion', passwd ='DataDL01'
;
;3 multi parameters array
;
;  iug_load_gaia_cpl_nc, parameter = ['xoi','xo2i'],uname = 'realion', passwd ='DataDL01'
;  iug_load_gaia_gcm_nc, parameter = ['gu','gv'],uname = 'realion', passwd ='DataDL01'
;  
;4 caps parameter
;
;  iug_load_gaia_cpl_nc, parameter = 'XOI',uname = 'realion', passwd ='DataDL01'
;  iug_load_gaia_gcm_nc, parameter = 'GU',uname = 'realion', passwd ='DataDL01'
;  
;5 load all parameters
;
;  iug_load_gaia_cpl_nc, parameter = 'all',uname = 'realion', passwd ='DataDL01'
;  iug_load_gaia_gcm_nc, parameter = 'all',uname = 'realion', passwd ='DataDL01'
;  
;6 load * parameters
;
;  iug_load_gaia_cpl_nc, parameter = '*',uname = 'realion', passwd ='DataDL01'
;  iug_load_gaia_gcm_nc, parameter = '*',uname = 'realion', passwd ='DataDL01'
;  
;7 verbose
;
;  iug_load_gaia_cpl_nc, parameter = 'xoi',/verbose,uname = 'realion', passwd ='DataDL01'
;  iug_load_gaia_gcm_nc, parameter = 'gu',/verbose,uname = 'realion', passwd ='DataDL01'
;
;8 /downloadonly
;
; iug_load_gaia_cpl_nc, parameter = 'xoi',uname = 'realion', passwd ='DataDL01' ,/downloadonly
; iug_load_gaia_gcm_nc, parameter = 'gu',uname = 'realion', passwd ='DataDL01' ,/downloadonly
;
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2021-10-28 (28 Oct 2021) $
; $LastChangedRevision:  $
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

qa_timespan[0,*] = [ '2017-09-07', '2017-09-08']

qa_timespan[1,*] = [ '2011-07-29', '2011-07-30']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/day

del_data,'*'

;
;1 Basic Test
; iug_load_gaia_cpl_nc, uname = 'realion', passwd ='DataDL01'
; iug_load_gaia_gcm_nc,uname = 'realion', passwd ='DataDL01'
;
;  
t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_gaia_cpl_nc,uname = 'realion', passwd ='DataDL01'
  iug_load_gaia_gcm_nc,uname = 'realion', passwd ='DataDL01'

  ;just spot checking cause there are a lot of data types
  print_tvar_info,'gaia_cpl_*'
  print_tvar_info,'gaia_gcm_*'

  if ~data_exists(['gaia_cpl_*','gaia_gcm_*'], qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single parameter
;
; iug_load_gaia_cpl_nc, parameter = 'xoi',uname = 'realion', passwd ='DataDL01'
; iug_load_gaia_gcm_nc, parameter = 'gu',uname = 'realion', passwd ='DataDL01'
;

t_name='single parameter'

catch,err

if err eq 0 then begin

  iug_load_gaia_cpl_nc, parameter = 'xoi',uname = 'realion', passwd ='DataDL01'
  iug_load_gaia_gcm_nc, parameter = 'gu',uname = 'realion', passwd ='DataDL01'
  
  ;just spot checking cause there are a lot of data types
  print_tvar_info,'gaia_cpl_*'
  print_tvar_info,'gaia_gcm_*'

  if ~data_exists(['gaia_cpl_xoi','gaia_gcm_gu'], qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi parameter array
;
; iug_load_gaia_cpl_nc, parameter = ['xoi','xo2i'],uname = 'realion', passwd ='DataDL01'
; iug_load_gaia_gcm_nc, parameter = ['gu','gv'],uname = 'realion', passwd ='DataDL01'
;

t_name='multi parameter string'

catch,err

if err eq 0 then begin

  iug_load_gaia_cpl_nc, parameter = ['xoi','xo2i'],uname = 'realion', passwd ='DataDL01'
  iug_load_gaia_gcm_nc, parameter = ['gu','gv'],uname = 'realion', passwd ='DataDL01'
  
  ;just spot checking cause there are a lot of data types
  print_tvar_info,'gaia_cpl_*' 
  print_tvar_info,'gaia_gcm_*'

  if ~data_exists(['gaia_cpl_xoi','gaia_cpl_xo2i','gaia_gcm_gu','gaia_gcm_gv'], qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 caps parameter
;
; iug_load_gaia_cpl_nc, parameter = 'XOI',uname = 'realion', passwd ='DataDL01'
; iug_load_gaia_gcm_nc, parameter = 'GU',uname = 'realion', passwd ='DataDL01'
;

t_name='caps parameter'

catch,err

if err eq 0 then begin

  iug_load_gaia_cpl_nc, parameter = 'XOI',uname = 'realion', passwd ='DataDL01'
  iug_load_gaia_gcm_nc, parameter = 'GU',uname = 'realion', passwd ='DataDL01'

  ;just spot checking cause there are a lot of data types
  print_tvar_info,'gaia_cpl_*'
  print_tvar_info,'gaia_gcm_*'
    
  if ~data_exists(['gaia_cpl_xoi','gaia_gcm_gu'], qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 load all parameters
;
; iug_load_gaia_cpl_nc, parameter = 'all', uname = 'realion', passwd ='DataDL01'
; iug_load_gaia_gcm_nc, parameter = 'all',uname = 'realion', passwd ='DataDL01'
;

t_name='all parameters'

catch,err

if err eq 0 then begin

  iug_load_gaia_cpl_nc, parameter = 'all', uname = 'realion', passwd ='DataDL01'
  iug_load_gaia_gcm_nc, parameter = 'all',uname = 'realion', passwd ='DataDL01'
  
  ;just spot checking cause there are a lot of data types
  print_tvar_info,'gaia_cpl_*'
  print_tvar_info,'gaia_gcm_*'
  
  if ~data_exists(['gaia_cpl_xoi','gaia_gcm_gu'], qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load * parameters
;
; iug_load_gaia_cpl_nc, parameter = '*', uname = 'realion', passwd ='DataDL01'
; iug_load_gaia_gcm_nc, parameter = '*',uname = 'realion', passwd ='DataDL01'
;

t_name='* parameters'

catch,err

if err eq 0 then begin

  iug_load_gaia_cpl_nc, parameter = '*', uname = 'realion', passwd ='DataDL01'
  iug_load_gaia_gcm_nc, parameter = '*',uname = 'realion', passwd ='DataDL01'
  
  ;just spot checking cause there are a lot of data types
  print_tvar_info,'gaia_cpl_*'
  print_tvar_info,'gaia_gcm_*'

  if ~data_exists(['gaia_cpl_xoi','gaia_gcm_gu'], qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 verbose
;
; iug_load_gaia_cpl_nc, parameter = 'xoi', uname = 'realion', passwd ='DataDL01',/verbose
; iug_load_gaia_gcm_nc, parameter = 'gu', uname = 'realion', passwd ='DataDL01',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

  iug_load_gaia_cpl_nc, parameter = 'xoi', uname = 'realion', passwd ='DataDL01',/verbose
  iug_load_gaia_gcm_nc, parameter = 'gu', uname = 'realion', passwd ='DataDL01',/verbose
  
  ;just spot checking cause there are a lot of data types
  print_tvar_info,'gaia_cpl_*'
  print_tvar_info,'gaia_gcm_*'

  if ~data_exists(['gaia_cpl_xoi','gaia_gcm_gu'], qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 /downloadonly
;
; iug_load_gaia_cpl_nc, parameter = 'xoi', uname = 'realion', passwd ='DataDL01',/downloadonly
; iug_load_gaia_gcm_nc, parameter = 'gu', uname = 'realion', passwd ='DataDL01',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  
  iug_load_gaia_cpl_nc, parameter = 'xoi', uname = 'realion', passwd ='DataDL01',/downloadonly
  iug_load_gaia_gcm_nc, parameter = 'gu', uname = 'realion', passwd ='DataDL01',/downloadonly
  
  
  if data_exists(['gaia_cpl_xoi','gaia_gcm_gu'],qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
