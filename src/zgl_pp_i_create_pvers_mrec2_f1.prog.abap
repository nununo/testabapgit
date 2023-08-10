************************************************************************
* 5/21/19   smartShift project
* Rules applied:  105 110 139 153 157 164 166 601 712 723 901
************************************************************************

*----------------------------------------------------------------------
* Program : Include Z_GL_PP_I_CREATE_PVERS_MREC_F1
* Description : Contain the performs of Report
*               Z_GL_PP_R_CREATE_PVERS_MREC
*  Reference of the development request :   D01K904342
*  GAP number : MFG034
* ---------------------------------------------------------------------
* Author : Francisco López
* Creation date : 19/12/2007
* ---------------------------------------------------------------------
*    Date                 Author                    Text
*  07/04/08     Fco López Mateo           Defect 3981: MFG034 execute performence issue
*                                         Transport request number:  D01K908651
*&---------------------------------------------------------------------*
*  04/02/22     Washington Almeida        CR 42510: MFG034_KNW1_MFG_Formula
*                                         Industrialization Tools v1.8
*                                         Transp. request number:  DN1K9C0NRJ
* ---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  f_val_werks
*&---------------------------------------------------------------------*
*       Validate Plant
*----------------------------------------------------------------------*
FORM f_val_werks.

  IF p_werks IS INITIAL.
    MESSAGE e063(8i).
  ELSE.
* Check that Plant exist in T001W table
    SELECT SINGLE *
      FROM t001w
      INTO wa_t001w
     WHERE werks EQ p_werks.
    IF sy-subrc NE 0.
      MESSAGE e058(00) WITH p_werks space space c_t001w.
*   Entry & & & does not exist in &4 (check entry)
    ELSE.
      AUTHORITY-CHECK OBJECT 'C_FVER_WRK'
                 ID 'ACTVT' FIELD '02'
                 ID 'WERKS' FIELD p_werks.
      IF sy-subrc <> 0.
        MESSAGE e631(5w) WITH c_plant p_werks.
      ENDIF.
    ENDIF.
  ENDIF.

ENDFORM.                    " f_val_werks
*&---------------------------------------------------------------------*
*&      Form  f_get_data
*&---------------------------------------------------------------------*
*       Retrieve data for ALV display
*----------------------------------------------------------------------*
FORM f_get_data .
* Accesing to database, just error message in case of no material selection
  PERFORM f_get_all_data.

  IF p_prgmod <> c_2.
    PERFORM f_filter_it.
    PERFORM f_filter_priority.
    PERFORM f_filter_pv_groups.
    IF gt_rectempl_bi[] IS INITIAL AND it_fullreturn[] IS INITIAL.
      "$sst: #110

      MESSAGE i116(z_mfg). "No relevant data found
      gv_flag = c_mark.
    ENDIF.
  ENDIF.

ENDFORM.                    " f_get_data

*&---------------------------------------------------------------------*
*&      Form  f_batch_input
*&---------------------------------------------------------------------*
*       Run Batch input
*----------------------------------------------------------------------*
FORM f_batch_input.

* Deletion only if Program Mode 2 or 3
  IF ( p_prgmod = c_3 AND NOT gt_rectempl_bi[] IS INITIAL )  "$sst: #110
    OR p_prgmod = c_2.                                       "$sst: #110
    PERFORM f_del_old_ver.
  ENDIF.

* Recipe Creation only if Program Mode 1 or 3
  IF p_prgmod <> c_2.
    LOOP AT gt_rectempl_bi INTO wa_rectempl.                 "$sst: #110
*"Begin - 115874 - Fabricio Beneduzi - Inetum - 22.09.2022
*      IF p_zmip IS NOT INITIAL AND wa_rectempl-zmip IS INITIAL.
      IF wa_rectempl-zmip NOT IN s_zmip[].
        CONTINUE.
      ENDIF.
*"End - 115874 - Fabricio Beneduzi - Inetum - 22.09.2022
      PERFORM f_execute_function CHANGING wa_rectempl.       "$sst: #901
      MODIFY gt_rectempl_bi FROM wa_rectempl.                "$sst: #110
    ENDLOOP.
    APPEND LINES OF it_rectempl_filter_ant TO it_rectempl_filter.
    APPEND LINES OF it_rectempl_bi_ant TO gt_rectempl_bi.    "$sst: #110
    IF gt_rectempl_bi[] IS INITIAL.                          "$sst: #110
      gv_flag = c_mark.
    ENDIF.
  ENDIF.
  COMMIT WORK AND WAIT. " SIMOESM - 20210520 - ALM-111994 - CHANGE POINTER
ENDFORM.                    " f_batch_input
*&---------------------------------------------------------------------*
*&      Form  f_execute_function
*&---------------------------------------------------------------------*
*       Execute function module Z_GL_PP_F_CREATE_PVERS_MREC
*       for create Production Version and Master Recipes
*----------------------------------------------------------------------*
*       -->PI_RECTEMPL   text
*----------------------------------------------------------------------*
FORM f_execute_function CHANGING p_rectempl TYPE zgl_rectempl.
  "$sst: #901
** Begin – FONSECC4 – 03.10.2019 – CR 40444
  DATA: lt_mkal TYPE z_tt_mkal.
** End – FONSECC4 – 03.10.2019 – CR 40444

  DATA: lv_subrc       TYPE sy-subrc,                              "$sst: #153
        lv_type        TYPE sy-msgty,                              "$sst: #153
        lv_nro         TYPE sy-msgno,                              "$sst: #153
        lv_msg1        TYPE sy-msgv1,                              "$sst: #153
        lv_msg2        TYPE sy-msgv1,                              "$sst: #153
        lv_msg3        TYPE sy-msgv1,                              "$sst: #153
        lv_msg4        TYPE sy-msgv1,                              "$sst: #153
        lv_class       TYPE sy-msgid,                              "$sst: #153
        lv_matnr       TYPE matnr,
        ls_subproccode TYPE zgl_subproccode.

  DATA: ls_rectempl_bi_aux TYPE zgl_rectempl,
        ls_mkal            TYPE ty_s_mkal.

  CLEAR it_return[].                                         "$sst: #157

  IF p_prgmod = c_1.
    CLEAR lv_subrc.
    SELECT SINGLE matnr
      INTO lv_matnr
      FROM mkal
     WHERE matnr = p_rectempl-matnr
       AND werks = p_rectempl-werks
       AND verid = p_rectempl-pv_num.
    IF sy-subrc = 0.
      "Task list & already exists
      p_rectempl-status_code = c_error.
      p_rectempl-prc_date    = sy-datum.
      MOVE-CORRESPONDING p_rectempl TO wa_fullreturn.
      wa_fullreturn-act_code = c_insert.
      wa_fullreturn-pv_num   = p_rectempl-pv_num.
      wa_fullreturn-stalt    = p_rectempl-stalt.
      CLEAR: lv_class, lv_nro, lv_msg1, lv_msg2, lv_msg3, lv_msg4.

      lv_class = '/ASU/GENERAL'.
      lv_nro   = '224'.
      CONCATENATE p_rectempl-werks '/' p_rectempl-matnr INTO lv_msg1.
      PERFORM f_populate_msg USING c_error
                                   lv_class
                                   lv_nro
                                   lv_msg1
                                   lv_msg2
                                   lv_msg3
                                   lv_msg4
                          CHANGING wa_return.
      MOVE-CORRESPONDING wa_return TO wa_fullreturn.
      APPEND wa_fullreturn TO it_fullreturn.
      lv_subrc = 4.
    ENDIF.
  ENDIF.

  CHECK lv_subrc IS INITIAL.

  READ TABLE it_rectempl_bi_aux INTO ls_rectempl_bi_aux
    WITH KEY werks       = p_rectempl-werks
             labor       = p_rectempl-labor
             plan_id     = p_rectempl-plan_id
             matnr       = p_rectempl-matnr
             status_code = p_rectempl-status_code
             pv_num      = p_rectempl-pv_num.
  IF sy-subrc = 0.
    wa_fullreturn-fr_qty = p_rectempl-fr_qty = ls_rectempl_bi_aux-fr_qty.
    wa_fullreturn-to_qty = p_rectempl-to_qty = ls_rectempl_bi_aux-to_qty.
  ENDIF.

** Begin – FONSECC4 – 03.10.2019 – CR 40444
  MOVE-CORRESPONDING it_mkal TO lt_mkal.
** End – FONSECC4 – 03.10.2019 – CR 40444

  CALL FUNCTION 'Z_GL_PP_F_CREATE_PVERS_MREC'
    EXPORTING
      im_rectempl   = p_rectempl
    TABLES
      im_return     = it_return
    EXCEPTIONS
      error_at_c223 = 1
      error_at_c201 = 2
      OTHERS        = 4.

  lv_subrc = sy-subrc.
  IF lv_subrc EQ 0.
    p_rectempl-status_code = c_success.
  ELSE.
    p_rectempl-status_code = c_error.
  ENDIF.
  p_rectempl-prc_date = sy-datum.

  CLEAR: wa_fullreturn, wa_return, ls_subproccode.

  READ TABLE it_return INTO wa_return INDEX 1.
  IF sy-subrc = 0.
    wa_fullreturn-act_code = c_insert.

    MOVE-CORRESPONDING p_rectempl TO wa_fullreturn.
    MOVE-CORRESPONDING wa_return TO wa_fullreturn.
    wa_fullreturn-pv_num   = p_rectempl-pv_num.
    wa_fullreturn-stalt    = p_rectempl-stalt.

    READ TABLE it_subproccode INTO ls_subproccode
     WITH KEY werks = p_rectempl-werks
              matnr = p_rectempl-matnr.
    IF sy-subrc = 0.
      wa_fullreturn-plan_id = ls_subproccode-plan_id.
    ENDIF.

    APPEND wa_fullreturn TO it_fullreturn.

* In MFG034b we only do the number of pour calculation if it is
* selected in the selection screen.
    IF p_rectempl-nop IS NOT INITIAL.
*   Determine Number Pour
      PERFORM f_number_pour USING wa_fullreturn-matnr
                                  wa_fullreturn-werks
                                  wa_fullreturn-stalt
                                  wa_fullreturn-stlan
                                  wa_fullreturn-message_v1. "plnnr
    ENDIF.

  ELSE.
    MOVE-CORRESPONDING p_rectempl TO wa_fullreturn.
    CLEAR: lv_msg1, lv_msg2, lv_msg3, lv_msg4.
    CASE lv_subrc.
      WHEN 0.
        lv_type = 'Z_MFG'.
        lv_nro  = '175'.
        lv_msg1 = TEXT-e00.

      WHEN 1.                                               "Error C223
        lv_type = c_msg_ppe4.
        lv_nro  = c_nro_131.

      WHEN 2.                                               "Error C201
        lv_type = 'MRTRS'.
        lv_nro = '019'.

      WHEN OTHERS.
        lv_type = 'CCMSBI_MESSAGES'.
        lv_nro  = '013'.

    ENDCASE.

    PERFORM f_populate_msg USING c_error
                                 lv_type                    "c_msg_ppe4
                                 lv_nro                     "c_nro_131
                                 lv_msg1
                                 lv_msg2
                                 lv_msg3
                                 lv_msg4
                        CHANGING wa_return.
    MOVE-CORRESPONDING wa_return TO wa_fullreturn.
    wa_fullreturn-act_code = c_insert.
    wa_fullreturn-pv_num   = p_rectempl-pv_num.
    wa_fullreturn-stalt    = p_rectempl-stalt.
    APPEND wa_fullreturn TO it_fullreturn.
  ENDIF.

ENDFORM.                    " f_execute_function
*&---------------------------------------------------------------------*
*&      Form  f_update_operation_phase
*&---------------------------------------------------------------------*
*       Determine the Operation/Phase to be updated
*----------------------------------------------------------------------*
*  -->  pi_fullreturn        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_update_operation_phase.

  DATA: wa_planpo    TYPE plpob,
        wa_plpo_high TYPE plpo,
        lv_upd       TYPE c,
        it_pplanpo   TYPE TABLE OF pplpo,
        it_planas    TYPE TABLE OF plasb,
        it_pplanas   TYPE TABLE OF pplas,
        it_plpo_high TYPE TABLE OF plpo.

  CLEAR: wa_plpo.
  it_plpo_high[] = it_plpo[].
  LOOP AT it_plpo INTO wa_plpo .

    CLEAR: wa_crhd, wa_planpo, lv_upd.
    READ TABLE it_crhd WITH KEY objty = c_objty
                                objid = wa_plpo-arbid
                           INTO wa_crhd.

    IF sy-subrc EQ 0.
      lv_upd = c_mark.
    ELSE.
*     it has subhierarchy
      READ TABLE it_plpo_high INTO wa_plpo_high
                              WITH KEY plnkn = wa_plpo-pvzkn.
      IF sy-subrc = 0.
        READ TABLE it_crhd WITH KEY objty = c_objty
                                    objid = wa_plpo_high-arbid
                               INTO wa_crhd.
        lv_upd = c_mark.
      ENDIF.
    ENDIF.
    IF lv_upd = c_mark.
      IF wa_crhd-vgwts IN r_vgwts.
*       Calculate the new value of PLPO-VGW03
        MOVE-CORRESPONDING wa_plpo TO wa_planpo.            "#EC ENHOK
        wa_planpo-vgw03 = ( gv_num * wa_plpo-vgw03 ) / 100.
        wa_planpo-flg_sel = c_update.
        wa_planpo-vbkz = c_update.
        APPEND wa_planpo TO it_planpo.
      ENDIF.
    ENDIF.
  ENDLOOP.

* BEGIN - NASCIMEV - 2019.11.22 - ALM107381 - DUMP in Z_CR_MREC
** BEGIN - NASCIMEV - 2019.10.18 - GSD40444
*  SELECT * INTO CORRESPONDING FIELDS OF TABLE it_planas
*    FROM plas
*     FOR ALL ENTRIES IN it_planpo
*   WHERE plnty = it_planpo-plnty AND
*         plnnr = it_planpo-plnnr AND
*         plnkn = it_planpo-plnkn.
** END - NASCIMEV - 2019.10.18 - GSD40444
  IF it_planpo[] IS NOT INITIAL.
    SELECT * INTO CORRESPONDING FIELDS OF TABLE it_planas
      FROM plas
       FOR ALL ENTRIES IN it_planpo
     WHERE plnty = it_planpo-plnty AND
           plnnr = it_planpo-plnnr AND
           plnkn = it_planpo-plnkn.
  ENDIF.
* END - NASCIMEV - 2019.11.22 - ALM107381 - DUMP in Z_CR_MREC


  CALL FUNCTION 'CP_DU_OPR_SAVE'
    TABLES
      c_planpo  = it_planpo
      c_planas  = it_planas
      c_pplanas = it_pplanas
      c_pplanpo = it_pplanpo.

ENDFORM.                    " f_update_operation_phase
*&---------------------------------------------------------------------*
*&      Form  f_get_hardcode
*&---------------------------------------------------------------------*
*       Retrieve hardcodes
*----------------------------------------------------------------------*
FORM f_get_hardcode .

  CONSTANTS: c_vgwts TYPE name_feld VALUE 'VGWTS',
             c_plnty TYPE name_feld VALUE 'PLNTY'.

  CALL FUNCTION 'Z_GL_HARDCODE_TO_RANGE'
    EXPORTING
      inc_meth  = c_program
      fieldname = c_vgwts
    TABLES
      it_range  = r_vgwts.

  CALL FUNCTION 'Z_GL_HARDCODE_SINGLE_FIELD'
    EXPORTING
      inc_meth   = c_program
      fieldname  = c_plnty
    IMPORTING
      fieldvalue = gv_plnty.

ENDFORM.                    " f_get_hardcode
*&---------------------------------------------------------------------*
*&      Form  f_number_pour
*&---------------------------------------------------------------------*
*       Determinate number pour
*----------------------------------------------------------------------*
FORM f_number_pour USING p_fullreturn_matnr TYPE matnr
                         p_fullreturn_werks TYPE werks_d
                         p_fullreturn_stalt TYPE stalt
                         p_fullreturn_stlan TYPE stlan
                         p_fullreturn_plnnr TYPE symsgv.

  DATA: lv_tmp(2) TYPE n,
        lv_stlal  TYPE stalt,
        lv_plnnr  TYPE plnnr.

  MOVE p_fullreturn_plnnr TO lv_plnnr.

  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
    EXPORTING
      input  = p_fullreturn_stalt
    IMPORTING
      output = lv_stlal.

  CLEAR: it_exp_bom[].                                       "$sst: #157
  CLEAR: it_exp_itm[].                                       "$sst: #157

* Determination of Number of Pours and update of new Recipe
  CALL FUNCTION 'CABM_READ_BOM'
    EXPORTING
      i_matnr         = p_fullreturn_matnr
      i_werks         = p_fullreturn_werks
      i_stlal         = lv_stlal
      i_stlan         = p_fullreturn_stlan
    TABLES
      exp_bom_data    = it_exp_bom
      exp_itm_data    = it_exp_itm
    EXCEPTIONS
      no_record_found = 1
      OTHERS          = 2.
  IF sy-subrc EQ 0.
    gv_num = lines( it_exp_itm ).                            "$sst: #164
    IF  sy-subrc NE 0.
      CLEAR: gv_num.
    ENDIF.

*access plpo
    PERFORM f_retrieve_plpo USING lv_plnnr.

* Determine the Operation/Phase to be updated
    PERFORM f_update_operation_phase.

  ENDIF.

ENDFORM.                    " f_number_pour
*&---------------------------------------------------------------------*
*&      Form  f_retrieve_plpo
*&---------------------------------------------------------------------*
*       retrieve plpo
*----------------------------------------------------------------------*
*      -->P_PI_FULLRETURN  text
*----------------------------------------------------------------------*
FORM f_retrieve_plpo  USING p_fullreturn_plnnr TYPE plnnr.

  SELECT *
    FROM plpo
    INTO TABLE it_plpo
   WHERE plnty EQ gv_plnty
     AND plnnr EQ p_fullreturn_plnnr.

  IF sy-subrc EQ 0.
    IF NOT it_plpo[] IS INITIAL.
      SELECT objty objid vgwts FROM crhd                     "$sst: #712
        INTO TABLE it_crhd
         FOR ALL ENTRIES IN it_plpo
       WHERE objty EQ c_objty
         AND objid EQ it_plpo-arbid.
      IF sy-subrc NE 0.
        CLEAR: it_crhd.
      ENDIF.
    ENDIF.
  ENDIF.

ENDFORM.                    " f_retrieve_plpo
*&---------------------------------------------------------------------*
*&      Form  f_alv_log
*&---------------------------------------------------------------------*
*       Show an ALV report from program log
*----------------------------------------------------------------------*
FORM f_alv_log USING ls_select TYPE zgl_rect_sel_log.

* Fill table IT_GLOBAL_DATA
  PERFORM f_fill_global_data USING ls_select.

* Fill table for data ALV
*  PERFORM f_configuration_alv_fields.    "--> Roff SDF - Pedro Freitas - CR 87638 - 09.01.2015
  PERFORM f_fill_fieldcatalog.            "--> Roff SDF - Pedro Freitas - CR 87638 - 09.01.2015

* ALV layout catalog
  PERFORM f_alv_layout.

* Show ALV display
  PERFORM f_show_alv.

ENDFORM.                    " f_alv_log
*&---------------------------------------------------------------------*
*&      Form  f_configuration_alv_fields
*&---------------------------------------------------------------------*
*       Configuration ALV fields
*----------------------------------------------------------------------*
FORM f_configuration_alv_fields .

  DATA lv_colpos TYPE i.

  CLEAR lv_colpos.
