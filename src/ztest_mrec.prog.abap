*&---------------------------------------------------------------------*
*& Report ZTEST_MREC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest_mrec.
INCLUDE ztest_mrec_top.



START-OF-SELECTION.

  plnty_ss = 2.
  plnnr_ss = '53529161'.
  plnal_ss = '01'.
  sttag_ss = sy-datum.
  aktyp_ss = 'A'.
*  break abrantes.
**  is_rc271-aennr      = ls_plko-aennr.
**  is_rc271-sttag      = ls_plko-datuv.
**  is_rc271-datuv      = ls_plko-datuv.
**  is_rc271-profidnetz = ls_plko-profidnetz.
**
**  is_rc27s-aennr      = ls_plko-aennr.
**  is_rc27s-sttag      = ls_plko-datuv.
**  is_rc27s-aktyp      = 'A'.
**
**  is_rc27m-werks      = ls_plko-werks.
* CALL FUNCTION 'MRTRS300_MASTER_RECIPE_INIT'
*  EXPORTING
*    i_plnty         = plnty_ss
** IMPORTING
**   ES_TCA01        =
**   ES_TCA05        =
**   ES_TCA09        =
**   ES_TCA11        =
**   ES_T430D        =
* EXCEPTIONS
*   NOT_FOUND       = 1
*   OTHERS          = 2
*          .
*IF sy-subrc <> 0.
** Implement suitable error handling here
*ENDIF.
*  CALL FUNCTION 'MRTRS300_MASTER_RECIPE_READ'
*  EXPORTING
*    is_rc271                 = is_rc271
*    is_rc27m                 = is_rc27m
*    is_rc27s                 = is_rc27s
* IMPORTING
**   XS_RC271                 =
**   XS_RC27M                 =
**   XS_RC27S                 =
**   ES_RC27I                 =
*   ES_PLKOB                 = ES_PLKOB
**   ET_MKAL                  = ET_MKAL
*   ET_OPERATION             = ET_OPERATION
*   ET_PHASE                 = ET_PHASE
*   ET_RELATION              = ET_RELATION
*   ET_SEC_RESOURCE          = ET_SEC_RESOURCE
*   ET_MAPL                  = ET_MAPL
*   ET_PLMZ                  = ET_PLMZ
*   ET_PLFT                  = ET_PLFT
*   ET_PLFV                  = ET_PLFV
*   ET_PLMK                  = ET_PLMK
*   ET_PLMW                  = ET_PLMW
*   ET_RESCLAS               = ET_RESCLAS
*   ET_LTEXT                 = ET_LTEXT
* EXCEPTIONS
*   KEY_NOT_QUALIFIED        = 1
*   KEY_INVALID              = 2
*   KEY_NUMBER_INVALID       = 3
*   NOT_FOUND                = 4
*   EXISTING                 = 5
*   INTERNAL_ERROR           = 6
*   FOREIGN_LOCK             = 7
*   OTHERS                   = 8
*          .
*IF sy-subrc <> 0.
** Implement suitable error handling here
*ENDIF.
*CHECK 1 = 2.
  BREAK abrantes.
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


  CALL FUNCTION 'CP_NV_DETERMINE_PLNNR'
    EXPORTING
