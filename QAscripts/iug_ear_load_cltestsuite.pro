
;1 basic
; iug_load_ear
;
;2 single datatype
;
; iug_load_ear,datatype='troposphere'
; 
;3 multi datatypes string
;
; iug_load_ear, datatype = 'troposphere e_region'
;
;4 multi datatypes array
;
; iug_load_ear, datatype = ['troposphere','e_region','f_region']
;
;5 caps datatype
;
; iug_load_ear,datatype= 'TROPOSPHERE'
; 
;6 load all datatypes
;
; iug_load_ear,datatype = 'all'
;
;7 * datatype
;
; iug_load_mu,datatype='*'
;
;8 array datatype
;
; iug_load_ear, datatype = ['troposphere']
; 
;9 single parameter
;
; iug_load_ear,datatype='e_region',parameter='eb3p4b'
;
;10 multi parameters string
;
; iug_load_ear,datatype='e_region',parameter = 'eb3p4b fb1p16j4'
;
;11 multi parameters array
;
; iug_load_ear,datatype='e_region',parameter = ['eb3p4b', 'fb1p16j4', 'fb1p16k3']
;
;12 caps parameter
;
; iug_load_ear,datatype='e_region',parameter ='EB3P4B'
;
;13 * parameter
;
; iug_load_ear,datatype='e_region',parameter ='*'
;
;14 array parameter
;
; iug_load_ear,datatype='e_region',parameter =['eb3p4b']
; 
;15 all parameter
;
; iug_load_ear,datatype='e_region',parameter ='all'
;
;16 verbose
;
; iug_load_ear,/verbose
;
;17 /downloadonly
;
; iug_load_ear,/downloadonly
;
;
;
; $LastChangedBy: A. Shinbori $
; $LastChangedDate: 2011-11-08 (08 Nov 2011) $
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
;	*** set time span ***
qa_timespan = strarr(2,2)

qa_timespan[0,*] = [ '2005-08-24', '2005-08-25']

qa_timespan[1,*] = [ '2011-07-01', '2011-07-02']

qa_t = 0
;;qa_t = 1

timespan,qa_timespan[qa_t,0],1,/hour

del_data,'*'