* Set Icon
  PERFORM f_icon CHANGING lv_colpos.                         "$sst: #901
* Set Plant
  PERFORM f_werks CHANGING lv_colpos.                        "$sst: #901
* Set Material
  PERFORM f_matnr CHANGING lv_colpos.                        "$sst: #901
* Set Description Material
  PERFORM f_matnr_text CHANGING lv_colpos.                   "$sst: #901
* Set Key for Task List Group
  PERFORM f_plnnr CHANGING lv_colpos.                        "$sst: #901
* Set Processing Status
  PERFORM f_status_code CHANGING lv_colpos.                  "$sst: #901
* Set Date
  PERFORM f_datum CHANGING lv_colpos.                        "$sst: #901
* Set Process Code
  PERFORM f_labor CHANGING lv_colpos.                        "$sst: #901
* Set Sub Process Code
  PERFORM f_plan_id CHANGING lv_colpos.                      "$sst: #901
* Set Production version
  PERFORM f_pv_num CHANGING lv_colpos.                       "$sst: #901
* Set Process date
  PERFORM f_datuv CHANGING lv_colpos.                        "$sst: #901
* Set Log Message
  PERFORM f_message CHANGING lv_colpos.                      "$sst: #901

ENDFORM.                    " f_configuration_alv_fields
*&---------------------------------------------------------------------*
*&      Form  f_fill_global_data
*&---------------------------------------------------------------------*
*      Fill table IT_GLOBAL_DATA for ALV display
*----------------------------------------------------------------------*
FORM f_fill_global_data USING ls_select TYPE zgl_rect_sel_log.
*--> Roff SDF - Pedro Freitas - CR 87638 - 06.01.2015
  DATA: ls_mkal     LIKE LINE OF it_mkal,
        ls_output   TYPE zgl_rect_ex_log,
        ls_bulkfact TYPE ty_s_bulk_factor,
        ls_mc29v    TYPE ty_s_mc29v.
*<-- Roff SDF - Pedro Freitas - CR 87638 - 06.01.2015

  DATA lt_filter_ls_output TYPE STANDARD TABLE OF zgl_rect_ex_log.
  "$sst: #723

  CLEAR: wa_fullreturn,
         wa_global_data.

  BREAK-POINT ID zgl_mrec.
  IF p_prgmod <> 2.
    SELECT matnr werks labor mmsta
      FROM mc29v INTO TABLE it_mc29v
      FOR ALL ENTRIES IN it_fullreturn
      WHERE matnr = it_fullreturn-matnr
        AND werks = it_fullreturn-werks.
  ENDIF.

  IF it_mkal[] IS INITIAL.
    SELECT matnr werks verid
** Begin – FONSECC4 – 03.10.2019 – CR 40444
      plnnr
** End – FONSECC4 – 03.10.2019 – CR 40444
      stlal mdv01 "ALM-115874 - 07.13.2022 - RFMORAIS
      FROM mkal                               "#EC CI_FAE_LINES_ENSURED
      APPENDING CORRESPONDING FIELDS OF TABLE it_mkal "ALM-115874 - 07.13.2022 - RFMORAIS
      FOR ALL ENTRIES IN it_mc29v
      WHERE matnr EQ it_mc29v-matnr
        AND werks EQ it_mc29v-werks
        AND verid IN s_pvnum.

    DATA(lt_mkal) = it_mkal[].
    SORT lt_mkal BY matnr werks verid.
    DELETE ADJACENT DUPLICATES FROM lt_mkal COMPARING matnr werks verid.
    it_mkal = lt_mkal.
  ENDIF.

  LOOP AT it_fullreturn INTO wa_fullreturn.
    READ TABLE it_mkal INTO ls_mkal
                        WITH KEY matnr = wa_fullreturn-matnr
                                 werks = wa_fullreturn-werks
                                 verid = wa_fullreturn-pv_num.
    CLEAR: wa_global_data.
*   Retrieve MATNR_TEXT	using the function module HAZMAT_MATNR_GET_TEXT
    PERFORM f_retrieve_matnr_text USING wa_fullreturn-matnr.

    CLEAR ls_bulkfact.
    READ TABLE gt_bulkfact INTO ls_bulkfact
                            WITH KEY matnr  = wa_fullreturn-matnr
                                     pv_num = wa_fullreturn-pv_num.
*--> Roff SDF - Pedro Freitas - CR 87638 - 06.01.2015
    wa_global_data-werks       = wa_fullreturn-werks.
*    wa_global_data-status_code = wa_fullreturn-status_code.
*    wa_global_data-datum       = sy-datum.
    wa_global_data-matnr       = wa_fullreturn-matnr.
*    wa_global_data-matnr_text  = gv_maktx.
    IF p_prgmod <> 2 .
      READ TABLE it_mc29v INTO ls_mc29v
                          WITH KEY matnr = wa_fullreturn-matnr
                                   werks = wa_fullreturn-werks.
      wa_global_data-labor     = ls_mc29v-labor.
    ELSE.
      wa_global_data-labor     = wa_fullreturn-labor.
    ENDIF.
    wa_global_data-plan_id     = wa_fullreturn-plan_id.
    wa_global_data-pv_num      = wa_fullreturn-pv_num.
    READ TABLE it_recpvgrp INTO wa_recpvgrp
                          WITH KEY plant     = wa_fullreturn-werks
                                   material  = wa_fullreturn-matnr.
    IF sy-subrc = 0.
      wa_global_data-pv_group    = wa_recpvgrp-pv_group.
    ENDIF.
*    wa_global_data-message     = wa_fullreturn-message.
    wa_global_data-act_code    = wa_fullreturn-act_code.
    wa_global_data-plnnr       = wa_fullreturn-plnnr.
    wa_global_data-plnal       = wa_fullreturn-plnal.
    wa_global_data-bstmi       = wa_fullreturn-fr_qty.
    wa_global_data-bstma       = wa_fullreturn-to_qty.
    wa_global_data-zbulk       = ls_bulkfact-zbulk.
    wa_global_data-ffactor     = ls_bulkfact-ffactor.
    wa_global_data-tfactor     = ls_bulkfact-tfactor.
    wa_global_data-factor3     = ls_bulkfact-factor3.
    wa_global_data-factor4     = ls_bulkfact-factor4.
    wa_global_data-yield       = ls_bulkfact-yield.
    wa_global_data-stlan       = wa_fullreturn-stlan.
    wa_global_data-stlal       = wa_fullreturn-stalt.
    wa_global_data-screenid    = ls_select-exec_num.
    wa_global_data-userex      = ls_select-userex.
    wa_global_data-dateex      = ls_select-dateex.
    wa_global_data-timeex      = ls_select-timeex.

*BEGIN - ALM-115874 - 07.13.2022 - RFMORAIS
*"Begin - 115874 - Fabricio Beneduzi - Inetum - 22.09.2022
    READ TABLE it_rectempl INTO DATA(ls_templ)
                           WITH KEY werks  = wa_fullreturn-werks
                                    labor  = wa_fullreturn-labor
                                    pv_num = wa_fullreturn-pv_num.

    IF sy-subrc IS NOT INITIAL.
      READ TABLE it_rectempl_filter INTO ls_templ
                                    WITH KEY werks  = wa_fullreturn-werks
                                             labor  = wa_fullreturn-labor
                                             pv_num = wa_fullreturn-pv_num.
    ENDIF.
    wa_global_data-zmip     = ls_templ-zmip.
    CLEAR:ls_templ.
*"End - 115874 - Fabricio Beneduzi - Inetum - 22.09.2022
*END - ALM-115874 - 07.13.2022 - RFMORAIS


*<-- Roff SDF - Pedro Freitas - CR 87638 - 06.01.2015
    IF wa_fullreturn-type EQ c_success2.
      wa_global_data-icon  = c_icon1.
      wa_global_data-plnnr = wa_fullreturn-message_v1.
    ELSE.
      CLEAR: wa_global_data-plnnr, wa_global_data-plnal.
      wa_global_data-icon = c_icon2.
      wa_global_data-msglin = wa_fullreturn-message.
    ENDIF.
    APPEND wa_global_data TO it_global_data.
  ENDLOOP.

*  SORT it_global_data
*    BY icon werks status_code datum
*       matnr matnr_text labor plan_id
*       pv_num datuv message plnnr.
  SORT it_global_data
    BY icon userex dateex timeex werks matnr labor plan_id
       pv_num plnnr.
  DELETE ADJACENT DUPLICATES FROM it_global_data
    COMPARING ALL FIELDS.

*--> Roff SDF - Pedro Freitas - CR 87638 - 06.02.2015
*  SORT it_global_data
*    BY werks matnr.

  CLEAR wa_global_data.

  LOOP AT it_global_data INTO wa_global_data.
**    Insert into data base
    MOVE-CORRESPONDING wa_global_data TO ls_output.
    APPEND ls_output TO lt_filter_ls_output.                 "$sst: #723
    IF lines( lt_filter_ls_output ) >= 10000.                "$sst: #723
      INSERT zgl_rect_ex_log FROM TABLE lt_filter_ls_output  "$sst: #723
        ACCEPTING DUPLICATE KEYS.                            "$sst: #723
      CLEAR lt_filter_ls_output[].                           "$sst: #723
    ENDIF.                                                   "$sst: #723
    CLEAR: wa_global_data, ls_output.
  ENDLOOP.                                                   "$sst: #723
  IF NOT lt_filter_ls_output[] IS INITIAL.                   "$sst: #723
    INSERT zgl_rect_ex_log FROM TABLE lt_filter_ls_output    "$sst: #723
      ACCEPTING DUPLICATE KEYS.                              "$sst: #723
    FREE lt_filter_ls_output[].                              "$sst: #723
  ENDIF.                                                     "$sst: #723

**  SORT output
  SORT it_global_data BY act_code ASCENDING werks labor plan_id matnr pv_num plnnr DESCENDING bstmi bstma ASCENDING.
*<-- Roff SDF - Pedro Freitas - CR 87638 - 06.02.2015
ENDFORM.                    " f_fill_global_data

*&---------------------------------------------------------------------*
*&      Form  f_retrieve_matnr_text
*&---------------------------------------------------------------------*
*       Retrieve MATNR_TEXT	using the function module
*       HAZMAT_MATNR_GET_TEXT
*----------------------------------------------------------------------*
*      -->PI_MATNR  text
*----------------------------------------------------------------------*
FORM f_retrieve_matnr_text  USING    p_matnr TYPE zgl_rectempl-matnr.
  "$sst: #105


  CALL FUNCTION 'HAZMAT_MATNR_GET_TEXT'
    EXPORTING
      i_matnr         = p_matnr
      i_langu         = sy-langu
    IMPORTING
      e_maktx         = gv_maktx
    EXCEPTIONS
      no_record_found = 1
      OTHERS          = 2.
  IF sy-subrc NE 0.
    CLEAR: gv_maktx.
  ENDIF.

ENDFORM.                    " f_retrieve_matnr_text

*&---------------------------------------------------------------------*
*&      Form  f_ypgen_add_alv_field_catalog
*&---------------------------------------------------------------------*
*       Add fields to the field catalog with the most used attributes.
*----------------------------------------------------------------------*
FORM f_ypgen_add_alv_field_catalog
          USING
            p_fieldname  TYPE slis_fieldcat_alv-fieldname
            p_tabname    TYPE slis_fieldcat_alv-tabname
            p_colpos     TYPE slis_fieldcat_alv-col_pos
            p_outputlen  TYPE slis_fieldcat_alv-outputlen
            p_noout      TYPE slis_fieldcat_alv-no_out
            p_cfieldname TYPE slis_fieldcat_alv-cfieldname
            p_ctabname   TYPE slis_fieldcat_alv-ctabname
            p_qfieldname TYPE slis_fieldcat_alv-qfieldname
            p_qtabname   TYPE slis_fieldcat_alv-qtabname
            p_key        TYPE slis_fieldcat_alv-key
            p_seltext_s  TYPE slis_fieldcat_alv-seltext_s
            p_seltext_m  TYPE slis_fieldcat_alv-seltext_m
            p_seltext_l  TYPE slis_fieldcat_alv-seltext_l
            p_ddictxt    TYPE slis_fieldcat_alv-ddictxt
            p_just       TYPE slis_fieldcat_alv-just
            p_emphasize  TYPE slis_fieldcat_alv-emphasize
            p_nozero     TYPE slis_fieldcat_alv-no_zero
            p_dosum      TYPE slis_fieldcat_alv-do_sum
            p_icon       TYPE slis_fieldcat_alv-icon
        CHANGING
            p_catalog    TYPE slis_t_fieldcat_alv.

  DATA: wa_catalog TYPE LINE OF  slis_t_fieldcat_alv.

* clear header
  CLEAR wa_catalog.

* add attributes to the ALV field catalog
  wa_catalog-fieldname  = p_fieldname.
  wa_catalog-tabname    = p_tabname.
  wa_catalog-col_pos    = p_colpos.
  wa_catalog-outputlen  = p_outputlen.
  wa_catalog-no_out     = p_noout.
  wa_catalog-cfieldname = p_cfieldname.
  wa_catalog-ctabname   = p_ctabname.
  wa_catalog-qfieldname = p_qfieldname.
  wa_catalog-qtabname   = p_qtabname.
  wa_catalog-key        = p_key.
  wa_catalog-icon       = p_icon.
  wa_catalog-seltext_s  = p_seltext_s.
  wa_catalog-seltext_m  = p_seltext_m.
  wa_catalog-seltext_l  = p_seltext_l.
  wa_catalog-ddictxt    = p_ddictxt.
  wa_catalog-just       = p_just.
  wa_catalog-emphasize  = p_emphasize.
  wa_catalog-no_zero    = p_nozero.
  wa_catalog-do_sum     = p_dosum.

* add new field to the catalog
  APPEND wa_catalog TO p_catalog.

ENDFORM.                    " f_ypgen_add_alv_field_catalog

*&---------------------------------------------------------------------*
*&      Form  f_WERKS
*&---------------------------------------------------------------------*
*       Configuration of field werks for alv display
*----------------------------------------------------------------------*
FORM f_werks CHANGING p_colpos TYPE i.                  "$sst: #105 #901

  DATA: lv_fieldna  TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab TYPE slis_fieldcat_alv-tabname,
        lv_outlen   TYPE slis_fieldcat_alv-outputlen VALUE space,
        lv_no_out   TYPE slis_fieldcat_alv-no_out    VALUE space,
        lv_textl    TYPE slis_fieldcat_alv-seltext_l VALUE space,
        lv_dosum    TYPE slis_fieldcat_alv-do_sum    VALUE space.

  ADD 1 TO p_colpos.
  lv_fieldna = TEXT-003.
  lv_fieldtab = TEXT-002.
  lv_textl = TEXT-004.
  PERFORM f_ypgen_add_alv_field_catalog
          USING lv_fieldna   lv_fieldtab   p_colpos
                lv_outlen    lv_no_out     space
                space        space         space
                c_mark       space         space       "SELTEXT MIDDLE
                lv_textl     space         c_center    "justification
                space        space         lv_dosum
                space
       CHANGING it_alv_fieldcat.

ENDFORM.                    " f_WERKS

*&---------------------------------------------------------------------*
*&      Form  f_status_code
*&---------------------------------------------------------------------*
*       Configuration of field status_code for alv display
*----------------------------------------------------------------------*
FORM f_status_code CHANGING p_colpos TYPE i.            "$sst: #105 #901

  DATA: lv_fieldna   TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab  TYPE slis_fieldcat_alv-tabname,
        lv_outlen    TYPE slis_fieldcat_alv-outputlen VALUE space,
        lv_textl     TYPE slis_fieldcat_alv-seltext_l VALUE space,
        lv_emphasize TYPE slis_fieldcat_alv-emphasize VALUE space.

  ADD 1 TO p_colpos.
  lv_fieldna = TEXT-005.
  lv_fieldtab = TEXT-002.
  lv_textl = TEXT-006.

  PERFORM f_ypgen_add_alv_field_catalog USING lv_fieldna  "FIELDNAME
                                              lv_fieldtab "TABNAME
                                              p_colpos    "lv_colpos
                                              lv_outlen
                                              space
                                              space
                                              space
                                              space
                                              space
                                              c_mark
                                              space       "SELTEXT SHORT
                                              space       "SELTEXT MIDDLE
                                              lv_textl    "SELTEXT LONG
                                              space
                                              c_center    "justification
                                              lv_emphasize
                                              space
                                              space
                                              space
                                     CHANGING it_alv_fieldcat.

ENDFORM.                    " f_status_code
*&---------------------------------------------------------------------*
*&      Form  f_datum
*&---------------------------------------------------------------------*
*       Configuration of field datum for alv display
*----------------------------------------------------------------------*
FORM f_datum CHANGING p_colpos TYPE i.                  "$sst: #105 #901

  DATA: lv_fieldna   TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab  TYPE slis_fieldcat_alv-tabname,
        lv_outlen    TYPE slis_fieldcat_alv-outputlen VALUE space,
        lv_textl     TYPE slis_fieldcat_alv-seltext_l VALUE space,
        lv_emphasize TYPE slis_fieldcat_alv-emphasize VALUE space.

  ADD 1 TO p_colpos.
  lv_fieldna = TEXT-007.
  lv_fieldtab = TEXT-002.
  lv_textl = TEXT-008.

  PERFORM f_ypgen_add_alv_field_catalog USING lv_fieldna  "FIELDNAME
                                              lv_fieldtab   "TABNAME
                                              p_colpos      "lv_colpos
                                              lv_outlen
                                              space
                                              space
                                              space
                                              space
                                              space
                                              c_mark        "KEY
                                              space         "SELTEXT SHORT
                                              space         "SELTEXT MIDDLE
                                              lv_textl      "SELTEXT LONG
                                              space
                                              c_left        "justification
                                              lv_emphasize
                                              space         "no-zero
                                              space
                                              space
                                     CHANGING it_alv_fieldcat.

ENDFORM.                    " f_datum
*&---------------------------------------------------------------------*
*&      Form  f_matnr
*&---------------------------------------------------------------------*
*       Configuration of field matnr for alv display
*----------------------------------------------------------------------*
FORM f_matnr CHANGING p_colpos TYPE i.                  "$sst: #105 #901

  DATA: lv_fieldna   TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab  TYPE slis_fieldcat_alv-tabname,
        lv_outlen    TYPE slis_fieldcat_alv-outputlen VALUE space,
        lv_textl     TYPE slis_fieldcat_alv-seltext_l VALUE space,
        lv_emphasize TYPE slis_fieldcat_alv-emphasize VALUE space.

  ADD 1 TO p_colpos.
  lv_fieldna = TEXT-009.
  lv_fieldtab = TEXT-002.
  lv_textl = TEXT-010.

  PERFORM f_ypgen_add_alv_field_catalog USING lv_fieldna     "FIELDNAME
                                              lv_fieldtab    "TABNAME
                                              p_colpos "lv_colpos
                                              lv_outlen
                                              space
                                              space
                                              space
                                              space
                                              space
                                              c_mark
                                              space   "SELTEXT SHORT
                                              space   "SELTEXT MIDDLE
                                              lv_textl   "SELTEXT LONG
                                              space
                                              c_left     "justification
                                              lv_emphasize
                                              space
                                              space
                                              space
                                     CHANGING it_alv_fieldcat.

