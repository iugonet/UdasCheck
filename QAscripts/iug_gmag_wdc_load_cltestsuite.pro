;+
;1 basic
; iug_load_gmag_wdc
;
;2 single site
;
; iug_load_gmag_wdc,site='kak'
;
;3 multi sites string
;
; iug_load_gmag_wdc,site='kak mmb kny'
;
;4 multi sites array
;
; iug_load_gmag_wdc,site=['kak', 'mmb', 'kny']
;
;5 caps site
;
; iug_load_gmag_wdc,site='KAK'
;
;
;6 asy index
;
; iug_load_gmag_wdc,site='asy'
;
;7 sym index
;
; iug_load_gmag_wdc,site='sym'
;
;8 ae index
;
; iug_load_gmag_wdc,site='ae'
;
;9 dst index
;
; iug_load_gmag_wdc,site='dst'
;
;10 multi indices
;
; iug_load_gmag_wdc,site='asy sym ae dst'
;
;11 multi indices array
;
; iug_load_gmag_wdc,site=['asy', 'sym','ae','dst']
;
;12 caps asy index
;
; iug_load_gmag_wdc,site='ASY'
;
;13 caps sym index
;
; iug_load_gmag_wdc,site='SYM'
;
;14 caps ae indices
;
; iug_load_gmag_wdc,site='AE'
;
;15 caps dst index
;
; iug_load_gmag_wdc,site='DST'
;
;16 load all sites
;
; iug_load_gmag_wdc,site='all'
;
;17 load * sites
;
; iug_load_gmag_wdc,site='*'
;
;18 verbose
;
; iug_load_gmag_wdc,site='kak',/verbose
;
;19 /downloadonly
;
; iug_load_gmag_wdc,site='kak',/downloadonly
;
;20 /no_download
;
; iug_load_gmag_wdc,site='kak',/no_download
;
;
; Written by Yuki. KOYAMA, Nov. 11, 2011 (ykoyama at kugi.kyoto-u.ac.jp)
;-

init_tests

;prepare to run tests
t_num = 0

thm_init
;;thm_init, LOCAL_DATA_DIR='~/data/',THEMIS_REMOTE_DATA_DIR="http://themis.stp.isas.jaxa.jp/data/themis/"

qa_timespan = ['2007-01-22', '2007-01-24']

timespan,qa_timespan,24,/hour

del_data,'*'

;1 Basic Test
; iug_load_gmag_wdc

t_name='basic'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_dst_prov'
   if ~data_exists('wdc_mag_dst_prov',qa_timespan[0],qa_timespan[1]) $
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
;2 single site
;
; iug_load_gmag_wdc,site='kak'
;

