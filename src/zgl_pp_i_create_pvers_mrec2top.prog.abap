************************************************************************
* 5/21/19   smartShift project
* Rules applied:  110 153 712
************************************************************************

*&---------------------------------------------------------------------*
*&  Include           Z_GL_PP_I_CREATE_PVERS_MRECTOP
*&---------------------------------------------------------------------*
*               D A T A   D E C L A R A T I O N                        *
*&---------------------------------------------------------------------*
*----------------------------------------------------------------------*
* Tables                                                           *
*----------------------------------------------------------------------*
TABLES: mara,
        marc,
        t024l,
        t437p,
        t412,
*        plko,
        zgl_rectempl.

TABLES sscrfields. "Additional buttons
INCLUDE ZGL_PP_I_CREATE_PVERS_MREC2_TY.
INCLUDE <icon>.
*----------------------------------------------------------------------*
* Type-pools                                                           *
*----------------------------------------------------------------------*
TYPE-POOLS: slis.       " Type-pool for ALV.

*----------------------------------------------------------------------*
* Types                                                                *
*----------------------------------------------------------------------*
TYPES: BEGIN OF ty_s_full_return.
    INCLUDE TYPE bapiret2.
    INCLUDE TYPE zgl_rectempl.
TYPES:  act_code(1) TYPE c.
TYPES: END OF ty_s_full_return.

TYPES: BEGIN OF ty_s_global_data.
    INCLUDE TYPE zgl_rect_ex_log.
*        icon        TYPE string,
*        werks       TYPE werks_d,
*        act_code(1) TYPE c,        "--> Roff SDF - Pedro Freitas - CR 89638 - 05.01.2015
**        status_code TYPE z_gl_pp_scode,    "--> Roff SDF - Pedro Freitas - CR 89638 - 09.01.2015
**        datum       TYPE sy-datum,         "--> Roff SDF - Pedro Freitas - CR 89638 - 09.01.2015
*        matnr       TYPE matnr,
**        matnr_text  TYPE maktx,            "--> Roff SDF - Pedro Freitas - CR 89638 - 09.01.2015
*        labor       TYPE labor,
*        plan_id     TYPE mdv,
*        pv_num      TYPE z_gl_pp_pvnum,
**        datuv       TYPE datuv,            "--> Roff SDF - Pedro Freitas - CR 89638 - 09.01.2015
**        message     TYPE bapi_msg,         "--> Roff SDF - Pedro Freitas - CR 89638 - 09.01.2015
*        plnnr       TYPE symsgv,
**--> Roff SDF - Pedro Freitas - CR 89638 - 05.01.2015
*        plnal       TYPE plnal,
*        bstmi       TYPE bstmi,
*        bstma       TYPE bstma,
*        bulk        TYPE zzbulk,
*        ffactor     TYPE zzfactor,
*        tfactor     TYPE zzfactor,
*        stlan       TYPE stlan,
*        stlal       TYPE stlal,
*        screenid    TYPE char10,
*        userex      TYPE syuname,
*        dateex      TYPE sydatum,
*        timeex      TYPE syuzeit,

*<-- Roff SDF - Pedro Freitas - CR 89638 - 05.01.2015
TYPES: END OF ty_s_global_data.

*--> Roff SDF - Pedro Freitas - CR 87638 - 03.02.2015
TYPES: BEGIN OF ty_s_bulk_factor,
         matnr   TYPE matnr,
         zbulk   TYPE zzbulk,
         ffactor TYPE zzfactor1,
         tfactor TYPE zzfactor2,
         factor3 TYPE zzfactor3,
         factor4 TYPE zzfactor4,
         fact3yn TYPE zzfactor3_yn,
         yield   TYPE pw_lmngr,
         pv_num  TYPE verid,
       END OF ty_s_bulk_factor.

TYPES: BEGIN OF ty_s_density,
         matnr   TYPE matnr,
         density TYPE zzbulk,
       END OF ty_s_density.
