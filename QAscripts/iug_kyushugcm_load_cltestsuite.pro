
;1 basic
; iug_load_kyushugcm
;
;2 single datatype
;
; iug_load_kyushugcm,datatype='t'
;
;3 multi datatype string
;
; iug_load_kyushugcm,datatype='t u'
;
;4 multi datatype array
;
; iug_load_kyushugcm,datatype=['t', 'u']
;
;5 caps datatype
;
; iug_load_kyushugcm,datatype='T'
;
;6 load all datatypes (not allowed)
;
; iug_load_kyushugcm,datatype='all'
;
;7 single calmethod
;
; iug_load_kyushugcm,datatype='t',calmethod='j3'
;
;8 multi calmethod string (but only the 1st one is selected)
;
; iug_load_kyushugcm,datatype='t',calmethod='j3 s1'
;
;9 multi calmethod array (but only the 1st one is selected)
;
; iug_load_kyushugcm,datatype='t',calmethod=['j3','s1']
;
;10 caps calmethod
;
; iug_load_kyushugcm,datatype='t',calmethod='J3'
;
;11 load * calmethods (but only the 1st one is selected)
;
; iug_load_kyushugcm,datatype='t',calmethod='*'
;
;12 altitude
;
; iug_load_kyushugcm,datatype='t',/altitude
;
;13 verbose
;
; iug_load_kyushugcm,datatype='t',/verbose
;
;14 /downloadonly
;
; iug_load_kyushugcm,datatype='t',/downloadonly
;
;15 /no_download
;
; iug_load_kyushugcm,datatype='t',/no_download
;
;16 load 1D
;
; iug_load_kyushugcm,datatype='t',selparam_idx=[1,0,0],selparam_dat=[0.,10.,20.]
;
;17 load 2D
;
; iug_load_kyushugcm,datatype='t',selparam_idx=[1,1,0],selparam_dat=[0.,0.,10.]
;
;18 newname
;
; iug_load_kyushugcm,datatype='t',selparam_idx=[1,0,0],selparam_dat=[0.,10.,20.], newname='newname'
;
; Written by Y.-M. Tanaka, Oct. 20, 2011 (ytanaka at nipr.ac.jp)
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
qa_timespan1 = ['2009-01-01', '2009-01-02']

timespan,qa_timespan1

del_data,'*'

;1 Basic Test
; iug_load_kyushugcm

t_name='basic'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T'

  if ~data_exists_3d('kyushugcm_T',$
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;2 single site
;
; iug_load_kyushugcm,site='esr_42m'
;

t_name='single datatype'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='t'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T'

  if ~data_exists_3d('kyushugcm_T',$
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi datatype string
;
; iug_load_kyushugcm,datatype='t u'
;

t_name='multi datatypes string'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='t u'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T kyushugcm_U'

  if ~data_exists_3d('kyushugcm_T kyushugcm_U', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi datatype array
;
; iug_load_kyushugcm,datatype=['t', 'u']
;

t_name='multi datatypes array'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype=['t', 'u']

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T kyushugcm_U'

  if ~data_exists_3d('kyushugcm_T kyushugcm_U', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'* sites'

;
;5 caps datatype
;
; iug_load_kyushugcm,datatype='T'
;

t_name='caps datatype'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='T'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T'

  if ~data_exists_3d('kyushugcm_T', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 load all datatypes (not allowed)
;
; iug_load_kyushugcm,datatype='all'
;

t_name='all datatypes'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='all'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T'

  if data_exists_3d('kyushugcm_T', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 single calmethod
;
; iug_load_kyushugcm,datatype='t',calmethod='j3'
;

t_name='single calmethod'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='t',calmethod='j3'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T'

  if ~data_exists_3d('kyushugcm_T', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 multi calmethod string (but only the 1st one is selected)
;
; iug_load_kyushugcm,datatype='t',calmethod='j3 s1'
;

t_name='multi calmethod string'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='t',calmethod='j3 s1'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T'

  if ~data_exists_3d('kyushugcm_T', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;9 multi calmethod array (but only the 1st one is selected)
;
; iug_load_kyushugcm,datatype='t',calmethod=['j3','s1']
;

t_name='multi calmethod array'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='t',calmethod=['j3','s1']

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T'

  if ~data_exists_3d('kyushugcm_T', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'* sites'

;
;10 caps calmethod
;
; iug_load_kyushugcm,datatype='t',calmethod='J3'
;

t_name='caps calmethod'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='t',calmethod='J3'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T'

  if ~data_exists_3d('kyushugcm_T', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;11 load * calmethods (but only the 1st one is selected)
;
; iug_load_kyushugcm,datatype='t',calmethod='*'
;

t_name='* calmethods'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='t',calmethod='*'

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T'

  if ~data_exists_3d('kyushugcm_T', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;12 altitude
;
; iug_load_kyushugcm,datatype='t',/altitude
;

t_name='altitude'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='t',/altitude

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T'

  if ~data_exists_3d('kyushugcm_T', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;13 verbose
;
;iug_load_kyushugcm,datatype='t',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin

iug_load_kyushugcm,datatype='t',/verbose

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;14 /downloadonly
;
; iug_load_kyushugcm,datatype='t',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
  iug_load_kyushugcm,datatype='t',/downloadonly

  if data_exists_3d('kyushugcm_T',qa_timespan1[0],qa_timespan1[1]) $
    then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;15 /no_download
;
; iug_load_kyushugcm,datatype='t',/no_download
;

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
  iug_load_kyushugcm,datatype='t',/no_download

  if data_exists_3d('kyushugcm_T',qa_timespan1[0],qa_timespan1[1]) $
      then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

;
;16 load 1D
;
; iug_load_kyushugcm,datatype='t',selparam_idx=[1,0,0],selparam_dat=[0.,10.,20.]
;

t_name='load 1D'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='t',selparam_idx=[1,0,0],selparam_dat=[0.,10.,20.]

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T'

  if ~data_exists_3d('kyushugcm_T', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

  get_data, 'kyushugcm_T', data=d

  if size(d.y, /N_dimensions) ne 2 then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'
undefine, d

;
;17 load 2D
;
; iug_load_kyushugcm,datatype='t',selparam_idx=[1,1,0],selparam_dat=[0.,0.,10.]
;

t_name='load 2D'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='t',selparam_idx=[1,1,0],selparam_dat=[0.,0.,10.]

;just spot checking cause there are a lot of data types
  print_tvar_info,'kyushugcm_T'

  if ~data_exists_3d('kyushugcm_T', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

  get_data, 'kyushugcm_T', data=d

  if size(d.y, /N_dimensions) ne 3 then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'
undefine, d

;
;18 newname
;
; iug_load_kyushugcm,datatype='t',selparam_idx=[1,0,0],selparam_dat=[0.,10.,20.], newname='newname'
;

t_name='newname'

catch,err

if err eq 0 then begin

  iug_load_kyushugcm,datatype='t',selparam_idx=[1,0,0],selparam_dat=[0.,10.,20.], newname='newname'

;just spot checking cause there are a lot of data types
  print_tvar_info,'newname'

  if ~data_exists_3d('newname', $
	qa_timespan1[0],qa_timespan1[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


end_tests

end

