
;1 basic
; iug_load_elf_hokudai
;
;2 single site
;
; iug_load_elf_hokudai, site='syo'
;
;3 caps site
;
; iug_load_elf_hokudai, site='SYO'
;
;4 load all sites
;
; iug_load_elf_hokudai, site='all'
;
;5 load * sites
;
; iug_load_elf_hokudai, site='*'
;
;6 verbose
;
; iug_load_elf_hokudai, site='syo', /verbose
;
;7 /downloadonly
;
; iug_load_elf_rish, site='syo',/downloadonly
;
;8 /downloadonly
;
; iug_load_elf_rish, site='syo',/no_download
;
;
;
; $LastChangedBy: Y.-M. Tanaka $
; $LastChangedDate: 2021-12-03 (03 Dec 2021) $
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
qa_timespan = strarr(1,2)

qa_timespan[0,*] = ['2010-01-01', '2010-01-02']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/hour

del_data,'*'

;1 Basic Test
; iug_load_elf_hokudai

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_elf_hokudai

;just spot checking cause there are a lot of data types
  print_tvar_info,'hokudai_irig_code_syo hokudai_elf_syo'

  if ~data_exists('hokudai_*_syo', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_elf_hokudai,site='bik'
;

t_name='single site'

catch,err

if err eq 0 then begin

  iug_load_elf_hokudai,site='syo'

;just spot checking cause there are a lot of data types
  print_tvar_info,'hokudai_irig_code_syo hokudai_elf_syo'

  if ~data_exists('hokudai_*_syo', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 caps site
;
; iug_load_elf_hokudai,site = 'SYO'
;

t_name='caps site'

catch,err

if err eq 0 then begin

  iug_load_elf_hokudai,site = 'SYO'

;just spot checking cause there are a lot of data types
  print_tvar_info,'hokudai_irig_code_syo hokudai_elf_syo'

  if ~data_exists('hokudai_*_syo', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 load all sites
;
; iug_load_elf_hokudai,site = 'all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

  iug_load_elf_hokudai,site = 'all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'hokudai_irig_code_syo hokudai_elf_syo'

  if ~data_exists('hokudai_*_syo', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 load * sites
;
; iug_load_elf_hokudai, site='*'
;

t_name='* sites'

catch,err

if err eq 0 then begin

  iug_load_elf_hokudai, site='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'hokudai_irig_code_syo hokudai_elf_syo'

  if ~data_exists('hokudai_*_syo', qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 verbose
;
;iug_load_elf_hokudai,site='syo',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_elf_hokudai,site='syo',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 /downloadonly
;
;  iug_load_elf_hokudai,site='bik',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_elf_hokudai,site='syo',/downloadonly
endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;8 /no_download
;
;iug_load_asi_nipr, /no_download
;

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
  iug_load_elf_hokudai, /no_download

  if data_exists('hokudai_*_syo',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
        then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

end_tests

end
