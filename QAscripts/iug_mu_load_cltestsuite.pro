
;1 basic
; iug_load_mu
;
;2 single datatype
;
; iug_load_mu, datatype = 'troposphere'
; 
;2 multi datatypes string
;
; iug_load_mu, datatype = 'troposphere mesosphere'
;
;3 multi datatypes array
;
; iug_load_mu, datatype = ['troposphere','mesosphere']
;
;5 caps datatype
;
; iug_load_mu, datatype = 'TROPOSPHERE'
;
;6 load all datatypes
;
; iug_load_mu, datatype = 'all'
;
;7 load * datatypes
;
; iug_load_mu, datatype = '*'
; 
;8 single level
;
; iug_load_mu, level = 'org'
;
;9 multi levels string
;
; iug_load_mu, level = 'org scr'
;
;10 multi levels array
;
; iug_load_mu, level = ['org','scr']
;
;11 caps level
;
; iug_load_mu, level = 'ORG'
;
;12 load all levels
;
; iug_load_mu, level = 'all'
;
;13 load * levels
;
; iug_load_mu, level = '*'
;
;14 single parameter for meteor mode observation
;
; iug_load_mu, datatype = 'meteor', parameter = 'h1t60min00'
;
;15 multi parameters string
;
; iug_load_mu, datatype = 'meteor', parameter = 'h1t60min00 h2t60min00'
;
;16 multi parameters array
;
; iug_load_mu, datatype = 'meteor', parameter = ['h1t60min00','h2t60min00']
;
;17 caps parameters
;
; iug_load_mu, datatype = 'meteor', parameter = 'H1T60MIN00'
;
;18 load all parameters
;
; iug_load_mu, datatype = 'meteor', parameter = 'all'
;
;19 load * parameters
;
; iug_load_mu, datatype = 'meteor', parameter = '*'
; 
;20 verbose
;
; iug_load_mu,/verbose
;
;21 /downloadonly
;
; iug_load_mu,/downloadonly
;
;
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2011-11-08 (08 Nov 2011) $
; $LastChangedRevision: 2012-11-14 (14 Nov 2012) $
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

qa_timespan[0,*] = ['1986-03-17', '1986-03-18']

qa_timespan[1,*] = ['1990-05-18', '1990-05-25']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/day

del_data,'*'

;1 Basic Test
; iug_load_mu

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_mu

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5 iug_mu_meso_pwr1_org '+$
                  'iug_mu_meso_pwr2_org iug_mu_meso_pwr3_org iug_mu_meso_pwr4_org iug_mu_meso_pwr5_org iug_mu_meso_wdt1_org '+$
                  'iug_mu_meso_wdt2_org iug_mu_meso_wdt3_org iug_mu_meso_wdt4_org iug_mu_meso_wdt5_org iug_mu_meso_dpl1_org '+$
                  'iug_mu_meso_dpl2_org iug_mu_meso_dpl3_org iug_mu_meso_dpl4_org iug_mu_meso_dpl5_org iug_mu_meso_pn1_org '+$
                  'iug_mu_meso_pn2_org iug_mu_meso_pn3_org iug_mu_meso_pn4_org iug_mu_meso_pn5_org iug_mu_meso_uwnd_org '+$
                  'iug_mu_meso_vwnd_org iug_mu_meso_wwnd_org iug_mu_meso_pwr1_scr iug_mu_meso_pwr2_scr iug_mu_meso_pwr3_scr '+$
                  'iug_mu_meso_pwr4_scr iug_mu_meso_pwr5_scr iug_mu_meso_wdt1_scr iug_mu_meso_wdt2_scr iug_mu_meso_wdt3_scr '+$
                  'iug_mu_meso_wdt4_scr iug_mu_meso_wdt5_scr iug_mu_meso_dpl1_scr iug_mu_meso_dpl2_scr iug_mu_meso_dpl3_scr '+$
                  'iug_mu_meso_dpl4_scr iug_mu_meso_dpl5_scr iug_mu_meso_pn1_scr iug_mu_meso_pn2_scr iug_mu_meso_pn3_scr '+$
                  'iug_mu_meso_pn4_scr iug_mu_meso_pn5_scr iug_mu_meso_uwnd_scr iug_mu_meso_vwnd_scr iug_mu_meso_wwnd_scr '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single datatype