ENDFORM.                    " f_matnr
*&---------------------------------------------------------------------*
*&      Form  f_matnr_text
*&---------------------------------------------------------------------*
*       Configuration of field matnr_text for alv display
*----------------------------------------------------------------------*
FORM f_matnr_text CHANGING p_colpos TYPE i.             "$sst: #105 #901

  DATA: lv_fieldna   TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab  TYPE slis_fieldcat_alv-tabname,
        lv_outlen    TYPE slis_fieldcat_alv-outputlen VALUE space,
        lv_textl     TYPE slis_fieldcat_alv-seltext_l VALUE space,
        lv_emphasize TYPE slis_fieldcat_alv-emphasize VALUE space.

  ADD 1 TO p_colpos.
  lv_fieldna = TEXT-011.
  lv_fieldtab = TEXT-002.
  lv_textl = TEXT-012.

  PERFORM f_ypgen_add_alv_field_catalog USING lv_fieldna    "FIELDNAME
                                              lv_fieldtab   "TABNAME
                                              p_colpos      "lv_colpos
                                              lv_outlen
                                              space
                                              space
                                              space
                                              space
                                              space
                                              c_mark
                                              space         "SELTEXT SHORT
                                              space         "SELTEXT MIDDLE
                                              lv_textl      "SELTEXT LONG
                                              space
                                              c_left        "justification
                                              lv_emphasize
                                              space
                                              space
                                              space
                                     CHANGING it_alv_fieldcat.

ENDFORM.                    " f_matnr_text
*&---------------------------------------------------------------------*
*&      Form  f_labor
*&---------------------------------------------------------------------*
*       Configuration of field labor for alv display
*----------------------------------------------------------------------*
FORM f_labor CHANGING p_colpos TYPE i.                  "$sst: #105 #901

  DATA: lv_fieldna   TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab  TYPE slis_fieldcat_alv-tabname,
        lv_outlen    TYPE slis_fieldcat_alv-outputlen VALUE space,
        lv_textl     TYPE slis_fieldcat_alv-seltext_l VALUE space,
        lv_emphasize TYPE slis_fieldcat_alv-emphasize VALUE space.

  ADD 1 TO p_colpos.
  lv_fieldna = TEXT-013.
  lv_fieldtab = TEXT-002.
  lv_textl = TEXT-014.

  PERFORM f_ypgen_add_alv_field_catalog USING lv_fieldna     "FIELDNAME
                                            lv_fieldtab    "TABNAME
                                            p_colpos "lv_colpos
                                            lv_outlen
                                            space
                                            space
                                            space
                                            space
                                            space
                                            c_mark
                                            space   "SELTEXT SHORT
                                            space   "SELTEXT MIDDLE
                                            lv_textl   "SELTEXT LONG
                                            space
                                            c_left     "justification
                                            lv_emphasize
                                            space
                                            space
                                            space
                                   CHANGING it_alv_fieldcat.

ENDFORM.                    " f_labor
*&---------------------------------------------------------------------*
*&      Form  f_plan_id
*&---------------------------------------------------------------------*
*       Configuration of field plan_id for alv display
*----------------------------------------------------------------------*
FORM f_plan_id CHANGING p_colpos TYPE i.                "$sst: #105 #901

  DATA: lv_fieldna   TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab  TYPE slis_fieldcat_alv-tabname,
        lv_outlen    TYPE slis_fieldcat_alv-outputlen VALUE space,
        lv_textl     TYPE slis_fieldcat_alv-seltext_l VALUE space,
        lv_emphasize TYPE slis_fieldcat_alv-emphasize VALUE space.

  ADD 1 TO p_colpos.
  lv_fieldna = TEXT-015.
  lv_fieldtab = TEXT-002.
  lv_textl = TEXT-016.

  PERFORM f_ypgen_add_alv_field_catalog USING lv_fieldna     "FIELDNAME
                                              lv_fieldtab    "TABNAME
                                              p_colpos "lv_colpos
                                              lv_outlen
                                              space
                                              space
                                              space
                                              space
                                              space
                                              c_mark
                                              space   "SELTEXT SHORT
                                              space   "SELTEXT MIDDLE
                                              lv_textl   "SELTEXT LONG
                                              space
                                              c_left     "justification
                                              lv_emphasize
                                              space
                                              space
                                              space
                                     CHANGING it_alv_fieldcat.

ENDFORM.                    " f_plan_id
*&---------------------------------------------------------------------*
*&      Form  f_pv_num
*&---------------------------------------------------------------------*
*       Configuration of field pv_num for alv display
*----------------------------------------------------------------------*
FORM f_pv_num CHANGING p_colpos TYPE i.                 "$sst: #105 #901

  DATA: lv_fieldna   TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab  TYPE slis_fieldcat_alv-tabname,
        lv_outlen    TYPE slis_fieldcat_alv-outputlen VALUE space,
        lv_textl     TYPE slis_fieldcat_alv-seltext_l VALUE space,
        lv_emphasize TYPE slis_fieldcat_alv-emphasize VALUE space.

  ADD 1 TO p_colpos.
  lv_fieldna = TEXT-017.
  lv_fieldtab = TEXT-002.
  lv_textl = TEXT-018.

  PERFORM f_ypgen_add_alv_field_catalog USING lv_fieldna     "FIELDNAME
                                            lv_fieldtab    "TABNAME
                                            p_colpos "lv_colpos
                                            lv_outlen
                                            space
                                            space
                                            space
                                            space
                                            space
                                            c_mark
                                            space   "SELTEXT SHORT
                                            space   "SELTEXT MIDDLE
                                            lv_textl   "SELTEXT LONG
                                            space
                                            c_left     "justification
                                            lv_emphasize
                                            space
                                            space
                                            space
                                   CHANGING it_alv_fieldcat.

ENDFORM.                    " f_pv_num
*&---------------------------------------------------------------------*
*&      Form  f_datuv
*&---------------------------------------------------------------------*
*       Configuration of field datuv for alv display
*----------------------------------------------------------------------*
FORM f_datuv CHANGING p_colpos TYPE i.                  "$sst: #105 #901

  DATA: lv_fieldna   TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab  TYPE slis_fieldcat_alv-tabname,
        lv_outlen    TYPE slis_fieldcat_alv-outputlen VALUE space,
        lv_textl     TYPE slis_fieldcat_alv-seltext_l VALUE space,
        lv_emphasize TYPE slis_fieldcat_alv-emphasize VALUE space.

  ADD 1 TO p_colpos.
  lv_fieldna = TEXT-019.
  lv_fieldtab = TEXT-002.
  lv_textl = TEXT-020.

  PERFORM f_ypgen_add_alv_field_catalog USING lv_fieldna  "FIELDNAME
                                              lv_fieldtab "TABNAME
                                              p_colpos    "lv_colpos
                                              lv_outlen
                                              space
                                              space
                                              space
                                              space
                                              space
                                              c_mark
                                              space      "SELTEXT SHORT
                                              space      "SELTEXT MIDDLE
                                              lv_textl   "SELTEXT LONG
                                              space
                                              c_left     "justification
                                              lv_emphasize
                                              space
                                              space
                                              space
                                     CHANGING it_alv_fieldcat.

ENDFORM.                    " f_datuv
*&---------------------------------------------------------------------*
*&      Form  f_message
*&---------------------------------------------------------------------*
*       Configuration of field message for alv display
*----------------------------------------------------------------------*
FORM f_message CHANGING p_colpos TYPE i.                "$sst: #105 #901

  DATA: lv_fieldna   TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab  TYPE slis_fieldcat_alv-tabname,
        lv_outlen    TYPE slis_fieldcat_alv-outputlen VALUE space,
        lv_textl     TYPE slis_fieldcat_alv-seltext_l VALUE space,
        lv_emphasize TYPE slis_fieldcat_alv-emphasize VALUE space.

  ADD 1 TO p_colpos.
  lv_fieldna = TEXT-021.
  lv_fieldtab = TEXT-002.
  lv_textl = TEXT-022.

  PERFORM f_ypgen_add_alv_field_catalog USING lv_fieldna     "FIELDNAME
                                            lv_fieldtab    "TABNAME
                                            p_colpos "lv_colpos
                                            lv_outlen
                                            space
                                            space
                                            space
                                            space
                                            space
                                            c_mark
                                            space   "SELTEXT SHORT
                                            space   "SELTEXT MIDDLE
                                            lv_textl   "SELTEXT LONG
                                            space
                                            c_left     "justification
                                            lv_emphasize
                                            space
                                            space
                                            space
                                   CHANGING it_alv_fieldcat.

ENDFORM.                    " f_message
*&---------------------------------------------------------------------*
*&      Form  f_icon
*&---------------------------------------------------------------------*
*       Configuration of field icon for alv display
*----------------------------------------------------------------------*
FORM f_icon CHANGING p_colpos TYPE i.                   "$sst: #105 #901

  DATA: lv_fieldna   TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab  TYPE slis_fieldcat_alv-tabname,
        lv_outlen    TYPE slis_fieldcat_alv-outputlen VALUE space,
        lv_textl     TYPE slis_fieldcat_alv-seltext_l VALUE space,
        lv_emphasize TYPE slis_fieldcat_alv-emphasize VALUE space.

  ADD 1 TO p_colpos.
  lv_fieldna = TEXT-023.
  lv_fieldtab = TEXT-002.
  lv_textl = TEXT-024.

  PERFORM f_ypgen_add_alv_field_catalog USING lv_fieldna     "FIELDNAME
                                              lv_fieldtab    "TABNAME
                                              p_colpos
                                              lv_outlen
                                              space
                                              space
                                              space
                                              space
                                              space
                                              c_mark
                                              space   "SELTEXT SHORT
                                              space   "SELTEXT MIDDLE
                                              lv_textl   "SELTEXT LONG
                                              space
                                              c_center   "justification
                                              lv_emphasize
                                              space
                                              space
                                              c_mark
                                     CHANGING it_alv_fieldcat.
ENDFORM.                    " f_icon
*&---------------------------------------------------------------------*
*&      Form  f_plnnr
*&---------------------------------------------------------------------*
*       Configuration of field plnnr for alv display
*----------------------------------------------------------------------*
FORM f_plnnr CHANGING p_colpos TYPE i.                  "$sst: #105 #901

  DATA: lv_fieldna   TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab  TYPE slis_fieldcat_alv-tabname,
        lv_outlen    TYPE slis_fieldcat_alv-outputlen VALUE space,
        lv_textl     TYPE slis_fieldcat_alv-seltext_l VALUE space,
        lv_emphasize TYPE slis_fieldcat_alv-emphasize VALUE space.

  ADD 1 TO p_colpos.
  lv_fieldna = TEXT-025.
  lv_fieldtab = TEXT-002.
  lv_textl = TEXT-026.

  PERFORM f_ypgen_add_alv_field_catalog USING lv_fieldna     "FIELDNAME
                                              lv_fieldtab    "TABNAME
                                              p_colpos
                                              lv_outlen
                                              space
                                              space
                                              space
                                              space
                                              space
                                              c_mark
                                              space   "SELTEXT SHORT
                                              space   "SELTEXT MIDDLE
                                              lv_textl   "SELTEXT LONG
                                              space
                                              c_left     "justification
                                              lv_emphasize
                                              space
                                              space
                                              space
                                     CHANGING it_alv_fieldcat.

ENDFORM.                    " f_plnnr
*&---------------------------------------------------------------------*
*&      Form  f_alv_layout
*&---------------------------------------------------------------------*
*       Configuration of Layout catalog
*----------------------------------------------------------------------*
FORM f_alv_layout .

  CLEAR wa_layout.
  wa_layout-colwidth_optimize = c_mark.

ENDFORM.                    " f_alv_layout

*&---------------------------------------------------------------------*
*&      Form  f_show_alv
*&---------------------------------------------------------------------*
*       Show ALV display
*----------------------------------------------------------------------*
FORM f_show_alv .

  DATA:
    lv_repid TYPE repid.                                     "$sst: #166

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = lv_repid
      it_fieldcat        = it_alv_fieldcat
      is_layout          = wa_layout
    TABLES
      t_outtab           = it_global_data
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.
  IF sy-subrc NE 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

ENDFORM.                    " f_show_alv
*&---------------------------------------------------------------------*
*&      Form  f_initialitation
*&---------------------------------------------------------------------*
*       Initialize all the global data
*----------------------------------------------------------------------*
FORM f_initialitation .

  DATA: lv_functxt TYPE smp_dyntxt.
  CLEAR:
*&---------------------------------------------------------------------*
*&      Variables
*&---------------------------------------------------------------------*
        gv_flag,
        gv_num,
        gv_plnty,
        gv_maktx,

*&---------------------------------------------------------------------*
*&      Internal tables and structures
*&---------------------------------------------------------------------*
        it_marc,
        it_mkal,
        it_mara,
        it_subproccode,
        it_rectempl,
        gs_rectempl_bi,                                      "$sst: #110
        it_rectempl_filter,
        it_return,
        it_fullreturn,
        it_exp_bom,
        it_exp_itm,
        it_crhd,
        it_planpo,
        it_plpo,
        it_global_data,
        it_alv_fieldcat.

* Recipe Template Button
  lv_functxt-icon_id    = icon_view_form.
  lv_functxt-quickinfo  = c_quickinfo.
  lv_functxt-icon_text  = c_icontext.
  sscrfields-functxt_01 = lv_functxt.
* Factors Button
  lv_functxt-icon_id    = icon_base_planning_object.
  lv_functxt-quickinfo  = c_quickinfo2.
  lv_functxt-icon_text  = c_icontext2.
  sscrfields-functxt_02 = lv_functxt.
* Production Version Grouping Button
  lv_functxt-icon_id    = icon_product_group.
  lv_functxt-quickinfo  = c_quickinfo3.
  lv_functxt-icon_text  = c_icontext3.
  sscrfields-functxt_03 = lv_functxt.

ENDFORM.                    " f_initialitation
*&---------------------------------------------------------------------*
*&      Form  f_populate_alv
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_WA_RECTEMPL  text
*      -->P_WA_RETURN  text
*      -->P_C_ERROR  text
*----------------------------------------------------------------------*
FORM f_populate_alv USING p_wa_rectempl STRUCTURE zgl_rectempl
                          p_wa_return TYPE bapiret2          "$sst: #105
                          p_status TYPE                      "$sst: #105
                            zgl_rectempl-status_code         "$sst: #105
                          p_act_code TYPE clike.             "$sst: #105

  MOVE-CORRESPONDING p_wa_rectempl TO wa_fullreturn .
  MOVE-CORRESPONDING p_wa_return TO wa_fullreturn .
  wa_fullreturn-act_code = p_act_code.
  wa_fullreturn-stalt    = p_wa_rectempl-stalt.
  wa_fullreturn-type     = p_status.
  APPEND wa_fullreturn TO it_fullreturn.

ENDFORM.                    " f_populate_alv

*&---------------------------------------------------------------------*
*&      Form  f_update_rectempl
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_update_rectempl .
  LOOP AT it_rectempl_filter INTO wa_rectempl_filter.
*   verify Batch input execution
    CLEAR wa_rectempl.
    IF NOT wa_rectempl_filter-labor IS INITIAL.
      READ TABLE gt_rectempl_bi INTO wa_rectempl             "$sst: #110
                                WITH KEY werks       = wa_rectempl_filter-werks
                                         labor       = wa_rectempl_filter-labor
                                         fr_qty      = wa_rectempl_filter-fr_qty
                                         to_qty      = wa_rectempl_filter-to_qty
                                         pv_num      = wa_rectempl_filter-pv_num
                                         status_code = c_error.
    ELSEIF NOT wa_rectempl_filter-plan_id IS INITIAL.
      READ TABLE gt_rectempl_bi INTO wa_rectempl             "$sst: #110
                                WITH KEY werks       = wa_rectempl_filter-werks
                                         plan_id     = wa_rectempl_filter-plan_id
                                         fr_qty      = wa_rectempl_filter-fr_qty
                                         to_qty      = wa_rectempl_filter-to_qty
                                         pv_num      = wa_rectempl_filter-pv_num
                                         status_code = c_error.
    ELSEIF NOT wa_rectempl_filter-matnr IS INITIAL.
      READ TABLE gt_rectempl_bi INTO wa_rectempl             "$sst: #110
                                WITH KEY werks       = wa_rectempl_filter-werks
                                         matnr       = wa_rectempl_filter-matnr
                                         fr_qty      = wa_rectempl_filter-fr_qty
                                         to_qty      = wa_rectempl_filter-to_qty
                                         pv_num      = wa_rectempl_filter-pv_num
                                         status_code = c_error.
    ENDIF.
*    create an error record
    IF sy-subrc = 0.
*     'update' status_code:
*     delete existent record
      DELETE zgl_rectempl FROM wa_rectempl_filter.
      wa_rectempl_filter-prc_date    = sy-datum.
      wa_rectempl_filter-status_code = c_error.
      MODIFY zgl_rectempl FROM wa_rectempl_filter.

*    create a successful record
    ELSE.
*     'update' status_code:
*     delete existent record
      DELETE zgl_rectempl FROM wa_rectempl_filter.
      wa_rectempl_filter-prc_date    = sy-datum.
      wa_rectempl_filter-status_code = c_success.
      MODIFY zgl_rectempl FROM wa_rectempl_filter.
    ENDIF.
  ENDLOOP.
  COMMIT WORK.
ENDFORM.                    " f_update_rectempl

*&---------------------------------------------------------------------*
*&      Form  f_populate_msg
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_C_BAPI_E  text
*      -->P_3194   text
*      -->P_3195   text
*      -->P_WA_MARC_MATNR  text
*      -->P_WA_MARC_WERKS  text
*      -->P_SPACE  text
*      -->P_SPACE  text
*      <--P_WA_RETURN  text
*----------------------------------------------------------------------*
FORM f_populate_msg  USING    p_type TYPE clike              "$sst: #105
                              p_class TYPE clike             "$sst: #105
                              p_nro TYPE clike               "$sst: #105
                              p_val01 TYPE clike             "$sst: #105
                              p_val02 TYPE clike             "$sst: #105
                              p_val03 TYPE clike             "$sst: #105
                              p_val04 TYPE clike             "$sst: #105
                     CHANGING p_return TYPE bapiret2.

  DATA: lv_class   TYPE sy-msgid,                             "$sst: #153
        lv_type    TYPE sy-msgty,                             "$sst: #153
        lv_number  TYPE sy-msgno,                             "$sst: #153
        lv_par1    TYPE sy-msgv1,                             "$sst: #153
        lv_par2    TYPE sy-msgv2,                             "$sst: #153
        lv_par3    TYPE sy-msgv3,                             "$sst: #153
        lv_par4    TYPE sy-msgv4,                             "$sst: #153
        lv_msg_lin TYPE cfgnl-msglin.                        "$sst: #153

  lv_class  = p_class.
  lv_type   = p_type.
  lv_number = p_nro.
  lv_par1   = p_val01.
  lv_par2   = p_val02.
  lv_par3   = p_val03.
  lv_par4   = p_val04.

  CALL FUNCTION 'RKC_MSG_STRING'
    EXPORTING
      id      = lv_class
      mtype   = lv_type
      number  = lv_number
      par1    = lv_par1
      par2    = lv_par2
      par3    = lv_par3
      par4    = lv_par4
    IMPORTING
      msg_lin = lv_msg_lin.
  MOVE lv_msg_lin TO p_return-message.