t_name='single site'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site='kak'

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_kak_1min'
   if ~data_exists('wdc_mag_kak_1min',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;3 multi sites string
;
; iug_load_gmag_wdc,site='kak mmb kny'
;

t_name='multi site string'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site='kak mmb kny'

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_kak_1min wdc_mag_kny_1min wdc_mag_mmb_1min'
   if ~data_exists('wdc_mag_kak_1min wdc_mag_kny_1min wdc_mag_mmb_1min', $
                   qa_timespan[0],qa_timespan[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;4 multi sites array
;
; iug_load_gmag_wdc,site=['kak', 'mmb', 'kny']
;

t_name='multi sites array'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site=['kak', 'mmb', 'kny']
;;	print, '%%%'
;;	tplot_names
;;	print, '%%%'

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_kak_1min wdc_mag_kny_1min wdc_mag_mmb_1min'
   if ~data_exists('wdc_mag_kak_1min wdc_mag_kny_1min wdc_mag_mmb_1min', $
                   qa_timespan[0],qa_timespan[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'* sites'

;
;5 caps site
;
; iug_load_gmag_wdc,site='KAK'
;

t_name='caps site'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site=['KAK']

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_kak_1min'

   if ~data_exists('wdc_mag_kak_1min',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;6 asy index
;
; iug_load_gmag_wdc,site='asy'
;

t_name='asy index'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site='asy'

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_asy'
   if ~data_exists('wdc_mag_asy',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;7 sym index
;
; iug_load_gmag_wdc,site='sym'
;

t_name='sym index'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site='sym'

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_sym'
   if ~data_exists('wdc_mag_sym',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;8 ae indices
;
; iug_load_gmag_wdc,site='ae'
;

t_name='ae indices'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site='ae'

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_ae_prov_1min'
   if ~data_exists('wdc_mag_ae_prov_1min',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;9 dst index
;
; iug_load_gmag_wdc,site='dst'
;

t_name='dst index'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site='dst'

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_dst_prov'
   if ~data_exists('wdc_mag_dst_prov',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'


;
;10 multi indices
;
; iug_load_gmag_wdc,site='asy sym ae dst'
;

t_name='multi indices'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site='asy sym ae dst'

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_asy wdc_mag_sym wdc_mag_ae_prov_1min wdc_mag_dst_prov'
   if ~data_exists('wdc_mag_asy wdc_mag_sym wdc_mag_ae_prov_1min wdc_mag_dst_prov', $
                   qa_timespan[0],qa_timespan[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;11 multi indices array
;
; iug_load_gmag_wdc,site=['asy', 'sym', 'ae' , 'dst']
;

t_name='multi indices array'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site=['asy', 'sym', 'ae', 'dst']

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_asy wdc_mag_sym wdc_mag_ae_prov_1min wdc_mag_dst_prov'
   if ~data_exists('wdc_mag_asy wdc_mag_sym wdc_mag_ae_prov_1min wdc_mag_dst_prov', $
                   qa_timespan[0],qa_timespan[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'* sites'

;
;12 caps asy index
;
; iug_load_gmag_wdc,site='ASY'
;

t_name='caps asy index'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site=['ASY']

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_asy'

   if ~data_exists('wdc_mag_asy',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;13 caps sym index
;
; iug_load_gmag_wdc,site='SYM'
;

t_name='caps sym index'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site=['SYM']

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_sym'

   if ~data_exists('wdc_mag_sym',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;14 caps ae indices
;
; iug_load_gmag_wdc,site='AE'
;

t_name='caps ae indices'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site=['AE']

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_ae_prov_1min'

   if ~data_exists('wdc_mag_ae_prov_1min',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;15 caps dst index
;
; iug_load_gmag_wdc,site='DST'
;

t_name='caps dst index'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site=['DST']

;just spot checking cause there are a lot of data types
   print_tvar_info,'wdc_mag_dst_prov'

   if ~data_exists('wdc_mag_dst_prov',qa_timespan[0],qa_timespan[1]) $
   then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;16 load all sites
;
; iug_load_gmag_wdc,site='all'
;

t_name='all sites'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site='all'

;just spot checking cause there are a lot of data types
;removed variable, wdc_mag_asp_1min, because its all elements are NaNs.
   print_tvar_info,'wdc_mag_dst_prov wdc_mag_ae_prov_1min wdc_mag_sym wdc_mag_asy wdc_mag_aaa_1min wdc_mag_aae_1min wdc_mag_abg_1min wdc_mag_abk_1min wdc_mag_aia_1min wdc_mag_ams_1min wdc_mag_api_1min wdc_mag_aqu_1min wdc_mag_asc_1min wdc_mag_bdv_1min wdc_mag_bel_1min wdc_mag_bfe_1min wdc_mag_bfo_1min wdc_mag_bgy_1min wdc_mag_blc_1min wdc_mag_bmt_1min wdc_mag_bng_1min wdc_mag_bou_1min wdc_mag_box_1min wdc_mag_brw_1min wdc_mag_bsl_1min wdc_mag_cbb_1min wdc_mag_cbi_1min wdc_mag_clf_1min wdc_mag_cmo_1min wdc_mag_cnb_1min wdc_mag_cta_1min wdc_mag_czt_1min wdc_mag_dlr_1min wdc_mag_dob_1min wdc_mag_dou_1min wdc_mag_drv_1min  wdc_mag_ebr_1min wdc_mag_elt_1min wdc_mag_esa_1min wdc_mag_esk_1min wdc_mag_eyr_1min wdc_mag_fcc_1min wdc_mag_frd_1min wdc_mag_frn_1min wdc_mag_fur_1min wdc_mag_gck_1min wdc_mag_gna_1min wdc_mag_gua_1min wdc_mag_gui_1min wdc_mag_gzh_1min wdc_mag_had_1min wdc_mag_hbk_1min wdc_mag_her_1min wdc_mag_hlp_1min wdc_mag_hon_1min wdc_mag_hrb_1min wdc_mag_hrn_1min wdc_mag_hty_1min wdc_mag_hua_1min wdc_mag_iqa_1min wdc_mag_irt_1min wdc_mag_izn_1min wdc_mag_kak_1min wdc_mag_kdu_1min wdc_mag_kir_1min wdc_mag_kny_1min wdc_mag_knz_1min wdc_mag_kou_1min wdc_mag_ler_1min wdc_mag_liv_1min wdc_mag_lrm_1min wdc_mag_lrv_1min wdc_mag_lvv_1min wdc_mag_lzh_1min wdc_mag_mab_1min wdc_mag_maw_1min wdc_mag_mbo_1min wdc_mag_mcq_1min wdc_mag_mea_1min wdc_mag_miz_1min wdc_mag_mmb_1min wdc_mag_naq_1min wdc_mag_nck_1min wdc_mag_new_1min wdc_mag_ngk_1min wdc_mag_nur_1min wdc_mag_nvs_1min wdc_mag_ott_1min wdc_mag_paf_1min wdc_mag_pag_1min wdc_mag_pbq_1min wdc_mag_phu_1min wdc_mag_ppt_1min wdc_mag_pst_1min wdc_mag_qsb_1min wdc_mag_res_1min wdc_mag_sba_1min wdc_mag_sfs_1min wdc_mag_shu_1min wdc_mag_sit_1min wdc_mag_sjg_1min wdc_mag_sod_1min wdc_mag_spt_1min wdc_mag_stj_1min wdc_mag_sua_1min wdc_mag_tam_1min wdc_mag_tan_1min wdc_mag_teo_1min wdc_mag_thl_1min wdc_mag_thy_1min wdc_mag_trw_1min wdc_mag_tsu_1min wdc_mag_tuc_1min wdc_mag_ups_1min wdc_mag_val_1min wdc_mag_vic_1min wdc_mag_vss_1min wdc_mag_wng_1min wdc_mag_ykc_1min'

   if ~data_exists('wdc_mag_dst_prov wdc_mag_ae_prov_1min wdc_mag_sym wdc_mag_asy wdc_mag_aaa_1min wdc_mag_aae_1min wdc_mag_abg_1min wdc_mag_abk_1min wdc_mag_aia_1min wdc_mag_ams_1min wdc_mag_api_1min wdc_mag_aqu_1min wdc_mag_asc_1min wdc_mag_bdv_1min wdc_mag_bel_1min wdc_mag_bfe_1min wdc_mag_bfo_1min wdc_mag_bgy_1min wdc_mag_blc_1min wdc_mag_bmt_1min wdc_mag_bng_1min wdc_mag_bou_1min wdc_mag_box_1min wdc_mag_brw_1min wdc_mag_bsl_1min wdc_mag_cbb_1min wdc_mag_cbi_1min wdc_mag_clf_1min wdc_mag_cmo_1min wdc_mag_cnb_1min wdc_mag_cta_1min wdc_mag_czt_1min wdc_mag_dlr_1min wdc_mag_dob_1min wdc_mag_dou_1min wdc_mag_drv_1min  wdc_mag_ebr_1min wdc_mag_elt_1min wdc_mag_esa_1min wdc_mag_esk_1min wdc_mag_eyr_1min wdc_mag_fcc_1min wdc_mag_frd_1min wdc_mag_frn_1min wdc_mag_fur_1min wdc_mag_gck_1min wdc_mag_gna_1min wdc_mag_gua_1min wdc_mag_gui_1min wdc_mag_gzh_1min wdc_mag_had_1min wdc_mag_hbk_1min wdc_mag_her_1min wdc_mag_hlp_1min wdc_mag_hon_1min wdc_mag_hrb_1min wdc_mag_hrn_1min wdc_mag_hty_1min wdc_mag_hua_1min wdc_mag_iqa_1min wdc_mag_irt_1min wdc_mag_izn_1min wdc_mag_kak_1min wdc_mag_kdu_1min wdc_mag_kir_1min wdc_mag_kny_1min wdc_mag_knz_1min wdc_mag_kou_1min wdc_mag_ler_1min wdc_mag_liv_1min wdc_mag_lrm_1min wdc_mag_lrv_1min wdc_mag_lvv_1min wdc_mag_lzh_1min wdc_mag_mab_1min wdc_mag_maw_1min wdc_mag_mbo_1min wdc_mag_mcq_1min wdc_mag_mea_1min wdc_mag_miz_1min wdc_mag_mmb_1min wdc_mag_naq_1min wdc_mag_nck_1min wdc_mag_new_1min wdc_mag_ngk_1min wdc_mag_nur_1min wdc_mag_nvs_1min wdc_mag_ott_1min wdc_mag_paf_1min wdc_mag_pag_1min wdc_mag_pbq_1min wdc_mag_phu_1min wdc_mag_ppt_1min wdc_mag_pst_1min wdc_mag_qsb_1min wdc_mag_res_1min wdc_mag_sba_1min wdc_mag_sfs_1min wdc_mag_shu_1min wdc_mag_sit_1min wdc_mag_sjg_1min wdc_mag_sod_1min wdc_mag_spt_1min wdc_mag_stj_1min wdc_mag_sua_1min wdc_mag_tam_1min wdc_mag_tan_1min wdc_mag_teo_1min wdc_mag_thl_1min wdc_mag_thy_1min wdc_mag_trw_1min wdc_mag_tsu_1min wdc_mag_tuc_1min wdc_mag_ups_1min wdc_mag_val_1min wdc_mag_vic_1min wdc_mag_vss_1min wdc_mag_wng_1min wdc_mag_ykc_1min', $
                   qa_timespan[0],qa_timespan[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;17 load * sites
;
; iug_load_gmag_wdc,site='*'
;

t_name='* sites'

catch,err

if err eq 0 then begin

   iug_load_gmag_wdc,site='*'

;just spot checking cause there are a lot of data types
;removed variable, wdc_mag_asp_1min, because its all elements are NaNs.
   print_tvar_info,'wdc_mag_dst_prov wdc_mag_ae_prov_1min wdc_mag_sym wdc_mag_asy wdc_mag_aaa_1min wdc_mag_aae_1min wdc_mag_abg_1min wdc_mag_abk_1min wdc_mag_aia_1min wdc_mag_ams_1min wdc_mag_api_1min wdc_mag_aqu_1min wdc_mag_asc_1min wdc_mag_bdv_1min wdc_mag_bel_1min wdc_mag_bfe_1min wdc_mag_bfo_1min wdc_mag_bgy_1min wdc_mag_blc_1min wdc_mag_bmt_1min wdc_mag_bng_1min wdc_mag_bou_1min wdc_mag_box_1min wdc_mag_brw_1min wdc_mag_bsl_1min wdc_mag_cbb_1min wdc_mag_cbi_1min wdc_mag_clf_1min wdc_mag_cmo_1min wdc_mag_cnb_1min wdc_mag_cta_1min wdc_mag_czt_1min wdc_mag_dlr_1min wdc_mag_dob_1min wdc_mag_dou_1min wdc_mag_drv_1min  wdc_mag_ebr_1min wdc_mag_elt_1min wdc_mag_esa_1min wdc_mag_esk_1min wdc_mag_eyr_1min wdc_mag_fcc_1min wdc_mag_frd_1min wdc_mag_frn_1min wdc_mag_fur_1min wdc_mag_gck_1min wdc_mag_gna_1min wdc_mag_gua_1min wdc_mag_gui_1min wdc_mag_gzh_1min wdc_mag_had_1min wdc_mag_hbk_1min wdc_mag_her_1min wdc_mag_hlp_1min wdc_mag_hon_1min wdc_mag_hrb_1min wdc_mag_hrn_1min wdc_mag_hty_1min wdc_mag_hua_1min wdc_mag_iqa_1min wdc_mag_irt_1min wdc_mag_izn_1min wdc_mag_kak_1min wdc_mag_kdu_1min wdc_mag_kir_1min wdc_mag_kny_1min wdc_mag_knz_1min wdc_mag_kou_1min wdc_mag_ler_1min wdc_mag_liv_1min wdc_mag_lrm_1min wdc_mag_lrv_1min wdc_mag_lvv_1min wdc_mag_lzh_1min wdc_mag_mab_1min wdc_mag_maw_1min wdc_mag_mbo_1min wdc_mag_mcq_1min wdc_mag_mea_1min wdc_mag_miz_1min wdc_mag_mmb_1min wdc_mag_naq_1min wdc_mag_nck_1min wdc_mag_new_1min wdc_mag_ngk_1min wdc_mag_nur_1min wdc_mag_nvs_1min wdc_mag_ott_1min wdc_mag_paf_1min wdc_mag_pag_1min wdc_mag_pbq_1min wdc_mag_phu_1min wdc_mag_ppt_1min wdc_mag_pst_1min wdc_mag_qsb_1min wdc_mag_res_1min wdc_mag_sba_1min wdc_mag_sfs_1min wdc_mag_shu_1min wdc_mag_sit_1min wdc_mag_sjg_1min wdc_mag_sod_1min wdc_mag_spt_1min wdc_mag_stj_1min wdc_mag_sua_1min wdc_mag_tam_1min wdc_mag_tan_1min wdc_mag_teo_1min wdc_mag_thl_1min wdc_mag_thy_1min wdc_mag_trw_1min wdc_mag_tsu_1min wdc_mag_tuc_1min wdc_mag_ups_1min wdc_mag_val_1min wdc_mag_vic_1min wdc_mag_vss_1min wdc_mag_wng_1min wdc_mag_ykc_1min'

   if ~data_exists('wdc_mag_dst_prov wdc_mag_ae_prov_1min wdc_mag_sym wdc_mag_asy wdc_mag_aaa_1min wdc_mag_aae_1min wdc_mag_abg_1min wdc_mag_abk_1min wdc_mag_aia_1min wdc_mag_ams_1min wdc_mag_api_1min wdc_mag_aqu_1min wdc_mag_asc_1min wdc_mag_bdv_1min wdc_mag_bel_1min wdc_mag_bfe_1min wdc_mag_bfo_1min wdc_mag_bgy_1min wdc_mag_blc_1min wdc_mag_bmt_1min wdc_mag_bng_1min wdc_mag_bou_1min wdc_mag_box_1min wdc_mag_brw_1min wdc_mag_bsl_1min wdc_mag_cbb_1min wdc_mag_cbi_1min wdc_mag_clf_1min wdc_mag_cmo_1min wdc_mag_cnb_1min wdc_mag_cta_1min wdc_mag_czt_1min wdc_mag_dlr_1min wdc_mag_dob_1min wdc_mag_dou_1min wdc_mag_drv_1min  wdc_mag_ebr_1min wdc_mag_elt_1min wdc_mag_esa_1min wdc_mag_esk_1min wdc_mag_eyr_1min wdc_mag_fcc_1min wdc_mag_frd_1min wdc_mag_frn_1min wdc_mag_fur_1min wdc_mag_gck_1min wdc_mag_gna_1min wdc_mag_gua_1min wdc_mag_gui_1min wdc_mag_gzh_1min wdc_mag_had_1min wdc_mag_hbk_1min wdc_mag_her_1min wdc_mag_hlp_1min wdc_mag_hon_1min wdc_mag_hrb_1min wdc_mag_hrn_1min wdc_mag_hty_1min wdc_mag_hua_1min wdc_mag_iqa_1min wdc_mag_irt_1min wdc_mag_izn_1min wdc_mag_kak_1min wdc_mag_kdu_1min wdc_mag_kir_1min wdc_mag_kny_1min wdc_mag_knz_1min wdc_mag_kou_1min wdc_mag_ler_1min wdc_mag_liv_1min wdc_mag_lrm_1min wdc_mag_lrv_1min wdc_mag_lvv_1min wdc_mag_lzh_1min wdc_mag_mab_1min wdc_mag_maw_1min wdc_mag_mbo_1min wdc_mag_mcq_1min wdc_mag_mea_1min wdc_mag_miz_1min wdc_mag_mmb_1min wdc_mag_naq_1min wdc_mag_nck_1min wdc_mag_new_1min wdc_mag_ngk_1min wdc_mag_nur_1min wdc_mag_nvs_1min wdc_mag_ott_1min wdc_mag_paf_1min wdc_mag_pag_1min wdc_mag_pbq_1min wdc_mag_phu_1min wdc_mag_ppt_1min wdc_mag_pst_1min wdc_mag_qsb_1min wdc_mag_res_1min wdc_mag_sba_1min wdc_mag_sfs_1min wdc_mag_shu_1min wdc_mag_sit_1min wdc_mag_sjg_1min wdc_mag_sod_1min wdc_mag_spt_1min wdc_mag_stj_1min wdc_mag_sua_1min wdc_mag_tam_1min wdc_mag_tan_1min wdc_mag_teo_1min wdc_mag_thl_1min wdc_mag_thy_1min wdc_mag_trw_1min wdc_mag_tsu_1min wdc_mag_tuc_1min wdc_mag_ups_1min wdc_mag_val_1min wdc_mag_vic_1min wdc_mag_vss_1min wdc_mag_wng_1min wdc_mag_ykc_1min', $
                   qa_timespan[0],qa_timespan[1]) then message,'invalid load'

endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;18 verbose
;
;iug_load_gmag_wdc,site='kak',/verbose
;

t_name='verbose'

catch,err

if err eq 0 then begin
   iug_load_gmag_wdc,site='kak',/verbose
endif

catch,/cancel

handle_error,err,t_name,++t_num

del_data,'*'

;
;19 /downloadonly
;
;  iug_load_gmag_wdc,site='kak',/downloadonly
;

t_name = '/downloadonly'
catch,err
if err eq 0 then begin
   iug_load_gmag_wdc,site='kak',/downloadonly

   if data_exists('wdc_mag_kak_1min',qa_timespan,qa_timespan) $
   then message,'invalid load'

endif
catch,/cancel
handle_error,err,t_name,++t_num

del_data,'*'

;
;20 /no_download
;
;iug_load_gmag_wdc, /no_download
;

t_name = '/no_download'

currdir=root_data_dir()
setenv,'ROOT_DATA_DIR=' + getenv('IDL_TMPDIR') + 'data/'; make sure there is no data here

catch,err

if err eq 0 then begin
   iug_load_gmag_wdc,site='kak',/no_download

   if data_exists('wdc_mag_kak_1min',qa_timespan,qa_timespan) $
   then message, 'Unexpected data in temporary directory'+root_data_dir()

endif

catch,/cancel
handle_error,err,t_name,++t_num
setenv,'ROOT_DATA_DIR=' + currdir

del_data,'*'

end_tests

end
