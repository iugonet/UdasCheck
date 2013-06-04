;+
;1 basic
; iug_load_infrasound_iga
;
;2 verbose
;
; iug_load_infrasound_iga,/verbose
;
;3 /downloadonly
;
; iug_load_infrasound_iga,/downloadonly
;
;4 /no_download
;
; iug_load_infrasound_iga,/no_download
;
; Written by Yuki. KOYAMA, Jan 14, 2012 (ykoyama at kugi.kyoto-u.ac.jp)
;-

init_tests

;prepare to run tests
t_num = 0

thm_init
;;thm_init, LOCAL_DATA_DIR='~/data/',THEMIS_REMOTE_DATA_DIR="http://themis.stp.isas.jaxa.jp/data/themis/"

qa_timespan = ['1984-09-18', '1984-09-19']

timespan,qa_timespan,24,/hour

del_data,'*'

;1 Basic Test
; iug_load_infrasound_iga

t_name='basic'

catch,err

if err eq 0 then begin

   iug_load_infrasound_iga

;just spot checking cause there are a lot of data types
   print_tvar_info,'iga_infrasound'
   if ~data_exists('iga_infrasound',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

   print_tvar_info,'wdc_mag_ae_prov_1min'
   if ~data_exists('wdc_mag_ae_prov_1min',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

   print_tvar_info,'wdc_mag_sym'
   if ~data_exists('wdc_mag_sym',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

   print_tvar_info,'wdc_mag_asy'
   if ~data_exists('wdc_mag_asy',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

   print_tvar_info,'wdc_mag_kak_1min'
   if ~data_exists('wdc_mag_kak_1min',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 verbose
;
;iug_load_infrasound_iga,/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin
   iug_load_infrasound_iga,/verbose
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 /downloadonly
;
;  iug_load_infrasound_iga,/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
   iug_load_infrasound_iga,/downloadonly

   if data_exists('iga_infrasound',qa_timespan,qa_timespan) $
   then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;4 /no_download
;
;iug_load_infrasound_iga, /no_download
;

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
   iug_load_infrasound_iga,/no_download

   if data_exists('iga_infrasound',qa_timespan,qa_timespan) $
   then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

end_tests

end