ENDFORM.                    " f_populate_msg
*&---------------------------------------------------------------------*
*&      Form  f_val_input_pmod
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_val_input_pmod.

  IF p_prgmod = c_1. "If in create mode only, disable deletion type parameters
    CLEAR: p_recrpm, p_recrsc.
    LOOP AT SCREEN.
      IF screen-name = 'P_RECRSC'
      OR screen-name = 'P_RECRPM'.
        screen-input = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.

  IF p_recrpm = c_mark. "Disable Material Gouping ID and Production Version if to delete by Plant / Material
    CLEAR: s_plan_i[].                                       "$sst: #157
    LOOP AT SCREEN.
      IF screen-name = 'S_PLAN_I-LOW'
      OR screen-name = 'S_PLAN_I-HIGH'
      OR screen-name = 'S_PVNUM-LOW'
      OR screen-name = 'S_PVNUM-HIGH'.
        screen-input = 0.
        MODIFY SCREEN.
        CLEAR: s_plan_i[], s_pvnum[].
      ENDIF.
    ENDLOOP.
  ENDIF.

ENDFORM.                    " f_val_input_pmod

*&---------------------------------------------------------------------*
*&      Form  f_back_pvers
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_back_pvers .
  CALL TRANSACTION 'Z_CR_RTEMPL'.
ENDFORM.                    " f_back_pvers
*&---------------------------------------------------------------------*
*&      Form  f_go_factors
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM f_go_factors.
  CALL TRANSACTION 'ZGL_MFG_MAINT_FACTOR'.
ENDFORM.                    "f_go_factors
*&---------------------------------------------------------------------*
*&      Form  f_go_pv_grp
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM f_go_pv_grp.
  CALL TRANSACTION 'ZGL_MFG_MAINT_PVGRP'.
ENDFORM.                    "f_go_pv_grp
*&---------------------------------------------------------------------*
*&      Form  f_get_all_data
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_get_all_data.

  DATA: lv_mats       TYPE sytabix,
        lv_index      TYPE sytabix,
        it_matnr      TYPE TABLE OF ty_matnr,
        lv_ignore(10) TYPE c,                                "$sst: #139
        lv_matnr(18)  TYPE c,                                 "$sst: #139
        wa_matnr      TYPE ty_matnr.

* initialization of internal tables
  CLEAR: it_rectempl[].                                      "$sst: #157
  CLEAR: it_rectempl_filter[].                               "$sst: #157
  CLEAR: gt_rectempl_bi[].                              "$sst: #110 #157
  CLEAR: it_rectempl_aux[].                                  "$sst: #157
  CLEAR: it_mc29v[].                                         "$sst: #157
  CLEAR: it_subproccode[].                                   "$sst: #157
  CLEAR: it_marc[].                                          "$sst: #157
  CLEAR: it_mkal[].                                          "$sst: #157
  CLEAR: it_mast[].                                          "$sst: #157

  CLEAR: lv_mats, lv_index, it_matnr[], wa_matnr.

* If Only Plant filled
  IF s_labor[] IS INITIAL AND s_plan_i[] IS INITIAL AND s_matnr[] IS INITIAL.
    SELECT matnr werks labor mmsta
      FROM mc29v
           APPENDING TABLE it_mc29v
     WHERE matnr IN s_matnr
       AND werks = p_werks
       AND labor IN s_labor
       AND mmsta IN s_mmsta
       AND beskz IN s_beskz
       AND sobsl IN s_sobsl.
  ENDIF.

* Lab/Office and/or Material filled
  IF s_labor[] IS NOT INITIAL OR s_matnr[] IS NOT INITIAL.
    IF it_mc29v[] IS INITIAL.
      lv_mats = lines( s_matnr ).                            "$sst: #164
      IF lv_mats > c_4000.
        CLEAR: it_matnr[], r_matnr[].
        WHILE lv_index <= lv_mats.
          DO 4000 TIMES.
            ADD 1 TO lv_index.
            READ TABLE s_matnr INTO wa_matnr INDEX lv_index.
            IF sy-subrc EQ 0.
              IF wa_matnr CS c_eq.
                CLEAR: lv_ignore, lv_matnr.
                SPLIT wa_matnr-matnr AT c_eq INTO lv_ignore lv_matnr.
                wa_matnr-matnr = lv_matnr.
                APPEND wa_matnr TO it_matnr.
                CLEAR wa_matnr.
              ENDIF.
            ELSE.
              EXIT.
            ENDIF.
          ENDDO.
          SELECT matnr werks labor mmsta
            FROM mc29v
                 APPENDING TABLE it_mc29v
                 FOR ALL ENTRIES IN it_matnr
           WHERE matnr = it_matnr-matnr
             AND werks = p_werks
             AND labor IN s_labor
             AND mmsta IN s_mmsta
             AND beskz IN s_beskz
             AND sobsl IN s_sobsl.
          CLEAR it_matnr[].
        ENDWHILE.
        r_matnr[] = s_matnr[].
        DELETE r_matnr WHERE option EQ c_eq.
        IF NOT r_matnr[] IS INITIAL.
          SELECT matnr werks labor mmsta
            FROM mc29v
                 APPENDING TABLE it_mc29v
           WHERE matnr IN r_matnr
             AND werks = p_werks
             AND labor IN s_labor
             AND mmsta IN s_mmsta
             AND beskz IN s_beskz
             AND sobsl IN s_sobsl.
        ENDIF.
      ELSE.
        SELECT matnr werks labor mmsta
          FROM mc29v
               APPENDING TABLE it_mc29v
         WHERE matnr IN s_matnr
           AND werks = p_werks
           AND labor IN s_labor
           AND mmsta IN s_mmsta
           AND beskz IN s_beskz
           AND sobsl IN s_sobsl.
      ENDIF.
    ENDIF.
  ENDIF.

* Material Grouping with values
  IF s_plan_i[] IS NOT INITIAL AND it_mc29v[] IS INITIAL.
    SELECT m~matnr m~werks m~labor m~mmsta
      FROM mc29v AS m
           APPENDING TABLE it_mc29v
     WHERE m~matnr IN s_matnr
       AND m~werks = p_werks
       AND m~labor IN s_labor
       AND m~mmsta IN s_mmsta
       AND m~beskz IN s_beskz
       AND m~sobsl IN s_sobsl
       AND EXISTS ( SELECT matnr
                      FROM zgl_subproccode AS z
                     WHERE z~werks   EQ p_werks
                       AND z~matnr   IN s_matnr
                       AND z~plan_id IN s_plan_i
                       AND z~werks   EQ m~werks
                       AND z~matnr   EQ m~matnr ).
  ENDIF.

  SORT it_mc29v
    BY werks matnr.
  DELETE ADJACENT DUPLICATES FROM it_mc29v
    COMPARING werks matnr.

* Material Grouping with values
  SELECT *
    FROM zgl_subproccode
    INTO TABLE it_subproccode
     FOR ALL ENTRIES IN it_mc29v
   WHERE werks   EQ it_mc29v-werks
     AND matnr   EQ it_mc29v-matnr
     AND plan_id IN s_plan_i.

* Get templates for the Plant
  SELECT *
    FROM zgl_rectempl
    INTO TABLE it_rectempl
   WHERE werks       EQ p_werks
     AND pv_num      IN s_pvnum.                             "$sst: #712
      "#EC CI_ALL_FIELDS_NEEDED (FUNCTION actual parameter) "$sst: #712

  IF NOT it_mc29v[] IS INITIAL.

    SELECT matnr werks stlan stlnr stlal
      FROM mast
           APPENDING TABLE it_mast
       FOR ALL ENTRIES IN it_mc29v
     WHERE matnr EQ it_mc29v-matnr
       AND werks EQ it_mc29v-werks.
    IF sy-subrc NE 0.
      CLEAR it_mast[].                                       "$sst: #157
    ENDIF.

    SELECT matnr werks verid
** Begin – FONSECC4 – 03.10.2019 – CR 40444
      plnnr
** End – FONSECC4 – 03.10.2019 – CR 40444
      stlal bstmi bstma mdv01 "ALM-115874 - 07.13.2022 - RFMORAIS
      FROM mkal

           APPENDING CORRESPONDING FIELDS OF TABLE it_mkal "ALM-115874 - 07.13.2022 - RFMORAIS
       FOR ALL ENTRIES IN it_mc29v
     WHERE matnr EQ it_mc29v-matnr
       AND werks EQ it_mc29v-werks
       AND verid IN s_pvnum.
    IF sy-subrc NE 0.
      CLEAR it_mkal[].                                       "$sst: #157
    ENDIF.

    SELECT matnr werks mmsta
      FROM marc APPENDING TABLE it_marc
       FOR ALL ENTRIES IN it_mc29v
     WHERE matnr EQ it_mc29v-matnr
       AND werks EQ it_mc29v-werks.

    SORT it_marc BY matnr werks.                             "$sst: #601
  ENDIF.

  SORT it_mkal BY matnr werks verid.
  DELETE ADJACENT DUPLICATES FROM it_mkal
    COMPARING matnr werks verid.

ENDFORM.                    "f_get_all_data

*&---------------------------------------------------------------------*
*&      Form  f_filter_it
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_filter_it .

* Locked templates are not processed!
  DELETE it_rectempl WHERE status = c_red.
  IF it_rectempl[] IS NOT INITIAL.
    LOOP AT it_rectempl INTO wa_rectempl.
      IF wa_rectempl-labor IS NOT INITIAL.       "First option --> Lab/Office
        PERFORM validate_labor USING wa_rectempl.
      ELSEIF wa_rectempl-plan_id IS NOT INITIAL. "Second option --> Material Grouping
        PERFORM validate_plan_id USING wa_rectempl.
      ELSEIF wa_rectempl-matnr IS NOT INITIAL.   "Third option --> Material
        PERFORM validate_matnr USING wa_rectempl.
      ENDIF.
    ENDLOOP.
  ENDIF.
  CLEAR: it_rectempl[].

* To avoid duplicates
  SORT it_rectempl_filter
    BY werks labor plan_id matnr pv_num.
  DELETE ADJACENT DUPLICATES FROM it_rectempl_filter
         COMPARING werks labor plan_id matnr pv_num.
  SORT gt_rectempl_bi                                        "$sst: #110
    BY werks labor plan_id matnr pv_num status_code.
  DELETE ADJACENT DUPLICATES FROM gt_rectempl_bi             "$sst: #110
         COMPARING werks labor plan_id matnr pv_num status_code.

ENDFORM.                    " f_filter_it

*&---------------------------------------------------------------------*
*&      Form  validate_labor
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_WA_RECTEMPL  text
*----------------------------------------------------------------------*
FORM validate_labor USING p_rectempl TYPE zgl_rectempl.

  DATA: wa_mc29v    LIKE LINE OF it_mc29v,
        wa_template TYPE zgl_rectempl.

  MOVE p_rectempl TO wa_template.

  LOOP AT it_mc29v INTO wa_mc29v
                  WHERE werks = p_rectempl-werks
                    AND labor = p_rectempl-labor.
    MOVE p_rectempl TO wa_template.
    PERFORM f_validate_mast_mkal_b
      USING wa_mc29v-matnr
            wa_mc29v-werks
            wa_template.
  ENDLOOP.

ENDFORM.                    " validate_labor

*&---------------------------------------------------------------------*
*&      Form  validate_plan_id
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_WA_RECTEMPL  text
*----------------------------------------------------------------------*
FORM validate_plan_id  USING  p_rectempl TYPE zgl_rectempl.

  DATA: wa_template TYPE zgl_rectempl,
        lv_plan_id  TYPE mdv.

  MOVE p_rectempl TO wa_template.

  CLEAR wa_subproccode.

  SELECT SINGLE plan_id
    INTO lv_plan_id
    FROM t437p
   WHERE werks   = wa_template-werks
     AND plan_id = wa_template-plan_id.
  IF sy-subrc = 0.
    LOOP AT it_subproccode INTO wa_subproccode
            WHERE plan_id EQ wa_template-plan_id
              AND werks   EQ wa_template-werks.
      READ TABLE it_marc INTO wa_marc
                 WITH KEY matnr = wa_subproccode-matnr
                          werks = wa_subproccode-werks.
      IF sy-subrc = 0.
        MOVE p_rectempl TO wa_template.
        PERFORM f_validate_mast_mkal_b
          USING wa_subproccode-matnr
                wa_subproccode-werks
                wa_template.
      ENDIF.
      CLEAR wa_subproccode.
    ENDLOOP.
  ELSE.
    CLEAR wa_return.
    APPEND wa_template TO it_rectempl_filter_ant.
    wa_template-status_code = c_error. "Log value displayed
    APPEND wa_template TO it_rectempl_bi_ant.
*   '& & & & does not exist.'
    PERFORM f_populate_msg USING    c_bapi_e
                                    c_msg_oio
                                    c_nro_232
                                    TEXT-m03 "'Sub. Proc.: '
                                    wa_template-plan_id
                                    TEXT-m01 "' for Plant: '
                                    wa_template-werks
                           CHANGING wa_return.
    PERFORM f_populate_alv USING wa_template
                                 wa_return
                                 c_error
                                 c_insert.
  ENDIF.

ENDFORM.                    " validate_plan_id

*&---------------------------------------------------------------------*
*&      Form  validate_matnr
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_WA_RECTEMPL  text
*----------------------------------------------------------------------*
FORM validate_matnr USING p_rectempl TYPE zgl_rectempl.

  DATA: wa_template TYPE zgl_rectempl.

  MOVE p_rectempl TO wa_template.

  CLEAR wa_marc.

  READ TABLE it_marc INTO wa_marc
    WITH KEY matnr = wa_template-matnr
             werks = wa_template-werks.
  IF sy-subrc = 0.
    PERFORM f_validate_mast_mkal_b
            USING wa_template-matnr
                  wa_template-werks
                  wa_template.
  ELSE.
    IF wa_template-matnr IN s_matnr.
      CLEAR wa_return.
      APPEND wa_template TO it_rectempl_filter_ant.
      wa_template-status_code = c_error. "Log value displayed
      APPEND wa_template TO it_rectempl_bi_ant.
*     '& & & & does not exist.'
      PERFORM f_populate_msg USING    c_bapi_e
                                      c_msg_oio
                                      c_nro_232
                                      TEXT-m04 "'Material: '
                                      wa_template-matnr
                                      TEXT-m01 "' for Plant: '
                                      wa_template-werks
                          CHANGING wa_return.
      PERFORM f_populate_alv USING wa_template
                                   wa_return
                                   c_error
                                   c_insert.
    ENDIF.
  ENDIF.
ENDFORM.                    " validate_matnr
*&---------------------------------------------------------------------*
*&      Form  f_validate_mast_mkal
*&---------------------------------------------------------------------*
*       New form with some changes to meet the requirements of MFG034b.
*----------------------------------------------------------------------*
FORM f_validate_mast_mkal_b USING p_matnr TYPE matnr         "$sst: #105
                                  p_werks TYPE werks_d       "$sst: #105
                                  p_rectempl TYPE zgl_rectempl.

  DATA: wa_templ TYPE zgl_rectempl,
        lv_stlal LIKE wa_templ-stalt.

  MOVE p_rectempl TO wa_templ.
  CLEAR: wa_mast,
         wa_mkal.

  SORT it_mast BY werks matnr werks stlan stlal.

* The alternative BOM is entered with one digit. The value is required with 2
  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
    EXPORTING
      input  = wa_templ-stalt
    IMPORTING
      output = lv_stlal.
  READ TABLE it_mast INTO wa_mast WITH KEY matnr = p_matnr
                                           werks = p_werks
                                           stlan = wa_templ-stlan
                                           stlal = lv_stlal
                                  BINARY SEARCH.
  IF sy-subrc <> 0.
*   Search for GL BOM if the one defined in Z_CR_RTEMPL
    READ TABLE it_mast INTO wa_mast WITH KEY matnr = p_matnr
                                             werks = p_werks
                                             stlan = wa_templ-stlan
                                             stlal = c_gl
                                    BINARY SEARCH.
    IF sy-subrc = 0.
*     Replace Alternative BOM in case the one defined in Z_CR_RTEMPL doesn't exist
      wa_templ-stalt = wa_mast-stlal.
      APPEND wa_templ TO it_rectempl_filter.
      wa_templ-matnr = p_matnr.
      APPEND wa_templ TO gt_rectempl_bi.                     "$sst: #110
    ELSE.
*   Search for other Alternative BOM
      READ TABLE it_mast INTO wa_mast WITH KEY matnr = p_matnr
                                               werks = p_werks
                                               stlan = wa_templ-stlan
                                      BINARY SEARCH.
      IF sy-subrc = 0.
*     Replace Alternative BOM in case the one defined in Z_CR_RTEMPL doesn't exist
        wa_templ-stalt = wa_mast-stlal.
        APPEND wa_templ TO it_rectempl_filter.
        wa_templ-matnr = p_matnr.
        APPEND wa_templ TO gt_rectempl_bi.                   "$sst: #110
      ELSE.
        CLEAR wa_return.
*   Further addition to it_rectempl_filter
        APPEND wa_templ TO it_rectempl_filter_ant.
        wa_templ-matnr = p_matnr.
        wa_templ-status_code = c_error. "Log value displayed
        APPEND wa_templ TO it_rectempl_bi_ant.
        CLEAR: wa_templ-labor, wa_templ-plan_id.
*   'Material & in plant & has no BOM'
        PERFORM f_populate_msg USING c_bapi_e
                                     c_msg_ck
                                     c_nro_314
                                     p_matnr
                                     p_werks
                                     space
                                     space
                            CHANGING wa_return.
        PERFORM f_populate_alv USING wa_templ
                                     wa_return
                                     c_error
                                     c_insert.
      ENDIF.
    ENDIF.
  ELSE.
    wa_templ-stalt = wa_mast-stlal.
    APPEND wa_templ TO it_rectempl_filter.
    wa_templ-matnr = p_matnr.
    APPEND wa_templ TO gt_rectempl_bi.                       "$sst: #110
  ENDIF.

ENDFORM.                    " validate_mast_mkal
*&---------------------------------------------------------------------*
*&      Form  f_del_old_ver
*&---------------------------------------------------------------------*
*       Delete old versions
*----------------------------------------------------------------------*
FORM f_del_old_ver.

  DATA: it_return   TYPE TABLE OF bapiret2,
        wa_templ    TYPE zgl_rectempl,
        it_templ    TYPE TABLE OF zgl_rectempl,
        lv_subrc    TYPE sy-subrc,                             "$sst: #153
        it_mkal_tmp TYPE TABLE OF ty_s_mkal_tmp,
        wa_mkal_tmp TYPE ty_s_mkal_tmp.
  DATA: ls_subproccode TYPE zgl_subproccode.

  CLEAR: it_mkal_tmp[], wa_mkal_tmp, it_templ[].

  " All PV's should be deleted by Plant/Material
  IF p_recrpm EQ c_mark.
    IF NOT it_mc29v[] IS INITIAL.
      SELECT m~matnr m~werks m~verid m~plnnr a~labor
             m~alnal m~stlan m~stlal m~bstmi m~bstma
        INTO TABLE it_mkal_tmp
        FROM ( mkal AS m INNER JOIN mara AS a
                         ON m~matnr = a~matnr )
         FOR ALL ENTRIES IN it_mc29v
       WHERE m~matnr EQ it_mc29v-matnr
         AND m~werks EQ it_mc29v-werks.
    ENDIF.
    " PV's deleted based on Selection Parameter
  ELSEIF p_recrsc EQ c_mark.
    IF s_plan_i[] IS INITIAL.
      IF NOT it_mc29v[] IS INITIAL.
        SELECT m~matnr m~werks m~verid m~plnnr a~labor
               m~alnal m~stlan m~stlal m~bstmi m~bstma
          INTO TABLE it_mkal_tmp
          FROM ( mkal AS m INNER JOIN mara AS a
                           ON m~matnr = a~matnr )
           FOR ALL ENTRIES IN it_mc29v
         WHERE m~matnr EQ it_mc29v-matnr
           AND m~werks EQ p_werks
           AND m~verid IN s_pvnum
           AND a~labor IN s_labor.
      ENDIF.
    ELSE.
      IF NOT it_mc29v[] IS INITIAL.
        SELECT m~matnr m~werks m~verid m~plnnr a~labor
               m~alnal m~stlan m~stlal m~bstmi m~bstma
          INTO TABLE it_mkal_tmp
          FROM ( mkal AS m INNER JOIN mara AS a
                           ON m~matnr = a~matnr )
           FOR ALL ENTRIES IN it_mc29v
         WHERE m~matnr EQ it_mc29v-matnr
           AND m~werks EQ it_mc29v-werks
           AND m~verid IN s_pvnum
           AND a~labor IN s_labor
           AND EXISTS ( SELECT matnr
                          FROM zgl_subproccode AS z
                         WHERE z~matnr = m~matnr
                           AND z~werks = m~werks
                           AND z~plan_id IN s_plan_i ).
      ENDIF.
    ENDIF.
  ENDIF.