;
; iug_load_mu, datatype = 'troposphere'
;

t_name='single datatype'

catch,err

if err eq 0 then begin

  iug_load_mu, datatype = 'troposphere'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

; 
;3 multi datatypes
;
; iug_load_mu, datatype = 'troposphere mesosphere'

t_name='multi datatype string'

catch,err

if err eq 0 then begin

  iug_load_mu, datatype = 'troposphere mesosphere'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5 iug_mu_meso_pwr1_org '+$
                  'iug_mu_meso_pwr2_org iug_mu_meso_pwr3_org iug_mu_meso_pwr4_org iug_mu_meso_pwr5_org iug_mu_meso_wdt1_org '+$
                  'iug_mu_meso_wdt2_org iug_mu_meso_wdt3_org iug_mu_meso_wdt4_org iug_mu_meso_wdt5_org iug_mu_meso_dpl1_org '+$
                  'iug_mu_meso_dpl2_org iug_mu_meso_dpl3_org iug_mu_meso_dpl4_org iug_mu_meso_dpl5_org iug_mu_meso_pn1_org '+$
                  'iug_mu_meso_pn2_org iug_mu_meso_pn3_org iug_mu_meso_pn4_org iug_mu_meso_pn5_org iug_mu_meso_uwnd_org '+$
                  'iug_mu_meso_vwnd_org iug_mu_meso_wwnd_org iug_mu_meso_pwr1_scr iug_mu_meso_pwr2_scr iug_mu_meso_pwr3_scr '+$
                  'iug_mu_meso_pwr4_scr iug_mu_meso_pwr5_scr iug_mu_meso_wdt1_scr iug_mu_meso_wdt2_scr iug_mu_meso_wdt3_scr '+$
                  'iug_mu_meso_wdt4_scr iug_mu_meso_wdt5_scr iug_mu_meso_dpl1_scr iug_mu_meso_dpl2_scr iug_mu_meso_dpl3_scr '+$
                  'iug_mu_meso_dpl4_scr iug_mu_meso_dpl5_scr iug_mu_meso_pn1_scr iug_mu_meso_pn2_scr iug_mu_meso_pn3_scr '+$
                  'iug_mu_meso_pn4_scr iug_mu_meso_pn5_scr iug_mu_meso_uwnd_scr iug_mu_meso_vwnd_scr iug_mu_meso_wwnd_scr '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

; 
;4 multi datatypes array
;
; iug_load_mu, datatype = ['troposphere','mesosphere']

t_name='multi datatype array'

catch,err

if err eq 0 then begin

  iug_load_mu, datatype = ['troposphere','mesosphere']

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5 iug_mu_meso_pwr1_org '+$
                  'iug_mu_meso_pwr2_org iug_mu_meso_pwr3_org iug_mu_meso_pwr4_org iug_mu_meso_pwr5_org iug_mu_meso_wdt1_org '+$
                  'iug_mu_meso_wdt2_org iug_mu_meso_wdt3_org iug_mu_meso_wdt4_org iug_mu_meso_wdt5_org iug_mu_meso_dpl1_org '+$
                  'iug_mu_meso_dpl2_org iug_mu_meso_dpl3_org iug_mu_meso_dpl4_org iug_mu_meso_dpl5_org iug_mu_meso_pn1_org '+$
                  'iug_mu_meso_pn2_org iug_mu_meso_pn3_org iug_mu_meso_pn4_org iug_mu_meso_pn5_org iug_mu_meso_uwnd_org '+$
                  'iug_mu_meso_vwnd_org iug_mu_meso_wwnd_org iug_mu_meso_pwr1_scr iug_mu_meso_pwr2_scr iug_mu_meso_pwr3_scr '+$
                  'iug_mu_meso_pwr4_scr iug_mu_meso_pwr5_scr iug_mu_meso_wdt1_scr iug_mu_meso_wdt2_scr iug_mu_meso_wdt3_scr '+$
                  'iug_mu_meso_wdt4_scr iug_mu_meso_wdt5_scr iug_mu_meso_dpl1_scr iug_mu_meso_dpl2_scr iug_mu_meso_dpl3_scr '+$
                  'iug_mu_meso_dpl4_scr iug_mu_meso_dpl5_scr iug_mu_meso_pn1_scr iug_mu_meso_pn2_scr iug_mu_meso_pn3_scr '+$
                  'iug_mu_meso_pn4_scr iug_mu_meso_pn5_scr iug_mu_meso_uwnd_scr iug_mu_meso_vwnd_scr iug_mu_meso_wwnd_scr '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;5 caps datatype