*     FLG_UNIQUE       = 'X'
      plnty = plnty_ss
    IMPORTING
      plnnr = plnnr_ss.

  rc271-plnal = plnal_ss.
  rc271-profidnetz = 'ZGIVPI'.
  rc271-sttag = sttag_ss.
  rc271-werks = 'CM02'.
  rc271-plnnr = plnnr_ss.
  rc27m-matnr = '96200383'.
  rc27m-werks = 'CM02'.

  DATA: test   TYPE /plmi/t_mrcp_key.
  BREAK abrantes.
  DATA(lo_mrcp) = zcl_mrcp_utilites=>get_instance( ).
  lo_mrcp->get_details(
    EXPORTING
      it_mrcp_key     =   test              " Table of Master Recipe Keys
*    it_mrcp_verid   =                  " Table of Master Recipe Keys with Prod. Vers.
*    iv_lock         = abap_false       " Locking Indicator
*    iv_only_from_db = abap_false       " Get data only from DB (Skip temporary objects in buffer)
    IMPORTING
      et_mrcp         =  DATA(mrcp_tab2)                " Table of master recipes
*      et_message      = t_message                 " Message
*    ev_severity     =                  " Message Severity
*    et_index_failed =                  " Index of node ID for which no data is available
  ).



  DATA: mrcp_header   TYPE /plmi/t_mrcp_header,
        t_message     TYPE /plmb/t_spi_msg,
        severity      TYPE /plmb/spi_msg_severity,
        index_failed  TYPE /plmb/t_spi_rtr_index_failed,
        op_tab        TYPE /plmi/t_mrcp_operation,
        operation_tab TYPE /plmi/t_mrcp_operation,
        prodver_tab   TYPE /plmi/t_mrcp_prodver_add,
        failed        TYPE /plmb/spi_failed_ind,
        lv_sibling    TYPE plnkn.
  DATA phase_tab TYPE /plmi/t_mrcp_phase_add.
  DATA ls_phase TYPE /plmi/s_mrcp_phase_add.



  mrcp_header = VALUE #( FOR plko IN copy_plkob
                            ( CORRESPONDING #( plko EXCEPT plnal ) )
                         ).