*"Begin - 115874 - Fabricio Beneduzi - Inetum - 22.09.2022
  "When Mack-in-Pack indicator are selected, exclude only MIP records.
  DATA(lt_mka1_tm) = it_mkal_tmp[].
  LOOP AT lt_mka1_tm INTO wa_mkal_tmp.
    DATA(lv_index) = sy-tabix.
    READ TABLE it_rectempl INTO DATA(ls_templ)
                           WITH KEY werks  = wa_mkal_tmp-werks
                                    labor  = wa_mkal_tmp-labor
                                    pv_num = wa_mkal_tmp-verid.

    IF sy-subrc IS NOT INITIAL.
      READ TABLE it_rectempl_filter INTO ls_templ
                                    WITH KEY werks  = wa_mkal_tmp-werks
                                             labor  = wa_mkal_tmp-labor
                                             pv_num = wa_mkal_tmp-verid.
    ENDIF.

    IF ls_templ-zmip NOT IN s_zmip[].
      CLEAR: ls_templ.
      DELETE lt_mka1_tm INDEX lv_index.
    ENDIF.
  ENDLOOP.
  it_mkal_tmp = lt_mka1_tm[].

*"END - 115874 - Fabricio Beneduzi - Inetum - 22.09.2022

  IF it_mkal_tmp[] IS INITIAL AND p_prgmod = c_2.
    MESSAGE i615(pq). "Nothing to be deleted
  ELSE.
    CHECK NOT it_mkal_tmp[] IS INITIAL.
    LOOP AT it_mkal_tmp INTO wa_mkal_tmp.

      wa_templ-werks  = wa_mkal_tmp-werks.
      wa_templ-matnr  = wa_mkal_tmp-matnr.
      wa_templ-pv_num = wa_mkal_tmp-verid.
      wa_templ-labor  = wa_mkal_tmp-labor.
      wa_templ-fr_qty = wa_mkal_tmp-bstmi.
      wa_templ-to_qty = wa_mkal_tmp-bstma.
      wa_templ-plnnr  = wa_mkal_tmp-plnnr.
      wa_templ-plnal  = wa_mkal_tmp-alnal.
      wa_templ-stalt  = wa_mkal_tmp-stlal.
      wa_templ-stlan  = wa_mkal_tmp-stlan.
      wa_templ-zmip   = ls_templ-zmip.

      READ TABLE it_subproccode INTO ls_subproccode
                                WITH KEY werks = wa_mkal_tmp-werks
                                         matnr = wa_mkal_tmp-matnr.
      IF sy-subrc = 0.
        wa_templ-plan_id = ls_subproccode-plan_id.
      ENDIF.

      CLEAR: it_return[],ls_templ.                                     "$sst: #157

      CALL FUNCTION 'Z_GL_PP_F_DELETE_PVERS_MREC'
        EXPORTING
          i_rectempl         = wa_templ
        TABLES
          it_return          = it_return
        EXCEPTIONS
          matnr_not_filled   = 1
          error_at_c223      = 2
          error_at_ca98      = 3
          unexistent_version = 4
          OTHERS             = 5.
      lv_subrc = sy-subrc.

      IF lv_subrc <> 0 AND lv_subrc <> 4.
        READ TABLE it_return INDEX 1
              INTO wa_return.
        IF sy-subrc <> 0.
          CLEAR wa_return.
          IF sy-subrc = 1.
            PERFORM f_populate_msg USING  c_bapi_e
                                          c_zmfg
                                          c_484
                                          wa_templ-pv_num
                                          space
                                          space
                                          space
                                 CHANGING wa_return.
          ELSEIF sy-subrc = 2.
            PERFORM f_populate_msg USING  c_bapi_e
                                          c_zmfg
                                          c_484
                                          wa_templ-pv_num
                                          space
                                          space
                                          space
                                 CHANGING wa_return.
          ELSEIF sy-subrc = 3.
            PERFORM f_populate_msg USING  c_bapi_e
                                          c_zmfg
                                          c_485
                                          wa_templ-plnnr
                                          space
                                          space
                                          space
                                 CHANGING wa_return.
          ENDIF.
        ENDIF.

        PERFORM f_populate_alv USING  wa_templ
                                      wa_return
                                      c_error
                                      c_delete.
      ELSE.
        IF p_prgmod <> c_1.
          PERFORM f_populate_msg USING c_success2
                                       c_pep
                                       c_067 "Task list & was deleted
                                       wa_templ-plnnr
                                       space
                                       space
                                       space
                              CHANGING wa_return.

          MOVE-CORRESPONDING wa_templ TO wa_fullreturn.
          MOVE-CORRESPONDING wa_return TO wa_fullreturn.
          wa_fullreturn-type     = c_success2.
          wa_fullreturn-act_code = c_delete.
          CLEAR wa_return.
          READ TABLE it_return INDEX 1
            INTO wa_return.
          wa_fullreturn-message_v1 = wa_return-message_v1.
          APPEND wa_fullreturn TO it_fullreturn.
        ENDIF.
      ENDIF.

      CLEAR: wa_mkal_tmp, wa_templ, wa_fullreturn.

    ENDLOOP.
  ENDIF.

  CLEAR: it_mkal_tmp[].                                      "$sst: #157
  CLEAR: it_return[].                                        "$sst: #157

ENDFORM.                    " f_filter_it
*&---------------------------------------------------------------------*
*&      Form  f_filter_priority
*&---------------------------------------------------------------------*
* Filter templates table according to priority established rules
* Highest - Only Material Filled
* Medium  - Subproccode Filled & Process Code not filled
* Lowest  - Process Code filled
*----------------------------------------------------------------------*
FORM f_filter_priority.

  DATA: it_templ_aux TYPE TABLE OF zgl_rectempl.

  it_templ_aux[] = gt_rectempl_bi[].                         "$sst: #110

  SORT it_templ_aux ASCENDING BY werks
                    ASCENDING matnr
                    ASCENDING plan_id
                    ASCENDING labor.

  LOOP AT it_templ_aux INTO wa_rectempl.

    IF wa_rectempl-plan_id IS INITIAL
      AND wa_rectempl-labor IS INITIAL.
* if we have one PV template defined by material, we delete all the other
* templates for that PV (defined by process code or sub process code)
      DELETE gt_rectempl_bi                                  "$sst: #110
        WHERE matnr = wa_rectempl-matnr
         AND ( labor   IS NOT INITIAL
          OR   plan_id IS NOT INITIAL ).

    ELSEIF wa_rectempl-plan_id IS NOT INITIAL
      AND wa_rectempl-labor IS INITIAL.
* if we have one PV template defined by subproccode, we delete all the other
* templates for that PV defined by process code
      DELETE gt_rectempl_bi                                  "$sst: #110
        WHERE matnr = wa_rectempl-matnr
          AND labor IS NOT INITIAL.
    ELSEIF s_plan_i[] IS NOT INITIAL.
* if on selection screen Material Grouping have values, we should only select
* templates that belongs to selected Material Grouping ID
      DELETE gt_rectempl_bi                                  "$sst: #110
        WHERE matnr = wa_rectempl-matnr
          AND plan_id NOT IN s_plan_i.
    ENDIF.

  ENDLOOP.

  CLEAR: it_templ_aux[].

ENDFORM.                    "f_filter_priority
*&---------------------------------------------------------------------*
*&      Form  f_load_program
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_load_program .

  DATA: lv_prgmod TYPE z_gl_pp_prog_mode.

  CALL FUNCTION 'Z_GL_HARDCODE_SINGLE_FIELD'
    EXPORTING
      inc_meth   = c_program
      fieldname  = 'PROG_MODE'
    IMPORTING
      fieldvalue = lv_prgmod.
  IF lv_prgmod IS NOT INITIAL.
    p_prgmod = lv_prgmod.
  ENDIF.

ENDFORM.                    " f_load_program
*&---------------------------------------------------------------------*
*&      Form  CHECK_ACTIVATION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM check_activation .

*" Begin of CR 42510 - INETUM (WASHINGTON ALMEIDA) - 04.02.2022
*  DATA: ls_marc LIKE LINE OF it_marc,
*        lv_act  TYPE flag.

*  read table it_marc into ls_marc index 1.
*
*  CHECK sy-subrc IS INITIAL.
*
*  SELECT SINGLE zactivation INTO lv_act FROM zgl_plant_check
*    WHERE werks = ls_marc-werks.
*
*  CHECK lv_act IS NOT INITIAL.

  DATA: ls_marc   LIKE LINE OF it_marc,
        it_string TYPE TABLE OF string.

  READ TABLE it_marc INTO ls_marc INDEX 1.

  CHECK sy-subrc IS INITIAL.

  CLEAR: wa_plant_check.

  SELECT SINGLE * INTO wa_plant_check FROM zgl_plant_check
    WHERE werks = ls_marc-werks.

  CHECK wa_plant_check-zactivation IS NOT INITIAL.

  FREE: r_verid, it_string.

  SPLIT wa_plant_check-list_verid AT ';' INTO TABLE it_string.

  LOOP AT it_string ASSIGNING FIELD-SYMBOL(<fs_str>).

    CONDENSE <fs_str>.

    APPEND INITIAL LINE TO r_verid ASSIGNING FIELD-SYMBOL(<fs_verid>).

    <fs_verid>-low = <fs_str>.
    <fs_verid>-sign = 'I'.
    <fs_verid>-option = 'EQ'.
    CONDENSE <fs_verid>-low.

  ENDLOOP.

*" End of   CR 42510 - INETUM (WASHINGTON ALMEIDA) - 04.02.2022

  PERFORM get_dens_data.
  PERFORM get_density.
  PERFORM get_factor USING ls_marc-werks.

ENDFORM.                    " CHECK_ACTIVATION

*&---------------------------------------------------------------------*
*&      Form  GET_BULK
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_dens_data .
  DATA: ls_rectempl_bi TYPE zgl_rectempl,
        lv_matnr       TYPE matnr,
        lr_matnr       TYPE RANGE OF matnr,
        ls_matnr       LIKE LINE OF lr_matnr.

  CONSTANTS: c_idcat TYPE eseidcat VALUE 'ZGRP_CODE'.

  CHECK gt_rectempl_bi[] IS NOT INITIAL.                     "$sst: #110

**  get range of materials from IT_RECTEMPL_BI
  ls_matnr-option = 'EQ'.
  ls_matnr-sign   = 'I'.
  LOOP AT gt_rectempl_bi INTO ls_rectempl_bi.                "$sst: #110
    IF lv_matnr NE ls_rectempl_bi-matnr.
      ls_matnr-low    = ls_rectempl_bi-matnr.
      APPEND ls_matnr TO lr_matnr.
    ENDIF.
    lv_matnr = ls_rectempl_bi-matnr.
  ENDLOOP.

**
  CHECK NOT lr_matnr[] IS INITIAL.

  SELECT idcat ident recnroot
    FROM estri
    INTO TABLE gt_estri
   WHERE idcat = c_idcat
     AND ident IN lr_matnr[].

  CHECK NOT gt_estri[] IS INITIAL.

  SELECT recnroot recn subid
    FROM estrh
    INTO TABLE gt_estrh
    FOR ALL ENTRIES IN gt_estri
   WHERE recnroot = gt_estri-recnroot.

ENDFORM.                    "GET_DENS_DATA

*&---------------------------------------------------------------------*
*&      Form  GET_BULK
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_density .
**  get gv_density
  DATA: ls_scenario            TYPE espap_new_scenario_type,
        ls_valuation           TYPE esprh_apivh_wa_type,
        ls_addinf              TYPE rcgaddinf,              "$sst: #153
        lt_valuation           TYPE esprh_valuation_head_lgk_tp,
        ls_spec_head_tab       TYPE esprh_apirh_wa_type,
        lf_flg_internal_error  TYPE boolean,
        lf_flg_error           TYPE boolean,
        lt_spec_head_tab       TYPE esprh_apirh_tab_type,
        lt_material_tab        TYPE esprh_apimj_tab_type,
        lt_valuation_head_tab  TYPE esprh_apivh_tab_type,
        lt_valuation_inst_tab  TYPE esprh_apiva_tab_type,
        lt_valuation_usage_tab TYPE esprh_apidu_tab_type,
        lt_charact_data_tab    TYPE esprh_apipr_tab_type.

  CONSTANTS: c_n             TYPE c         VALUE 'N',
             c_state_matter  TYPE eseestcat VALUE 'SAP_EHS_1013_001', "State of Matter
             c_bulk_dens     TYPE eseestcat VALUE 'SAP_EHS_1013_024', "Bulk Density
             c_relative_dens TYPE eseestcat VALUE 'SAP_EHS_1013_006'. "Relative Density

  FIELD-SYMBOLS: <ls_estrh> TYPE ty_s_estrh.

  CLEAR: lt_material_tab,
         lt_valuation_head_tab,
         lt_valuation_inst_tab,
         lt_charact_data_tab,
         lt_valuation_usage_tab.

  ls_addinf-valdat            = sy-datum.
  ls_scenario-spec_head       = c_n.
  ls_scenario-material        = c_n.
  ls_scenario-valuation_head  = c_n.
  ls_scenario-valuation_inst  = c_n.
  ls_scenario-valuation_usage = c_n.
  ls_scenario-charact_data    = c_n.

  ls_scenario-spec_head       = c_n.
  ls_scenario-identifier      = c_n.
  ls_scenario-regulatory_list = c_n.
  ls_scenario-material        = c_n.

  ls_valuation-estcat = c_state_matter.
  INSERT ls_valuation INTO TABLE lt_valuation.
  ls_valuation-estcat = c_bulk_dens.
  INSERT ls_valuation INTO TABLE lt_valuation.
  ls_valuation-estcat = c_relative_dens.
  INSERT ls_valuation INTO TABLE lt_valuation.


  LOOP AT gt_estrh ASSIGNING <ls_estrh>.
    CLEAR:  ls_spec_head_tab.
    ls_spec_head_tab-recn = <ls_estrh>-recn.
    ls_spec_head_tab-subid = <ls_estrh>-subid.
    APPEND ls_spec_head_tab TO lt_spec_head_tab.
  ENDLOOP.

  CHECK NOT lt_spec_head_tab[] IS INITIAL.

  CALL FUNCTION 'C1F5_SPECIFICATIONS_READ'
    EXPORTING
      i_scenario                = ls_scenario
      i_addinf                  = ls_addinf
      i_flg_with_ref_data       = esp1_true
      i_flg_with_ref_data_ovrwr = esp1_true
      i_flg_with_inh_data       = esp1_true
      i_valuation_head_lgk_stab = lt_valuation
    IMPORTING
      e_flg_internal_error      = lf_flg_internal_error
      e_flg_error               = lf_flg_error
    TABLES
      x_spec_head_tab           = lt_spec_head_tab
      x_material_tab            = lt_material_tab
      x_valuation_head_tab      = lt_valuation_head_tab
      x_valuation_inst_tab      = lt_valuation_inst_tab
      x_valuation_usage_tab     = lt_valuation_usage_tab
      x_charact_data_tab        = lt_charact_data_tab.

** Read data from FM result
  PERFORM read_data_tab USING lt_charact_data_tab.

ENDFORM.                    " GET_DENSITY

*&---------------------------------------------------------------------*
*&      Form  READ_DATA_TAB
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_LT_CHARACT_DATA_TAB  text
*----------------------------------------------------------------------*
FORM read_data_tab  USING lt_charact_data_tab TYPE esprh_apipr_tab_type.
  DATA: ls_charact_data_tab       LIKE LINE OF lt_charact_data_tab,
        ls_charact_data_tab_init  LIKE LINE OF lt_charact_data_tab,
        ls_charact_data_tab_final LIKE LINE OF lt_charact_data_tab,
        ls_charact_data_tab_aux   LIKE LINE OF lt_charact_data_tab,
        lt_charact_data_tab_aux   TYPE esprh_apipr_tab_type,
        ls_density                TYPE ty_s_density,
        ls_estri                  TYPE ty_s_estri,
        lt_harcode_table          TYPE TABLE OF zdev_us_ex_hardc,
        ls_harcode_table          TYPE zdev_us_ex_hardc.

  DATA: lr_atinn TYPE RANGE OF atinn,
        ls_atinn LIKE LINE OF lr_atinn,
        lr_state TYPE RANGE OF atwrt,
        ls_state LIKE LINE OF lr_state,
        lr_temp  TYPE RANGE OF atwrt,
        ls_temp  LIKE LINE OF lr_temp.

  CONSTANTS: c_program  TYPE zdev_inc_meth VALUE 'Z_GL_PP_I_CREATE_PVERS_MREC',
             c_atinn(5) TYPE c             VALUE 'ATINN',
             c_state(5) TYPE c             VALUE 'STATE',
             c_temp(4)  TYPE c             VALUE 'TEMP'.

********************************************
****** get data from hardcode table ********
********************************************
  CALL FUNCTION 'Z_GL_DEV_HARDCODE'
    EXPORTING
      inc_meth    = c_program
    TABLES
      it_hardcode = lt_harcode_table.

  SORT lt_harcode_table BY occurrence counter ASCENDING .

** Read data
  LOOP AT lt_harcode_table INTO ls_harcode_table.
    CASE ls_harcode_table-fieldname.
      WHEN c_atinn.
        IF ls_harcode_table-occurrence = 1.
          CLEAR ls_atinn.
          ls_atinn-option = ls_harcode_table-ue_option.
          ls_atinn-sign   = ls_harcode_table-ue_sign.
          ls_atinn-high   = ls_harcode_table-ue_high.
          ls_atinn-low    = ls_harcode_table-ue_low.
          APPEND ls_atinn TO lr_atinn.
        ENDIF.
      WHEN c_state.
        IF ls_harcode_table-occurrence = 2.
          CLEAR ls_state.
          ls_state-option = ls_harcode_table-ue_option.
          ls_state-sign   = ls_harcode_table-ue_sign.
          ls_state-high   = ls_harcode_table-ue_high.
          ls_state-low    = ls_harcode_table-ue_low.
          APPEND ls_state TO lr_state.
        ENDIF.
      WHEN c_temp.
        IF ls_harcode_table-occurrence = 3.
          CLEAR ls_temp.
          ls_temp-option = ls_harcode_table-ue_option.
          ls_temp-sign   = ls_harcode_table-ue_sign.
          ls_temp-high   = ls_harcode_table-ue_high.
          ls_temp-low    = ls_harcode_table-ue_low.
          APPEND ls_temp TO lr_temp.
        ENDIF.
    ENDCASE.
  ENDLOOP.

