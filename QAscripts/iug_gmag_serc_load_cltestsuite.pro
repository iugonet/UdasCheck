;0 basic test
; iug_load_gmag_serc
;
;1 single site
; iug_load_gmag_serc,site='asb'
;
;2 multi sites string
; iug_load_gmag_serc,site='asb mut'
;
;3 multi sites array
; iug_load_gmag_serc,site=['asb','mut']
;
;4 caps site
; iug_load_gmag_serc,site='ASB'
;
;5 load all sites
; iug_load_gmag_serc,site='all'
;
;6 load * sites
; iug_load_gmag_serc,site='*'
;
;7 single datatype
; iug_load_gmag_serc,datatype='mag'
;
;8 caps datatype
; iug_load_gmag_serc,datatype='MAG'
;
;9 * datatype
; iug_load_gmag_serc,datatype='*'
;
;10 array datatype
; iug_load_gmag_serc,datatype='['mag']
;
;11 verbose
; iug_load_gmag_serc,site='asb',/verbose
;
;12 /downloadonly
; iug_load_gmag_serc,site='asb',/downloadonly
;
; $LastChangedBy: S. Abe $
; $LastChangedDate: 2011-11-26 $
;

init_tests

;prepare to run tests
t_num = 0

thm_init

;set to somewhere appropriate, if needed
timespan,'2008-03-23',1,/hour

del_data,'*'


;0 basic test
; iug_load_gmag_serc
;
t_name='basic'

catch,err

if err eq 0 then begin

iug_load_gmag_serc

;just spot checking cause there are a lot of data types
print_tvar_info,'magdas_mag_anc'

if ~data_exists('magdas_mag_dvs magdas_mag_onw magdas_mag_yap','2008-03-23','2008-03-24') $
  then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;1 single site
; iug_load_gmag_serc,site='asb'
;
t_name='single site'

catch,err

if err eq 0 then begin

iug_load_gmag_serc,site='asb'

;just spot checking cause there are a lot of data types
print_tvar_info,'magdas_mag_asb'

if ~data_exists('magdas_mag_asb','2008-03-23','2008-03-24') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;2 multi sites string
; iug_load_gmag_serc,site='asb mut'
;
t_name='multi site string'

catch,err

if err eq 0 then begin

iug_load_gmag_serc,site='asb mut'

;just spot checking cause there are a lot of data types
print_tvar_info,'magdas_mag_mut'

if ~data_exists('magdas_mag_asb magdas_mag_mut','2008-03-23','2008-03-24') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;3 multi sites array
; iug_load_gmag_serc,site=['asb','mut']
;
t_name='multi sites array'

catch,err

if err eq 0 then begin

iug_load_gmag_serc,site=['asb','mut']

;just spot checking cause there are a lot of data types
print_tvar_info,'magdas_mag_mut'

if ~data_exists('magdas_mag_asb magdas_mag_mut','2008-03-23','2008-03-24') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;4 caps site
; iug_load_gmag_serc,site='ASB'
;
t_name='caps site'

catch,err

if err eq 0 then begin

iug_load_gmag_serc,site=['ASB']

;just spot checking cause there are a lot of data types
print_tvar_info,'magdas_mag_asb'

if ~data_exists('magdas_mag_asb','2008-03-23','2008-03-24') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;5 load all sites
; iug_load_gmag_serc,site='all'
;
t_name='all sites'

catch,err

if err eq 0 then begin

iug_load_gmag_serc,site='all'

;just spot checking cause there are a lot of data types
print_tvar_info,'magdas_mag_asb'

if ~data_exists('magdas_mag_dvs magdas_mag_onw magdas_mag_yap','2008-03-23','2008-03-24') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;6 load * sites
; iug_load_gmag_serc,site='*'
;
t_name='*'

catch,err

if err eq 0 then begin

iug_load_gmag_serc,site='*'

;just spot checking cause there are a lot of data types
print_tvar_info,'magdas_mag_asb'

if ~data_exists('magdas_mag_dvs magdas_mag_onw magdas_mag_yap','2008-03-23','2008-03-24') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;7 single datatype
; iug_load_gmag_serc,datatype='mag'
;
t_name='single datatype'

catch,err

if err eq 0 then begin

iug_load_gmag_serc,datatype='mag'

;just spot checking cause there are a lot of data types
print_tvar_info,'magdas_mag_asb'

if ~data_exists('magdas_mag_dvs magdas_mag_onw magdas_mag_yap','2008-03-23','2008-03-24') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;8 caps datatype
; iug_load_gmag_serc,datatype='MAG'
;
t_name='caps datatype'

catch,err

if err eq 0 then begin

iug_load_gmag_serc,datatype='MAG'

;just spot checking cause there are a lot of data types
print_tvar_info,'magdas_mag_asb'

if ~data_exists('magdas_mag_dvs magdas_mag_onw magdas_mag_yap','2008-03-23','2008-03-24') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;9 * datatype
; iug_load_gmag_serc,datatype='*'
;
t_name='* datatype'

catch,err

if err eq 0 then begin

iug_load_gmag_serc,datatype = '*'

;just spot checking cause there are a lot of data types
print_tvar_info,'magdas_mag_asb'

if ~data_exists('magdas_mag_dvs magdas_mag_onw magdas_mag_yap','2008-03-23','2008-03-24') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;10 array datatype
; iug_load_gmag_serc,datatype='['mag']
;
t_name='array datatype'

catch,err

if err eq 0 then begin

iug_load_gmag_serc,datatype=['mag']

;just spot checking cause there are a lot of data types
print_tvar_info,'magdas_mag_asb'

if ~data_exists('magdas_mag_dvs magdas_mag_onw magdas_mag_yap','2008-03-23','2008-03-24') $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;11 verbose
; iug_load_gmag_serc,site='asb',/verbose
;
t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_gmag_serc,/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;12 /downloadonly
; iug_load_gmag_serc,site='asb',/downloadonly
;
t_name = '/downloadonly'

catch,err

if err eq 0 then begin
iug_load_gmag_serc,site='asb',/downloadonly

if data_exists('magdas_*_asb','2008-03-23','2008-03-24') $
  then message,'invalid data load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

end_tests

end