;1 Basic Test
; iug_load_ear

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_ear

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_trop_nc ear_fai_nc'

  if ~data_exists('iug_ear_trop_uwnd iug_ear_trop_vwnd iug_ear_trop_wwnd iug_ear_trop_pwr1 iug_ear_trop_pwr2 iug_ear_trop_pwr3 iug_ear_trop_pwr4 '+$
                  'iug_ear_trop_pwr5 iug_ear_trop_wdt1 iug_ear_trop_wdt2 iug_ear_trop_wdt3 iug_ear_trop_wdt4 iug_ear_trop_wdt5 iug_ear_trop_pn1 '+$
                  'iug_ear_trop_pn2 iug_ear_trop_pn3 iug_ear_trop_pn4 iug_ear_trop_pn5 iug_ear_trop_dpl1 iug_ear_trop_dpl2 iug_ear_trop_dpl3 '+$
                  'iug_ear_trop_dpl4 iug_ear_trop_dpl5 iug_ear_faieb3p4b_pwr1 iug_ear_faieb3p4b_pwr2 iug_ear_faieb3p4b_pwr3 '+$
                  'iug_ear_faieb3p4b_wdt1 iug_ear_faieb3p4b_wdt2 iug_ear_faieb3p4b_wdt3 iug_ear_faieb3p4b_dpl1 '+$
                  'iug_ear_faieb3p4b_dpl2 iug_ear_faieb3p4b_dpl3 iug_ear_faieb3p4b_pn1 iug_ear_faieb3p4b_pn2 '+$
                  'iug_ear_faieb3p4b_pn3',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single datatype
;
; iug_load_ear, datatype = 'troposphere'
;

t_name='single datatype'

catch,err

if err eq 0 then begin

  iug_load_ear, datatype = 'troposphere'

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_trop_nc'

  if ~data_exists('iug_ear_trop_uwnd iug_ear_trop_vwnd iug_ear_trop_wwnd iug_ear_trop_pwr1 iug_ear_trop_pwr2 iug_ear_trop_pwr3 iug_ear_trop_pwr4 '+$
                  'iug_ear_trop_pwr5 iug_ear_trop_wdt1 iug_ear_trop_wdt2 iug_ear_trop_wdt3 iug_ear_trop_wdt4 iug_ear_trop_wdt5 iug_ear_trop_pn1 '+$
                  'iug_ear_trop_pn2 iug_ear_trop_pn3 iug_ear_trop_pn4 iug_ear_trop_pn5 iug_ear_trop_dpl1 iug_ear_trop_dpl2 iug_ear_trop_dpl3 '+$
                  'iug_ear_trop_dpl4 iug_ear_trop_dpl5',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;3 multi datatypes string
;
; iug_load_ear, datatype = 'troposphere e_region'

t_name='multi datatype'

catch,err

if err eq 0 then begin

  iug_load_ear, datatype = 'troposphere e_region'

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_trop_nc ear_fai_nc'

  if ~data_exists('iug_ear_trop_uwnd iug_ear_trop_vwnd iug_ear_trop_wwnd iug_ear_trop_pwr1 iug_ear_trop_pwr2 iug_ear_trop_pwr3 iug_ear_trop_pwr4 '+$
                  'iug_ear_trop_pwr5 iug_ear_trop_wdt1 iug_ear_trop_wdt2 iug_ear_trop_wdt3 iug_ear_trop_wdt4 iug_ear_trop_wdt5 iug_ear_trop_pn1 '+$
                  'iug_ear_trop_pn2 iug_ear_trop_pn3 iug_ear_trop_pn4 iug_ear_trop_pn5 iug_ear_trop_dpl1 iug_ear_trop_dpl2 iug_ear_trop_dpl3 '+$
                  'iug_ear_trop_dpl4 iug_ear_trop_dpl5 iug_ear_faieb3p4b_pwr1 iug_ear_faieb3p4b_pwr2 iug_ear_faieb3p4b_pwr3 '+$
                  'iug_ear_faieb3p4b_wdt1 iug_ear_faieb3p4b_wdt2 iug_ear_faieb3p4b_wdt3 iug_ear_faieb3p4b_dpl1 '+$
                  'iug_ear_faieb3p4b_dpl2 iug_ear_faieb3p4b_dpl3 iug_ear_faieb3p4b_pn1 iug_ear_faieb3p4b_pn2 '+$
                  'iug_ear_faieb3p4b_pn3',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;4 multi datatypes array
;
; iug_load_ear, datatype = ['troposphere','e_region','f_region']

t_name='multi datatype array'

catch,err

if err eq 0 then begin

  iug_load_ear, datatype = ['troposphere','e_region','f_region']

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_trop_nc ear_fai_nc'

  if ~data_exists('iug_ear_trop_uwnd iug_ear_trop_vwnd iug_ear_trop_wwnd iug_ear_trop_pwr1 iug_ear_trop_pwr2 iug_ear_trop_pwr3 iug_ear_trop_pwr4 '+$
                  'iug_ear_trop_pwr5 iug_ear_trop_wdt1 iug_ear_trop_wdt2 iug_ear_trop_wdt3 iug_ear_trop_wdt4 iug_ear_trop_wdt5 iug_ear_trop_pn1 '+$
                  'iug_ear_trop_pn2 iug_ear_trop_pn3 iug_ear_trop_pn4 iug_ear_trop_pn5 iug_ear_trop_dpl1 iug_ear_trop_dpl2 iug_ear_trop_dpl3 '+$
                  'iug_ear_trop_dpl4 iug_ear_trop_dpl5 iug_ear_faieb3p4b_pwr1 iug_ear_faieb3p4b_pwr2 iug_ear_faieb3p4b_pwr3 '+$
                  'iug_ear_faieb3p4b_wdt1 iug_ear_faieb3p4b_wdt2 iug_ear_faieb3p4b_wdt3 iug_ear_faieb3p4b_dpl1 '+$
                  'iug_ear_faieb3p4b_dpl2 iug_ear_faieb3p4b_dpl3 iug_ear_faieb3p4b_pn1 iug_ear_faieb3p4b_pn2 '+$
                  'iug_ear_faieb3p4b_pn3',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;5 caps datatype
;
; iug_load_ear, datatype = 'TROPOSPHERE'
;

t_name='caps datatype'

catch,err

if err eq 0 then begin

  iug_load_ear, datatype = 'TROPOSPHERE'
	print, tnames('*')

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_trop_nc'

  if ~data_exists('iug_ear_trop_uwnd iug_ear_trop_vwnd iug_ear_trop_wwnd iug_ear_trop_pwr1 iug_ear_trop_pwr2 iug_ear_trop_pwr3 iug_ear_trop_pwr4 '+$
                  'iug_ear_trop_pwr5 iug_ear_trop_wdt1 iug_ear_trop_wdt2 iug_ear_trop_wdt3 iug_ear_trop_wdt4 iug_ear_trop_wdt5 iug_ear_trop_pn1 '+$
                  'iug_ear_trop_pn2 iug_ear_trop_pn3 iug_ear_trop_pn4 iug_ear_trop_pn5 iug_ear_trop_dpl1 iug_ear_trop_dpl2 iug_ear_trop_dpl3 '+$
                  'iug_ear_trop_dpl4 iug_ear_trop_dpl5',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all datatypes
;
; iug_load_ear,datatype = 'all'
;

t_name='all datatype'

catch,err

if err eq 0 then begin

  iug_load_ear, datatype = 'all'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_trop_nc ear_fai_nc'

  if ~data_exists('iug_ear_trop_uwnd iug_ear_trop_vwnd iug_ear_trop_wwnd iug_ear_trop_pwr1 iug_ear_trop_pwr2 iug_ear_trop_pwr3 iug_ear_trop_pwr4 '+$
                  'iug_ear_trop_pwr5 iug_ear_trop_wdt1 iug_ear_trop_wdt2 iug_ear_trop_wdt3 iug_ear_trop_wdt4 iug_ear_trop_wdt5 iug_ear_trop_pn1 '+$
                  'iug_ear_trop_pn2 iug_ear_trop_pn3 iug_ear_trop_pn4 iug_ear_trop_pn5 iug_ear_trop_dpl1 iug_ear_trop_dpl2 iug_ear_trop_dpl3 '+$
                  'iug_ear_trop_dpl4 iug_ear_trop_dpl5 iug_ear_faieb3p4b_pwr1 iug_ear_faieb3p4b_pwr2 iug_ear_faieb3p4b_pwr3 '+$
                  'iug_ear_faieb3p4b_wdt1 iug_ear_faieb3p4b_wdt2 iug_ear_faieb3p4b_wdt3 iug_ear_faieb3p4b_dpl1 '+$
                  'iug_ear_faieb3p4b_dpl2 iug_ear_faieb3p4b_dpl3 iug_ear_faieb3p4b_pn1 iug_ear_faieb3p4b_pn2 '+$
                  'iug_ear_faieb3p4b_pn3',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;7 * datatype
;
; iug_load_ear,datatype = '*'
;

t_name='* datatype'

catch,err

if err eq 0 then begin

  iug_load_ear, datatype = '*'
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_trop_nc ear_fai_nc'

  if ~data_exists('iug_ear_trop_uwnd iug_ear_trop_vwnd iug_ear_trop_wwnd iug_ear_trop_pwr1 iug_ear_trop_pwr2 iug_ear_trop_pwr3 iug_ear_trop_pwr4 '+$
                  'iug_ear_trop_pwr5 iug_ear_trop_wdt1 iug_ear_trop_wdt2 iug_ear_trop_wdt3 iug_ear_trop_wdt4 iug_ear_trop_wdt5 iug_ear_trop_pn1 '+$
                  'iug_ear_trop_pn2 iug_ear_trop_pn3 iug_ear_trop_pn4 iug_ear_trop_pn5 iug_ear_trop_dpl1 iug_ear_trop_dpl2 iug_ear_trop_dpl3 '+$
                  'iug_ear_trop_dpl4 iug_ear_trop_dpl5 iug_ear_faieb3p4b_pwr1 iug_ear_faieb3p4b_pwr2 iug_ear_faieb3p4b_pwr3 '+$
                  'iug_ear_faieb3p4b_wdt1 iug_ear_faieb3p4b_wdt2 iug_ear_faieb3p4b_wdt3 iug_ear_faieb3p4b_dpl1 '+$
                  'iug_ear_faieb3p4b_dpl2 iug_ear_faieb3p4b_dpl3 iug_ear_faieb3p4b_pn1 iug_ear_faieb3p4b_pn2 '+$
                  'iug_ear_faieb3p4b_pn3',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
     then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;8 array datatype
;
; iug_load_ear, datatype = ['troposphere']

t_name='array datatype'

catch,err

if err eq 0 then begin

  iug_load_ear, datatype = ['troposphere']
  print, tnames('*')

;just spot checking cause there are a lot of data types
  print_tvar_info,'mu_trop_nc'

  if ~data_exists('iug_ear_trop_uwnd iug_ear_trop_vwnd iug_ear_trop_wwnd iug_ear_trop_pwr1 iug_ear_trop_pwr2 iug_ear_trop_pwr3 iug_ear_trop_pwr4 '+$
                  'iug_ear_trop_pwr5 iug_ear_trop_wdt1 iug_ear_trop_wdt2 iug_ear_trop_wdt3 iug_ear_trop_wdt4 iug_ear_trop_wdt5 iug_ear_trop_pn1 '+$
                  'iug_ear_trop_pn2 iug_ear_trop_pn3 iug_ear_trop_pn4 iug_ear_trop_pn5 iug_ear_trop_dpl1 iug_ear_trop_dpl2 iug_ear_trop_dpl3 '+$
                  'iug_ear_trop_dpl4 iug_ear_trop_dpl5',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;9 single parameter
;
; iug_load_ear,datatype='e_region',parameter='eb3p4b'
;

t_name='single parameter'

catch,err

if err eq 0 then begin

  iug_load_ear,datatype='e_region',parameter='eb3p4b'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_fai_nc'

  if ~data_exists('iug_ear_faieb3p4b_pwr1 iug_ear_faieb3p4b_pwr2 iug_ear_faieb3p4b_pwr3 '+$
                  'iug_ear_faieb3p4b_wdt1 iug_ear_faieb3p4b_wdt2 iug_ear_faieb3p4b_wdt3 iug_ear_faieb3p4b_dpl1 '+$
                  'iug_ear_faieb3p4b_dpl2 iug_ear_faieb3p4b_dpl3 iug_ear_faieb3p4b_pn1 iug_ear_faieb3p4b_pn2 '+$
                  'iug_ear_faieb3p4b_pn3',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;10 multi parameters string
;
; iug_load_ear,datatype='e_region',parameter = 'eb3p4b fb1p16j4'

t_name='multi parameters string'

catch,err

if err eq 0 then begin

  iug_load_ear,datatype='e_region',parameter = 'eb3p4b fb1p16j4'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_fai_nc'

  if ~data_exists('iug_ear_faieb3p4b_pwr1 iug_ear_faieb3p4b_pwr2 iug_ear_faieb3p4b_pwr3 '+$
                  'iug_ear_faieb3p4b_wdt1 iug_ear_faieb3p4b_wdt2 iug_ear_faieb3p4b_wdt3 iug_ear_faieb3p4b_dpl1 '+$
                  'iug_ear_faieb3p4b_dpl2 iug_ear_faieb3p4b_dpl3 iug_ear_faieb3p4b_pn1 iug_ear_faieb3p4b_pn2 '+$
                  'iug_ear_faieb3p4b_pn3',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;11 multi parameters array
;
; iug_load_ear,datatype='e_region',parameter = ['eb3p4b', 'fb1p16j4', 'fb1p16k3']

t_name='multi parameters array'

catch,err

if err eq 0 then begin

  iug_load_ear,datatype='e_region',parameter = ['eb3p4b', 'fb1p16j4', 'fb1p16k3']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_fai_nc'

  if ~data_exists('iug_ear_faieb3p4b_pwr1 iug_ear_faieb3p4b_pwr2 iug_ear_faieb3p4b_pwr3 '+$
                  'iug_ear_faieb3p4b_wdt1 iug_ear_faieb3p4b_wdt2 iug_ear_faieb3p4b_wdt3 iug_ear_faieb3p4b_dpl1 '+$
                  'iug_ear_faieb3p4b_dpl2 iug_ear_faieb3p4b_dpl3 iug_ear_faieb3p4b_pn1 iug_ear_faieb3p4b_pn2 '+$
                  'iug_ear_faieb3p4b_pn3',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;12 caps parameter
;
; iug_load_ear,datatype='e_region',parameter ='EB3P4B'

t_name='caps parameter'

catch,err

if err eq 0 then begin

  iug_load_ear,datatype='e_region',parameter ='EB3P4B'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_fai_nc'

  if ~data_exists('iug_ear_faieb3p4b_pwr1 iug_ear_faieb3p4b_pwr2 iug_ear_faieb3p4b_pwr3 '+$
                  'iug_ear_faieb3p4b_wdt1 iug_ear_faieb3p4b_wdt2 iug_ear_faieb3p4b_wdt3 iug_ear_faieb3p4b_dpl1 '+$
                  'iug_ear_faieb3p4b_dpl2 iug_ear_faieb3p4b_dpl3 iug_ear_faieb3p4b_pn1 iug_ear_faieb3p4b_pn2 '+$
                  'iug_ear_faieb3p4b_pn3',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;13 * parameter
;
; iug_load_ear,datatype='e_region',parameter ='*'

t_name='caps parameter'

catch,err

if err eq 0 then begin

  iug_load_ear,datatype='e_region',parameter ='*'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_fai_nc'

  if ~data_exists('iug_ear_faieb3p4b_pwr1 iug_ear_faieb3p4b_pwr2 iug_ear_faieb3p4b_pwr3 '+$
                  'iug_ear_faieb3p4b_wdt1 iug_ear_faieb3p4b_wdt2 iug_ear_faieb3p4b_wdt3 iug_ear_faieb3p4b_dpl1 '+$
                  'iug_ear_faieb3p4b_dpl2 iug_ear_faieb3p4b_dpl3 iug_ear_faieb3p4b_pn1 iug_ear_faieb3p4b_pn2 '+$
                  'iug_ear_faieb3p4b_pn3',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;14 array parameter
;
; iug_load_ear,datatype='e_region',parameter =['eb3p4b']

t_name='array parameter'

catch,err

if err eq 0 then begin

  iug_load_ear,datatype='e_region',parameter =['eb3p4b']
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_fai_nc'

  if ~data_exists('iug_ear_faieb3p4b_pwr1 iug_ear_faieb3p4b_pwr2 iug_ear_faieb3p4b_pwr3 '+$
                  'iug_ear_faieb3p4b_wdt1 iug_ear_faieb3p4b_wdt2 iug_ear_faieb3p4b_wdt3 iug_ear_faieb3p4b_dpl1 '+$
                  'iug_ear_faieb3p4b_dpl2 iug_ear_faieb3p4b_dpl3 iug_ear_faieb3p4b_pn1 iug_ear_faieb3p4b_pn2 '+$
                  'iug_ear_faieb3p4b_pn3',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;15 all parameter
;
; iug_load_ear,datatype='e_region',parameter ='all'

t_name='all parameter'

catch,err

if err eq 0 then begin

  iug_load_ear,datatype='e_region',parameter ='all'
;;  print, '%%%'
;;  tplot_names
;;  print, '%%%'

;just spot checking cause there are a lot of data types
  print_tvar_info,'ear_fai_nc'

  if ~data_exists('iug_ear_faieb3p4b_pwr1 iug_ear_faieb3p4b_pwr2 iug_ear_faieb3p4b_pwr3 '+$
                  'iug_ear_faieb3p4b_wdt1 iug_ear_faieb3p4b_wdt2 iug_ear_faieb3p4b_wdt3 iug_ear_faieb3p4b_dpl1 '+$
                  'iug_ear_faieb3p4b_dpl2 iug_ear_faieb3p4b_dpl3 iug_ear_faieb3p4b_pn1 iug_ear_faieb3p4b_pn2 '+$
                  'iug_ear_faieb3p4b_pn3',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;16 verbose
;
;iug_load_ear,/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_ear,/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;17 /downloadonly
;
;  iug_load_ear,/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_ear,/downloadonly

  if data_exists('iug_ear_* iug_ear_fai*',qa_timespan[qa_t,0],qa_timespan[qa_t,1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