********************************************
************ read data from FM *************
********************************************
  lt_charact_data_tab_aux[] = lt_charact_data_tab[].

  CLEAR gt_density[].                                        "$sst: #157

* Get key for data reading
* ... Index 1 = State Matter
  READ TABLE lr_atinn INTO ls_atinn INDEX 1. "Index 1 = State Matter
  DELETE lt_charact_data_tab_aux WHERE atinn <> ls_atinn-low.

  LOOP AT lt_charact_data_tab_aux[] INTO ls_charact_data_tab_aux.

    READ TABLE lr_atinn INTO ls_atinn INDEX 1. "Index 1 = State Matter
** 1. Get State of Mater: solid or liquid
    READ TABLE lt_charact_data_tab INTO ls_charact_data_tab_init
      WITH KEY recnroot = ls_charact_data_tab_aux-recnroot
               atinn = ls_atinn-low.

** 2. First reading - to get OBJEK key (if liquid, compared at 20ºC)
    READ TABLE lr_atinn INTO ls_atinn INDEX 2. "Index 2 = Relative Density
    READ TABLE lr_temp INTO ls_temp INDEX 1.   "Compared at ...
    READ TABLE lt_charact_data_tab INTO ls_charact_data_tab
        WITH KEY recnroot = ls_charact_data_tab_aux-recnroot
                 atinn = ls_atinn-low
                 atwrt = ls_temp-low.

** 3. check state of mater
    READ TABLE lr_state INTO ls_state INDEX 1.
    "   State is Liquid?
    IF ls_charact_data_tab_init-atwrt = ls_state-low.
      IF ls_charact_data_tab-atwrt IS INITIAL.
** 3.1. Second reading - to get OBJEK key compared at 4ºC due to no value for 20ºC
        READ TABLE lr_atinn INTO ls_atinn INDEX 2.
        READ TABLE lr_temp INTO ls_temp INDEX 2.
        READ TABLE lt_charact_data_tab INTO ls_charact_data_tab
            WITH KEY recnroot = ls_charact_data_tab_aux-recnroot
                     atinn = ls_atinn-low
                     atwrt = ls_temp-low.

        IF ls_charact_data_tab-atwrt IS INITIAL.
** 3.2. Third reading - to get OBJEK key compared at 25ºC due to no value for 4ºC
          READ TABLE lr_atinn INTO ls_atinn INDEX 2.
          READ TABLE lr_temp INTO ls_temp INDEX 3.
          READ TABLE lt_charact_data_tab INTO ls_charact_data_tab
            WITH KEY recnroot = ls_charact_data_tab_aux-recnroot
                     atinn = ls_atinn-low
                     atwrt = ls_temp-low.
        ENDIF.
      ENDIF.

**    Get density value - Relative Density
      CLEAR ls_density.
      READ TABLE lr_atinn INTO ls_atinn INDEX 3. "Relative Density
      READ TABLE lt_charact_data_tab INTO ls_charact_data_tab_final
        WITH KEY recnroot = ls_charact_data_tab_aux-recnroot
                 atinn    = ls_atinn-low.
      IF sy-subrc = 0.
        MOVE ls_charact_data_tab_final-atflv TO ls_density-density.
      ENDIF.

      READ TABLE gt_estri INTO ls_estri
        WITH KEY recnroot = ls_charact_data_tab_aux-recnroot.

      ls_density-matnr = ls_estri-ident.
      APPEND ls_density TO gt_density.

      "   State is Solid?
    ELSE.
      READ TABLE lr_state INTO ls_state INDEX 2.
      IF ls_charact_data_tab_aux-atwrt <> ls_state-low.
        CONTINUE.
      ENDIF.

**    Get density value - Bulk Density
      CLEAR: ls_density, ls_charact_data_tab_final.
      READ TABLE lr_atinn INTO ls_atinn INDEX 4. "Bulk Density value
      READ TABLE lt_charact_data_tab INTO ls_charact_data_tab_final
        WITH KEY recnroot = ls_charact_data_tab_aux-recnroot
                 atinn    = ls_atinn-low.
      IF sy-subrc = 0.
        MOVE ls_charact_data_tab_final-atflv TO ls_density-density.
        IF ls_density-density <> 0.
          ls_density-density = ls_density-density / 1000.
        ENDIF.
      ENDIF.

      READ TABLE gt_estri INTO ls_estri
        WITH KEY recnroot = ls_charact_data_tab_aux-recnroot.

      ls_density-matnr = ls_estri-ident.
      APPEND ls_density TO gt_density.

    ENDIF.

  ENDLOOP.

ENDFORM.                    " READ_DATA_TAB
*&---------------------------------------------------------------------*
*&      Form  GET_FFACTOR
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_factor USING p_werks TYPE werks_d.                  "$sst: #105

  DATA: ls_ffactor     LIKE LINE OF gt_ffactor,
        ls_tfactor     LIKE LINE OF gt_tfactor,
        ls_factor1     TYPE zgl_mfg_ffactor,
        ls_factor34    TYPE zgl_mfg_ffactor,
        lt_factor1     TYPE TABLE OF zgl_mfg_ffactor,
        lt_factor34    TYPE TABLE OF zgl_mfg_ffactor,
        lt_tfactor_aux TYPE TABLE OF zgl_mfg_tfactor.

  DATA: lv_matnr       TYPE matnr,
        ls_bulkfact    TYPE ty_s_bulk_factor,
        ls_rectempl_bi TYPE zgl_rectempl,
        lv_baseqty     TYPE basmn,
        lv_compqty     TYPE basmn, "(+)CR 42510 - INETUM (WASHINGTON ALMEIDA) - 24.02.2022
        ls_density     TYPE ty_s_density,
        lv_novalue     TYPE flag.

  CLEAR lv_novalue.
  CLEAR: gt_ffactor[].                                       "$sst: #157
  CLEAR: gt_tfactor[].                                       "$sst: #157

* get factor 1 data from database table
  SELECT *
    FROM zgl_mfg_ffactor
    INTO TABLE gt_ffactor
   WHERE werks = p_werks .

* get factor 2 data from database table
  SELECT *
    FROM zgl_mfg_tfactor
    INTO TABLE gt_tfactor
   WHERE werks = p_werks.

  CLEAR gt_bulkfact[].                                       "$sst: #157

**  read data for factor reading
  CLEAR: it_rectempl_bi_aux[].                               "$sst: #157
  CLEAR: lt_factor34[].                                      "$sst: #157
  CLEAR: lt_factor1[].                                       "$sst: #157
  CLEAR: lt_tfactor_aux[].                                   "$sst: #157
  CLEAR: lv_matnr, ls_factor1, ls_factor34.

  LOOP AT gt_rectempl_bi INTO ls_rectempl_bi.                "$sst: #110

    lv_novalue = 'X'.
    lt_tfactor_aux[] = gt_tfactor[].
    lt_factor1[] = lt_factor34[] = gt_ffactor[].

    CLEAR: gv_fdensity, gv_tdensity, ls_bulkfact.

*-->Begin Modification Sérgio Silva Inetum - #GSD-42510 - 12.04.2022
    IF wa_plant_check-real_yield EQ abap_true.
      IF ls_rectempl_bi-pv_num IN r_verid.
        CLEAR lv_novalue.
      ENDIF.
    ENDIF.
*<--End Modification Sérgio Silva Inetum - #GSD-42510 - 12.04.2022

**  read data from density table
    IF lv_matnr NE ls_rectempl_bi-matnr.
      READ TABLE gt_density INTO ls_density
        WITH KEY matnr = ls_rectempl_bi-matnr.

      IF sy-subrc IS INITIAL.
        gv_density = ls_density-density.
      ELSE.
        CLEAR gv_density.
      ENDIF.
    ENDIF.

    IF gv_density IS NOT INITIAL.
*      ls_bulkfact-zbulk = gv_fdensity = gv_tdensity = ls_marm-umrez / ls_marm-umren.
      ls_bulkfact-zbulk = gv_fdensity = gv_tdensity = gv_density.
    ELSE.
      ls_bulkfact-zbulk = gv_fdensity = c_densfrom.       " = 1
      gv_tdensity = c_densto.                             " = 0.5
    ENDIF.

    DELETE lt_factor1
     WHERE NOT ( werks = ls_rectempl_bi-werks
       AND ( labor = ls_rectempl_bi-labor OR labor = '*' OR labor = space )
       AND ( plan_id = ls_rectempl_bi-plan_id OR plan_id = '*' OR plan_id = space )
       AND ( matnr = ls_rectempl_bi-matnr OR matnr = '*' OR matnr = space )
       AND ( verid = ls_rectempl_bi-pv_num OR verid = '*' OR verid = space )
       AND bulk_from <= gv_tdensity
       AND bulk_to >= gv_tdensity ).

    DELETE lt_factor34
     WHERE NOT ( werks = ls_rectempl_bi-werks
       AND ( labor = ls_rectempl_bi-labor OR labor = '*' OR labor = space )
       AND ( plan_id = ls_rectempl_bi-plan_id OR plan_id = '*' OR plan_id = space )
       AND ( matnr = ls_rectempl_bi-matnr OR matnr = '*' OR matnr = space )
       AND ( verid = ls_rectempl_bi-pv_num OR verid = '*' OR verid = space )
       AND bulk_from <= gv_fdensity
       AND bulk_to >= gv_fdensity ).

    IF NOT lt_factor1[] IS INITIAL OR NOT lt_factor34[] IS INITIAL.
      CLEAR: ls_factor1, ls_factor34.

      SORT lt_factor1 BY werks DESCENDING labor DESCENDING plan_id DESCENDING matnr DESCENDING verid DESCENDING
                         bulk_from ASCENDING bulk_to ASCENDING. " sort to get at first lines without '*'
      SORT lt_factor34 BY werks DESCENDING labor DESCENDING plan_id DESCENDING matnr DESCENDING verid DESCENDING
                          bulk_from ASCENDING bulk_to ASCENDING. " sort to get at first lines without '*'
      READ TABLE lt_factor1  INTO ls_factor1  INDEX 1.      " get value factor 1 from table
      IF sy-subrc IS INITIAL.
        ls_bulkfact-ffactor = ls_factor1-factor_val.
        lv_novalue = space.
      ELSE.
        ls_bulkfact-ffactor = 1.
        lv_novalue = 'X'.
      ENDIF.

      CHECK lv_novalue IS INITIAL.

      READ TABLE lt_factor34 INTO ls_factor34 INDEX 1.      " get value factor 3, 4 from table
      IF sy-subrc IS INITIAL.
        ls_bulkfact-factor3 = ls_factor34-factor_val_3.
        ls_bulkfact-factor4 = ls_factor34-factor_val_4.
      ELSE.
        ls_bulkfact-factor3 = 1.
        ls_bulkfact-factor4 = 1.
      ENDIF.

      IF lv_novalue IS INITIAL.
        DELETE lt_tfactor_aux
         WHERE NOT ( werks = ls_rectempl_bi-werks
           AND ( matnr = ls_rectempl_bi-matnr OR matnr = '*' OR matnr = space ) ).        " proceed to factor 2 only if factor 1 is available

        IF lt_tfactor_aux[] IS NOT INITIAL.
          SORT lt_tfactor_aux DESCENDING BY werks matnr.       " sort to get at first lines without '*'
          READ TABLE lt_tfactor_aux INTO ls_tfactor INDEX 1.      " get value factor 2 from table
          IF sy-subrc = 0.
            ls_bulkfact-tfactor = ls_tfactor-factor_val.
            ls_bulkfact-fact3yn = ls_tfactor-factor_3_yn.
            IF ls_bulkfact-fact3yn = 'N'.
              ls_bulkfact-factor3 = 1.
            ENDIF.
          ELSE.
            ls_bulkfact-tfactor = 1.       " consider value = 1 if table gt_tfactor is initial
            ls_bulkfact-fact3yn = 'N'.
          ENDIF.
        ENDIF.
      ELSE.
        ls_bulkfact-tfactor = 1.       " consider value = 1 if table gt_tfactor is initial
        ls_bulkfact-fact3yn = 'N'.
      ENDIF.

    ENDIF.

    lv_matnr = ls_rectempl_bi-matnr.

    CHECK lv_novalue IS INITIAL. " if factor 1, 3, 4 is initial, proceed like calculation is not allowed for corresponding plant(werks)


**  perform calculation of YIELD value
    PERFORM get_yield USING    ls_rectempl_bi
                      CHANGING lv_baseqty
                               lv_compqty.

    IF lv_baseqty IS NOT INITIAL.

*     gv_yield = lv_baseqty / c_compqty. "(-)CR 42510 - INETUM (WASHINGTON ALMEIDA) - 04.02.2022
      gv_yield = lv_baseqty / lv_compqty. "(+)CR 42510 - INETUM (WASHINGTON ALMEIDA) - 04.02.2022

    ELSE.

      gv_yield = 1.

    ENDIF.

    IF ls_bulkfact-tfactor IS INITIAL. ls_bulkfact-tfactor = 1. ENDIF.
    IF ls_bulkfact-ffactor IS INITIAL. ls_bulkfact-ffactor = 1. ENDIF.
    IF ls_bulkfact-factor3 IS INITIAL. ls_bulkfact-factor3 = 1. ENDIF.
    IF ls_bulkfact-factor4 IS INITIAL. ls_bulkfact-factor4 = 1. ENDIF.

**  process to calculate new From Qty and To Qty
    gv_fqty = ls_rectempl_bi-fr_qty * ( 1 / ls_bulkfact-tfactor ) * ls_bulkfact-factor3 * ls_bulkfact-factor4 * gv_fdensity.
    gv_tqty = ls_rectempl_bi-to_qty * ls_bulkfact-tfactor * ls_bulkfact-ffactor * gv_yield * gv_tdensity.

    ls_bulkfact-yield     = gv_yield.
    ls_rectempl_bi-fr_qty = gv_fqty.
    ls_rectempl_bi-to_qty = gv_tqty.

**  save data from density and factor calculation
    READ TABLE gt_bulkfact TRANSPORTING NO FIELDS
      WITH KEY matnr  = ls_rectempl_bi-matnr
               pv_num = ls_rectempl_bi-pv_num.
    IF sy-subrc <> 0.
      ls_bulkfact-matnr  = ls_rectempl_bi-matnr.
      ls_bulkfact-pv_num = ls_rectempl_bi-pv_num.
      APPEND ls_bulkfact TO gt_bulkfact.
    ENDIF.

    MODIFY TABLE gt_rectempl_bi FROM ls_rectempl_bi.         "$sst: #110

    lv_matnr = ls_rectempl_bi-matnr.

    CLEAR: lt_tfactor_aux[].                                 "$sst: #157
    CLEAR: lt_factor1[].                                     "$sst: #157
    CLEAR: lt_factor34[].                                    "$sst: #157

  ENDLOOP.

ENDFORM.                    " GET_FACTOR

*&---------------------------------------------------------------------*
*&      Form  SAVE_SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM save_selection CHANGING ls_select TYPE zgl_rect_sel_log.
  TABLES: dfies,
          x030l.

  DATA: lv_execnum TYPE raldb_vari,
        lt_par     TYPE TABLE OF rsparams,
        ls_par     TYPE rsparams,
        lt_rs38m   TYPE TABLE OF rs38m,
        lt_execnum TYPE TABLE OF raldb_vari .                "$sst: #110
  DATA: lv_execnum_1         TYPE raldb_vari,                          "$sst: #110
        lv_execnum_i(14)     TYPE i,
        lv_execnum_i_max(14) TYPE i.

  DATA: lt_textpool   TYPE TABLE OF textpool,
        ls_textpool   TYPE textpool,
        lt_fieldinfo  TYPE TABLE OF rsel_info,
        lt_fieldnames TYPE TABLE OF rsdynpar,
        ls_fieldinfo  TYPE rsel_info.

  DATA: tablenm TYPE ddobjname,
        fieldnm TYPE dfies-fieldname.

  DATA: BEGIN OF inttab OCCURS 100.
      INCLUDE STRUCTURE dfies.
  DATA: END OF inttab.

  DATA: ls_inttab LIKE LINE OF inttab.

  FIELD-SYMBOLS: <fs_par> LIKE LINE OF lt_par.

  CLEAR: lt_execnum[], lv_execnum_i, lv_execnum_i_max.       "$sst: #110

  SELECT DISTINCT exec_num
    INTO TABLE lt_execnum                                    "$sst: #110
    FROM zgl_rect_sel_log.

  IF lt_execnum[] IS INITIAL.                                "$sst: #110
    lv_execnum = 1.
  ELSE.
    lv_execnum_i_max = 1.
    LOOP AT lt_execnum INTO lv_execnum_i.                    "$sst: #110
      IF lv_execnum_i > lv_execnum_i_max.
        lv_execnum_i_max = lv_execnum_i.
      ENDIF.
    ENDLOOP.
    lv_execnum = lv_execnum_i_max + 1.
  ENDIF.

  CLEAR: lt_execnum[], lv_execnum_i, lv_execnum_i_max.       "$sst: #110

  CALL FUNCTION 'RS_REFRESH_FROM_SELECTOPTIONS'
    EXPORTING
      curr_report     = sy-repid
    TABLES
      selection_table = lt_par[].

  READ TEXTPOOL 'Z_GL_PP_R_CREATE_PVERS_MREC' INTO lt_textpool LANGUAGE sy-langu.
  DELETE lt_textpool WHERE id <> 'S'.
  DELETE lt_textpool WHERE entry(1) = 'D'.

  CALL FUNCTION 'RS_REPORTSELECTSCREEN_INFO'
    EXPORTING
      report      = sy-repid
    TABLES
      field_info  = lt_fieldinfo[]
      field_names = lt_fieldnames[].


  LOOP AT lt_fieldinfo INTO ls_fieldinfo.
    LOOP AT lt_par INTO ls_par WHERE selname = ls_fieldinfo-name.
      SPLIT ls_fieldinfo-dbfield AT '-' INTO tablenm fieldnm.

      CLEAR ls_inttab.

      CALL FUNCTION 'DDIF_FIELDINFO_GET'
        EXPORTING
          tabname        = tablenm
          fieldname      = fieldnm
          langu          = sy-langu
        TABLES
          dfies_tab      = inttab
        EXCEPTIONS
          not_found      = 1
          internal_error = 2
          OTHERS         = 3.

      READ TABLE lt_par ASSIGNING <fs_par>
        WITH KEY selname = ls_fieldinfo-name.

      IF sy-subrc IS INITIAL.
        READ TABLE lt_textpool INTO ls_textpool
        WITH KEY key = ls_fieldinfo-name.

        IF sy-subrc IS INITIAL.
          ls_select-zselname = ls_textpool-entry.
        ELSE.
          READ TABLE inttab INTO ls_inttab INDEX 1.
          IF sy-subrc IS INITIAL.
            ls_select-zselname = ls_inttab-fieldtext.
          ELSE.
            IF ls_par-selname = 'P_RECRSC'.
              ls_select-zselname = TEXT-027.
            ELSEIF ls_par-selname = 'P_RECRPM'.
              ls_select-zselname = TEXT-029.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.

      CONDENSE lv_execnum NO-GAPS.
      ls_select-exec_num = lv_execnum.
      ls_select-userex = sy-uname.
      ls_select-timeex = sy-uzeit.
      ls_select-dateex = sy-datum.
      ls_select-zkind    = ls_par-kind.
      ls_select-zsign    = ls_par-sign.
      ls_select-zoption  = ls_par-option.
      ls_select-zlow     = ls_par-low.
      ls_select-zhigh    = ls_par-high.

      INSERT zgl_rect_sel_log FROM ls_select.
      CLEAR ls_select.
    ENDLOOP.
  ENDLOOP.
  ls_select-exec_num = lv_execnum.
  ls_select-userex = sy-uname.
  ls_select-timeex = sy-uzeit.
  ls_select-dateex = sy-datum.