LO_MRCP->delete(
  EXPORTING
    it_mrcp_key     =  VALUE #( FOR mrcp IN mrcp_header ( CORRESPONDING #( mrcp ) ) )                " Table of MRCP Keys
*  IMPORTING
*    et_message      =                  " Message
*    ev_severity     =                  " Message Severity
*    et_index_failed =                  " Index of node ID for which no data is availab
).
  phase_tab = VALUE #( FOR plpo IN copy_plpob WHERE ( phflg IS NOT INITIAL )
                           ( CORRESPONDING #( plpo EXCEPT plnnr plnkn ) ) ).
  operation_tab = VALUE #( FOR plpo IN copy_plpob WHERE ( phflg IS INITIAL )
                           ( CORRESPONDING #( plpo EXCEPT plnnr plnkn ) ) ).
  plnal_ss = '01'.
  LOOP AT mrcp_header ASSIGNING FIELD-SYMBOL(<fs_plko>).
    <fs_plko>-plnnr = plnnr_ss.
    <fs_plko>-profidnetz = 'ZGIVXS'.
    <fs_plko>-plnal = plnal_ss.
    <fs_plko>-datuv = sy-datum.
    <fs_plko>-andat = sy-datum.
    <fs_plko>-annam = sy-uname.
  ENDLOOP.

  LOOP AT operation_tab ASSIGNING FIELD-SYMBOL(<fs_plpo>).
*    <fs_plpo>-plnkn = 99999999 - <fs_plpo>-zaehl.
    <fs_plpo>-plnnr = plnnr_ss.
    <fs_plpo>-plnal = plnal_ss.
    <fs_plpo>-datuv = sy-datum.
  ENDLOOP.

  LOOP AT phase_tab ASSIGNING FIELD-SYMBOL(<fs_ph>).
*    <fs_ph>-plnkn = 99999999 - <fs_ph>-zaehl.
    <fs_ph>-plnnr = plnnr_ss.
    <fs_ph>-plnal = plnal_ss.
    <fs_ph>-datuv = sy-datum.
  ENDLOOP.

  DATA(add_operation) = VALUE /plmi/t_mrcp_operation_add(
                                        FOR op IN operation_tab
                                        ( CORRESPONDING #( op ) )
                                        ).
  lo_mrcp->create(
    EXPORTING
      it_mrcp_header  = mrcp_header                 " Table of MRCP Header
    IMPORTING
      et_message      = t_message                 " Message
      ev_severity     = severity                  " Message Severity
      et_index_failed = index_failed
  ).


  DATA(lt_mat_ass) = VALUE /plmi/t_mrcp_mat_assignment(
                      FOR mat IN mrcp_header ( CORRESPONDING #( mat ) )
                      ).

  LOOP AT lt_mat_ass ASSIGNING FIELD-SYMBOL(<fs_mat>).
    <fs_mat>-matnr = rc27m-matnr.
  ENDLOOP.

  lo_mrcp->add_material_assignment(
    EXPORTING
      it_mrcp_mat_assignment = lt_mat_ass                  " Master Recipe Material Assignments
    IMPORTING
      et_mrcp_mat_assignment = DATA(lt_mat_assign)                 " Master Recipe Material Assignments
        et_message      = t_message                 " Message
        ev_severity     = severity                  " Message Severity
        et_index_failed = index_failed
  ).
  BREAK abrantes.

  lo_mrcp->add_operation(
    EXPORTING
      iv_insert_before  = abap_false        " Data element for domain BOOLE: TRUE (='X') and FALSE (=' ')
      it_mrcp_operation = add_operation             " Table of MRCP Operations
    IMPORTING
      et_mrcp_operation =   op_tab               " Table of MRCP Operations
      et_message        =   t_message                 " Message
*      ev_severity       =                  " Message Severity
*      et_index_failed   =
  ).
  lo_mrcp->get_details(
    EXPORTING
      it_mrcp_key     =  VALUE #( FOR mrcp IN mrcp_header ( CORRESPONDING #( mrcp ) ) )                " Table of Master Recipe Keys
*    it_mrcp_verid   =                  " Table of Master Recipe Keys with Prod. Vers.
*    iv_lock         = abap_false       " Locking Indicator
*    iv_only_from_db = abap_false       " Get data only from DB (Skip temporary objects in buffer)
    IMPORTING
      et_mrcp         =  DATA(mrcp_tab)                " Table of master recipes
      et_message      = t_message                 " Message
*    ev_severity     =                  " Message Severity
*    et_index_failed =                  " Index of node ID for which no data is available
  ).
*
*  lo_mrcp->change_operation(
*    EXPORTING
*      it_mrcp_operation = operation_tab                 " Table of MRCP Operations
*    IMPORTING
*      et_message        =  t_message                 " Message
*  ).


*
*  LOOP AT add_operation INTO DATA(opss).
*    ls_phase = CORRESPONDING #( opss ).
*    ls_phase-pvzkn = 99999998.
**    ls_phase-
*    APPEND ls_phase TO phase_tab.
*  ENDLOOP.


  LOOP AT phase_tab ASSIGNING <fs_ph>.
    <fs_ph>-pvzkn = mrcp_tab[ 1 ]-operation[ zaehl  = <fs_ph>-pvzkn ]-plnkn.
  ENDLOOP.
  lo_mrcp->add_phase(
    EXPORTING
      iv_insert_before = abap_false        " Data element for domain BOOLE: TRUE (='X') and FALSE (=' ')
      it_mrcp_phase    = phase_tab                 " Table of MRCP Phases
    IMPORTING
*      et_mrcp_phase    =                  " Table of MRCP Phases
 et_message      = t_message                 " Message
*      ev_severity      =                  " Message Severity
*      et_index_failed  =
  ).


  prodver_tab = VALUE #( FOR mrcp IN mrcp_header ( CORRESPONDING #( mrcp MAPPING alnal = plnal ) ) ).

  LOOP AT prodver_tab ASSIGNING FIELD-SYMBOL(<fs_prdver>).
    <fs_prdver>-mandt = sy-mandt.
    <fs_prdver>-matnr = '96200383'.
    <fs_prdver>-verid = 'L01B'.
    <fs_prdver>-text1 = 'TEST'.
    <fs_prdver>-bstmi = 10001.
    <fs_prdver>-bstma = 100000.
    <fs_prdver>-stlal = 'GL'.
    <fs_prdver>-stlan = 1.
    <fs_prdver>-mdv02 = 'L1ND'.
    <fs_prdver>-adatu = sy-datum.
    <fs_prdver>-prdat = sy-datum.
    <fs_prdver>-bdatu = '99991231'.
    <fs_prdver>-prfg_f = <fs_prdver>-prfg_s = '1'.

  ENDLOOP.

  lo_mrcp->add_prodver(
  EXPORTING
    it_mrcp_prodver = prodver_tab                 " Master Recipe Production Version
  IMPORTING
    et_mrcp_prodver = DATA(prodver_t)                 " Master Recipe Production Version
        et_message      = t_message                 " Message
        ev_severity     = severity                  " Message Severity
        et_index_failed = index_failed
).

  DATA lt_stpo TYPE TABLE OF stpox.

  CALL FUNCTION 'CS_BOM_EXPL_MAT_V2'
    EXPORTING
      capid                 = 'PP01'
      datuv                 = sy-datum
      mtnrv                 = <fs_prdver>-matnr
      stlal                 = <fs_prdver>-stlal
      stlan                 = <fs_prdver>-stlan
      werks                 = <fs_prdver>-werks
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

  lo_mrcp->add_stpo( VALUE #( for stpo in lt_stpo ( CORRESPONDING #( stpo ) ) )  ).

  DATA(comp_mat) = VALUE zgl_mrcp_comp_mat_assign_tab( FOR stpo IN lt_stpo
                                                    FOR prd_ver IN prodver_tab
      ( mandt = prd_ver-mandt
        plnty = prd_ver-plnty
        plnnr = prd_ver-plnnr
        datuv = prd_ver-adatu
        plnal = plnal_ss
        stlal = prd_ver-stlal
        werk_stl = prd_ver-werks
        plnkn = '00000002'
        stlty = stpo-stlty
        stlnr = stpo-stlnr
        stlkn = stpo-stlkn
        andat = sy-datum
        annam = sy-uname
        stlty_w = stpo-stlty
        stlnr_w = stpo-stlnr
        stlal_w = prd_ver-stlal

         ) ).
  LOOP AT comp_mat ASSIGNING FIELD-SYMBOL(<fs_cm>).

    <fs_cm>-zuonr = sy-tabix.
    <fs_cm>-zaehl = sy-tabix.
    <FS_CM>-PLNFL = 000000.

  ENDLOOP.


lo_mrcp->add_mat_comp_assignment(
  EXPORTING
    it_mrcp_mat_assignment =  comp_mat                " Master Recipe Material Assignments
  IMPORTING
        et_message      = t_message                 " Message
        ev_severity     = severity                  " Message Severity
        et_index_failed = index_failed
).

  BREAK abrantes.
  lo_mrcp->save(
    IMPORTING
      ev_failed   = failed                 " Failed Indicator
      et_message  = t_message                 " Message
      ev_severity = severity                 " Message Severity
  ).





  COMMIT WORK AND WAIT.



*  READ TABLE copy_plkob INDEX 1 INTO DATA(ls_plko).
*  CHECK sy-subrc = 0.
*  is_plkob = ls_plko.
*  is_plkob-plnty = is_rc271-plnty      = 2.
*  is_plkob-plnnr = is_rc271-plnnr      = plnnr_ss.
*  is_plkob-plnal = is_rc271-plnal      = '01'.
*  is_rc271-aennr      = ls_plko-aennr.
*  is_rc271-sttag      = ls_plko-datuv.
*  is_rc271-datuv      = ls_plko-datuv.
*  is_rc271-profidnetz = ls_plko-profidnetz.
*
*  is_rc27s-aennr      = ls_plko-aennr.
*  is_rc27s-sttag      = ls_plko-datuv.
*  is_rc27s-aktyp      = 'A'.
*
*  is_rc27m-werks      = ls_plko-werks.
*
*
*  LOOP AT copy_plpob INTO DATA(ls_plpo).
*    ls_plpo-plnkn = 99999999 - ls_plpo-zaehl.
*    ls_plpo-plnnr = plnnr_ss.
*
*    ls_plpo-datuv = sy-datum.
*    DATA(ls_operation) = CORRESPONDING mrtrss_plpo_opr( ls_plpo ).
*    ls_operation-plnal = plnal_ss.
*    DATA(ls_phase) = CORRESPONDING mrtrss_plpo_ph( ls_plpo ).
*    ls_phase-plnal = plnal_ss.
*    APPEND ls_operation to it_operation.
*    append ls_phase to it_phase.
*  ENDLOOP.
*data et_mkal type MRTRSTY_MKAL.
*CALL FUNCTION 'MRTRS300_MASTER_RECIPE_INIT'
*  EXPORTING
*    i_plnty         = plnty_ss
** IMPORTING
**   ES_TCA01        =
**   ES_TCA05        =
**   ES_TCA09        =
**   ES_TCA11        =
**   ES_T430D        =
* EXCEPTIONS
*   NOT_FOUND       = 1
*   OTHERS          = 2
*          .
*IF sy-subrc <> 0.
** Implement suitable error handling here
*ENDIF.
*
*

*
*
*
*  CALL FUNCTION 'MRTRS300_MASTER_RECIPE_WRITE'
*    EXPORTING
*      is_rc271            = is_rc271
*      is_rc27s            = is_rc27s
*      is_rc27m            = is_rc27m
*      is_plkob            = is_plkob
*      is_plkob_old        = is_plkob_old
*      is_mkal             = is_mkal
*      is_mkal_old         = is_mkal_old
*      it_operation        = it_operation
*      it_operation_old    = it_operation_old
*      it_phase            = it_phase
*      it_phase_old        = it_phase_old
*      it_relation         = it_relation
*      it_relation_old     = it_relation_old
*      it_sec_resource     = it_sec_resource
*      it_sec_resource_old = it_sec_resource_old
*      it_mapl             = it_mapl
*      it_mapl_old         = it_mapl_old
*      it_plmz             = it_plmz
*      it_plmz_old         = it_plmz_old
*      it_plft             = it_plft
*      it_plft_old         = it_plft_old
*      it_plfv             = it_plfv
*      it_plfv_old         = it_plfv_old
*      it_plmk             = it_plmk
*      it_plmk_old         = it_plmk_old
*      it_plmw             = it_plmw
*      it_plmw_old         = it_plmw_old
*      it_resclas          = it_resclas
*      it_ltext            = it_ltext
*      it_ltext_old        = it_ltext_old
*      is_stkob            = is_stkob
*      is_stkok            = is_stkok
*      it_stpob            = it_stpob
*    IMPORTING
*      es_plkob            = es_plkob
*      es_mkal             = es_mkal
*      et_operation        = et_operation
*      et_phase            = et_phase
*      et_relation         = et_relation
*      et_sec_resource     = et_sec_resource
*      et_mapl             = et_mapl
*      et_plmz             = et_plmz
*      et_plft             = et_plft
*      et_plfv             = et_plfv
*      et_plmk             = et_plmk
*      et_plmw             = et_plmw
*      et_resclas          = et_resclas
*      et_ltext            = et_ltext
*      et_plnkn_opr        = et_plnkn_opr
*      et_plnkn_ph         = et_plnkn_ph
*      et_plnkn_sop        = et_plnkn_sop
*      et_plmk_rel         = et_plmk_rel
*      et_pi_key           = et_pi_key
*      et_pi_char_key      = et_pi_char_key
*    EXCEPTIONS
*      not_found           = 1
*      internal_error      = 2
*      data_error          = 3
*      OTHERS              = 4.
*  IF sy-subrc <> 0.
** Implement suitable error handling here
*  ENDIF.
*
*     CALL FUNCTION 'MRTRS300_MASTER_RECIPE_SAVE'
*          EXPORTING
*            is_rc271   = is_rc271
*            is_rc27m   = is_rc27m
*            is_rc27s   = is_rc27s
*            is_plkob   = es_plkob
*          EXCEPTIONS
*            save_error = 1
*            OTHERS     = 2.
*COMMIT WORK AND WAIT.

*  CHECK 1 = 2.