*<-- Roff SDF - Pedro Freitas - CR 87638 - 03.02.2015

TYPES: BEGIN OF ty_s_marc,
         matnr TYPE matnr,
         werks TYPE werks_d,
         mmsta TYPE mmsta, "Additional field: CR 3028
       END OF ty_s_marc.

TYPES: BEGIN OF ty_s_mara,
         matnr TYPE matnr,
         labor TYPE labor,
       END OF ty_s_mara.

* Additional structures:
* View MARA-MARC - CR 3028
TYPES: BEGIN OF ty_s_mc29v,
         matnr TYPE matnr,
         werks TYPE werks_d,
         labor TYPE labor,
         mmsta TYPE mmsta,
       END OF ty_s_mc29v.

* some fields of table MAST (BOM)
TYPES: BEGIN OF ty_s_mast,
         matnr TYPE matnr,
         werks TYPE werks_d,
         stlan TYPE stlan,
         stlnr TYPE stnum,
         stlal TYPE stalt,
       END OF ty_s_mast.

TYPES: BEGIN OF ty_s_mkal,
         matnr TYPE matnr,
         werks TYPE werks_d,
         verid TYPE verid,
*--> Roff SDF - Pedro Freitas - CR 87638 - 06.01.2015
** Begin – FONSECC4 – 03.10.2019 – CR 40444
         plnnr TYPE plnnr,
** End – FONSECC4 – 03.10.2019 – CR 40444
         stlal TYPE stalt,
         bstmi TYPE bstmi,
         bstma TYPE bstma,
         "Begin - ALM-115874 - 07.13.2022 - RFMORAIS
         mdv01 TYPE mdv01,
         "End - ALM-115874 - 07.13.2022 - RFMORAIS
*<-- Roff SDF - Pedro Freitas - CR 87638 - 06.01.2015
       END OF ty_s_mkal.

TYPES: BEGIN OF ty_s_mkal_tmp,
         matnr TYPE matnr,
         werks TYPE werks_d,
         verid TYPE verid,
         plnnr TYPE plnnr,
         labor TYPE labor,
         alnal TYPE plnal,
         stlan TYPE stlan,
         stlal TYPE stalt,
         bstmi TYPE bstmi,
         bstma TYPE bstma,
       END OF ty_s_mkal_tmp.

*--> Roff SDF - Pedro Freitas - CR 87638 - 06.01.2015
TYPES: BEGIN OF ty_s_estrh,
         recnroot TYPE eserecn,
         recn     TYPE eserecn,
         subid    TYPE esesubid,
       END OF ty_s_estrh.

TYPES: BEGIN OF ty_s_estri,
         idcat    TYPE eseidcat,
         ident    TYPE matnr,                  "eseident,
         recnroot TYPE eserecn,
       END OF ty_s_estri.

TYPES: BEGIN OF ty_s_recpv,
         plant    LIKE zgl_mfg_recpv-plant,
         material LIKE zgl_mfg_recpv-material,
         pv_group LIKE zgl_mfg_recpv-pv_group,
       END OF ty_s_recpv.

TYPES: BEGIN OF ty_s_recpvgrp,
         plant        LIKE zgl_mfg_recpvgrp-werks,
         material     LIKE zgl_mfg_recpv-material,
         pv_group     LIKE zgl_mfg_recpvgrp-pv_group,
         prod_version LIKE zgl_mfg_recpvgrp-prod_version,
       END OF ty_s_recpvgrp.

TYPES: BEGIN OF ty_matnr,
         matnr TYPE matnr,
       END OF ty_matnr.

*<-- Roff SDF - Pedro Freitas - CR 87638 - 06.01.2015 11:46:22