;
; iug_load_mu, datatype = 'TROPOSPHERE'
;

t_name='caps datatype'

catch,err

if err eq 0 then begin

  iug_load_mu, datatype = 'TROPOSPHERE'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all datatypes
;
; iug_load_mu, datatype = 'all'
;

t_name='all datatype'

catch,err

if err eq 0 then begin

  iug_load_mu, datatype = 'all'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5 iug_mu_meso_pwr1_org '+$
                  'iug_mu_meso_pwr2_org iug_mu_meso_pwr3_org iug_mu_meso_pwr4_org iug_mu_meso_pwr5_org iug_mu_meso_wdt1_org '+$
                  'iug_mu_meso_wdt2_org iug_mu_meso_wdt3_org iug_mu_meso_wdt4_org iug_mu_meso_wdt5_org iug_mu_meso_dpl1_org '+$
                  'iug_mu_meso_dpl2_org iug_mu_meso_dpl3_org iug_mu_meso_dpl4_org iug_mu_meso_dpl5_org iug_mu_meso_pn1_org '+$
                  'iug_mu_meso_pn2_org iug_mu_meso_pn3_org iug_mu_meso_pn4_org iug_mu_meso_pn5_org iug_mu_meso_uwnd_org '+$
                  'iug_mu_meso_vwnd_org iug_mu_meso_wwnd_org iug_mu_meso_pwr1_scr iug_mu_meso_pwr2_scr iug_mu_meso_pwr3_scr '+$
                  'iug_mu_meso_pwr4_scr iug_mu_meso_pwr5_scr iug_mu_meso_wdt1_scr iug_mu_meso_wdt2_scr iug_mu_meso_wdt3_scr '+$
                  'iug_mu_meso_wdt4_scr iug_mu_meso_wdt5_scr iug_mu_meso_dpl1_scr iug_mu_meso_dpl2_scr iug_mu_meso_dpl3_scr '+$
                  'iug_mu_meso_dpl4_scr iug_mu_meso_dpl5_scr iug_mu_meso_pn1_scr iug_mu_meso_pn2_scr iug_mu_meso_pn3_scr '+$
                  'iug_mu_meso_pn4_scr iug_mu_meso_pn5_scr iug_mu_meso_uwnd_scr iug_mu_meso_vwnd_scr iug_mu_meso_wwnd_scr '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 load * datatypes
;
; iug_load_mu, datatype = '*'
; 

t_name='* datatype'

catch,err