ENDFORM.                    " SAVE_SELECTION

*&---------------------------------------------------------------------*
*&      Form  F_FILL_FIELDCATALOG
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_fill_fieldcatalog .
  FIELD-SYMBOLS: <fs_fieldcat> TYPE LINE OF  slis_t_fieldcat_alv.

  DATA: lv_fieldna  TYPE slis_fieldcat_alv-fieldname,
        lv_fieldtab TYPE slis_fieldcat_alv-tabname,
        lv_textl    TYPE slis_fieldcat_alv-seltext_l VALUE space.

  CLEAR it_alv_fieldcat[].                                   "$sst: #157

  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_program_name         = sy-cprog
      i_structure_name       = 'ZGL_RECT_EX_LOG'
      i_inclname             = sy-cprog
    CHANGING
      ct_fieldcat            = it_alv_fieldcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.

  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  LOOP AT it_alv_fieldcat ASSIGNING <fs_fieldcat>.
    CASE <fs_fieldcat>-fieldname.
      WHEN 'ACT_CODE'.
        lv_textl = TEXT-036.

        <fs_fieldcat>-key       = c_mark.
        <fs_fieldcat>-seltext_l = lv_textl.

      WHEN 'ICON'.
        lv_textl    = TEXT-024.

        <fs_fieldcat>-col_pos   = 1.
        <fs_fieldcat>-key       = c_mark.
        <fs_fieldcat>-seltext_l = lv_textl.


      WHEN 'WERKS'.
        lv_textl = TEXT-004.
        <fs_fieldcat>-key       = c_mark.
        <fs_fieldcat>-seltext_l = lv_textl.

      WHEN 'MATNR'.
        lv_textl = TEXT-010.

        <fs_fieldcat>-key       = c_mark.
        <fs_fieldcat>-seltext_l = lv_textl.


*      WHEN 'PLNNR'.
*        lv_fieldna = text-025.
*        lv_fieldtab = text-002.
*        lv_textl = text-026.
*
*        <fs_fieldcat>-fieldname = lv_fieldna.
**        <fs_fieldcat>-tabname   = lv_fieldtab.
**        <fs_fieldcat>-col_pos   = 5.
*        <fs_fieldcat>-key       = c_mark.
*        <fs_fieldcat>-seltext_l = lv_textl.
*        <fs_fieldcat>-do_sum    = c_mark.

      WHEN 'LABOR'.
        lv_textl = TEXT-014.
        <fs_fieldcat>-key       = c_mark.
        <fs_fieldcat>-seltext_l = lv_textl.

      WHEN 'PLAN_ID'.
        lv_textl = TEXT-016.

        <fs_fieldcat>-key       = c_mark.
        <fs_fieldcat>-seltext_l = lv_textl.

      WHEN 'PV_NUM'.
        lv_textl = TEXT-018.
        <fs_fieldcat>-key       = c_mark.
        <fs_fieldcat>-seltext_l = lv_textl.

      WHEN 'ACT_CODE'.
        lv_textl = TEXT-031.
        <fs_fieldcat>-seltext_l = lv_textl.

      WHEN 'SCREENID'.
        lv_textl = TEXT-034.
        <fs_fieldcat>-seltext_l = lv_textl.
*        <fs_fieldcat>-seltext_m = lv_textl.
*        <fs_fieldcat>-seltext_s = lv_textl.
      WHEN OTHERS.
    ENDCASE.
  ENDLOOP.

ENDFORM.                    " F_FILL_FIELDCATALOG

*&---------------------------------------------------------------------*
*&      Form  GET_YIELD
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_yield USING ls_rectempl_bi TYPE zgl_rectempl
               CHANGING p_baseqty TYPE basmn                "$sst: #105
                        p_compqty TYPE basmn.  "(+)CR 42510 - INETUM (WASHINGTON ALMEIDA) - 24.02.2022

  DATA: ls_mast  TYPE ty_s_mast,
        lv_bmeng TYPE basmn.

  DATA: lv_bmein      TYPE       basme, "(+)CR 42510 - INETUM (WASHINGTON ALMEIDA) - 04.02.2022
        lv_menge_cvt  TYPE  ekpo-menge, "(+)CR 42510 - INETUM (WASHINGTON ALMEIDA) - 04.02.2022
        lv_menge_coll TYPE  ekpo-menge. "(+)CR 42510 - INETUM (WASHINGTON ALMEIDA) - 04.02.2022

  CONSTANTS: c_stlty TYPE c VALUE 'M'.

  CLEAR: gv_yield,
         p_baseqty,
         p_compqty,
         ls_mast,
         lv_bmeng.

**  Read data from MAST table
  READ TABLE it_mast INTO ls_mast
    WITH KEY werks = ls_rectempl_bi-werks
             matnr = ls_rectempl_bi-matnr
             stlal = ls_rectempl_bi-stalt
             stlan = ls_rectempl_bi-stlan.

  CHECK sy-subrc IS INITIAL.

*" Begin of CR 42510 - INETUM (WASHINGTON ALMEIDA) - 04.02.2022

*  SELECT bmeng INTO lv_bmeng FROM stko UP TO 1 ROWS          "$sst: #601
*    WHERE stlty = c_stlty
*      AND stlnr = ls_mast-stlnr
*      AND stlal = ls_rectempl_bi-stalt
*    ORDER BY PRIMARY KEY.                                    "$sst: #601
*  ENDSELECT.                                                 "$sst: #601

  SELECT bmein
         bmeng INTO (lv_bmein, lv_bmeng)
     FROM stko UP TO 1 ROWS
    WHERE stlty = c_stlty
      AND stlnr = ls_mast-stlnr
      AND stlal = ls_rectempl_bi-stalt
    ORDER BY PRIMARY KEY.
  ENDSELECT.

*" End of   CR 42510 - INETUM (WASHINGTON ALMEIDA) - 04.02.2022

  CHECK sy-subrc IS INITIAL.

*  change base quantity
  p_baseqty = lv_bmeng.

*" Begin of CR 42510 - INETUM (WASHINGTON ALMEIDA) - 04.02.2022

* Change Component quantity
  p_compqty = c_compqty.

  IF wa_plant_check-real_yield EQ abap_true. "follow the First process

    CHECK ls_rectempl_bi-pv_num IN r_verid.

    "STPO table
    SELECT  stlty,
            stlnr,
            stlkn,
            stpoz,
            meins,
            menge
        FROM stpo
       WHERE stlty = @c_stlty
         AND stlnr = @ls_mast-stlnr
      INTO TABLE @DATA(lt_stpo).

    IF sy-subrc EQ 0.

      CLEAR: lv_bmeng,
             lv_menge_coll.

      LOOP AT lt_stpo ASSIGNING FIELD-SYMBOL(<fs_stpo>).

        CLEAR: lv_menge_cvt.

        IF lv_bmein EQ <fs_stpo>-meins.

          ADD <fs_stpo>-menge TO lv_menge_coll.

        ELSE.

          CALL FUNCTION 'MD_CONVERT_MATERIAL_UNIT'
            EXPORTING
              i_matnr              = ls_rectempl_bi-matnr
              i_in_me              = <fs_stpo>-meins
              i_out_me             = lv_bmein
              i_menge              = <fs_stpo>-menge
            IMPORTING
              e_menge              = lv_menge_cvt
            EXCEPTIONS
              error_in_application = 1
              error                = 2
              OTHERS               = 3.

          IF sy-subrc EQ 0.

            ADD lv_menge_cvt TO lv_menge_coll.

          ENDIF.

        ENDIF.

      ENDLOOP.

      p_compqty = lv_menge_coll.

    ENDIF.

  ENDIF.

*" End of   CR 42510 - INETUM (WASHINGTON ALMEIDA) - 04.02.2022

ENDFORM.                    " GET_YIELD
*&---------------------------------------------------------------------*
*&      Form  F_FILTER_PV_GROUPS
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_filter_pv_groups.

  DATA: lt_rectempl_bi_tmp TYPE STANDARD TABLE OF            "$sst: #110
    zgl_rectempl .                                           "$sst: #110
  DATA: ls_rectempl_bi_tmp TYPE zgl_rectempl.                  "$sst: #110

  CLEAR: it_recpv[], wa_recpv, it_recpvgrp[], wa_recpvgrp.

  CHECK NOT gt_rectempl_bi[] IS INITIAL.                     "$sst: #110

  SELECT DISTINCT plant material pv_group
    INTO TABLE it_recpv
    FROM zgl_mfg_recpv
     FOR ALL ENTRIES IN gt_rectempl_bi                       "$sst: #110
   WHERE plant    = gt_rectempl_bi-werks                     "$sst: #110
     AND material = gt_rectempl_bi-matnr.                    "$sst: #110

  CHECK NOT it_recpv[] IS INITIAL.

* Collect by Material
  LOOP AT it_recpv INTO wa_recpv.
    wa_recpvgrp-plant    = wa_recpv-plant.
    wa_recpvgrp-material = wa_recpv-material.
    SELECT pv_group prod_version
      INTO (wa_recpvgrp-pv_group, wa_recpvgrp-prod_version)
      FROM zgl_mfg_recpvgrp
     WHERE werks    = p_werks
       AND pv_group = wa_recpv-pv_group.
      APPEND wa_recpvgrp TO it_recpvgrp.
    ENDSELECT.
  ENDLOOP.

* Remove PV's not in the list for the materials selected
  lt_rectempl_bi_tmp[] = gt_rectempl_bi[].                   "$sst: #110
  LOOP AT lt_rectempl_bi_tmp INTO wa_rectempl.               "$sst: #110
*   Check if the material is defined for be considered on PV Grouping
    READ TABLE it_recpvgrp INTO wa_recpvgrp
      WITH KEY plant        = wa_rectempl-werks
               material     = wa_rectempl-matnr.
    IF sy-subrc = 0.
*     Check if the PV to be created is part of PV Grouping
      READ TABLE it_recpvgrp INTO wa_recpvgrp
        WITH KEY plant        = wa_rectempl-werks
                 material     = wa_rectempl-matnr
                 prod_version = wa_rectempl-pv_num.
      IF sy-subrc <> 0.
        DELETE TABLE gt_rectempl_bi FROM wa_rectempl.        "$sst: #110
      ENDIF.
    ENDIF.
  ENDLOOP.

  CLEAR: it_recpv[], wa_recpv, wa_recpvgrp,                  "$sst: #110
    lt_rectempl_bi_tmp[], wa_rectempl.                       "$sst: #110

ENDFORM.                    " F_FILTER_PV_GROUPS
*&---------------------------------------------------------------------*
*&      Form  F_CHECK_FROM_TO_QTY
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_check_from_to_qty .

  DATA: wa_rectempl_bi TYPE zgl_rectempl.

  LOOP AT gt_rectempl_bi INTO wa_rectempl_bi.                "$sst: #110
    IF wa_rectempl_bi-fr_qty > wa_rectempl_bi-to_qty.
      CLEAR wa_return.
      DELETE TABLE gt_rectempl_bi FROM wa_rectempl_bi.       "$sst: #110
      APPEND wa_rectempl_bi TO it_rectempl_filter_ant.
      wa_rectempl_bi-status_code = c_error. "Log value displayed
      APPEND wa_rectempl_bi TO it_rectempl_bi_ant.
      PERFORM f_populate_msg USING c_bapi_e
                                   c_msg_rcp
                                   c_nro_404
                                   space
                                   space
                                   space
                                   space
                          CHANGING wa_return.
      PERFORM f_populate_alv USING wa_rectempl_bi
                                   wa_return
                                   c_error
                                   c_insert.
    ENDIF.
  ENDLOOP.

ENDFORM.                    " F_CHECK_FROM_TO_QTY
*&---------------------------------------------------------------------*
*&      Form  F_INIT_VARIABLES
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM f_init_variables .

* Init Work Areas
  CLEAR: wa_mkal, wa_mast, wa_t001w, wa_mara, wa_marc,
         wa_subproccode, wa_rectempl, wa_rectempl_filter, wa_fullreturn,
         wa_return, wa_plpo, wa_crhd, wa_global_data, wa_layout,
         wa_recpv, wa_recpvgrp.

* Init tables
  CLEAR: it_mara[].                                          "$sst: #157
  CLEAR: it_marc[].                                          "$sst: #157
  CLEAR: it_mkal[].                                          "$sst: #157
  CLEAR: it_mast[].                                          "$sst: #157
  CLEAR: it_subproccode[].                                   "$sst: #157
  CLEAR: it_mc29v[].                                         "$sst: #157
  CLEAR: it_rectempl[].                                      "$sst: #157
  CLEAR: it_rectempl_aux[].                                  "$sst: #157
  CLEAR: it_rectempl_filter[].                               "$sst: #157
  CLEAR: gt_rectempl_bi[].                              "$sst: #110 #157
  CLEAR: it_rectempl_bi_aux[].                               "$sst: #157
  CLEAR: it_return[].                                        "$sst: #157
  CLEAR: it_fullreturn[].                                    "$sst: #157
  CLEAR: it_exp_bom[].                                       "$sst: #157
  CLEAR: it_exp_itm[].                                       "$sst: #157
  CLEAR: it_crhd[].                                          "$sst: #157
  CLEAR: it_planpo[].                                        "$sst: #157
  CLEAR: it_plpo[].                                          "$sst: #157
  CLEAR: it_global_data[].                                   "$sst: #157
  CLEAR: it_alv_fieldcat[].                                  "$sst: #157
  CLEAR: it_rectempl_filter_ant[].                           "$sst: #157
  CLEAR: it_rectempl_bi_ant[].                               "$sst: #157
  CLEAR: it_recpv[].                                         "$sst: #157
  CLEAR: it_recpvgrp[].                                      "$sst: #157
  CLEAR: gt_ffactor[].                                       "$sst: #157
  CLEAR: gt_tfactor[].                                       "$sst: #157
  CLEAR: gt_rectempl_log[].                                  "$sst: #157
  CLEAR: gt_bulkfact[].                                      "$sst: #157
  CLEAR: gt_estri[].                                         "$sst: #157
  CLEAR: gt_estrh[].                                         "$sst: #157
  CLEAR: gt_density[].                                       "$sst: #157

* Init Global Variables
  CLEAR: gv_recreation, gv_fdensity, gv_tdensity, gv_density, gv_fqty,
         gv_tqty, gv_yield, gv_flag, gv_num, gv_plnty, gv_maktx.

ENDFORM.                    " F_INIT_VARIABLES
*&---------------------------------------------------------------------*
*&      Form  F_VAL_Z_FVER_WRK
*&---------------------------------------------------------------------*
* Only users with access to Authorization Object “Z_FVER_WRK” for the
* plant and with activity ‘01’ should be able to execute the program having
* “Plant” as the only parameter filled.
* For the other users also with access but only for activity ‘02’,
* should be mandatory to enter “Plant” and at least one of the following
* fields (not being allowed the usage of “*” or a pattern “A*” or similar
* in any of them):
*  	Material
*  	Lab/Office
*  	Planning ID
*  	Production Version
*----------------------------------------------------------------------*
FORM f_val_z_fver_wrk .

  DATA lv_answer.
  DATA: lr_matnr  TYPE RANGE OF mara-matnr,
        lr_labor  TYPE RANGE OF t024l-labor,
        lr_plan_i TYPE RANGE OF t437p-plan_id,
        lr_pvnum  TYPE RANGE OF zgl_rectempl-pv_num.

  lr_matnr[]  = s_matnr[].
  lr_labor[]  = s_labor[].
  lr_plan_i[] = s_plan_i[].
  lr_pvnum[]  = s_pvnum[].

  DELETE lr_matnr WHERE low  CS '*'
                     OR high CS '*'.

  DELETE lr_labor WHERE low  CS '*'
                     OR high CS '*'.

  DELETE lr_plan_i WHERE low  CS '*'
                     OR high CS '*'.

  DELETE lr_pvnum WHERE low  CS '*'
                     OR high CS '*'.

* first check the authorization for PLANT and ACTVT = 01
  AUTHORITY-CHECK OBJECT 'Z_FVER_WRK'
             ID 'ACTVT' FIELD '01'
             ID 'WERKS' FIELD p_werks.

* If the authorization is ok, popup the following options
  IF sy-subrc EQ 0.

    IF s_matnr[]  IS INITIAL AND s_labor[] IS INITIAL AND
       s_plan_i[] IS INITIAL AND s_mmsta[] IS INITIAL AND
       s_beskz[]  IS INITIAL AND s_sobsl[] IS INITIAL  AND
       s_pvnum[]  IS INITIAL.

      CALL FUNCTION 'POPUP_WITH_2_BUTTONS_TO_CHOOSE'
        EXPORTING
          diagnosetext1 = 'Warning'
          textline1     = 'You’re about to execute the Recipe Re-generation for the'
          textline2     = 'entire Plant. All existing data will be deleted and'
          textline3     = 're-created. Are you sure you want to proceed ? '
          text_option1  = c_yes
          text_option2  = c_no
          titel         = 'Check'
        IMPORTING
          answer        = lv_answer.

    ENDIF.

* If the authorization check fail,
  ELSE.
*   check the authorization for PLANT and ACTVT = 02
    AUTHORITY-CHECK OBJECT 'Z_FVER_WRK'
               ID 'ACTVT' FIELD '02'
               ID 'WERKS' FIELD p_werks.
*   If return is ok, verify if any of the following parameters are filled
    IF sy-subrc EQ 0.

*     If the user doesn’t fill at least “Plant” and one of the previous
*     fields a popup message should be displayed
      IF lr_matnr[]  IS INITIAL AND lr_labor[] IS INITIAL AND
         lr_plan_i[] IS INITIAL AND lr_pvnum[]  IS INITIAL.

        CALL FUNCTION 'POPUP_TO_INFORM'
          EXPORTING
            titel = 'Warning'
            txt1  = 'Plant and, at least, Material and/or Lab/Office and/or Planning ID and/or'
            txt2  = 'Production Version are mandatory to be filled in order to proceed.'
            txt4  = 'Please review your entries.'.
        lv_answer = 2.

      ENDIF.
    ELSE.
      lv_answer = 2.

    ENDIF.
  ENDIF.

* Exit
  IF lv_answer EQ 2.
    LEAVE LIST-PROCESSING.
  ENDIF.