*----------------------------------------------------------------------*
* Constants                                                            *
*----------------------------------------------------------------------*
CONSTANTS:
  c_success     TYPE char2                     VALUE '14',
  c_error       TYPE zgl_rectempl-status_code  VALUE '13',
  c_msg_ppe4    TYPE char4                     VALUE 'PPE4',
  c_nro_131     TYPE char3                     VALUE '131',
  c_msg_m3      TYPE char2                     VALUE 'M3',
  c_nro_200     TYPE char3                     VALUE '200',
  c_msg_cfv     TYPE char4                     VALUE 'CFV',
  c_nro_001     TYPE char3                     VALUE '001',
  c_msg_oio     TYPE char4                     VALUE 'OIO', "CR 3028
  c_nro_232     TYPE char3                     VALUE '232', "CR 3028
  c_msg_ck      TYPE char4                     VALUE 'CK',  "CR 3028
  c_nro_314     TYPE char3                     VALUE '314', "CR 3028
  c_nro_081     TYPE char3                     VALUE '081', "CR 3028
  c_msg_sf      TYPE char4                     VALUE 'SF',  "CR 3028
  c_nro_256     TYPE char3                     VALUE '256', "CR 3028
  c_nro_404     TYPE char3                     VALUE '404',
  c_msg_rcp     TYPE char12                     VALUE '/PLMB/BA_RCP',
  c_dysplay     TYPE char1                     VALUE '1',
  c_new_fail    TYPE z_gl_pp_prog_mode         VALUE '3',    "16.09.2008 - Defect 10338
  c_plant(5)    TYPE c                         VALUE 'plant', "QCA2
  c_t001w(5)    TYPE c                         VALUE 'T001W',
  c_mode1       TYPE c                         VALUE '1',
  c_mode2       TYPE c                         VALUE '2',
  c_mode3       TYPE c                         VALUE '3',
  c_field_mode1 TYPE name_feld                 VALUE 'MODE1',
  c_field_mode2 TYPE name_feld                 VALUE 'MODE2',
  c_field_mode3 TYPE name_feld                 VALUE 'MODE3',
  c_mark        TYPE c                         VALUE 'X',
  c_1           TYPE z_gl_pp_prog_mode         VALUE '1', "Create only
  c_2           TYPE z_gl_pp_prog_mode         VALUE '2', "Delete only
  c_3           TYPE z_gl_pp_prog_mode         VALUE '3', "Delete and Create
  c_objty       TYPE c                         VALUE 'A',
  c_bapi_e      TYPE c                         VALUE 'E',
  c_update      TYPE c                         VALUE 'U',
  c_success2    TYPE c                         VALUE 'S',
  c_delete      TYPE c                         VALUE 'D',
  c_insert      TYPE c                         VALUE 'I',
*      c_pvers         TYPE sy-ucomm                  VALUE 'PVERS',
  c_center      TYPE slis_fieldcat_alv-just    VALUE 'C',
  c_left        TYPE slis_fieldcat_alv-just    VALUE 'L',
  c_icon1       TYPE icon-name                 VALUE '@5B\Q',
  c_icon2       TYPE icon-name                 VALUE '@5C\Q',
  c_quickinfo   TYPE smp_dyntxt-quickinfo      VALUE 'Recipe Template', "#EC NOTEXT
  c_icontext    TYPE smp_dyntxt-icon_text      VALUE 'Templates', "#EC NOTEXT
  c_quickinfo2  TYPE smp_dyntxt-quickinfo      VALUE 'Factors', "#EC NOTEXT
  c_icontext2   TYPE smp_dyntxt-icon_text      VALUE 'Factors', "#EC NOTEXT
  c_quickinfo3  TYPE smp_dyntxt-quickinfo      VALUE 'PV Grouping', "#EC NOTEXT
  c_icontext3   TYPE smp_dyntxt-icon_text      VALUE 'PV Grouping', "#EC NOTEXT
  c_program     TYPE zdev_us_ex_hardc-inc_meth VALUE 'Z_GL_PP_R_CREATE_REC_TEMPLATE',
  c_fc01        TYPE sy-ucomm                  VALUE   "$sst: #153
                  'FC01',                                              "$sst: #153
  c_fc02        TYPE sy-ucomm                  VALUE   "$sst: #153
                  'FC02',                                              "$sst: #153
  c_fc03        TYPE sy-ucomm                  VALUE   "$sst: #153
                  'FC03',                                              "$sst: #153
  c_gl          TYPE mast-stlal                VALUE   "$sst: #153
                  'GL',                                                "$sst: #153