if err eq 0 then begin

  iug_load_mu, datatype = '*'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5 iug_mu_meso_pwr1_org '+$
                  'iug_mu_meso_pwr2_org iug_mu_meso_pwr3_org iug_mu_meso_pwr4_org iug_mu_meso_pwr5_org iug_mu_meso_wdt1_org '+$
                  'iug_mu_meso_wdt2_org iug_mu_meso_wdt3_org iug_mu_meso_wdt4_org iug_mu_meso_wdt5_org iug_mu_meso_dpl1_org '+$
                  'iug_mu_meso_dpl2_org iug_mu_meso_dpl3_org iug_mu_meso_dpl4_org iug_mu_meso_dpl5_org iug_mu_meso_pn1_org '+$
                  'iug_mu_meso_pn2_org iug_mu_meso_pn3_org iug_mu_meso_pn4_org iug_mu_meso_pn5_org iug_mu_meso_uwnd_org '+$
                  'iug_mu_meso_vwnd_org iug_mu_meso_wwnd_org iug_mu_meso_pwr1_scr iug_mu_meso_pwr2_scr iug_mu_meso_pwr3_scr '+$
                  'iug_mu_meso_pwr4_scr iug_mu_meso_pwr5_scr iug_mu_meso_wdt1_scr iug_mu_meso_wdt2_scr iug_mu_meso_wdt3_scr '+$
                  'iug_mu_meso_wdt4_scr iug_mu_meso_wdt5_scr iug_mu_meso_dpl1_scr iug_mu_meso_dpl2_scr iug_mu_meso_dpl3_scr '+$
                  'iug_mu_meso_dpl4_scr iug_mu_meso_dpl5_scr iug_mu_meso_pn1_scr iug_mu_meso_pn2_scr iug_mu_meso_pn3_scr '+$
                  'iug_mu_meso_pn4_scr iug_mu_meso_pn5_scr iug_mu_meso_uwnd_scr iug_mu_meso_vwnd_scr iug_mu_meso_wwnd_scr '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

; 
;8 single level
;
; iug_load_mu, level = 'org'
;

t_name='single level'

catch,err

if err eq 0 then begin

  iug_load_mu, level = 'org'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5 iug_mu_meso_pwr1_org '+$
                  'iug_mu_meso_pwr2_org iug_mu_meso_pwr3_org iug_mu_meso_pwr4_org iug_mu_meso_pwr5_org iug_mu_meso_wdt1_org '+$
                  'iug_mu_meso_wdt2_org iug_mu_meso_wdt3_org iug_mu_meso_wdt4_org iug_mu_meso_wdt5_org iug_mu_meso_dpl1_org '+$
                  'iug_mu_meso_dpl2_org iug_mu_meso_dpl3_org iug_mu_meso_dpl4_org iug_mu_meso_dpl5_org iug_mu_meso_pn1_org '+$
                  'iug_mu_meso_pn2_org iug_mu_meso_pn3_org iug_mu_meso_pn4_org iug_mu_meso_pn5_org iug_mu_meso_uwnd_org '+$
                  'iug_mu_meso_vwnd_org iug_mu_meso_wwnd_org'$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;9 multi levels string
;
; iug_load_mu, level = 'org scr'
;

t_name='multi level string'

catch,err

if err eq 0 then begin

  iug_load_mu, level = 'org scr'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5 iug_mu_meso_pwr1_org '+$
                  'iug_mu_meso_pwr2_org iug_mu_meso_pwr3_org iug_mu_meso_pwr4_org iug_mu_meso_pwr5_org iug_mu_meso_wdt1_org '+$
                  'iug_mu_meso_wdt2_org iug_mu_meso_wdt3_org iug_mu_meso_wdt4_org iug_mu_meso_wdt5_org iug_mu_meso_dpl1_org '+$
                  'iug_mu_meso_dpl2_org iug_mu_meso_dpl3_org iug_mu_meso_dpl4_org iug_mu_meso_dpl5_org iug_mu_meso_pn1_org '+$
                  'iug_mu_meso_pn2_org iug_mu_meso_pn3_org iug_mu_meso_pn4_org iug_mu_meso_pn5_org iug_mu_meso_uwnd_org '+$
                  'iug_mu_meso_vwnd_org iug_mu_meso_wwnd_org iug_mu_meso_pwr1_scr iug_mu_meso_pwr2_scr iug_mu_meso_pwr3_scr '+$
                  'iug_mu_meso_pwr4_scr iug_mu_meso_pwr5_scr iug_mu_meso_wdt1_scr iug_mu_meso_wdt2_scr iug_mu_meso_wdt3_scr '+$
                  'iug_mu_meso_wdt4_scr iug_mu_meso_wdt5_scr iug_mu_meso_dpl1_scr iug_mu_meso_dpl2_scr iug_mu_meso_dpl3_scr '+$
                  'iug_mu_meso_dpl4_scr iug_mu_meso_dpl5_scr iug_mu_meso_pn1_scr iug_mu_meso_pn2_scr iug_mu_meso_pn3_scr '+$
                  'iug_mu_meso_pn4_scr iug_mu_meso_pn5_scr iug_mu_meso_uwnd_scr iug_mu_meso_vwnd_scr iug_mu_meso_wwnd_scr '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;10 multi levels array