ENDFORM.
FORM get_defaults USING plnnr TYPE plnnr
                        plnal TYPE plnal
                  CHANGING ct_plkob TYPE plkob_tt
                           ct_plpob TYPE  vmp_plpob.

  plnty_ss = 2.
  sttag_ss = sy-datum.
  aktyp_ss = 'A'.
  plnal_ss = |{ plnal ALPHA = OUT }|.
  plnnr_ss = plnnr.

  SELECT plnal FROM plko
  WHERE plnty = @plnty_ss
  AND plnnr = @plnnr_ss INTO TABLE @DATA(lt_plnal).
  IF sy-subrc IS INITIAL.
    plnal_ss = COND #( WHEN line_exists( lt_plnal[ plnal = plnal  ] ) THEN plnal
                          ELSE lt_plnal[ 1 ]-plnal ).
  ENDIF.

  CALL DIALOG 'CP_EXT_LST_CREATE'
    EXPORTING
      plnty_ss
      plnnr_ss
      plnal_ss
      sttag_ss
      aktyp_ss        "Anzeigeberechtigung auf Quelle ist nötig
      source_matnr
      source_werks
      source_vbeln
      source_posnr
      source_pspnr
    IMPORTING
      copy_mapl
      copy_plkob
      copy_plflb
      copy_plasb
      copy_plpob
      copy_plfhb
      copy_plmzb
      copy_plabb
      copy_pltxb
      copy_mlstb
      copy_plmkb
      copy_plmwb
      copy_plphb
      copy_plftb
      copy_plfvb
      copy_lst.


  ct_plkob = VALUE #( FOR plko_s IN copy_plkob ( CORRESPONDING #( plko_s ) ) ).

  ct_plpob = VALUE #( FOR plpo_s IN copy_plpob ( CORRESPONDING #( plpo_s ) ) ).



ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  CALL_BAPI
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM call_bapi .
* Deletion only if Program Mode 2 or 3
  IF ( p_prgmod = c_3 AND NOT gt_rectempl_bi[] IS INITIAL )  "$sst: #110
    OR p_prgmod = c_2.                                       "$sst: #110
    PERFORM f_del_old_ver.
  ENDIF.

* Recipe Creation only if Program Mode 1 or 3
  IF p_prgmod <> c_2.

    DATA(lo_mrcp) = NEW cl_mrcp( gt_rectempl_bi ).
    lo_mrcp->create_master_recipe( ).

    DATA(lt_return) = lo_mrcp->get_t_message( ).

    LOOP AT gt_rectempl_bi INTO DATA(ls_rec).
      DATA(lv_tabix) = sy-tabix.

      IF NOT line_exists( lt_return[ msgty = 'S'] ).

      ELSE.

        DATA(ls_return) = lt_return[ 1 ].
        wa_fullreturn = CORRESPONDING #( ls_rec ).

        PERFORM f_populate_msg USING c_success
                                 ls_return-msgid                    "c_msg_ppe4
                                 ls_return-msgno                     "c_nro_131
                                 ls_return-msgv1
                                 ls_return-msgv2
                                 ls_return-msgv3
                                 ls_return-msgv4
                        CHANGING wa_return.
      ENDIF.

      MOVE-CORRESPONDING wa_return TO wa_fullreturn.
      wa_fullreturn-act_code = c_insert.
      wa_fullreturn-message_v1 = lo_mrcp->plnnr_tab[ lv_tabix ]-low.
      APPEND wa_fullreturn TO it_fullreturn.
    ENDLOOP.
    APPEND LINES OF it_rectempl_filter_ant TO it_rectempl_filter.
    APPEND LINES OF it_rectempl_bi_ant TO gt_rectempl_bi.    "$sst: #110
    IF gt_rectempl_bi[] IS INITIAL.                          "$sst: #110
      gv_flag = c_mark.
    ENDIF.
  ENDIF.

  COMMIT WORK AND WAIT. " SIMOESM - 20210520 - ALM-111994 - CHANGE POINTER


ENDFORM.

CLASS cl_mrcp IMPLEMENTATION.

  METHOD constructor.

    me->t_rectempl_bi = it_rectempl_bi.

    o_mrcp =  zcl_mrcp_utilites=>get_instance( ).

  ENDMETHOD.

  METHOD create_master_recipe.
    calculate( ).

    save_mrcp(  ).
  ENDMETHOD.


  METHOD calculate.

    LOOP AT t_rectempl_bi INTO me->rectempl_bi .

      read_tables_aux( ).

      rectempl_bi-plnal = '01'.

      add_header( ).

      add_mat_assign( ).

      add_operation( ).

      add_phase(  ).

      add_prodversion(  ).

      add_comp_mat(  ).

      clean(  ).

    ENDLOOP.

  ENDMETHOD.

  METHOD add_header.

    build_mrcp_header(  ).


    o_mrcp->create(
      EXPORTING
        it_mrcp_header  =  mrcp_header                " Table of MRCP Header
      IMPORTING
      et_message      = t_message                 " Message
      ev_severity     = severity                  " Message Severity
      et_index_failed = index_failed
    ).
  ENDMETHOD.

  METHOD add_mat_assign.

    build_mat_ass_tab( ).

    o_mrcp->add_material_assignment(
      EXPORTING
        it_mrcp_mat_assignment =  mat_ass_tab                " Master Recipe Material Assignments
      IMPORTING
      et_mrcp_mat_assignment = DATA(lt_mat_assign)                 " Master Recipe Material Assignments
        et_message      = t_message                 " Message
        ev_severity     = severity                  " Message Severity
        et_index_failed = index_failed
    ).

  ENDMETHOD.

  METHOD add_operation.

    build_operation_tab(  ).

    o_mrcp->add_operation(
      EXPORTING
        iv_insert_before  = abap_false        " Data element for domain BOOLE: TRUE (='X') and FALSE (=' ')
        it_mrcp_operation = opera_add_tab                 " Table of MRCP Operations
      IMPORTING
        et_mrcp_operation =  operation_tab                " Table of MRCP Operations
      et_message      = t_message                 " Message
      ev_severity     = severity                  " Message Severity
      et_index_failed = index_failed
    ).


  ENDMETHOD.



  METHOD get_mrcp_header.
    r_result = me->mrcp_header.
  ENDMETHOD.

  METHOD set_mrcp_header.
    me->mrcp_header = i_mrcp_header.
  ENDMETHOD.
  METHOD build_mrcp_header.

    LOOP AT me->plkob INTO DATA(ls_plko).
      DATA(ls_mrcp_header) = CORRESPONDING /plmi/s_mrcp_header( ls_plko ).
      ls_mrcp_header-plnnr = get_nr_plnnr( ).
      ls_mrcp_header-profidnetz = rectempl_bi-profidnetz .
      ls_mrcp_header-plnal = rectempl_bi-plnal.
      ls_mrcp_header-datuv = sy-datum.
      ls_mrcp_header-andat = sy-datum.
      ls_mrcp_header-annam = sy-uname.
      APPEND ls_mrcp_header TO me->mrcp_header.
    ENDLOOP.


  ENDMETHOD.

  METHOD get_mat_ass_tab.
    r_result = me->mat_ass_tab.
  ENDMETHOD.

  METHOD set_mat_ass_tab.
    me->mat_ass_tab = i_mat_ass_tab.
  ENDMETHOD.

  METHOD build_mat_ass_tab.

    LOOP AT mrcp_header INTO DATA(ls_header).
      DATA(ls_mat) = CORRESPONDING  /plmi/s_mrcp_mat_assignment( ls_header ).
      ls_mat-matnr = rectempl_bi-matnr.
      APPEND ls_mat TO mat_ass_tab.
    ENDLOOP.

  ENDMETHOD.

  METHOD build_operation_tab.

    opera_add_tab = VALUE #( FOR plpo IN me->plpob WHERE ( phflg IS INITIAL )
                           ( CORRESPONDING #( plpo EXCEPT plnnr plnkn ) ) ).

    LOOP AT opera_add_tab ASSIGNING FIELD-SYMBOL(<fs_plpo>).
      <fs_plpo>-plnnr = new_plnnr.
      <fs_plpo>-plnal = rectempl_bi-plnal.
      <fs_plpo>-datuv = sy-datum.
      <fs_plpo>-vgw03 = calculate_vgw03( CORRESPONDING #( <fs_plpo> ) ).
    ENDLOOP.

  ENDMETHOD.

  METHOD get_nr_plnnr.
    CALL FUNCTION 'CP_NV_DETERMINE_PLNNR'
      EXPORTING
        flg_unique = abap_false
        plnty      = plnty_ss
      IMPORTING
        plnnr      = new_plnnr.

    APPEND VALUE #( sign = 'I' option = 'EQ' low = new_plnnr ) TO plnnr_tab.

    r_plnnr = new_plnnr.
  ENDMETHOD.

  METHOD clean.
    CLEAR:
    mrcp_header,
    opera_add_tab,
    op_tab,
    operation_tab,
    mat_ass_tab ,
    prodver_tab,
    phase_tab,
    comp_mat_tab,
    plnnr_ss,
    plnal_ss,
    rectempl_bi.
  ENDMETHOD.


  METHOD save_mrcp.
    o_mrcp->save(
        IMPORTING
      ev_failed   = failed                 " Failed Indicator
      et_message  = t_message                 " Message
      ev_severity = severity
    ).

*    if  failed is INITIAL.
*
*    commit WORK AND WAIT.
*
*    endif.


  ENDMETHOD.


  METHOD add_prodversion.

    build_prodver_tab( ).

    o_mrcp->add_prodver(
      EXPORTING
        it_mrcp_prodver = prodver_tab                 " Master Recipe Production Version
      IMPORTING
        et_mrcp_prodver = DATA(lt_prodver)                 " Master Recipe Production Version
        et_message      = t_message                 " Message
        ev_severity     = severity                  " Message Severity
        et_index_failed = index_failed
    ).
  ENDMETHOD.


  METHOD add_phase.
    build_phase_tab(  ).

    o_mrcp->add_phase(
      EXPORTING
        iv_insert_before = abap_false        " Data element for domain BOOLE: TRUE (='X') and FALSE (=' ')
        it_mrcp_phase    = phase_tab                 " Table of MRCP Phases
      IMPORTING
        et_mrcp_phase    = DATA(lt_phase)                 " Table of MRCP Phases
        et_message      = t_message                 " Message
        ev_severity     = severity                  " Message Severity
        et_index_failed = index_failed
    ).

  ENDMETHOD.

  METHOD build_phase_tab.
    phase_tab = VALUE #( FOR plpo IN me->plpob WHERE ( phflg IS NOT INITIAL )
                         ( CORRESPONDING #( plpo EXCEPT plnnr plnkn ) ) ).

    LOOP AT phase_tab ASSIGNING FIELD-SYMBOL(<fs_ph>).
      <fs_ph>-plnnr = new_plnnr.
      <fs_ph>-plnal = rectempl_bi-plnal.
      <fs_ph>-datuv = sy-datum.
      READ TABLE operation_tab INTO DATA(ls_op) WITH KEY zaehl = <fs_ph>-pvzkn.
      <fs_ph>-pvzkn = ls_op-plnkn.
      <fs_ph>-vgw03 = calculate_vgw03( CORRESPONDING #( <fs_ph> ) ).
    ENDLOOP.
  ENDMETHOD.

  METHOD build_plmz_tab.



    comp_mat_tab = VALUE #( FOR stpo IN t_stpo
                                 FOR prd_ver IN prodver_tab
        ( mandt = prd_ver-mandt
          plnty = prd_ver-plnty
          plnnr = prd_ver-plnnr
          datuv = prd_ver-adatu
          plnal = prd_ver-alnal
          stlal = prd_ver-stlal
          werk_stl = prd_ver-werks
          plnkn = calculate_plnkn( stpo )
          plnfl = '000000'
          stlty = stpo-stlty
          stlnr = stpo-stlnr
          stlkn = stpo-stlkn
          andat = sy-datum
          annam = sy-uname
          stlty_w = stpo-stlty
          stlnr_w = stpo-stlnr
          stlal_w = prd_ver-stlal


           ) ).
    LOOP AT comp_mat_tab ASSIGNING FIELD-SYMBOL(<fs_cm>).
      <fs_cm>-zuonr = sy-tabix.
      <fs_cm>-zaehl = sy-tabix.
    ENDLOOP.

  ENDMETHOD.

  METHOD build_prodver_tab.

    prodver_tab = VALUE #( FOR header IN mrcp_header
                         ( mandt = sy-mandt
                           matnr = rectempl_bi-matnr
                           werks = rectempl_bi-werks
                           verid = rectempl_bi-pv_num
                           bdatu = '99991231'
                           adatu = sy-datum
                           datuv = header-datuv
                           stlal = rectempl_bi-stalt
                            stlan = rectempl_bi-stlan
                            plnty = header-plnty
                            plnnr = header-plnnr
                            alnal = header-plnal
                            mdv01 = COND #( WHEN rectempl_bi-zmip IS NOT INITIAL THEN c_mip
                                            ELSE space )
                            mdv02 = rectempl_bi-plan_id
                            text1 = rectempl_bi-pv_desc
                            bstmi = rectempl_bi-fr_qty
                            bstma = rectempl_bi-to_qty
                             prdat = sy-datum
                             prfg_f = 1
                             prfg_s = 1
                           )
                          ).

  ENDMETHOD.


  METHOD calculate_plnkn.

    IF NOT line_exists( t_stpo[ zcphas = space  ] ).


      READ TABLE phase_map_tab INTO DATA(ls_phase_map) WITH KEY
                                                                 material = space
                                                                 verid = rectempl_bi-pv_num
                                                                 zcphas = space.
      READ TABLE phase_map_tab INTO ls_phase_map WITH KEY
                                                               material = space
                                                               verid = space
                                                               zcphas = stpo-zcphas.
      READ TABLE phase_map_tab INTO ls_phase_map WITH KEY
                                                               material = rectempl_bi-matnr
                                                               verid = rectempl_bi-pv_num
                                                               zcphas = stpo-zcphas.
      DATA(lv_ktsch) = ls_phase_map-ktsch.


    ELSE.

      READ TABLE t_mat_asgn_rul INTO DATA(ls_rul) WITH KEY werks = rectempl_bi-werks
                                                           labor = me->labor .
      READ TABLE t_mat_asgn_rul INTO ls_rul WITH KEY werks = rectempl_bi-werks
                                                          dispo = me->dispo .

      READ TABLE t_mat_asgn_rul INTO ls_rul WITH KEY   werks = rectempl_bi-werks
                                                       material     = rectempl_bi-matnr
                                                      prod_version  = space
                                                      component     = stpo-idnrk
                                                      bom_item      = stpo-posnr.
      READ TABLE phase_tab INTO DATA(ls_phase) WITH KEY vornr = ls_rul-phase.
      lv_ktsch = ls_phase-ktsch.
    ENDIF.

    READ TABLE plpob INTO DATA(ls_plpo) WITH KEY  ktsch = lv_ktsch
                                                  phflg = abap_true.
    IF sy-subrc IS INITIAL.
      r_result = sy-tabix.
    ENDIF.



  ENDMETHOD.


  METHOD get_t_stpo.
    r_result = me->t_stpo.
  ENDMETHOD.

  METHOD set_t_stpo.
    DATA lv_stalt TYPE stalt.
    DATA lt_stpo TYPE TABLE OF stpox.

    lv_stalt = rectempl_bi-stalt.
    CALL FUNCTION 'CS_BOM_EXPL_MAT_V2'
      EXPORTING
        capid                 = 'PP01'
        datuv                 = sy-datum
        mtnrv                 = rectempl_bi-matnr
        stlal                 = rectempl_bi-stalt
        stlan                 = rectempl_bi-stlan
        werks                 = rectempl_bi-werks
      TABLES
        stb                   = lt_stpo
      EXCEPTIONS
        alt_not_found         = 1
        call_invalid          = 2
        material_not_found    = 3
        missing_authorization = 4
        no_bom_found          = 5
        no_plant_data         = 6
        no_suitable_bom_found = 7
        conversion_error      = 8
        OTHERS                = 9.
    IF sy-subrc IS INITIAL.
      t_stpo = lt_stpo.
      me->o_mrcp->add_stpo( VALUE #( FOR stpo IN t_stpo ( CORRESPONDING #( stpo ) ) ) ).

    ENDIF.
  ENDMETHOD.


  METHOD read_tables_aux.

    IF rectempl_bi-plnnr NE template_plnnr
    OR rectempl_bi-plnal NE template_plnal.

      template_plnnr = rectempl_bi-plnnr.
      template_plnal = rectempl_bi-plnal.

      PERFORM get_defaults USING rectempl_bi-plnnr rectempl_bi-plnal
                            CHANGING me->plkob
                                     me->plpob.
    ENDIF.


    IF  template_matnr NE rectempl_bi-matnr
    OR template_werks NE rectempl_bi-werks
    OR template_stalt NE rectempl_bi-stalt.

      template_matnr = rectempl_bi-matnr.
      template_werks = rectempl_bi-werks.
      template_stalt = rectempl_bi-stalt.

      set_t_stpo(  ).

      select_crhd(  ).

      SELECT labor FROM mara WHERE matnr = @rectempl_bi-matnr INTO @me->labor UP TO 1 ROWS.ENDSELECT.
      SELECT dispo FROM marc WHERE matnr = @rectempl_bi-matnr AND  werks = @rectempl_bi-werks INTO @me->dispo UP TO 1 ROWS.ENDSELECT.

      SELECT *
        FROM zgl_phase_map
        WHERE werks EQ @rectempl_bi-werks
        AND labor = @me->labor
        INTO TABLE @phase_map_tab.

      SELECT *
       FROM zgl_mat_asgn_rul
       INTO TABLE @t_mat_asgn_rul
       FOR ALL ENTRIES IN @t_stpo
       WHERE werks        EQ @rectempl_bi-werks
         AND labor        EQ @space   "Laboratory/design office must be empty
         AND dispo        EQ @space   "MRP Controller must be empty
         AND (
               ( prod_version EQ @t_stpo-verid OR prod_version EQ @space ) OR
               ( material     EQ @rectempl_bi-matnr )
             )
         AND component    EQ @t_stpo-idnrk
         AND bom_item     EQ @t_stpo-posnr.

      SELECT *
          FROM  zgl_mat_asgn_rul
              APPENDING TABLE @t_mat_asgn_rul
                WHERE werks EQ @p_werks
                  AND dispo = @me->dispo.


      SELECT *
        FROM zgl_mat_asgn_rul
          APPENDING TABLE @t_mat_asgn_rul
             WHERE werks EQ @p_werks
               AND labor = @me->labor.
    ENDIF.
  ENDMETHOD.


  METHOD add_comp_mat.

    build_plmz_tab( ).

    o_mrcp->add_mat_comp_assignment(
      EXPORTING
        it_mrcp_mat_assignment = comp_mat_tab                 " Master Recipe Material Assignments
*        IMPORTING
*          et_message             =                  " Message
*          ev_severity            =                  " Message Severity
*          et_index_failed        =
    ).
  ENDMETHOD.


  METHOD select_crhd.
    SELECT objty objid vgwts FROM crhd                     "$sst: #712
   INTO TABLE t_crhd
    FOR ALL ENTRIES IN me->plpob
  WHERE objty EQ c_objty
    AND objid EQ me->plpob-arbid.
  ENDMETHOD.


  METHOD calculate_vgw03.
    IF rectempl_bi-nop IS NOT INITIAL.
      IF line_exists( t_crhd[ objid = plpo-arbid ] ).
        r_result = ( lines( t_stpo ) * plpo-vgw03 ) / 100.
      ELSE.
        READ TABLE operation_tab INTO DATA(ls_op) WITH KEY plnkn = plpo-pvzkn.
        IF line_exists( t_crhd[ objid = ls_op-arbid ] ).
          r_result = ( lines( t_stpo ) * plpo-vgw03 ) / 100.
        ELSE.
          r_result = plpo-vgw03.
        ENDIF.
      ENDIF.


    ENDIF.
  ENDMETHOD.

  METHOD get_t_message.
    r_result = me->t_message.
  ENDMETHOD.


  METHOD get_return.



  ENDMETHOD.

ENDCLASS.