*--> Roff SDF - Pedro Freitas - CR 87638 - 06.01.2015
  c_densto(2)   TYPE p DECIMALS 1             VALUE '0.5',
  c_densfrom(3) TYPE c                         VALUE '1',
  c_compqty     TYPE i                         VALUE 1000,
*<-- Roff SDF - Pedro Freitas - CR 87638 - 06.01.2015
*  ---> BF
  c_zmfg(5)     TYPE c                         VALUE 'Z_MFG',
  c_pep(3)      TYPE c                         VALUE 'PEP',
  c_cp(2)       TYPE c                         VALUE 'CP',
  c_eq(2)       TYPE c                         VALUE 'EQ',
  c_485(3)      TYPE c                         VALUE '485',
  c_484(3)      TYPE c                         VALUE '484',
  c_184(3)      TYPE c                         VALUE '184',
  c_067(3)      TYPE c                         VALUE '067',
  c_red         TYPE icon-id                   VALUE '@5C@',
  c_4000(4)     TYPE i                         VALUE '4000',
  c_yes(3)      TYPE c                         VALUE 'Yes',       "CR 114848 - 31.10.2022
  c_no(2)       TYPE c                         VALUE 'No'.        "CR 114848 - 31.10.2022
* <--- BF
*----------------------------------------------------------------------*
* Variables                                                            *
*----------------------------------------------------------------------*
DATA: gv_flag  TYPE c,
      gv_num   TYPE i,
      gv_plnty TYPE c,
      gv_maktx TYPE maktx.

*----------------------------------------------------------------------*
* Ranges                                                          *
*----------------------------------------------------------------------*
DATA: r_vgwts TYPE RANGE OF crhd-vgwts.

*----------------------------------------------------------------------*
* Structures                                                           *
*----------------------------------------------------------------------*
* Structures for ALV report.
DATA:
*< Begining of modification FJLM
*  D01K908651 2008/04/07.
* D
*      wa_mkal        TYPE mkal
*> End of modification D01K908651,

*< Begining of modification FJLM
*  D01K908651 2008/04/07.
* I
  wa_mkal            TYPE ty_s_mkal,
*> End of modification D01K908651
  wa_mast            TYPE ty_s_mast,
  wa_t001w           TYPE t001w,
  wa_mara            TYPE ty_s_mara,
  wa_marc            TYPE ty_s_marc,
  wa_subproccode     TYPE zgl_subproccode,
  wa_rectempl        TYPE zgl_rectempl,
  wa_rectempl_filter TYPE zgl_rectempl,
  wa_fullreturn      TYPE ty_s_full_return,
  wa_return          TYPE bapiret2,
  wa_plpo            TYPE plpo.
TYPES: BEGIN OF ts_crhd_sel,                                 "$sst: #712
         objty TYPE crhd-objty,                                 "$sst: #712
         objid TYPE crhd-objid,                                 "$sst: #712
         vgwts TYPE crhd-vgwts,                                 "$sst: #712
       END OF ts_crhd_sel.                                   "$sst: #712
DATA: wa_crhd        TYPE ts_crhd_sel,                       "$sst: #712
      wa_global_data TYPE ty_s_global_data,
      wa_layout      TYPE slis_layout_alv,
      wa_recpv       TYPE ty_s_recpv,
      wa_recpvgrp    TYPE ty_s_recpvgrp.

DATA: wa_plant_check TYPE zgl_plant_check, "(+)CR 42510 - INETUM (WASHINGTON ALMEIDA) - 04.02.2022
      r_verid        TYPE RANGE OF verid.  "(+)CR 42510 - INETUM (WASHINGTON ALMEIDA) - 14.03.2022