;
; iug_load_mu, level = ['org','scr']
;

t_name='multi level array'

catch,err

if err eq 0 then begin

  iug_load_mu, level = ['org','scr']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5 iug_mu_meso_pwr1_org '+$
                  'iug_mu_meso_pwr2_org iug_mu_meso_pwr3_org iug_mu_meso_pwr4_org iug_mu_meso_pwr5_org iug_mu_meso_wdt1_org '+$
                  'iug_mu_meso_wdt2_org iug_mu_meso_wdt3_org iug_mu_meso_wdt4_org iug_mu_meso_wdt5_org iug_mu_meso_dpl1_org '+$
                  'iug_mu_meso_dpl2_org iug_mu_meso_dpl3_org iug_mu_meso_dpl4_org iug_mu_meso_dpl5_org iug_mu_meso_pn1_org '+$
                  'iug_mu_meso_pn2_org iug_mu_meso_pn3_org iug_mu_meso_pn4_org iug_mu_meso_pn5_org iug_mu_meso_uwnd_org '+$
                  'iug_mu_meso_vwnd_org iug_mu_meso_wwnd_org iug_mu_meso_pwr1_scr iug_mu_meso_pwr2_scr iug_mu_meso_pwr3_scr '+$
                  'iug_mu_meso_pwr4_scr iug_mu_meso_pwr5_scr iug_mu_meso_wdt1_scr iug_mu_meso_wdt2_scr iug_mu_meso_wdt3_scr '+$
                  'iug_mu_meso_wdt4_scr iug_mu_meso_wdt5_scr iug_mu_meso_dpl1_scr iug_mu_meso_dpl2_scr iug_mu_meso_dpl3_scr '+$
                  'iug_mu_meso_dpl4_scr iug_mu_meso_dpl5_scr iug_mu_meso_pn1_scr iug_mu_meso_pn2_scr iug_mu_meso_pn3_scr '+$
                  'iug_mu_meso_pn4_scr iug_mu_meso_pn5_scr iug_mu_meso_uwnd_scr iug_mu_meso_vwnd_scr iug_mu_meso_wwnd_scr '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;11 caps level
;
; iug_load_mu, level = 'ORG'
;

t_name='caps level'

catch,err

if err eq 0 then begin

  iug_load_mu, level = 'ORG'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5 iug_mu_meso_pwr1_org '+$
                  'iug_mu_meso_pwr2_org iug_mu_meso_pwr3_org iug_mu_meso_pwr4_org iug_mu_meso_pwr5_org iug_mu_meso_wdt1_org '+$
                  'iug_mu_meso_wdt2_org iug_mu_meso_wdt3_org iug_mu_meso_wdt4_org iug_mu_meso_wdt5_org iug_mu_meso_dpl1_org '+$
                  'iug_mu_meso_dpl2_org iug_mu_meso_dpl3_org iug_mu_meso_dpl4_org iug_mu_meso_dpl5_org iug_mu_meso_pn1_org '+$
                  'iug_mu_meso_pn2_org iug_mu_meso_pn3_org iug_mu_meso_pn4_org iug_mu_meso_pn5_org iug_mu_meso_uwnd_org '+$
                  'iug_mu_meso_vwnd_org iug_mu_meso_wwnd_org'$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;12 load all levels