*----------------------------------------------------------------------*
* Internal tables and ranges                                           *
*----------------------------------------------------------------------*
* Internal tables for ALV report.
DATA: it_mara            TYPE STANDARD TABLE OF ty_s_mara,
      it_marc            TYPE STANDARD TABLE OF ty_s_marc,
*< Begining of modification FJLM
*  D01K908651 2008/04/07.
* D
*      it_mkal                 TYPE STANDARD TABLE OF mkal,
*> End of modification D01K908651

*< Begining of modification FJLM
*  D01K908651 2008/04/07.
* I
      it_mkal            TYPE STANDARD TABLE OF ty_s_mkal,
      it_mast            TYPE STANDARD TABLE OF ty_s_mast,
*> End of modification D01K908651
      it_subproccode     TYPE STANDARD TABLE OF zgl_subproccode,
      it_mc29v           TYPE STANDARD TABLE OF ty_s_mc29v,
      it_rectempl        TYPE STANDARD TABLE OF zgl_rectempl,
      it_rectempl_aux    TYPE STANDARD TABLE OF zgl_rectempl, "CR 3028
      it_rectempl_filter TYPE STANDARD TABLE OF zgl_rectempl,
      gt_rectempl_bi     TYPE STANDARD TABLE OF         "$sst: #110
        zgl_rectempl .                                       "$sst: #110
DATA: gs_rectempl_bi         TYPE zgl_rectempl,                      "$sst: #110
      it_rectempl_bi_aux     TYPE STANDARD TABLE OF zgl_rectempl,
      it_return              TYPE TABLE OF bapiret2,
      it_fullreturn          TYPE TABLE OF ty_s_full_return,
      it_exp_bom             TYPE TABLE OF capp_bom,
      it_exp_itm             TYPE TABLE OF capp_itm,
      it_crhd                TYPE TABLE OF ts_crhd_sel,     "$sst: #712
      it_planpo              TYPE TABLE OF plpob,
      it_plpo                TYPE TABLE OF plpo,
      it_global_data         TYPE TABLE OF ty_s_global_data,
      it_alv_fieldcat        TYPE slis_t_fieldcat_alv, " ALV field catalog.
      it_rectempl_filter_ant TYPE STANDARD TABLE OF zgl_rectempl,  "Defect 3817
      it_rectempl_bi_ant     TYPE STANDARD TABLE OF zgl_rectempl,  "Defect 3817
      it_recpv               TYPE STANDARD TABLE OF ty_s_recpv,
      it_recpvgrp            TYPE STANDARD TABLE OF ty_s_recpvgrp.

DATA: gv_recreation TYPE z_recreation.

DATA: gt_ffactor      TYPE TABLE OF zgl_mfg_ffactor,
      gt_tfactor      TYPE TABLE OF zgl_mfg_tfactor,
      gt_rectempl_log TYPE TABLE OF zgl_rect_ex_log,
      gt_bulkfact     TYPE TABLE OF ty_s_bulk_factor,
      gt_estri        TYPE TABLE OF ty_s_estri,
      gt_estrh        TYPE TABLE OF ty_s_estrh,
      gt_density      TYPE TABLE OF ty_s_density.

DATA: gv_fdensity TYPE zzbulk_from,
      gv_tdensity TYPE zzbulk_to,
      gv_density  TYPE zzbulk,
      gv_fqty     TYPE sa_losvn,
      gv_tqty     TYPE sa_losbs,
      gv_yield    TYPE sa_losvn.

DATA: r_matnr TYPE RANGE OF mara-matnr.

*INCLUDE ztest_mrec_top.
CLASS cl_mrcp DEFINITION.

  PUBLIC SECTION.
    DATA o_mrcp TYPE REF TO ZCL_MRCP_UTILITES.