;
; iug_load_mu, level = 'all'
;

t_name='all level'

catch,err

if err eq 0 then begin

  iug_load_mu, level = 'all'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5 iug_mu_meso_pwr1_org '+$
                  'iug_mu_meso_pwr2_org iug_mu_meso_pwr3_org iug_mu_meso_pwr4_org iug_mu_meso_pwr5_org iug_mu_meso_wdt1_org '+$
                  'iug_mu_meso_wdt2_org iug_mu_meso_wdt3_org iug_mu_meso_wdt4_org iug_mu_meso_wdt5_org iug_mu_meso_dpl1_org '+$
                  'iug_mu_meso_dpl2_org iug_mu_meso_dpl3_org iug_mu_meso_dpl4_org iug_mu_meso_dpl5_org iug_mu_meso_pn1_org '+$
                  'iug_mu_meso_pn2_org iug_mu_meso_pn3_org iug_mu_meso_pn4_org iug_mu_meso_pn5_org iug_mu_meso_uwnd_org '+$
                  'iug_mu_meso_vwnd_org iug_mu_meso_wwnd_org iug_mu_meso_pwr1_scr iug_mu_meso_pwr2_scr iug_mu_meso_pwr3_scr '+$
                  'iug_mu_meso_pwr4_scr iug_mu_meso_pwr5_scr iug_mu_meso_wdt1_scr iug_mu_meso_wdt2_scr iug_mu_meso_wdt3_scr '+$
                  'iug_mu_meso_wdt4_scr iug_mu_meso_wdt5_scr iug_mu_meso_dpl1_scr iug_mu_meso_dpl2_scr iug_mu_meso_dpl3_scr '+$
                  'iug_mu_meso_dpl4_scr iug_mu_meso_dpl5_scr iug_mu_meso_pn1_scr iug_mu_meso_pn2_scr iug_mu_meso_pn3_scr '+$
                  'iug_mu_meso_pn4_scr iug_mu_meso_pn5_scr iug_mu_meso_uwnd_scr iug_mu_meso_vwnd_scr iug_mu_meso_wwnd_scr '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;13 load * levels
;
; iug_load_mu, level = '*'
;

t_name='* level'

catch,err

if err eq 0 then begin

  iug_load_mu, level = '*'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_stdobs_nc'

  if ~data_exists('iug_mu_trop_uwnd iug_mu_trop_vwnd iug_mu_trop_wwnd iug_mu_trop_dpl1 iug_mu_trop_dpl2 iug_mu_trop_dpl3 '+$
                  'iug_mu_trop_dpl4 iug_mu_trop_dpl5 iug_mu_trop_pwr1 iug_mu_trop_pwr2 iug_mu_trop_pwr3 iug_mu_trop_pwr4 '+$
                  'iug_mu_trop_pwr5 iug_mu_trop_wdt1 iug_mu_trop_wdt2 iug_mu_trop_wdt3 iug_mu_trop_wdt4 iug_mu_trop_wdt5 '+$
                  'iug_mu_trop_pn1 iug_mu_trop_pn2 iug_mu_trop_pn3 iug_mu_trop_pn4 iug_mu_trop_pn5 iug_mu_meso_pwr1_org '+$
                  'iug_mu_meso_pwr2_org iug_mu_meso_pwr3_org iug_mu_meso_pwr4_org iug_mu_meso_pwr5_org iug_mu_meso_wdt1_org '+$
                  'iug_mu_meso_wdt2_org iug_mu_meso_wdt3_org iug_mu_meso_wdt4_org iug_mu_meso_wdt5_org iug_mu_meso_dpl1_org '+$
                  'iug_mu_meso_dpl2_org iug_mu_meso_dpl3_org iug_mu_meso_dpl4_org iug_mu_meso_dpl5_org iug_mu_meso_pn1_org '+$
                  'iug_mu_meso_pn2_org iug_mu_meso_pn3_org iug_mu_meso_pn4_org iug_mu_meso_pn5_org iug_mu_meso_uwnd_org '+$
                  'iug_mu_meso_vwnd_org iug_mu_meso_wwnd_org iug_mu_meso_pwr1_scr iug_mu_meso_pwr2_scr iug_mu_meso_pwr3_scr '+$
                  'iug_mu_meso_pwr4_scr iug_mu_meso_pwr5_scr iug_mu_meso_wdt1_scr iug_mu_meso_wdt2_scr iug_mu_meso_wdt3_scr '+$
                  'iug_mu_meso_wdt4_scr iug_mu_meso_wdt5_scr iug_mu_meso_dpl1_scr iug_mu_meso_dpl2_scr iug_mu_meso_dpl3_scr '+$
                  'iug_mu_meso_dpl4_scr iug_mu_meso_dpl5_scr iug_mu_meso_pn1_scr iug_mu_meso_pn2_scr iug_mu_meso_pn3_scr '+$
                  'iug_mu_meso_pn4_scr iug_mu_meso_pn5_scr iug_mu_meso_uwnd_scr iug_mu_meso_vwnd_scr iug_mu_meso_wwnd_scr '$
                  ,qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

qa_t = 1

timespan,qa_timespan[qa_t,0],1,/day

;
;14 single parameter for meteor mode observarion
;
; iug_load_mu, datatype = 'meteor', parameter = 'h1t60min00'
;

t_name='single parameter'

catch,err

if err eq 0 then begin

  iug_load_mu, datatype = 'meteor', parameter = 'h1t60min00'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_meteor_nc'

  if ~data_exists('iug_mu_meteor_uwnd_h1t60min00 iug_mu_meteor_vwnd_h1t60min00 iug_mu_meteor_uwndsig_h1t60min00 '+$
                  'iug_mu_meteor_vwndsig_h1t60min00 iug_mu_meteor_mwnum_h1t60min00',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;15 multi parameters string
;
; iug_load_mu, datatype = 'meteor', parameter = 'h1t60min00 h2t60min00'
;

t_name='multi parameter string'

catch,err

if err eq 0 then begin

  iug_load_mu, datatype = 'meteor', parameter = 'h1t60min00 h2t60min00'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_meteor_nc'

  if ~data_exists('iug_mu_meteor_uwnd_h1t60min00 iug_mu_meteor_vwnd_h1t60min00 iug_mu_meteor_uwndsig_h1t60min00 '+$
                  'iug_mu_meteor_vwndsig_h1t60min00 iug_mu_meteor_mwnum_h1t60min00 iug_mu_meteor_uwnd_h2t60min00 '+$
                  'iug_mu_meteor_vwnd_h2t60min00 iug_mu_meteor_uwndsig_h2t60min00 iug_mu_meteor_vwndsig_h2t60min00 '+$
                  'iug_mu_meteor_mwnum_h2t60min00',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;16 multi parameters array
;
; iug_load_mu, datatype = 'meteor', parameter = ['h1t60min00','h2t60min00']
;

t_name='multi parameter array'

catch,err

if err eq 0 then begin

  iug_load_mu, datatype = 'meteor', parameter = ['h1t60min00','h2t60min00']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_meteor_nc'

  if ~data_exists('iug_mu_meteor_uwnd_h1t60min00 iug_mu_meteor_vwnd_h1t60min00 iug_mu_meteor_uwndsig_h1t60min00 '+$
                  'iug_mu_meteor_vwndsig_h1t60min00 iug_mu_meteor_mwnum_h1t60min00 iug_mu_meteor_uwnd_h2t60min00 '+$
                  'iug_mu_meteor_vwnd_h2t60min00 iug_mu_meteor_uwndsig_h2t60min00 iug_mu_meteor_vwndsig_h2t60min00 '+$
                  'iug_mu_meteor_mwnum_h2t60min00',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;17 caps parameters
;
; iug_load_mu, datatype = 'meteor', parameter = 'H1T60MIN00'
;

t_name='caps parameter'

catch,err

if err eq 0 then begin

  iug_load_mu, datatype = 'meteor', parameter = 'H1T60MIN00'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_meteor_nc'

  if ~data_exists('iug_mu_meteor_uwnd_h1t60min00 iug_mu_meteor_vwnd_h1t60min00 iug_mu_meteor_uwndsig_h1t60min00 '+$
                  'iug_mu_meteor_vwndsig_h1t60min00 iug_mu_meteor_mwnum_h1t60min00',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;18 load all parameters
;
; iug_load_mu, datatype = 'meteor', parameter = 'all'
;

t_name='all parameter'

catch,err

if err eq 0 then begin

  iug_load_mu, datatype = 'meteor', parameter = 'all'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_meteor_nc'

  if ~data_exists('iug_mu_meteor_uwnd_h1t60min00 iug_mu_meteor_vwnd_h1t60min00 iug_mu_meteor_uwndsig_h1t60min00 '+$
                  'iug_mu_meteor_vwndsig_h1t60min00 iug_mu_meteor_mwnum_h1t60min00 iug_mu_meteor_uwnd_h2t60min00 '+$
                  'iug_mu_meteor_vwnd_h2t60min00 iug_mu_meteor_uwndsig_h2t60min00 iug_mu_meteor_vwndsig_h2t60min00 '+$
                  'iug_mu_meteor_mwnum_h2t60min00 iug_mu_meteor_uwnd_h1t60min30 iug_mu_meteor_vwnd_h1t60min30 ' +$
                  'iug_mu_meteor_uwndsig_h1t60min30 iug_mu_meteor_vwndsig_h1t60min30 iug_mu_meteor_mwnum_h1t60min30 '+$
                  'iug_mu_meteor_uwnd_h2t60min30 iug_mu_meteor_vwnd_h2t60min30 iug_mu_meteor_uwndsig_h2t60min30 '+$
                  'iug_mu_meteor_vwndsig_h2t60min30 iug_mu_meteor_mwnum_h2t60min30',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;19 load * parameters
;
; iug_load_mu, datatype = 'meteor', parameter = 'all'
; 

t_name='* parameter'

catch,err

if err eq 0 then begin

  iug_load_mu, datatype = 'meteor', parameter = 'all'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_meteor_nc'

  if ~data_exists('iug_mu_meteor_uwnd_h1t60min00 iug_mu_meteor_vwnd_h1t60min00 iug_mu_meteor_uwndsig_h1t60min00 '+$
                  'iug_mu_meteor_vwndsig_h1t60min00 iug_mu_meteor_mwnum_h1t60min00 iug_mu_meteor_uwnd_h2t60min00 '+$
                  'iug_mu_meteor_vwnd_h2t60min00 iug_mu_meteor_uwndsig_h2t60min00 iug_mu_meteor_vwndsig_h2t60min00 '+$
                  'iug_mu_meteor_mwnum_h2t60min00 iug_mu_meteor_uwnd_h1t60min30 iug_mu_meteor_vwnd_h1t60min30 ' +$
                  'iug_mu_meteor_uwndsig_h1t60min30 iug_mu_meteor_vwndsig_h1t60min30 iug_mu_meteor_mwnum_h1t60min30 '+$
                  'iug_mu_meteor_uwnd_h2t60min30 iug_mu_meteor_vwnd_h2t60min30 iug_mu_meteor_uwndsig_h2t60min30 '+$
                  'iug_mu_meteor_vwndsig_h2t60min30 iug_mu_meteor_mwnum_h2t60min30',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;20 verbose
;
;iug_load_mu,/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_mu,/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;21 /downloadonly
;
;  iug_load_mu,/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_mu,/downloadonly

  if data_exists('iug_mu_*',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