DATA
          plnnr_tab TYPE RANGE OF plnnr.

    METHODS:
      constructor IMPORTING it_rectempl_bi TYPE zgl_rectempl_tt,
      create_master_recipe ,
      get_mrcp_header RETURNING VALUE(r_result) TYPE /plmi/t_mrcp_header,
      set_mrcp_header IMPORTING i_mrcp_header TYPE /plmi/t_mrcp_header,
      build_mrcp_header,
      build_operation_tab ,
      get_mat_ass_tab RETURNING VALUE(r_result) TYPE /plmi/t_mrcp_mat_assignment,
      set_mat_ass_tab IMPORTING i_mat_ass_tab TYPE /plmi/t_mrcp_mat_assignment,
      get_t_stpo RETURNING value(r_result) TYPE /FHGE/T_STPOX,
      get_t_message RETURNING value(r_result) TYPE /plmb/t_spi_msg,
      get_return
            RETURNING
              value(r_result) TYPE /plmb/t_spi_msg.
  PRIVATE SECTION.
TYPES TT_zgl_phase_map TYPE TABLE OF zgl_phase_map.
TYPES: BEGIN OF ts_crhd_sel,                                 "$sst: #712
         objty TYPE crhd-objty,                                 "$sst: #712
         objid TYPE crhd-objid,                                 "$sst: #712
         vgwts TYPE crhd-vgwts,                                 "$sst: #712
       END OF ts_crhd_sel.                                   "$sst: #712
    DATA: mrcp_header   TYPE /plmi/t_mrcp_header,
          t_message     TYPE /plmb/t_spi_msg,
          severity      TYPE /plmb/spi_msg_severity,
          index_failed  TYPE /plmb/t_spi_rtr_index_failed,
          op_tab        TYPE /plmi/t_mrcp_operation,
          operation_tab TYPE /plmi/t_mrcp_operation,
          opera_add_tab TYPE /plmi/t_mrcp_operation_add,
          mat_ass_tab   TYPE /plmi/t_mrcp_mat_assignment,
          prodver_tab   TYPE /plmi/t_mrcp_prodver_add,
          phase_tab TYPE /plmi/t_mrcp_phase_add,
          comp_mat_tab type zgl_mrcp_comp_mat_assign_tab,
          failed        TYPE /plmb/spi_failed_ind,
          phase_map_tab type TT_zgl_phase_map,
          t_rectempl_bi TYPE zgl_rectempl_tt,
          rectempl_bi TYPE zgl_rectempl,
          template_matnr         TYPE matnr,
          template_plnnr         TYPE plnnr,
          template_plnal         TYPE plnal,
          new_plnnr    type plnnr,
          template_werks type werks,
          template_stalt type stalt,
          t_crhd                TYPE TABLE OF ts_crhd_sel,
          dispo type dispo,
          labor type labor,
          plkob TYPE TABLE OF plkob,
          plpob TYPE TABLE OF plpob,
          c_mip TYPE  mdv01 VALUE 'MIP',
          t_stpo TYPE /FHGE/T_STPOX,
          t_mat_asgn_rul type TABLE OF ZGL_MAT_ASGN_RUL.

    CONSTANTS:   c_new_number TYPE plnkn VALUE 99999999.

    METHODS:
      clean,
      calculate,
      build_phase_tab,
      build_mat_ass_tab,
      build_prodver_tab,
      build_plmz_tab,
      add_header,
      add_operation,
      add_mat_assign,
      get_nr_plnnr RETURNING VALUE(r_plnnr) TYPE plnnr,
      save_mrcp,
      add_prodversion,
      add_phase,
      calculate_plnkn
            IMPORTING stpo type stpox
            RETURNING
              value(r_result) TYPE plnkn,
      set_t_stpo,
      read_tables_aux,
      add_comp_mat,
      select_crhd,
      calculate_vgw03
            IMPORTING plpo type plpo
            RETURNING
              value(r_result) TYPE plpo-vgw03.




ENDCLASS.
