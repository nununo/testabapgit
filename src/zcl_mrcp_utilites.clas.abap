*----------------------------------------------------------------------*
*       CLASS /PLMI/CL_MRCP_BL DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
class ZCL_MRCP_UTILITES definition
  public
  final
  create private .

public section.

  types:
    BEGIN OF gty_s_mrcp_existence.
            INCLUDE TYPE /plmi/s_mrcp_key.
    TYPES exists TYPE exists.
    TYPES END OF gty_s_mrcp_existence .
  types:
    gty_t_mrcp_existence TYPE STANDARD TABLE OF gty_s_mrcp_existence WITH KEY plnal plnnr .
  types:
    BEGIN OF gty_s_plnkn_mapping.
    TYPES plnkn_tmp TYPE plnkn.
    TYPES plnkn_db TYPE plnkn.
    TYPES END OF gty_s_plnkn_mapping .
  types:
    gty_t_plnkn_mapping TYPE STANDARD TABLE OF gty_s_plnkn_mapping .
  types:
    BEGIN OF gty_s_plnft_mapping.
    TYPES plnft_tmp TYPE plnft.
    TYPES plnft_db TYPE plnft.
    TYPES END OF gty_s_plnft_mapping .
  types:
    gty_t_plnft_mapping TYPE STANDARD TABLE OF gty_s_plnft_mapping .
  types:
    BEGIN OF gty_s_mkmzl_mapping.
    TYPES mkmzl_tmp TYPE plnfv.
    TYPES mkmzl_db TYPE plnfv.
    TYPES END OF gty_s_mkmzl_mapping .
  types:
    gty_t_mkmzl_mapping TYPE STANDARD TABLE OF gty_s_mkmzl_mapping .

  constants GC_PLNTY_MRCP type PLNTY value '2' ##NO_TEXT.

  methods ADD_STPO
    importing
      !IT_STPO type MRTRSTY_STPOB
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods ADD_MAT_COMP_ASSIGNMENT
    importing
      !IT_MRCP_MAT_ASSIGNMENT type ZGL_MRCP_COMP_MAT_ASSIGN_TAB
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods ADD_MATERIAL_ASSIGNMENT
    importing
      !IT_MRCP_MAT_ASSIGNMENT type /PLMI/T_MRCP_MAT_ASSIGNMENT
    exporting
      !ET_MRCP_MAT_ASSIGNMENT type /PLMI/T_MRCP_MAT_ASSIGNMENT
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods ADD_OPERATION
    importing
      !IV_INSERT_BEFORE type BOOLE_D default ABAP_TRUE
      !IT_MRCP_OPERATION type /PLMI/T_MRCP_OPERATION_ADD
    exporting
      !ET_MRCP_OPERATION type /PLMI/T_MRCP_OPERATION
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods ADD_PHASE
    importing
      !IV_INSERT_BEFORE type BOOLE_D default ABAP_TRUE
      !IT_MRCP_PHASE type /PLMI/T_MRCP_PHASE_ADD
    exporting
      !ET_MRCP_PHASE type /PLMI/T_MRCP_PHASE
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods ADD_PI
    importing
      !IV_INSERT_BEFORE type BOOLE_D default ABAP_TRUE
      !IT_MRCP_PI type /PLMI/T_MRCP_PI_ADD
    exporting
      !ET_MRCP_PI type /PLMI/T_MRCP_PI
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods ADD_PI_CHAR_VAL
    importing
      !IV_INSERT_BEFORE type BOOLE_D default ABAP_TRUE
      !IT_MRCP_PI_CHAR_VAL type /PLMI/T_MRCP_PI_CHAR_VAL_ADD
    exporting
      !ET_MRCP_PI_CHAR_VAL type /PLMI/T_MRCP_PI_CHAR_VAL
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods ADD_PRODVER
    importing
      !IT_MRCP_PRODVER type /PLMI/T_MRCP_PRODVER_ADD
    exporting
      !ET_MRCP_PRODVER type /PLMI/T_MRCP_PRODVER
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods ADD_RESOURCE
    importing
      !IV_INSERT_BEFORE type BOOLE_D default ABAP_TRUE
      !IT_MRCP_RESOURCE type /PLMI/T_MRCP_RESOURCE_ADD
    exporting
      !ET_MRCP_RESOURCE type /PLMI/T_MRCP_RESOURCE
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods ADD_RSC
    importing
      !IT_MRCP_RSC type /PLMI/T_MRCP_RSC
    exporting
      !ET_MRCP_RSC type /PLMI/T_MRCP_RSC
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods CHANGE_HEADER
    importing
      !IT_MRCP_HEADER type /PLMI/T_MRCP_HEADER
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods CHANGE_MATERIAL_ASSIGNMENT
    importing
      !IT_MRCP_MAT_ASSIGNMENT type /PLMI/T_MRCP_MAT_ASSIGNMENT
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods CHANGE_OPERATION
    importing
      !IT_MRCP_OPERATION type /PLMI/T_MRCP_OPERATION
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods CHANGE_PHASE
    importing
      !IT_MRCP_PHASE type /PLMI/T_MRCP_PHASE
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods CHANGE_PI
    importing
      !IT_MRCP_PI type /PLMI/T_MRCP_PI
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods CHANGE_PI_CHAR_VAL
    importing
      !IT_MRCP_PI_CHAR_VAL type /PLMI/T_MRCP_PI_CHAR_VAL
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods CHANGE_PRODVER
    importing
      !IT_MRCP_PRODVER type /PLMI/T_MRCP_PRODVER
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods CHANGE_RESOURCE
    importing
      !IT_MRCP_RESOURCE type /PLMI/T_MRCP_RESOURCE
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods CHANGE_RSC
    importing
      !IT_MRCP_RSC type /PLMI/T_MRCP_RSC
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods MOVE_OPERATION
    importing
      !IS_MRCP_KEY type /PLMI/S_MRCP_KEY
      !IV_ITEM_PLNKN type PLNKN
      !IV_SIBLING_PLNKN type PLNKN
      !IV_INSERT_BEFORE type BOOLE_D default ABAP_TRUE
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods MOVE_PHASE
    importing
      !IS_MRCP_KEY type /PLMI/S_MRCP_KEY
      !IV_ITEM_PLNKN type PLNKN
      !IV_SIBLING_PLNKN type PLNKN optional
      !IV_SIBLING_PVZKN type PLNKN
      !IV_INSERT_BEFORE type BOOLE_D default ABAP_TRUE
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods MOVE_PI
    importing
      !IS_MRCP_KEY type /PLMI/S_MRCP_KEY
      !IV_ITEM_PLNFT type PLNFT
      !IV_ITEM_PLNKN type PLNKN
      !IV_SIBLING_PLNFT type PLNFT optional
      !IV_SIBLING_PLNKN type PLNKN
      !IV_INSERT_BEFORE type BOOLE_D default ABAP_TRUE
    exporting
      !ES_MRCP_PI type /PLMI/S_MRCP_PI
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods MOVE_PI_CHAR_VAL
    importing
      !IS_MRCP_KEY type /PLMI/S_MRCP_KEY
      !IV_ITEM_MKMZL type PLNFV
      !IV_ITEM_PLNFT type PLNFT
      !IV_ITEM_PLNKN type PLNKN
      !IV_SIBLING_MKMZL type PLNFV optional
      !IV_SIBLING_PLNFT type PLNFT
      !IV_SIBLING_PLNKN type PLNKN
      !IV_INSERT_BEFORE type BOOLE_D default ABAP_TRUE
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods MOVE_RESOURCE
    importing
      !IS_MRCP_KEY type /PLMI/S_MRCP_KEY
      !IV_ITEM_PLNKN type PLNKN
      !IV_SIBLING_PLNKN type PLNKN optional
      !IV_SIBLING_SUMNR type SUMKNTNR
      !IV_INSERT_BEFORE type BOOLE_D default ABAP_TRUE
    exporting
      !ES_MRCP_RESOURCE type /PLMI/S_MRCP_RESOURCE
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods CHECK_EXISTENCE
    importing
      !IT_MRCP_KEY type /PLMI/T_MRCP_KEY
    exporting
      !ET_MRCP_EXISTENCE type GTY_T_MRCP_EXISTENCE
      !ET_MRCP_HEADER type /PLMI/T_MRCP_HEADER
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods CLEAN_UP
    importing
      !IV_REASON type /PLMB/SPI_CLEAN_UP_REASON default /PLMB/IF_SPI_C=>GS_C_CLEANUP_REASON-BUFFER_REFRESH .
  methods CREATE
    importing
      !IT_MRCP_HEADER type /PLMI/T_MRCP_HEADER
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods DELETE
    importing
      !IT_MRCP_KEY type /PLMI/T_MRCP_KEY
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods DELETE_OPERATION
    importing
      !IT_MRCP_OPERATION_KEY type /PLMI/T_MRCP_OPERATION_KEY
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods DELETE_PHASE
    importing
      !IT_MRCP_PHASE_KEY type /PLMI/T_MRCP_PHASE_KEY
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods DELETE_PI
    importing
      !IT_MRCP_PI_KEY type /PLMI/T_MRCP_PI_KEY
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods DELETE_PI_CHAR_VAL
    importing
      !IT_MRCP_PI_CHAR_VAL_KEY type /PLMI/T_MRCP_PI_CHAR_VAL_KEY
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods DELETE_RESOURCE
    importing
      !IT_MRCP_RESOURCE_KEY type /PLMI/T_MRCP_RESOURCE_KEY
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods DELETE_RSC
    importing
      !IT_MRCP_RSC_KEY type /PLMI/T_MRCP_RSC_KEY
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  methods GET_DETAILS
    importing
      !IT_MRCP_KEY type /PLMI/T_MRCP_KEY
      !IT_MRCP_VERID type /PLMI/CL_GSS_MRCP=>TT_MRCP_VERID optional
      !IV_LOCK type /PLMB/SPI_LOCK_IND default ABAP_FALSE
      !IV_ONLY_FROM_DB type BOOLE_D default ABAP_FALSE
    exporting
      !ET_MRCP type /PLMI/T_MRCP_DETAILS
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_INDEX_FAILED .
  methods GET_PI
    importing
      !IT_MRCP_PI_KEY type /PLMI/T_MRCP_PI_KEY
      !IV_WHOLE_SUBTREE type BOOLE_D default ABAP_FALSE
    exporting
      !ET_PI type /PLMI/T_MRCP_PI
      !ET_PI_CHAR_VAL type /PLMI/T_MRCP_PI_CHAR_VAL
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY
      !ET_INDEX_FAILED type /PLMB/T_SPI_RTR_INDEX_FAILED .
  class-methods GET_INSTANCE
    returning
      value(RO_MRCP) type ref to ZCL_MRCP_UTILITES .
  methods GET_INTERNAL_KEY_MAPPING
    exporting
      !ET_PLNKN_MAPPING type GTY_T_PLNKN_MAPPING
      !ET_PLNFT_MAPPING type GTY_T_PLNFT_MAPPING
      !ET_MKMZL_MAPPING type GTY_T_MKMZL_MAPPING .
  methods SAVE
    exporting
      !EV_FAILED type /PLMB/SPI_FAILED_IND
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods LOCK
    importing
      !IV_PLNNR type PLNNR
    returning
      value(RV_SUCCESS) type BOOLE_D .
  methods UNLOCK .
protected section.
private section.

  types:
    BEGIN OF ty_mrcp_header_mod.
          INCLUDE TYPE /plmi/s_mrcp_header.
  TYPES mod_flg TYPE /plmi/gss_mr_mod_flg.
  TYPES END OF ty_mrcp_header_mod .
  types:
    BEGIN OF ty_mrcp_operation_mod.
          INCLUDE TYPE /plmi/s_mrcp_operation.
  TYPES mod_flg TYPE /plmi/gss_mr_mod_flg.
  TYPES END OF ty_mrcp_operation_mod .
  types:
    tt_mrcp_operation_mod TYPE STANDARD TABLE OF ty_mrcp_operation_mod WITH KEY plnnr plnal plnkn .
  types:
    BEGIN OF ty_mrcp_phase_mod.
          INCLUDE TYPE /plmi/s_mrcp_phase.
  TYPES mod_flg TYPE /plmi/gss_mr_mod_flg.
  TYPES END OF ty_mrcp_phase_mod .
  types:
    BEGIN OF ty_mrcp_resource_mod.
          INCLUDE TYPE /plmi/s_mrcp_resource.
  TYPES mod_flg TYPE /plmi/gss_mr_mod_flg.
  TYPES END OF ty_mrcp_resource_mod .
  types:
    BEGIN OF ty_mrcp_rsc_mod.
          INCLUDE TYPE /plmi/s_mrcp_rsc.
  TYPES mod_flg TYPE /plmi/gss_mr_mod_flg.
  TYPES END OF ty_mrcp_rsc_mod .
  types:
    BEGIN OF ty_mrcp_pi_mod.
          INCLUDE TYPE /plmi/s_mrcp_pi.
  TYPES mod_flg TYPE /plmi/gss_mr_mod_flg.
  TYPES END OF ty_mrcp_pi_mod .
  types:
    BEGIN OF ty_mrcp_pi_char_val_mod.
          INCLUDE TYPE /plmi/s_mrcp_pi_char_val.
  TYPES mod_flg TYPE /plmi/gss_mr_mod_flg.
  TYPES END OF ty_mrcp_pi_char_val_mod .
  types:
    BEGIN OF ty_mrcp_prodver_mod.
          INCLUDE TYPE /plmi/s_mrcp_prodver.
  TYPES mod_flg TYPE /plmi/gss_mr_mod_flg.
  TYPES END OF ty_mrcp_prodver_mod .
  types:
    BEGIN OF ty_mrcp_mat_assign_mod.
          INCLUDE TYPE /plmi/s_mrcp_mat_assignment.
  TYPES mod_flg TYPE /plmi/gss_mr_mod_flg.
  TYPES END OF ty_mrcp_mat_assign_mod .
  types:
    BEGIN OF ty_mrcp_mat_comp_assign_mod.
          INCLUDE TYPE ZGL_MRCP_COMP_MAT_ASSIGN.
  TYPES mod_flg TYPE /plmi/gss_mr_mod_flg.
  TYPES END OF ty_mrcp_mat_comp_assign_mod .
  types:
    BEGIN OF ty_mrcp_buffer.
          INCLUDE TYPE /plmi/s_mrcp_key.
  TYPES header              TYPE                    ty_mrcp_header_mod.
  TYPES operation           TYPE                    tt_mrcp_operation_mod.
  TYPES phase               TYPE STANDARD TABLE OF  ty_mrcp_phase_mod       WITH KEY plnnr plnal plnkn.
  TYPES pi                  TYPE STANDARD TABLE OF  ty_mrcp_pi_mod          WITH KEY plnnr plnal plnkn plnft.
  TYPES pi_char_val         TYPE STANDARD TABLE OF  ty_mrcp_pi_char_val_mod WITH KEY plnnr plnal plnkn plnft mkmzl.
  TYPES resource            TYPE STANDARD TABLE OF  ty_mrcp_resource_mod    WITH KEY plnnr plnal plnkn.
  TYPES rsc                 TYPE STANDARD TABLE OF  ty_mrcp_rsc_mod         WITH KEY plnnr plnal plnkn.
  TYPES prodver             TYPE STANDARD TABLE OF  ty_mrcp_prodver_mod     WITH KEY plnnr alnal.
  TYPES mat_assignment      TYPE STANDARD TABLE OF  ty_mrcp_mat_assign_mod  WITH KEY plnnr plnal.
  TYPES mat_comp_assign     TYPE STANDARD TABLE OF  ty_mrcp_mat_comp_assign_mod WITH KEY PLNTY PLNNR ZUONR ZAEHL.



  TYPES END OF ty_mrcp_buffer .
  types:
    BEGIN OF ty_stpo.
    INCLUDE TYPE /plmi/s_mrcp_key.
    TYPES stpo     TYPE MRTRSTY_STPOB.
    types END OF ty_stpo .
  types:
    tt_mrcp_buffer TYPE STANDARD TABLE OF ty_mrcp_buffer WITH KEY plnnr plnal datuv .
  types:
    tt_stpo TYPE STANDARD TABLE OF ty_stpo WITH KEY plnnr plnal datuv .
  types:
    BEGIN OF ty_profile,
        profile         TYPE profid_std,
        pe_inc          TYPE del_vornr,
        pi_inc          TYPE ftnr_inc,
        pi_char_val_inc TYPE fvnr_inc,
        resource_inc    TYPE cf_psninc,
    END OF ty_profile .
  types:
    tt_profile TYPE STANDARD TABLE OF ty_profile WITH KEY profile .
  types:
    BEGIN OF ty_id,
      type  TYPE char2,
      sumnr TYPE sumkntnr, " Parent operation ID in case of Resources
      pvzkn TYPE plnkn, " Parent operation ID in case of Phases
      plnkn TYPE plnkn, " Operation or Phase or Resource ID
      plnft TYPE plnft, " Process instruction ID
      mkmzl TYPE plnfv, " Process instruction characteristic ID
    END OF ty_id .
  types:
    BEGIN OF ty_lock,
        plnnr           TYPE plnnr,
    END OF ty_lock .
  types:
    tt_lock TYPE SORTED TABLE OF ty_lock WITH UNIQUE KEY plnnr .

  data STPO type TT_STPO .
  constants GC_MOD_FLAG_INSERT type CHAR1 value 'I' ##NO_TEXT.
  constants GC_MOD_FLAG_UPDATE type CHAR1 value 'U' ##NO_TEXT.
  constants GC_MOD_FLAG_DELETE type CHAR1 value 'D' ##NO_TEXT.
  class-data GO_MRCP type ref to ZCL_MRCP_UTILITES .
  data GV_MSG type CHAR250  ##NEEDED.
  data MT_BUFFER type TT_MRCP_BUFFER .
  data MV_PLNKN type PLNKN .
  data MV_PLNFT type PLNFT .
  data MT_BUFFER_OLD type TT_MRCP_BUFFER .
  data MV_MKMZL type PLNFV .
  data MT_PLNKN_MAPPING type GTY_T_PLNKN_MAPPING .
  data MT_PLNFT_MAPPING type GTY_T_PLNFT_MAPPING .
  data MT_MKMZL_MAPPING type GTY_T_MKMZL_MAPPING .
  data MT_PROFILE type TT_PROFILE .
  constants GC_DEF_SEQ_INC type NUMC4 value 10 ##NO_TEXT.
  data MT_LOCK_BUFFER type TT_LOCK .
  data MT_RESCLAS type MRTRSTY_RESCLAS .
  constants:
    BEGIN OF gs_c_mrcp_subobj_type,
    header          TYPE char2 VALUE '01', "#EC NOTEXT
    operation       TYPE char2 VALUE '02', "#EC NOTEXT
    phase           TYPE char2 VALUE '03', "#EC NOTEXT
    pi              TYPE char2 VALUE '04', "#EC NOTEXT
    pi_cv           TYPE char2 VALUE '05', "#EC NOTEXT
    resource        TYPE char2 VALUE '06', "#EC NOTEXT
    rsc             TYPE char2 VALUE '07', "#EC NOTEXT
    mat_assignment  TYPE char2 VALUE '08', "#EC NOTEXT
    prod_ver        TYPE char2 VALUE '09', "#EC NOTEXT
  END OF gs_c_mrcp_subobj_type .
  data GT_STPO type MRTRSTY_STPOB .

  methods BUFFER_RECIPE
    importing
      !IV_PLNNR type PLNNR
      !IV_PLNAL type PLNAL
      !IV_DATUV type DATUV
      !IV_AENNR type AENNR optional
      !IV_VERID type VERID optional
      !IV_LOCK type BOOLE_D default 'X'
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods CHANGE_MESSAGES
    importing
      !IV_INDEX type SYTABIX optional
      !IT_MESSAGE type /PLMB/T_SPI_MSG
    changing
      !CT_MESSAGE type /PLMB/T_SPI_MSG
      !CV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods CONSTRUCTOR .
  methods COPY_ELEMENT_TO_BUFFER_OLD
    importing
      !IV_TYPE type CHAR2
      !IS_MRCP_KEY type /PLMI/S_MRCP_KEY
      !IS_MRCP_OBJECT type ANY .
  methods GET_SEQ_INCREMENT
    importing
      !IV_PROFILE type PROFID_STD
      !IV_TYPE type CHAR2
    exporting
      !EV_INCREMENT type NUMC4
      !ET_MESSAGE type /PLMB/T_SPI_MSG .
  methods GET_SEQ_NUM
    importing
      !IV_PLNNR type PLNNR
      !IV_PLNAL type PLNAL
      !IV_DATUV type DATUV
      !IS_ID type TY_ID
      !IV_GET_LAST type BOOLE_D default 'X'
    exporting
      !EV_SEQ_NUM type NUMC4
      !ES_ITEM type ANY
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods INIT .
  methods MOVE
    importing
      !IV_PLNNR type PLNNR
      !IV_PLNAL type PLNAL
      !IV_DATUV type DATUV
      !IS_ID type TY_ID
      !IS_SIBLING type TY_ID
      !IV_INSERT_BEFORE type BOOLE_D default 'X'
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods READ_MRCP_FROM_DB
    importing
      !IS_MRCP_KEY type /PLMI/S_MRCP_KEY
      !IV_VERID type VERID optional
    raising
      /PLMI/CX_MRCP_BL .
  methods SAVE_INT
    importing
      !IV_AKTYP type AKTYP
    exporting
      !EV_FAILED type /PLMB/SPI_FAILED_IND
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods SHIFT_ITEMS
    importing
      !IV_PLNNR type PLNNR
      !IV_PLNAL type PLNAL
      !IV_DATUV type DATUV
      !IS_ITEM type TY_ID
      !IV_BY type I default 1
      !IV_INCLUDING_FROM type BOOLE_D default 'X'
      !IV_BACKWARDS type BOOLE_D optional
    exporting
      !EV_SHIFTED_FROM type NUMC4
      !ET_MESSAGE type /PLMB/T_SPI_MSG
      !EV_SEVERITY type /PLMB/SPI_MSG_SEVERITY .
  methods SHIFT_SEQUENCE
    importing
      !IV_TYPE type CHAR2
      !IS_FROM type ANY
      !IV_BY type I default 1
      !IV_INCLUDING_FROM type BOOLE_D default 'X'
      !IV_BACKWARDS type BOOLE_D optional
      !IV_PLNNR type PLNNR
      !IV_PLNAL type PLNAL
      !IV_DATUV type DATUV
    exporting
      !ET_MESSAGE type /PLMB/T_SPI_MSG .
  methods WRITE_MRCP
    importing
      !IS_MRCP_BUFFER type TY_MRCP_BUFFER
      !IV_AKTYP type AKTYP
    changing
      !CV_WRITE_WAS_CALLED type BOOLE_D
    raising
      /PLMI/CX_MRCP_BL .
  methods GET_DEFAULT_VALUES_WORKCENTER
    changing
      !CS_PLPOD type PLPOD .
ENDCLASS.



CLASS ZCL_MRCP_UTILITES IMPLEMENTATION.


METHOD ADD_MATERIAL_ASSIGNMENT.

  DATA:
         ls_mat_assignment_mod      TYPE zcl_mrcp_utilites=>ty_mrcp_mat_assign_mod,
         ls_index_failed            TYPE /plmb/s_spi_index_failed,
         lt_message                 TYPE /plmb/t_spi_msg
         .

  FIELD-SYMBOLS:
         <ls_buffer>                TYPE ty_mrcp_buffer,
         <ls_mrcp_mat_assgnmt>      TYPE /plmi/s_mrcp_mat_assignment,
         <ls_mrcp_mat_assgnmt_mod>  TYPE ty_mrcp_mat_assign_mod
         .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_mrcp_mat_assignment, et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Add material assignment to recipe, insert it into buffer
*--------------------------------------------------------------------*

  et_mrcp_mat_assignment = it_mrcp_mat_assignment.

  LOOP AT et_mrcp_mat_assignment ASSIGNING <ls_mrcp_mat_assgnmt>.

    ls_index_failed-index = sy-tabix.

    UNASSIGN: <ls_buffer>, <ls_mrcp_mat_assgnmt_mod>.

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = <ls_mrcp_mat_assgnmt>-plnnr
        iv_plnal = <ls_mrcp_mat_assgnmt>-plnal
        iv_datuv = <ls_mrcp_mat_assgnmt>-datuv
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " If Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      DELETE et_mrcp_mat_assignment INDEX ls_index_failed-index.
      CONTINUE.
    ENDIF.

    " check header existence in the buffer
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = <ls_mrcp_mat_assgnmt>-plnnr
               plnal = <ls_mrcp_mat_assgnmt>-plnal
               datuv = <ls_mrcp_mat_assgnmt>-datuv.

    IF sy-subrc NE 0.
      " superordinate object does not exist in the buffer -> message and continue
      MESSAGE e030(/plmi/al_gss_mrcp) WITH text-002 text-010 <ls_mrcp_mat_assgnmt>-plnnr <ls_mrcp_mat_assgnmt>-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF <ls_buffer>-header-mod_flg EQ me->gc_mod_flag_delete.
      " superordinate object has been marked for deletion -> message and continue
      MESSAGE e026(/plmi/al_gss_mrcp) WITH text-010 INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " check material assignment existence
    READ TABLE <ls_buffer>-mat_assignment ASSIGNING <ls_mrcp_mat_assgnmt_mod>
      WITH KEY  plnnr = <ls_mrcp_mat_assgnmt>-plnnr
                plnal = <ls_mrcp_mat_assgnmt>-plnal
                datuv = <ls_mrcp_mat_assgnmt>-datuv.

    IF <ls_mrcp_mat_assgnmt_mod> IS ASSIGNED. " production version exists

      " Material assignment already exists in recipe &1 &2
      MESSAGE e022(/plmi/al_gss_mrcp) WITH <ls_mrcp_mat_assgnmt>-plnnr <ls_mrcp_mat_assgnmt>-plnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).

      APPEND ls_index_failed TO et_index_failed.
      DELETE et_mrcp_mat_assignment INDEX ls_index_failed-index.
      CONTINUE.

    ELSE. " material assignment doesn't exists in the buffer -> insert

      CLEAR ls_mat_assignment_mod.
      MOVE-CORRESPONDING <ls_mrcp_mat_assgnmt> TO ls_mat_assignment_mod ##ENH_OK.
      ls_mat_assignment_mod-mod_flg = me->gc_mod_flag_insert.
      APPEND ls_mat_assignment_mod TO <ls_buffer>-mat_assignment.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD add_mat_comp_assignment.

  DATA:
    ls_mat_comp_mod  TYPE ty_mrcp_mat_comp_assign_mod,
    ls_index_failed  TYPE /plmb/s_spi_index_failed,
    lt_message       TYPE /plmb/t_spi_msg,
    lt_mrcp_mat_comp TYPE zgl_mrcp_comp_mat_assign_tab
    .

  FIELD-SYMBOLS:
    <ls_buffer>            TYPE ty_mrcp_buffer,
    <ls_mrcp_mat_comp>     TYPE zgl_mrcp_comp_mat_assign,
    <ls_mrcp_mat_comp_mod> TYPE ty_mrcp_mat_comp_assign_mod
    .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR:et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Add material assignment to recipe, insert it into buffer
*--------------------------------------------------------------------*
  lt_mrcp_mat_comp = it_mrcp_mat_assignment.
  LOOP AT lt_mrcp_mat_comp ASSIGNING <ls_mrcp_mat_comp>.

    ls_index_failed-index = sy-tabix.

    UNASSIGN: <ls_buffer>, <ls_mrcp_mat_comp_mod>.

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = <ls_mrcp_mat_comp>-plnnr
        iv_plnal = <ls_mrcp_mat_comp>-plnal
        iv_datuv = <ls_mrcp_mat_comp>-datuv
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " If Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
*      DELETE et_mrcp_mat_assignment INDEX ls_index_failed-index.
      CONTINUE.
    ENDIF.

    " check header existence in the buffer
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = <ls_mrcp_mat_comp>-plnnr
               plnal = <ls_mrcp_mat_comp>-plnal
               datuv = <ls_mrcp_mat_comp>-datuv.

    IF sy-subrc NE 0.
      " superordinate object does not exist in the buffer -> message and continue
      MESSAGE e030(/plmi/al_gss_mrcp) WITH TEXT-002 TEXT-010 <ls_mrcp_mat_comp>-plnnr <ls_mrcp_mat_comp>-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF <ls_buffer>-header-mod_flg EQ me->gc_mod_flag_delete.
      " superordinate object has been marked for deletion -> message and continue
      MESSAGE e026(/plmi/al_gss_mrcp) WITH TEXT-010 INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " check material assignment existence
    READ TABLE <ls_buffer>-mat_comp_assign ASSIGNING <ls_mrcp_mat_comp_mod>
      WITH KEY  plnnr = <ls_mrcp_mat_comp>-plnnr
                plnty = <ls_mrcp_mat_comp>-plnty
                zuonr = <ls_mrcp_mat_comp>-zuonr
                zaehl = <ls_mrcp_mat_comp>-zaehl.
    IF <ls_mrcp_mat_comp_mod> IS ASSIGNED. " production version exists

      " Material assignment already exists in recipe &1 &2
      MESSAGE e022(/plmi/al_gss_mrcp) WITH <ls_mrcp_mat_comp>-plnnr <ls_mrcp_mat_comp>-plnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).

      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.

    ELSE. " material assignment doesn't exists in the buffer -> insert

      CLEAR ls_mat_comp_mod.
      MOVE-CORRESPONDING <ls_mrcp_mat_comp> TO ls_mat_comp_mod ##ENH_OK.
      ls_mat_comp_mod-mod_flg = me->gc_mod_flag_insert.
      APPEND ls_mat_comp_mod TO <ls_buffer>-mat_comp_assign.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD add_operation.

  "  How to use this method
  "
  "  You can insert multiple operations to the existing ones.
  "  By default the new operations are appended to the END OF THE LIST,
  "  but a SIBLING parameter can be set for each insert element that
  "  designates a reference operation. If the SIBLING is set then the new
  "  operation will be inserted BEFORE the sibling. You can also insert
  "  the new element AFTER its SIBLING by setting the IV_INSERT_BEFORE to false.
  "  If the IV_INSERT_BEFORE parameter is set to false and no sibling is set,
  "  then the new elements will be inserted to the BEGINING OF THE LIST.


  DATA:
    ls_id             TYPE ty_id,
    ls_operation_mod  TYPE ty_mrcp_operation_mod,
    ls_index_failed   TYPE /plmb/s_spi_index_failed,
    lt_message        TYPE /plmb/t_spi_msg,
    lv_ref_seq_num    TYPE numc4,
    lv_ref_seq_num_t  TYPE numc4,
    lv_seq_num        TYPE numc4,
    lv_increment      TYPE numc4,
    lv_sibling        TYPE plnkn,
    ls_last_added     TYPE /plmi/s_mrcp_operation,
    ls_mrcp_operation	TYPE /plmi/s_mrcp_operation
    .

  FIELD-SYMBOLS:
    <ls_buffer>         TYPE ty_mrcp_buffer,
    <ls_mrcp_operation> TYPE /plmi/s_mrcp_operation_add
    .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_mrcp_operation, et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Insert new master recipe operation(s) into buffer
*--------------------------------------------------------------------*

  LOOP AT it_mrcp_operation ASSIGNING <ls_mrcp_operation>.

    ls_index_failed-index = sy-tabix.

    " Internal Key has to be set here
    " it is necessary to build up parent-child relationship between operation and its child objects
    " temporary numbering is started from '99999999' in order to avoid conflict with already existing internal keys in the DB
    " temporary keys will be changed to 'real' ones later on by FM master recipe write
    SUBTRACT 1 FROM me->mv_plnkn.

*--------------------------------------------------------------------*
* Initialize buffer with the needed Master Recipe (set <ls_buffer>)
*--------------------------------------------------------------------*

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = <ls_mrcp_operation>-plnnr
        iv_plnal = <ls_mrcp_operation>-plnal
        iv_datuv = <ls_mrcp_operation>-datuv
      IMPORTING
        et_message = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " If Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " Assigning <ls_buffer> with the needed Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = <ls_mrcp_operation>-plnnr
               plnal = <ls_mrcp_operation>-plnal
               datuv = <ls_mrcp_operation>-datuv.

    IF sy-subrc NE 0.
      " superordinate object does not exist in the buffer -> message and continue
      MESSAGE e030(/plmi/al_gss_mrcp) WITH TEXT-002 TEXT-003 <ls_mrcp_operation>-plnnr <ls_mrcp_operation>-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF <ls_buffer>-header-mod_flg EQ me->gc_mod_flag_delete.
      " superordinate object has been marked for deletion -> message and continue
      MESSAGE e026(/plmi/al_gss_mrcp) WITH TEXT-003 INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.


    IF <ls_mrcp_operation>-sibling IS NOT INITIAL.
      lv_sibling = <ls_mrcp_operation>-sibling.
    ELSEIF <ls_mrcp_operation>-plnnr = ls_last_added-plnnr AND
           <ls_mrcp_operation>-plnal = ls_last_added-plnal AND
           <ls_mrcp_operation>-datuv = ls_last_added-datuv.
      lv_sibling = ls_last_added-plnkn.
    ELSE.
      CLEAR lv_sibling.
    ENDIF.

*--------------------------------------------------------------------*
* Get reference sequence number (set lv_ref_seq_num)
*--------------------------------------------------------------------*
    CLEAR ls_id.
    ls_id-type = gs_c_mrcp_subobj_type-operation.
    ls_id-plnkn = lv_sibling.
    me->get_seq_num(
      EXPORTING
        iv_plnnr    = <ls_mrcp_operation>-plnnr
        iv_plnal    = <ls_mrcp_operation>-plnal
        iv_datuv    = <ls_mrcp_operation>-datuv
        is_id       = ls_id
        iv_get_last = iv_insert_before
     IMPORTING
       ev_seq_num   = lv_ref_seq_num
       et_message   = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

*--------------------------------------------------------------------*
* Figuring out the to be sequence number (set lv_seq_num)
*--------------------------------------------------------------------*

    me->get_seq_increment(
      EXPORTING
        iv_profile  = <ls_buffer>-header-profidnetz
        iv_type     = gs_c_mrcp_subobj_type-phase
      IMPORTING
       ev_increment = lv_increment
       et_message   = lt_message
    ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity
    ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF lv_ref_seq_num IS NOT INITIAL.

      " Figouring out the sequence number based on the reference sequence number,
      " the insert direction, and the increment of the sibling numbers

      " Where should we put the new element?
      IF  iv_insert_before EQ abap_true   AND lv_sibling IS NOT INITIAL OR
          iv_insert_before EQ abap_false  AND lv_sibling IS INITIAL.
        " Insert before, sibling is set     -> Before the sibling     -> Before the reference
        " Insert after, sibling is not set  -> Beginging of the list  -> Before the reference
        lv_seq_num = lv_ref_seq_num.

      ELSE.
        " Insert before, sibling is not set   -> End of the list    -> After the reference
        " Insert after, sibling is set        -> After the sibling  -> After the reference

        " If we are inserting an operation after an other, it might happen that the reference
        " allready contains some phases, so in this case we need the last phase of the operation
        " as a reference. In case of no sibling set, get the sequence number of the very last phase,
        " but in this case that might not be higher than the sequence number of the last operation
        " (if it does not belong to the last operation).
        CLEAR ls_id.
        ls_id-type = gs_c_mrcp_subobj_type-phase.
        ls_id-pvzkn = lv_sibling.
        me->get_seq_num(
          EXPORTING
            iv_plnnr      = <ls_mrcp_operation>-plnnr
            iv_plnal      = <ls_mrcp_operation>-plnal
            iv_datuv      = <ls_mrcp_operation>-datuv
            is_id         = ls_id
            iv_get_last   = abap_true
         IMPORTING
           ev_seq_num     = lv_ref_seq_num_t
           et_message     = lt_message
        ).

        me->change_messages(
          EXPORTING
            iv_index    = ls_index_failed-index
            it_message  = lt_message
          CHANGING
            ct_message  = et_message
            cv_severity = ev_severity
        ).

        IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
          APPEND ls_index_failed TO et_index_failed.
          CONTINUE.
        ENDIF.

        " If the operation has any phase assigned to it,
        " or the sequence number of the last phase is bigger
        " then get the temporary sequence number of the as reference
        IF lv_ref_seq_num_t IS NOT INITIAL AND lv_ref_seq_num_t > lv_ref_seq_num.
          lv_ref_seq_num = lv_ref_seq_num_t.
        ENDIF.

        " Shift with the increment
        lv_seq_num = lv_ref_seq_num + lv_increment.

      ENDIF.

    ELSE. " There's no operation yet

      lv_seq_num = lv_increment.

    ENDIF.

    CLEAR ls_mrcp_operation.
    MOVE-CORRESPONDING <ls_mrcp_operation> TO ls_mrcp_operation ##ENH_OK.
    ls_mrcp_operation-plnkn = me->mv_plnkn.
    ls_mrcp_operation-vornr = COND #( WHEN <ls_mrcp_operation>-vornr IS NOT INITIAL
                                      THEN <ls_mrcp_operation>-vornr
                                      ELSE lv_seq_num ).
    ls_mrcp_operation-phflg = space.
    CLEAR ls_operation_mod.
    MOVE-CORRESPONDING ls_mrcp_operation TO ls_operation_mod.
    ls_operation_mod-mod_flg  = me->gc_mod_flag_insert.

*--------------------------------------------------------------------*
* Shift the existing operations and phases in buffer
*--------------------------------------------------------------------*
    IF <ls_mrcp_operation>-vornr IS INITIAL.

      me->shift_sequence(
        EXPORTING
          iv_type   = gs_c_mrcp_subobj_type-operation
          is_from   = ls_operation_mod
          iv_plnnr  = <ls_mrcp_operation>-plnnr
          iv_plnal  = <ls_mrcp_operation>-plnal
          iv_datuv  = <ls_mrcp_operation>-datuv
        IMPORTING
          et_message = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity
      ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

    ENDIF.
*--------------------------------------------------------------------*
* Insert Operation
*--------------------------------------------------------------------*
    APPEND ls_operation_mod TO <ls_buffer>-operation.
    APPEND ls_mrcp_operation TO et_mrcp_operation.
    ls_last_added = ls_mrcp_operation.

  ENDLOOP.

ENDMETHOD.


METHOD add_phase.

  DATA:
    ls_id           TYPE ty_id,
    ls_phase_mod    TYPE ty_mrcp_phase_mod,
    ls_index_failed TYPE /plmb/s_spi_index_failed,
    lt_message      TYPE /plmb/t_spi_msg,
    lv_ref_seq_num  TYPE numc4,
    lv_seq_num      TYPE numc4,
    lv_increment    TYPE numc4,
    lv_sibling      TYPE plnkn,
    ls_plpod        TYPE plpod,                             "2633669
    ls_last_added   TYPE /plmi/s_mrcp_phase,
    ls_mrcp_phase   TYPE /plmi/s_mrcp_phase
    .

  FIELD-SYMBOLS:
    <ls_buffer>             TYPE ty_mrcp_buffer,
    <ls_mrcp_phase>         TYPE /plmi/s_mrcp_phase_add,
    <ls_mrcp_operation_mod> TYPE ty_mrcp_operation_mod
    .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_mrcp_phase, et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Insert new master recipe phase(s) into buffer
*--------------------------------------------------------------------*

  LOOP AT it_mrcp_phase ASSIGNING <ls_mrcp_phase>.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_mrcp_operation_mod>.

    " internal key has to be set here
    " it is necessary to build up parent-child relationship between phase and its child objects
    " temporary numbering is started from '99999999' in order to avoid conflict with already existing internal keys in the DB
    " temporary keys will be changed to 'real' ones later on by FM master recipe write
    SUBTRACT 1 FROM me->mv_plnkn.

*--------------------------------------------------------------------*
* Initialize buffer with the needed Master Recipe (set <ls_buffer>)
*--------------------------------------------------------------------*

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = <ls_mrcp_phase>-plnnr
        iv_plnal = <ls_mrcp_phase>-plnal
        iv_datuv = <ls_mrcp_phase>-datuv
      IMPORTING
       et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " If Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " Assigning <ls_buffer> with the needed Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH TABLE KEY plnnr = <ls_mrcp_phase>-plnnr
                     plnal = <ls_mrcp_phase>-plnal
                     datuv = <ls_mrcp_phase>-datuv.


*--------------------------------------------------------------------*
* Get superordinate operation (set <ls_mrcp_operation_mod>)
*--------------------------------------------------------------------*
    READ TABLE <ls_buffer>-operation ASSIGNING <ls_mrcp_operation_mod>
      WITH KEY  plnnr = <ls_mrcp_phase>-plnnr
                plnal = <ls_mrcp_phase>-plnal
                plnkn = <ls_mrcp_phase>-pvzkn
                .

    IF sy-subrc NE 0.
      " superordinate operation does not exist in the buffer -> message and continue
      MESSAGE e030(/plmi/al_gss_mrcp) WITH TEXT-003 TEXT-004 <ls_mrcp_phase>-plnnr <ls_mrcp_phase>-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF <ls_mrcp_operation_mod>-mod_flg EQ me->gc_mod_flag_delete.
      " superordinate object has been marked for deletion -> message and continue
      MESSAGE e026(/plmi/al_gss_mrcp) WITH TEXT-004 INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF <ls_mrcp_phase>-sibling IS NOT INITIAL.
      lv_sibling = <ls_mrcp_phase>-sibling.
    ELSEIF <ls_mrcp_phase>-plnnr = ls_last_added-plnnr AND
           <ls_mrcp_phase>-plnal = ls_last_added-plnal AND
           <ls_mrcp_phase>-datuv = ls_last_added-datuv AND
           <ls_mrcp_phase>-pvzkn = ls_last_added-pvzkn.
      lv_sibling = ls_last_added-plnkn.
    ELSE.
      CLEAR lv_sibling.
    ENDIF.

*--------------------------------------------------------------------*
* Get reference sequence number (set lv_ref_seq_num)
*--------------------------------------------------------------------*
    CLEAR ls_id.
    ls_id-type = gs_c_mrcp_subobj_type-phase.
    ls_id-plnkn = lv_sibling.
    ls_id-pvzkn = <ls_mrcp_phase>-pvzkn.
    me->get_seq_num(
      EXPORTING
        iv_plnnr      = <ls_mrcp_phase>-plnnr
        iv_plnal      = <ls_mrcp_phase>-plnal
        iv_datuv      = <ls_mrcp_phase>-datuv
        is_id         = ls_id
        iv_get_last   = iv_insert_before
      IMPORTING
        ev_seq_num    = lv_ref_seq_num
        et_message    = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

*--------------------------------------------------------------------*
* Figuring out the to be sequence number (set lv_seq_num)
*--------------------------------------------------------------------*

    me->get_seq_increment(
      EXPORTING
        iv_profile  = <ls_buffer>-header-profidnetz
        iv_type     = gs_c_mrcp_subobj_type-phase
      IMPORTING
       ev_increment = lv_increment
       et_message   = lt_message
    ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity
    ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF lv_ref_seq_num IS NOT INITIAL.

      " Figouring out the sequence number based on the reference sequence number,
      " the insert direction, and the increment of the sibling numbers

      " Where should we put the new element?
      IF  iv_insert_before EQ abap_true   AND lv_sibling IS NOT INITIAL OR
          iv_insert_before EQ abap_false  AND lv_sibling IS INITIAL.
        " Insert before, sibling is set     -> Before the sibling     -> Before the reference
        " Insert after, sibling is not set  -> Beginging of the list  -> Before the reference
        lv_seq_num = lv_ref_seq_num.

      ELSE.
        " Insert before, sibling is not set   -> End of the list    -> After the reference
        " Insert after, sibling is set        -> After the sibling  -> After the reference
        lv_seq_num = lv_ref_seq_num + lv_increment.

      ENDIF.

    ELSE. " There's no phase assigned to the operation yet

      " It shall be the first phase of the operation
      lv_seq_num = <ls_mrcp_operation_mod>-vornr + lv_increment.

    ENDIF.

    CLEAR ls_mrcp_phase.
    MOVE-CORRESPONDING <ls_mrcp_phase> TO ls_mrcp_phase ##ENH_OK.
* note 2633669
    MOVE-CORRESPONDING ls_mrcp_phase TO ls_plpod ##ENH_OK.
    ls_plpod-arbid = <ls_mrcp_operation_mod>-arbid.
    me->get_default_values_workcenter(
      CHANGING
        cs_plpod = ls_plpod
    ).
    MOVE-CORRESPONDING ls_plpod TO ls_mrcp_phase ##ENH_OK.
* note 2633669
    ls_mrcp_phase-plnkn    = me->mv_plnkn.
    ls_mrcp_phase-vornr    =  COND #( WHEN <ls_mrcp_phase>-vornr IS NOT INITIAL
                                      THEN <ls_mrcp_phase>-vornr
                                      ELSE lv_seq_num ).
    ls_mrcp_phase-phflg    = 'X'.
    CLEAR ls_phase_mod.
    MOVE-CORRESPONDING ls_mrcp_phase TO ls_phase_mod.
    ls_phase_mod-mod_flg  = me->gc_mod_flag_insert.

*--------------------------------------------------------------------*
* Shift the existing operations and phases in buffer
*--------------------------------------------------------------------*
    IF <ls_mrcp_phase>-vornr IS INITIAL.

      me->shift_sequence(
        EXPORTING
          iv_type  = gs_c_mrcp_subobj_type-operation
          is_from  = ls_phase_mod
          iv_plnnr = <ls_mrcp_phase>-plnnr
          iv_plnal = <ls_mrcp_phase>-plnal
          iv_datuv = <ls_mrcp_phase>-datuv
        IMPORTING
          et_message = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity
      ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

    ENDIF.

*--------------------------------------------------------------------*
* Insert Phase
*--------------------------------------------------------------------*
    APPEND ls_phase_mod TO <ls_buffer>-phase.
    APPEND ls_mrcp_phase TO et_mrcp_phase.
    ls_last_added = ls_mrcp_phase.

  ENDLOOP.

ENDMETHOD.


METHOD ADD_PI.

  DATA:
         ls_id               TYPE ty_id,
         ls_pi_mod           TYPE ty_mrcp_pi_mod,
         ls_index_failed     TYPE /plmb/s_spi_index_failed,
         lt_message          TYPE /plmb/t_spi_msg,
         lv_ref_seq_num      TYPE numc4,
         lv_seq_num          TYPE numc4,
         lv_increment        TYPE numc4,
         lv_sibling          TYPE plnft,
         ls_last_added       TYPE /plmi/s_mrcp_pi,
         ls_mrcp_pi	         TYPE /plmi/s_mrcp_pi
         .

  FIELD-SYMBOLS:
        <ls_buffer>         TYPE ty_mrcp_buffer,
        <ls_mrcp_pi>        TYPE /plmi/s_mrcp_pi_add,
        <ls_mrcp_phase_mod> TYPE ty_mrcp_phase_mod
         .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_mrcp_pi, et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Insert new process instruction(s) into buffer
*--------------------------------------------------------------------*

  LOOP AT it_mrcp_pi ASSIGNING <ls_mrcp_pi>.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_mrcp_phase_mod>.

    " internal key has to be set here
    " it is necessary to build up parent-child relationship between process instruction and its child objects
    " temporary numbering is started from '99999999' in order to avoid conflict with already existing internal keys in the DB
    " temporary keys will be changed to 'real' ones later on by FM master recipe write
    SUBTRACT 1 FROM me->mv_plnft.

*--------------------------------------------------------------------*
* Initialize buffer with the needed Master Recipe (set <ls_buffer>)
*--------------------------------------------------------------------*

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = <ls_mrcp_pi>-plnnr
        iv_plnal = <ls_mrcp_pi>-plnal
        iv_datuv = <ls_mrcp_pi>-datuv
      IMPORTING
       et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " If Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " Assigning <ls_buffer> with the needed Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH TABLE KEY plnnr = <ls_mrcp_pi>-plnnr
                     plnal = <ls_mrcp_pi>-plnal
                     datuv = <ls_mrcp_pi>-datuv.


*--------------------------------------------------------------------*
* Get superordinate Process Instruction (set <ls_mrcp_phase_mod>)
*--------------------------------------------------------------------*

    " parent object (phase) must exists
    " check phase existence
    READ TABLE <ls_buffer>-phase ASSIGNING <ls_mrcp_phase_mod>
      WITH KEY  plnnr = <ls_mrcp_pi>-plnnr
                plnal = <ls_mrcp_pi>-plnal
                plnkn = <ls_mrcp_pi>-plnkn
                .

    IF sy-subrc NE 0.
      " superordinate object does not exist in the buffer -> message and continue
      MESSAGE e030(/plmi/al_gss_mrcp) WITH text-004 text-005 <ls_mrcp_pi>-plnnr <ls_mrcp_pi>-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF <ls_mrcp_phase_mod>-mod_flg EQ me->gc_mod_flag_delete.
      " superordinate object has been marked for deletion -> message and continue
      MESSAGE e026(/plmi/al_gss_mrcp) WITH text-005 INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.


    IF <ls_mrcp_pi>-sibling IS NOT INITIAL.
      lv_sibling = <ls_mrcp_pi>-sibling.
    ELSEIF <ls_mrcp_pi>-plnnr = ls_last_added-plnnr AND
           <ls_mrcp_pi>-plnal = ls_last_added-plnal AND
           <ls_mrcp_pi>-datuv = ls_last_added-datuv AND
           <ls_mrcp_pi>-plnkn = ls_last_added-plnkn.
      lv_sibling = ls_last_added-plnft.
    ELSE.
      CLEAR lv_sibling.
    ENDIF.

*--------------------------------------------------------------------*
* Get reference sequence number (set lv_ref_seq_num)
*--------------------------------------------------------------------*
    CLEAR ls_id.
    ls_id-type  = gs_c_mrcp_subobj_type-pi.
    ls_id-plnft = lv_sibling.
    ls_id-plnkn = <ls_mrcp_pi>-plnkn.
    me->get_seq_num(
      EXPORTING
        iv_plnnr     = <ls_mrcp_pi>-plnnr
        iv_plnal     = <ls_mrcp_pi>-plnal
        iv_datuv     = <ls_mrcp_pi>-datuv
        is_id        = ls_id
        iv_get_last  = iv_insert_before
      IMPORTING
        ev_seq_num   = lv_ref_seq_num
        et_message   = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

*--------------------------------------------------------------------*
* Figuring out the to be sequence number (set lv_seq_num)
*--------------------------------------------------------------------*
    me->get_seq_increment(
      EXPORTING
        iv_profile  = <ls_buffer>-header-profidnetz
        iv_type     = gs_c_mrcp_subobj_type-pi
      IMPORTING
       ev_increment = lv_increment
       et_message   = lt_message
    ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity
    ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF lv_ref_seq_num IS NOT INITIAL.

      " Figouring out the sequence number based on the reference sequence number,
      " the insert direction, and the increment of the sibling numbers

      " Where should we put the new element?
      IF  iv_insert_before EQ abap_true   AND lv_sibling IS NOT INITIAL OR
          iv_insert_before EQ abap_false  AND lv_sibling IS INITIAL.
        " Insert before, sibling is set     -> Before the sibling     -> Before the reference
        " Insert after, sibling is not set  -> Beginging of the list  -> Before the reference
        lv_seq_num = lv_ref_seq_num.

      ELSE.
        " Insert before, sibling is not set   -> End of the list    -> After the reference
        " Insert after, sibling is set        -> After the sibling  -> After the reference
        lv_seq_num = lv_ref_seq_num + lv_increment.

      ENDIF.

    ELSE.

      lv_seq_num = lv_increment.

    ENDIF.

    CLEAR ls_mrcp_pi.
    MOVE-CORRESPONDING <ls_mrcp_pi> TO ls_mrcp_pi ##ENH_OK.
    ls_mrcp_pi-plnft = me->mv_plnft.
    ls_mrcp_pi-ftrnr = lv_seq_num.
    CLEAR ls_pi_mod.
    MOVE-CORRESPONDING ls_mrcp_pi TO ls_pi_mod.
    ls_pi_mod-mod_flg = me->gc_mod_flag_insert.

*--------------------------------------------------------------------*
* Shift the existing operations and phases in buffer
*--------------------------------------------------------------------*
    me->shift_sequence(
      EXPORTING
        iv_type  = gs_c_mrcp_subobj_type-pi
        is_from  = ls_pi_mod
        iv_plnnr = <ls_mrcp_pi>-plnnr
        iv_plnal = <ls_mrcp_pi>-plnal
        iv_datuv = <ls_mrcp_pi>-datuv
      IMPORTING
        et_message = lt_message
    ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity
    ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

*--------------------------------------------------------------------*
* Insert Process Instruction
*--------------------------------------------------------------------*
    APPEND ls_pi_mod TO <ls_buffer>-pi.
    APPEND ls_mrcp_pi TO et_mrcp_pi.
    ls_last_added = ls_mrcp_pi.

  ENDLOOP.

ENDMETHOD.


METHOD ADD_PI_CHAR_VAL.

  DATA:
         ls_id               TYPE ty_id,
         ls_pi_char_val_mod  TYPE ty_mrcp_pi_char_val_mod,
         ls_index_failed     TYPE /plmb/s_spi_index_failed,
         lt_message          TYPE /plmb/t_spi_msg,
         lv_ref_seq_num      TYPE numc4,
         lv_seq_num          TYPE numc4,
         lv_increment        TYPE numc4,
         lv_sibling          TYPE plnfv,
         ls_last_added       TYPE /plmi/s_mrcp_pi_char_val,
         ls_mrcp_pi_char_val TYPE /plmi/s_mrcp_pi_char_val
         .

  FIELD-SYMBOLS:
        <ls_buffer>           TYPE ty_mrcp_buffer,
        <ls_mrcp_pi_char_val> TYPE /plmi/s_mrcp_pi_char_val_add,
        <ls_mrcp_pi_mod>      TYPE ty_mrcp_pi_mod
         .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_mrcp_pi_char_val, et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Insert new process instruction(s) into buffer
*--------------------------------------------------------------------*

  LOOP AT it_mrcp_pi_char_val ASSIGNING <ls_mrcp_pi_char_val>.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_mrcp_pi_mod>.

    " it would not be necessary to set internal key MKMZL here, because process instruction characteristic value has no child objects
    " (it is used for building up parent-child relationship)
    " internal key is set here because of the consistency and for future use
    " temporary numbering is started from '99999999' in order to avoid conflict with already existing internal keys in the DB
    " temporary keys will be changed to 'real' ones later on by FM master recipe write
    SUBTRACT 1 FROM me->mv_mkmzl.

*--------------------------------------------------------------------*
* Initialize buffer with the needed Master Recipe (set <ls_buffer>)
*--------------------------------------------------------------------*

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = <ls_mrcp_pi_char_val>-plnnr
        iv_plnal = <ls_mrcp_pi_char_val>-plnal
        iv_datuv = <ls_mrcp_pi_char_val>-datuv
      IMPORTING
       et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " If Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " Assigning <ls_buffer> with the needed Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH TABLE KEY plnnr = <ls_mrcp_pi_char_val>-plnnr
                     plnal = <ls_mrcp_pi_char_val>-plnal
                     datuv = <ls_mrcp_pi_char_val>-datuv.

*--------------------------------------------------------------------*
* Get superordinate Process Instruction Characteristics (set <ls_mrcp_pi_mod>)
*--------------------------------------------------------------------*
    " check process instruction existence
    READ TABLE <ls_buffer>-pi ASSIGNING <ls_mrcp_pi_mod>
      WITH KEY plnnr = <ls_mrcp_pi_char_val>-plnnr
               plnal = <ls_mrcp_pi_char_val>-plnal
               plnkn = <ls_mrcp_pi_char_val>-plnkn
               plnft = <ls_mrcp_pi_char_val>-plnft
               .

    IF sy-subrc NE 0.
      " superordinate object does not exist in the buffer -> message and continue
      MESSAGE e030(/plmi/al_gss_mrcp) WITH text-005 text-006 <ls_mrcp_pi_char_val>-plnnr <ls_mrcp_pi_char_val>-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF <ls_mrcp_pi_mod>-mod_flg EQ me->gc_mod_flag_delete.
      " superordinate object has been marked for deletion -> message and continue
      MESSAGE e026(/plmi/al_gss_mrcp) WITH text-006 INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF <ls_mrcp_pi_char_val>-sibling IS NOT INITIAL.
      lv_sibling = <ls_mrcp_pi_char_val>-sibling.
    ELSEIF <ls_mrcp_pi_char_val>-plnnr = ls_last_added-plnnr AND
           <ls_mrcp_pi_char_val>-plnal = ls_last_added-plnal AND
           <ls_mrcp_pi_char_val>-datuv = ls_last_added-datuv AND
           <ls_mrcp_pi_char_val>-plnkn = ls_last_added-plnkn AND
           <ls_mrcp_pi_char_val>-plnft = ls_last_added-plnft.
      lv_sibling = ls_last_added-mkmzl.
    ELSE.
      CLEAR lv_sibling.
    ENDIF.

*--------------------------------------------------------------------*
* Get reference sequence number (set lv_ref_seq_num)
*--------------------------------------------------------------------*
    CLEAR ls_id.
    ls_id-type  = gs_c_mrcp_subobj_type-pi_cv.
    ls_id-mkmzl = lv_sibling.
    ls_id-plnft = <ls_mrcp_pi_char_val>-plnft.
    ls_id-plnkn = <ls_mrcp_pi_char_val>-plnkn.
    me->get_seq_num(
      EXPORTING
        iv_plnnr     = <ls_mrcp_pi_char_val>-plnnr
        iv_plnal     = <ls_mrcp_pi_char_val>-plnal
        iv_datuv     = <ls_mrcp_pi_char_val>-datuv
        is_id        = ls_id
        iv_get_last  = iv_insert_before
      IMPORTING
        ev_seq_num   = lv_ref_seq_num
        et_message   = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

*--------------------------------------------------------------------*
* Figuring out the to be sequence number (set lv_seq_num)
*--------------------------------------------------------------------*
    me->get_seq_increment(
      EXPORTING
        iv_profile  = <ls_buffer>-header-profidnetz
        iv_type     = gs_c_mrcp_subobj_type-pi_cv
      IMPORTING
       ev_increment = lv_increment
       et_message   = lt_message
    ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity
    ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF lv_ref_seq_num IS NOT INITIAL.

      " Figouring out the sequence number based on the reference sequence number,
      " the insert direction, and the increment of the sibling numbers

      " Where should we put the new element?
      IF  iv_insert_before EQ abap_true   AND lv_sibling IS NOT INITIAL OR
          iv_insert_before EQ abap_false  AND lv_sibling IS INITIAL.
        " Insert before, sibling is set     -> Before the sibling     -> Before the reference
        " Insert after, sibling is not set  -> Beginging of the list  -> Before the reference
        lv_seq_num = lv_ref_seq_num.

      ELSE.
        " Insert before, sibling is not set   -> End of the list    -> After the reference
        " Insert after, sibling is set        -> After the sibling  -> After the reference
        lv_seq_num = lv_ref_seq_num + lv_increment.

      ENDIF.

    ELSE.

      lv_seq_num = lv_increment.

    ENDIF.

    CLEAR ls_mrcp_pi_char_val.
    MOVE-CORRESPONDING <ls_mrcp_pi_char_val> TO ls_mrcp_pi_char_val ##ENH_OK.
    ls_mrcp_pi_char_val-mkmzl = me->mv_mkmzl.
    ls_mrcp_pi_char_val-fvlnr = lv_seq_num.
    CLEAR ls_pi_char_val_mod.
    MOVE-CORRESPONDING ls_mrcp_pi_char_val TO ls_pi_char_val_mod.
    ls_pi_char_val_mod-mod_flg  = me->gc_mod_flag_insert.

*--------------------------------------------------------------------*
* Shift the existing operations and phases in buffer
*--------------------------------------------------------------------*
    me->shift_sequence(
      EXPORTING
        iv_type  = gs_c_mrcp_subobj_type-pi_cv
        is_from  = ls_pi_char_val_mod
        iv_plnnr = <ls_mrcp_pi_char_val>-plnnr
        iv_plnal = <ls_mrcp_pi_char_val>-plnal
        iv_datuv = <ls_mrcp_pi_char_val>-datuv
      IMPORTING
        et_message = lt_message
    ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity
    ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

*--------------------------------------------------------------------*
* Insert Process Instruction
*--------------------------------------------------------------------*
    APPEND ls_pi_char_val_mod TO <ls_buffer>-pi_char_val.
    APPEND ls_mrcp_pi_char_val TO et_mrcp_pi_char_val.
    ls_last_added = ls_mrcp_pi_char_val.

  ENDLOOP.

ENDMETHOD.


METHOD ADD_PRODVER.

  DATA:
         lt_mrcp_prodver        TYPE /plmi/t_mrcp_prodver,
         ls_prodver_mod         TYPE ty_mrcp_prodver_mod,
         ls_index_failed        TYPE /plmb/s_spi_index_failed,
         lt_message             TYPE /plmb/t_spi_msg,
         lv_lines               TYPE int4 VALUE 0
         .

  FIELD-SYMBOLS:
         <ls_buffer>            TYPE ty_mrcp_buffer,
         <ls_mrcp_prodver>      TYPE /plmi/s_mrcp_prodver,
         <ls_mrcp_prodver_add>  TYPE /plmi/s_mrcp_prodver_add,
         <ls_mrcp_prodver_mod>  TYPE ty_mrcp_prodver_mod
         .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Set new production version for the recipe, insert it into buffer
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_prodver ASSIGNING <ls_mrcp_prodver_add>.
    APPEND INITIAL LINE TO lt_mrcp_prodver ASSIGNING <ls_mrcp_prodver>.
    MOVE-CORRESPONDING <ls_mrcp_prodver_add> TO <ls_mrcp_prodver> ##ENH_OK.
  ENDLOOP.

  LOOP AT lt_mrcp_prodver ASSIGNING <ls_mrcp_prodver>.

    ls_index_failed-index = sy-tabix.

*   check if lt_mrcp_prodver contains at most one row for each recipe
    LOOP AT lt_mrcp_prodver TRANSPORTING NO FIELDS
      WHERE plnnr = <ls_mrcp_prodver>-plnnr
        AND alnal = <ls_mrcp_prodver>-alnal
        AND datuv = <ls_mrcp_prodver>-datuv.
      ADD 1 TO lv_lines.
      IF lv_lines GT 1.
        EXIT.
      ENDIF.
    ENDLOOP.
    IF lv_lines GT 1.
      " Multiple production versions cannot be assigned to the same recipe
      MESSAGE e024(/plmi/al_gss_mrcp) INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity ).

      APPEND ls_index_failed TO et_index_failed.
      DELETE lt_mrcp_prodver INDEX ls_index_failed-index.
      CONTINUE.
    ENDIF.

    UNASSIGN: <ls_buffer>, <ls_mrcp_prodver_mod>.

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = <ls_mrcp_prodver>-plnnr
        iv_plnal = <ls_mrcp_prodver>-alnal
        iv_datuv = <ls_mrcp_prodver>-datuv
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " If Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      DELETE lt_mrcp_prodver INDEX ls_index_failed-index.
      CONTINUE.
    ENDIF.

    " check header existence in the buffer
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH TABLE KEY plnnr = <ls_mrcp_prodver>-plnnr
                     plnal = <ls_mrcp_prodver>-alnal
                     datuv = <ls_mrcp_prodver>-datuv.

    IF sy-subrc NE 0.
      " superordinate object does not exist in the buffer -> message and continue
      MESSAGE e030(/plmi/al_gss_mrcp) WITH text-002 text-009 <ls_mrcp_prodver>-plnnr <ls_mrcp_prodver>-alnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF <ls_buffer>-header-mod_flg EQ me->gc_mod_flag_delete.
      " superordinate object has been marked for deletion -> message and continue
      MESSAGE e026(/plmi/al_gss_mrcp) WITH text-009 INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " check production version existence
    READ TABLE <ls_buffer>-prodver ASSIGNING <ls_mrcp_prodver_mod>
      WITH KEY  plnnr = <ls_mrcp_prodver>-plnnr
                alnal = <ls_mrcp_prodver>-alnal
                datuv = <ls_mrcp_prodver>-datuv.

    IF <ls_mrcp_prodver_mod> IS ASSIGNED. " production version exists

      " Production version already exists in recipe &1 &2
      MESSAGE e023(/plmi/al_gss_mrcp) WITH <ls_mrcp_prodver>-plnnr <ls_mrcp_prodver>-alnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).

      APPEND ls_index_failed TO et_index_failed.
      DELETE lt_mrcp_prodver INDEX ls_index_failed-index.
      CONTINUE.

    ELSE. " production version doesn't exists in the buffer -> insert

      CLEAR ls_prodver_mod.
      MOVE-CORRESPONDING <ls_mrcp_prodver> TO ls_prodver_mod.
      ls_prodver_mod-mod_flg = me->gc_mod_flag_insert.
      APPEND ls_prodver_mod TO <ls_buffer>-prodver.

    ENDIF.

  ENDLOOP.

  et_mrcp_prodver = lt_mrcp_prodver.

ENDMETHOD.


METHOD ADD_RESOURCE.

  DATA:
          ls_id                   TYPE ty_id,
          ls_resource_mod         TYPE ty_mrcp_resource_mod,
          ls_index_failed         TYPE /plmb/s_spi_index_failed,
          lt_message              TYPE /plmb/t_spi_msg,
          lv_ref_seq_num          TYPE numc4,
          lv_seq_num              TYPE numc4,
          lv_increment            TYPE numc4,
          lv_sibling              TYPE plnkn,
          ls_plpod                TYPE plpod,                  "2633669
          ls_last_added           TYPE /plmi/s_mrcp_resource,
          ls_mrcp_resource        TYPE /plmi/s_mrcp_resource,
          lv_sumnr                TYPE sumkntnr,
          lv_mod_flg              TYPE /plmi/gss_mr_mod_flg
          .

  FIELD-SYMBOLS:
          <ls_buffer>             TYPE ty_mrcp_buffer,
          <ls_mrcp_resource>      TYPE /plmi/s_mrcp_resource_add,
          <ls_mrcp_operation_mod> TYPE ty_mrcp_operation_mod,
          <ls_mrcp_phase_mod>     TYPE ty_mrcp_phase_mod
          .

*  It's not necessary to set internal key PLNKN in this method,
*  because primary and secondary resource have no child objects

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_mrcp_resource, et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Insert new secondary resource(s) into buffer
*--------------------------------------------------------------------*

  LOOP AT it_mrcp_resource ASSIGNING <ls_mrcp_resource>.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_mrcp_operation_mod>, <ls_mrcp_phase_mod>.
    CLEAR: lv_sumnr, lv_mod_flg.

    " it would not be necessary to set internal key PLNKN here, because secondary resource has no child objects
    " (it is used for building up parent-child relationship)
    " internal key is set here because of the consistency and for future use
    " temporary numbering is started from '99999999' in order to avoid conflict with already existing internal keys in the DB
    " temporary keys will be changed to 'real' ones later on by FM master recipe write
    SUBTRACT 1 FROM me->mv_plnkn.

*--------------------------------------------------------------------*
* Initialize buffer with the needed Master Recipe (set <ls_buffer>)
*--------------------------------------------------------------------*

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = <ls_mrcp_resource>-plnnr
        iv_plnal = <ls_mrcp_resource>-plnal
        iv_datuv = <ls_mrcp_resource>-datuv
      IMPORTING
       et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " If Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " Assigning <ls_buffer> with the needed Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH TABLE KEY plnnr = <ls_mrcp_resource>-plnnr
                     plnal = <ls_mrcp_resource>-plnal
                     datuv = <ls_mrcp_resource>-datuv.

*--------------------------------------------------------------------*
* Get superordinate Process Instruction (set <ls_mrcp_phase_mod>)
*--------------------------------------------------------------------*

    " check operation existence
    READ TABLE <ls_buffer>-operation ASSIGNING <ls_mrcp_operation_mod>
      WITH KEY  plnnr = <ls_mrcp_resource>-plnnr
                plnal = <ls_mrcp_resource>-plnal
                plnkn = <ls_mrcp_resource>-sumnr.

    IF <ls_mrcp_operation_mod> IS ASSIGNED.
      lv_sumnr    = <ls_mrcp_operation_mod>-plnkn.
      lv_mod_flg  = <ls_mrcp_operation_mod>-mod_flg.
    ENDIF.

    " check phase existence
    READ TABLE <ls_buffer>-phase ASSIGNING <ls_mrcp_phase_mod>
      WITH KEY  plnnr = <ls_mrcp_resource>-plnnr
                plnal = <ls_mrcp_resource>-plnal
                plnkn = <ls_mrcp_resource>-sumnr.

    IF <ls_mrcp_phase_mod> IS ASSIGNED.
      lv_sumnr    = <ls_mrcp_phase_mod>-plnkn.
      lv_mod_flg  = <ls_mrcp_phase_mod>-mod_flg.
    ENDIF.

    IF lv_sumnr IS INITIAL. " parent object does not exists
      " superordinate object does not exist in the buffer -> message and continue
      DATA lv_msgparam1 TYPE string.
      CONCATENATE text-003 '/' text-004 INTO lv_msgparam1.
      MESSAGE e030(/plmi/al_gss_mrcp) WITH lv_msgparam1 text-007 <ls_mrcp_resource>-plnnr <ls_mrcp_resource>-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF lv_mod_flg EQ me->gc_mod_flag_delete.
      " superordinate object has been marked for deletion -> message and continue
      MESSAGE e026(/plmi/al_gss_mrcp) WITH text-007 INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.


    IF <ls_mrcp_resource>-sibling IS NOT INITIAL.
      lv_sibling = <ls_mrcp_resource>-sibling.
    ELSEIF <ls_mrcp_resource>-plnnr = ls_last_added-plnnr AND
           <ls_mrcp_resource>-plnal = ls_last_added-plnal AND
           <ls_mrcp_resource>-datuv = ls_last_added-datuv AND
           <ls_mrcp_resource>-sumnr = ls_last_added-sumnr.
      lv_sibling = ls_last_added-plnkn.
    ELSE.
      CLEAR lv_sibling.
    ENDIF.

*--------------------------------------------------------------------*
* Get reference sequence number (set lv_ref_seq_num)
*--------------------------------------------------------------------*
    CLEAR ls_id.
    ls_id-type  = gs_c_mrcp_subobj_type-resource.
    ls_id-plnkn = lv_sibling.
    ls_id-sumnr = <ls_mrcp_resource>-sumnr.
    me->get_seq_num(
      EXPORTING
        iv_plnnr      = <ls_mrcp_resource>-plnnr
        iv_plnal      = <ls_mrcp_resource>-plnal
        iv_datuv      = <ls_mrcp_resource>-datuv
        is_id         = ls_id
        iv_get_last   = iv_insert_before
      IMPORTING
        ev_seq_num    = lv_ref_seq_num
        et_message    = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

*--------------------------------------------------------------------*
* Figuring out the to be sequence number (set lv_seq_num)
*--------------------------------------------------------------------*
    me->get_seq_increment(
      EXPORTING
        iv_profile  = <ls_buffer>-header-profidnetz
        iv_type     = gs_c_mrcp_subobj_type-resource
      IMPORTING
       ev_increment = lv_increment
       et_message   = lt_message
    ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity
    ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    IF lv_ref_seq_num IS NOT INITIAL.

      " Figouring out the sequence number based on the reference sequence number,
      " the insert direction, and the increment of the sibling numbers

      " Where should we put the new element?
      IF  iv_insert_before EQ abap_true   AND lv_sibling IS NOT INITIAL OR
          iv_insert_before EQ abap_false  AND lv_sibling IS INITIAL.
        " Insert before, sibling is set     -> Before the sibling     -> Before the reference
        " Insert after, sibling is not set  -> Beginging of the list  -> Before the reference
        lv_seq_num = lv_ref_seq_num.

      ELSE.
        " Insert before, sibling is not set   -> End of the list    -> After the reference
        " Insert after, sibling is set        -> After the sibling  -> After the reference
        lv_seq_num = lv_ref_seq_num + lv_increment.

      ENDIF.

    ELSE.

      lv_seq_num = lv_increment.

    ENDIF.

    CLEAR ls_mrcp_resource.
    MOVE-CORRESPONDING <ls_mrcp_resource> TO ls_mrcp_resource ##ENH_OK.
* note 2633669
    IF ls_mrcp_resource-arbid IS NOT INITIAL.
      MOVE-CORRESPONDING ls_mrcp_resource TO ls_plpod ##ENH_OK.
      me->get_default_values_workcenter(
        CHANGING
          cs_plpod = ls_plpod
      ).
      MOVE-CORRESPONDING ls_plpod TO ls_mrcp_resource ##ENH_OK.
    ENDIF.
* note 2633669
    ls_mrcp_resource-plnkn = me->mv_plnkn.
    ls_mrcp_resource-sumnr = lv_sumnr.
    ls_mrcp_resource-vornr = lv_seq_num.
    CLEAR ls_resource_mod.
    MOVE-CORRESPONDING ls_mrcp_resource TO ls_resource_mod.
    ls_resource_mod-mod_flg = me->gc_mod_flag_insert.

*--------------------------------------------------------------------*
* Shift the existing operations and phases in buffer
*--------------------------------------------------------------------*
    me->shift_sequence(
      EXPORTING
        iv_type   = gs_c_mrcp_subobj_type-resource
        is_from   = ls_resource_mod
        iv_plnnr  = <ls_mrcp_resource>-plnnr
        iv_plnal  = <ls_mrcp_resource>-plnal
        iv_datuv  = <ls_mrcp_resource>-datuv
      IMPORTING
        et_message = lt_message
    ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity
    ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

*--------------------------------------------------------------------*
* Insert Secondary Resource
*--------------------------------------------------------------------*
    APPEND ls_resource_mod TO <ls_buffer>-resource.
    APPEND ls_mrcp_resource TO et_mrcp_resource.
    ls_last_added = ls_mrcp_resource.

  ENDLOOP.

ENDMETHOD.


METHOD ADD_RSC.

  DATA:
         ls_rsc_mod             TYPE ty_mrcp_rsc_mod,
         ls_index_failed        TYPE /plmb/s_spi_index_failed,
         lt_message             TYPE /plmb/t_spi_msg
         .

  FIELD-SYMBOLS:
        <ls_buffer>             TYPE ty_mrcp_buffer,
        <ls_mrcp_rsc>           TYPE /plmi/s_mrcp_rsc,
        <ls_mrcp_rsc_mod>       TYPE ty_mrcp_rsc_mod, " The existing RSC
        <ls_mrcp_operation_mod> TYPE ty_mrcp_operation_mod
        .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_mrcp_rsc, et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Insert new resource selection criteria into buffer
*--------------------------------------------------------------------*

  et_mrcp_rsc = it_mrcp_rsc.

  LOOP AT et_mrcp_rsc ASSIGNING <ls_mrcp_rsc>.

    " Check Resource Selection Criteria
    IF lines( <ls_mrcp_rsc>-char_val ) EQ 0.
      " It shall have at least one characteristic, otherwise it will be interpreted on
      " the function module side as a RSC that is marked for deletion -> skip it and continue
      CONTINUE.
    ENDIF.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_mrcp_operation_mod>.

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = <ls_mrcp_rsc>-plnnr
        iv_plnal = <ls_mrcp_rsc>-plnal
        iv_datuv = <ls_mrcp_rsc>-datuv
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " If Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      DELETE et_mrcp_rsc INDEX ls_index_failed-index.
      CONTINUE.
    ENDIF.

    " Check header existence in the buffer
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH TABLE KEY plnnr = <ls_mrcp_rsc>-plnnr
                     plnal = <ls_mrcp_rsc>-plnal
                     datuv = <ls_mrcp_rsc>-datuv.

    " Check operation existence
    READ TABLE <ls_buffer>-operation ASSIGNING <ls_mrcp_operation_mod>
      WITH KEY  plnnr = <ls_mrcp_rsc>-plnnr
                plnal = <ls_mrcp_rsc>-plnal
                plnkn = <ls_mrcp_rsc>-plnkn.

    IF <ls_mrcp_operation_mod> IS ASSIGNED. " parent object exists

      IF <ls_mrcp_operation_mod>-mod_flg EQ me->gc_mod_flag_delete.
        " superordinate object has been marked for deletion -> message and continue
        MESSAGE e026(/plmi/al_gss_mrcp) WITH text-008 INTO me->gv_msg.
        /plmb/cl_rcp_message=>add_message(
          EXPORTING
            iv_msg_index = ls_index_failed-index
          CHANGING
            ct_message   = et_message
            cv_severity  = ev_severity
        ).
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      " Check resource selection criteria existence (only one can exist per operation)
      READ TABLE <ls_buffer>-rsc ASSIGNING <ls_mrcp_rsc_mod>
        WITH TABLE KEY  plnnr = <ls_mrcp_rsc>-plnnr
                        plnal = <ls_mrcp_rsc>-plnal
                        plnkn = <ls_mrcp_rsc>-plnkn.

      IF sy-subrc EQ 0. " Resource selection criteria exists in the buffer

        IF <ls_mrcp_rsc_mod>-mod_flg EQ me->gc_mod_flag_delete.
          " The existing selection criteria is marked for deletion -> rewrite
          MOVE-CORRESPONDING <ls_mrcp_rsc> TO <ls_mrcp_rsc_mod>.
          <ls_mrcp_rsc_mod>-mod_flg = me->gc_mod_flag_insert.
        ELSE.
          " The existing selection criteria is a valid one -> that's a problem (only one can exist per operation)
          MESSAGE e021(/plmi/al_gss_mrcp) WITH <ls_mrcp_operation_mod>-vornr INTO me->gv_msg.
          /plmb/cl_rcp_message=>add_message(
            EXPORTING
              iv_msg_index = ls_index_failed-index
            CHANGING
              ct_message   = et_message
              cv_severity  = ev_severity
          ).
          APPEND ls_index_failed TO et_index_failed.
          DELETE et_mrcp_rsc INDEX ls_index_failed-index.
          CONTINUE.
        ENDIF.

      ELSE. " resource selection criteria doesn't exist in the buffer -> insert

        CLEAR ls_rsc_mod.
        MOVE-CORRESPONDING <ls_mrcp_rsc> TO ls_rsc_mod.
        ls_rsc_mod-mod_flg = me->gc_mod_flag_insert.
        APPEND ls_rsc_mod TO <ls_buffer>-rsc.

      ENDIF.

    ELSE.
      " superordinate object does not exist in the buffer -> message and continue
      MESSAGE e030(/plmi/al_gss_mrcp) WITH text-003 text-008 <ls_mrcp_rsc>-plnnr <ls_mrcp_rsc>-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD ADD_STPO.

 APPEND LINES OF it_stpo to gt_stpo.

ENDMETHOD.


METHOD BUFFER_RECIPE.

*--------------------------------------------------------------------*
* This method checks if the referenced Master Recipe exists in the buffer
* and tries to read it to the buffer from database if not
*--------------------------------------------------------------------*

  DATA:
    ls_mrcp_key          TYPE /plmi/s_mrcp_key,
    lt_mrcp_key          TYPE /plmi/t_mrcp_key,
    lt_mrcp_existence    TYPE gty_t_mrcp_existence,

    ls_message           TYPE /plmb/s_spi_msg,
    lx_mrcp_bl           TYPE REF TO /plmi/cx_mrcp_bl.

  FIELD-SYMBOLS:
    <ls_mrcp_existence>  TYPE gty_s_mrcp_existence.

  " Clear exporting parameters
  CLEAR: et_message, ev_severity.

  " Check header existence of the Master Recipe in the buffer
  READ TABLE me->mt_buffer TRANSPORTING NO FIELDS
    WITH TABLE KEY plnnr = iv_plnnr
                   plnal = iv_plnal
                   datuv = iv_datuv.

  IF sy-subrc NE 0.  " master recipe does not exist in the buffer, try to read it from database

    " Check existence of the Master Recipe in the DB

    CLEAR: ls_mrcp_key, lt_mrcp_key.
    ls_mrcp_key-plnnr = iv_plnnr. " Group
    ls_mrcp_key-plnal = iv_plnal. " Group counter
    ls_mrcp_key-datuv = iv_datuv. " Key date
    ls_mrcp_key-aennr = iv_aennr. " Change number
    APPEND ls_mrcp_key TO lt_mrcp_key.

    UNASSIGN: <ls_mrcp_existence>.
    me->check_existence(
      EXPORTING
        it_mrcp_key       = lt_mrcp_key
      IMPORTING
        et_mrcp_existence = lt_mrcp_existence
    ).

    READ TABLE lt_mrcp_existence INDEX 1 ASSIGNING <ls_mrcp_existence>.

    IF <ls_mrcp_existence>-exists EQ abap_true. " master recipe exists in the DB

      " read data from DB into buffer
      TRY .

          me->read_mrcp_from_db( is_mrcp_key = ls_mrcp_key
                                 iv_verid    = iv_verid ).      "2191166

          " Assign the corresponding buffer element
          READ TABLE me->mt_buffer TRANSPORTING NO FIELDS
            WITH TABLE KEY plnnr = iv_plnnr
                           plnal = iv_plnal
                           datuv = iv_datuv.

          IF sy-subrc NE 0.
            ASSERT 0 = 1. " Master Recipe header could not be read after puting it to buffer (Normally, it shall not be possible)
          ENDIF.

        CATCH /plmi/cx_mrcp_bl  INTO lx_mrcp_bl.

          lx_mrcp_bl->get_message(
            IMPORTING
              ev_msgid = ls_message-msgid
              ev_msgty = ls_message-msgty
              ev_msgno = ls_message-msgno
              ev_msgv1 = ls_message-msgv1
              ev_msgv2 = ls_message-msgv2
              ev_msgv3 = ls_message-msgv3
              ev_msgv4 = ls_message-msgv4 ).

          IF ls_message-msgid IS NOT INITIAL.
            /plmb/cl_rcp_message=>add_message(
              EXPORTING
                is_message   = ls_message
              CHANGING
                ct_message   = et_message
                cv_severity  = ev_severity
            ).
          ENDIF.

          " Read error
          MESSAGE e001(/plmi/al_gss_mrcp) WITH ls_mrcp_key-plnnr ls_mrcp_key-plnal INTO me->gv_msg.

          /plmb/cl_rcp_message=>add_message(
            CHANGING
              ct_message     =  et_message
              cv_severity    =  ev_severity
          ).

      ENDTRY.

    ELSE. " master recipe does not exist in the DB -> message

      MESSAGE e010(/plmi/al_gss_mrcp) WITH iv_plnnr iv_plnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        CHANGING
          ct_message     =  et_message
          cv_severity    =  ev_severity
      ).

    ENDIF.

  ENDIF.


  " Lock it if needed
  IF iv_lock EQ abap_true.
    IF me->lock( iv_plnnr = iv_plnnr ) NE abap_true.
      /plmb/cl_rcp_message=>add_message(
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD CHANGE_HEADER.

  DATA:
        ls_buffer_old        TYPE ty_mrcp_buffer,
        ls_mrcp_key          TYPE /plmi/s_mrcp_key,
        lt_mrcp_key          TYPE /plmi/t_mrcp_key,
        ls_mrcp_header       TYPE /plmi/s_mrcp_header,
        ls_index_failed      TYPE /plmb/s_spi_index_failed,
        lv_mod_flg           TYPE /plmi/gss_mr_mod_flg,
        lt_mrcp_existence    TYPE gty_t_mrcp_existence,

        ls_message           TYPE /plmb/s_spi_msg,
        lx_mrcp_bl           TYPE REF TO /plmi/cx_mrcp_bl
        .

  FIELD-SYMBOLS:
        <ls_buffer>          TYPE ty_mrcp_buffer,
        <ls_buffer_old>      TYPE ty_mrcp_buffer,
        <ls_mrcp_existence>  TYPE gty_s_mrcp_existence
        .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Update header or create new version in the buffer
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_header INTO ls_mrcp_header.

    UNASSIGN: <ls_buffer>, <ls_buffer_old>.

    ls_index_failed-index = sy-tabix.

    CLEAR: ls_mrcp_key, lt_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_header TO ls_mrcp_key.
    APPEND ls_mrcp_key TO lt_mrcp_key.

    " check existence in the buffer
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_header-plnnr
               plnal = ls_mrcp_header-plnal
               datuv = ls_mrcp_header-datuv.

    IF <ls_buffer> IS ASSIGNED. " master recipe exists in the buffer with this key date -> change it directly

      IF <ls_buffer>-header-mod_flg NE me->gc_mod_flag_insert.
        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          iv_type        = gs_c_mrcp_subobj_type-header
          is_mrcp_key    = ls_mrcp_key
          is_mrcp_object = <ls_buffer>-header ).
      ENDIF.

      " update header in the buffer
      ls_mrcp_header-zaehl = <ls_buffer>-header-zaehl.
      ls_mrcp_header-andat = <ls_buffer>-header-andat.
      ls_mrcp_header-annam = <ls_buffer>-header-annam.
      ls_mrcp_header-loekz = space. " do not allow delete in change method
      lv_mod_flg = <ls_buffer>-header-mod_flg.
      CLEAR <ls_buffer>-header.
      MOVE-CORRESPONDING ls_mrcp_header TO <ls_buffer>-header ##ENH_OK.
      IF lv_mod_flg EQ me->gc_mod_flag_insert.
        <ls_buffer>-header-mod_flg  = me->gc_mod_flag_insert.
      ELSE.
        <ls_buffer>-header-mod_flg  = me->gc_mod_flag_update.
      ENDIF.

    ELSE. " master recipe doesn't exist in the buffer

      " check existence
      UNASSIGN: <ls_mrcp_existence>.
      me->check_existence(
        EXPORTING
          it_mrcp_key       = lt_mrcp_key
        IMPORTING
          et_mrcp_existence = lt_mrcp_existence
      ).
      READ TABLE lt_mrcp_existence INDEX 1 ASSIGNING <ls_mrcp_existence>.
      IF <ls_mrcp_existence> EQ abap_false.
        " master recipe doesn't exist
        MESSAGE e010(/plmi/al_gss_mrcp) WITH ls_mrcp_header-plnnr ls_mrcp_header-plnal INTO me->gv_msg.
        /plmb/cl_rcp_message=>add_message(
          EXPORTING
            iv_msg_index = ls_index_failed-index
          CHANGING
            ct_message   = et_message
            cv_severity  = ev_severity
        ).
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      " read data from DB into buffer
      TRY .
          me->read_mrcp_from_db( is_mrcp_key = ls_mrcp_key ).
        CATCH /plmi/cx_mrcp_bl INTO lx_mrcp_bl.
          lx_mrcp_bl->get_message(
            IMPORTING
              ev_msgid = ls_message-msgid
              ev_msgty = ls_message-msgty
              ev_msgno = ls_message-msgno
              ev_msgv1 = ls_message-msgv1
              ev_msgv2 = ls_message-msgv2
              ev_msgv3 = ls_message-msgv3
              ev_msgv4 = ls_message-msgv4 ).

          IF ls_message-msgid IS NOT INITIAL.
            /plmb/cl_rcp_message=>add_message(
              EXPORTING
                is_message   = ls_message
                iv_msg_index = ls_index_failed-index
              CHANGING
                ct_message   = et_message
                cv_severity  = ev_severity
            ).
          ENDIF.

          " Read error
          MESSAGE e001(/plmi/al_gss_mrcp) WITH ls_mrcp_header-plnnr ls_mrcp_header-plnal INTO me->gv_msg.
          /plmb/cl_rcp_message=>add_message(
            EXPORTING
              iv_msg_index = ls_index_failed-index
            CHANGING
              ct_message   = et_message
              cv_severity  = ev_severity
          ).
          APPEND ls_index_failed TO et_index_failed.
          CONTINUE.
      ENDTRY.

      READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
        WITH KEY header-plnnr = ls_mrcp_header-plnnr
                 header-plnal = ls_mrcp_header-plnal
                 header-datuv = ls_mrcp_header-datuv.

      IF <ls_buffer> IS ASSIGNED. " master recipe exists in the buffer with this key date -> change it directly

        " previous version has to be stored in buffer_old
        READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
            WITH KEY  plnnr = ls_mrcp_header-plnnr
                      plnal = ls_mrcp_header-plnal
                      datuv = ls_mrcp_header-datuv.
        IF <ls_buffer_old> IS ASSIGNED.
          CLEAR <ls_buffer_old>-header.
          <ls_buffer_old>-header = <ls_buffer>-header.
        ELSE.
          CLEAR ls_buffer_old.
          ls_buffer_old-plnnr   = ls_mrcp_header-plnnr.
          ls_buffer_old-plnal   = ls_mrcp_header-plnal.
          ls_buffer_old-datuv   = ls_mrcp_header-datuv.
          ls_buffer_old-header  = <ls_buffer>-header.
          APPEND ls_buffer_old TO me->mt_buffer_old.
        ENDIF.

        " update header in the buffer
        ls_mrcp_header-zaehl = <ls_buffer>-header-zaehl.
        ls_mrcp_header-andat = <ls_buffer>-header-andat.
        ls_mrcp_header-annam = <ls_buffer>-header-annam.
        ls_mrcp_header-loekz = space. " do not allow delete in change method
        CLEAR <ls_buffer>-header.
        MOVE-CORRESPONDING ls_mrcp_header TO <ls_buffer>-header ##ENH_OK.
        <ls_buffer>-header-mod_flg  = me->gc_mod_flag_update.

      ELSE. " master recipe doesn't exist in the buffer with this key date -> create version

        " find the previous version
        SORT me->mt_buffer BY header-plnnr header-plnal header-datuv DESCENDING.
        READ TABLE me->mt_buffer INDEX 1 ASSIGNING <ls_buffer>.

        " previous version has to be stored in buffer_old with the new key date
        " but the header contains the old key date
        READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
          WITH KEY  plnnr = ls_mrcp_header-plnnr
                    plnal = ls_mrcp_header-plnal
                    datuv = ls_mrcp_header-datuv.
        IF <ls_buffer_old> IS ASSIGNED.
          CLEAR <ls_buffer_old>-header.
          <ls_buffer_old>-header = <ls_buffer>-header.
        ELSE.
          CLEAR ls_buffer_old.
          ls_buffer_old-plnnr   = ls_mrcp_header-plnnr.
          ls_buffer_old-plnal   = ls_mrcp_header-plnal.
          ls_buffer_old-datuv   = ls_mrcp_header-datuv.
          ls_buffer_old-header  = <ls_buffer>-header.
          APPEND ls_buffer_old TO me->mt_buffer_old.
        ENDIF.

        " create new version in the buffer
        CLEAR <ls_buffer>-header.
        MOVE-CORRESPONDING ls_mrcp_header TO <ls_buffer>-header ##ENH_OK.
        <ls_buffer>-plnnr = ls_mrcp_header-plnnr.
        <ls_buffer>-plnal = ls_mrcp_header-plnal.
        <ls_buffer>-datuv = ls_mrcp_header-datuv.
        <ls_buffer>-header-mod_flg = me->gc_mod_flag_update.

      ENDIF.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD CHANGE_MATERIAL_ASSIGNMENT.

  DATA:
    ls_mrcp_key            TYPE /plmi/s_mrcp_key,
    ls_mrcp_mat_assignment TYPE /plmi/s_mrcp_mat_assignment,
    ls_index_failed        TYPE /plmb/s_spi_index_failed,
    lv_mod_flg             TYPE /plmi/gss_mr_mod_flg,
    lt_message             TYPE /plmb/t_spi_msg
    .

  FIELD-SYMBOLS:
    <ls_buffer>            TYPE ty_mrcp_buffer,
    <ls_mat_assgnmt_mod>   TYPE ty_mrcp_mat_assign_mod
    .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Update material assignment in the buffer
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_mat_assignment INTO ls_mrcp_mat_assignment.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_mat_assgnmt_mod>.

    CLEAR ls_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_mat_assignment TO ls_mrcp_key.
    me->buffer_recipe(
      EXPORTING
        iv_plnnr = ls_mrcp_mat_assignment-plnnr
        iv_plnal = ls_mrcp_mat_assignment-plnal
        iv_datuv = ls_mrcp_mat_assignment-datuv
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_mat_assignment-plnnr
               plnal = ls_mrcp_mat_assignment-plnal
               datuv = ls_mrcp_mat_assignment-datuv.

    " check material assignment existence
    READ TABLE <ls_buffer>-mat_assignment ASSIGNING <ls_mat_assgnmt_mod>
      WITH KEY  plnnr = ls_mrcp_mat_assignment-plnnr
                plnal = ls_mrcp_mat_assignment-plnal
                matnr = ls_mrcp_mat_assignment-matnr
                werks = ls_mrcp_mat_assignment-werks.

    IF <ls_mat_assgnmt_mod> IS ASSIGNED.

      IF <ls_mat_assgnmt_mod>-mod_flg EQ me->gc_mod_flag_delete.
        " object has been marked for deletion -> message and continue
        MESSAGE e025(/plmi/al_gss_mrcp) WITH text-010 INTO me->gv_msg.
        /plmb/cl_rcp_message=>add_message(
          EXPORTING
            iv_msg_index = ls_index_failed-index
          CHANGING
            ct_message   = et_message
            cv_severity  = ev_severity
        ).
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      IF <ls_mat_assgnmt_mod>-mod_flg NE me->gc_mod_flag_insert.
        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-mat_assignment
            is_mrcp_key    = ls_mrcp_key
            is_mrcp_object = <ls_mat_assgnmt_mod>
        ).
      ENDIF.

      " unchangeble fields (even if the input contains different values for these fields, the old value will be used)
      ls_mrcp_mat_assignment-matnr = <ls_mat_assgnmt_mod>-matnr.
      ls_mrcp_mat_assignment-werks = <ls_mat_assgnmt_mod>-werks.
      ls_mrcp_mat_assignment-plnnr = <ls_mat_assgnmt_mod>-plnnr.
      ls_mrcp_mat_assignment-plnal = <ls_mat_assgnmt_mod>-plnal.
      ls_mrcp_mat_assignment-plnty = <ls_mat_assgnmt_mod>-plnty.

      " update in the buffer
      lv_mod_flg = <ls_mat_assgnmt_mod>-mod_flg.
      IF lv_mod_flg IS INITIAL.
        lv_mod_flg = me->gc_mod_flag_update.
      ENDIF.

      CLEAR <ls_mat_assgnmt_mod>.
      MOVE-CORRESPONDING ls_mrcp_mat_assignment TO <ls_mat_assgnmt_mod> ##ENH_OK.
      <ls_mat_assgnmt_mod>-mod_flg = lv_mod_flg.

    ELSE.
      " material assignment doesn't exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-010 ls_mrcp_mat_assignment-plnnr ls_mrcp_mat_assignment-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD CHANGE_MESSAGES.

  DATA:
        ls_message TYPE /plmb/s_spi_msg.

  LOOP AT it_message INTO ls_message.

    /plmb/cl_rcp_message=>add_message(
      EXPORTING
        is_message   = ls_message
        iv_msg_index = iv_index
      CHANGING
        ct_message   = ct_message
        cv_severity  = cv_severity
    ).

  ENDLOOP.

ENDMETHOD.


METHOD CHANGE_OPERATION.

  DATA:
    ls_mrcp_key          TYPE /plmi/s_mrcp_key,
    ls_mrcp_operation    TYPE /plmi/s_mrcp_operation,
    ls_index_failed      TYPE /plmb/s_spi_index_failed,
    lv_mod_flg           TYPE /plmi/gss_mr_mod_flg,
    lt_message           TYPE /plmb/t_spi_msg
    .

  FIELD-SYMBOLS:
    <ls_buffer>          TYPE ty_mrcp_buffer,
    <ls_operation_mod>   TYPE ty_mrcp_operation_mod
    .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Update operation in the buffer
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_operation INTO ls_mrcp_operation.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_operation_mod>.

    CLEAR ls_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_operation TO ls_mrcp_key.
    me->buffer_recipe(
      EXPORTING
        iv_plnnr = ls_mrcp_operation-plnnr
        iv_plnal = ls_mrcp_operation-plnal
        iv_datuv = ls_mrcp_operation-datuv
        iv_aennr = ls_mrcp_operation-aennr
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_operation-plnnr
               plnal = ls_mrcp_operation-plnal
               datuv = ls_mrcp_operation-datuv.

    " check operation existence
    READ TABLE <ls_buffer>-operation ASSIGNING <ls_operation_mod>
      WITH KEY  plnnr = ls_mrcp_operation-plnnr
                plnal = ls_mrcp_operation-plnal
                plnkn = ls_mrcp_operation-plnkn.

    IF <ls_operation_mod> IS ASSIGNED.

      IF <ls_operation_mod>-mod_flg EQ me->gc_mod_flag_delete.
        " object has been marked for deletion -> message and continue
        MESSAGE e025(/plmi/al_gss_mrcp) WITH text-003 INTO me->gv_msg.
        /plmb/cl_rcp_message=>add_message(
          EXPORTING
            iv_msg_index = ls_index_failed-index
          CHANGING
            ct_message   = et_message
            cv_severity  = ev_severity
        ).
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      IF <ls_operation_mod>-mod_flg NE me->gc_mod_flag_insert.
        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-operation       " Object Type
            is_mrcp_key    = ls_mrcp_key        " Master Recipe Key
            is_mrcp_object = <ls_operation_mod> " Master Recipe Object
        ).
      ENDIF.

      " unchangeble fields (even if the input contains different values for these fields, the old value will be used)
      ls_mrcp_operation-zaehl = <ls_operation_mod>-zaehl.
      ls_mrcp_operation-andat = <ls_operation_mod>-andat. " Created On
      ls_mrcp_operation-annam = <ls_operation_mod>-annam. " Created By
      ls_mrcp_operation-vornr = <ls_operation_mod>-vornr. " Sequence Number

      " do not allow delete in change method
      ls_mrcp_operation-loekz = space.

      " update operation in the buffer
      lv_mod_flg = <ls_operation_mod>-mod_flg.
      IF lv_mod_flg IS INITIAL.
        lv_mod_flg = me->gc_mod_flag_update.
      ENDIF.

      CLEAR <ls_operation_mod>.
      MOVE-CORRESPONDING ls_mrcp_operation TO <ls_operation_mod>.
      <ls_operation_mod>-mod_flg = lv_mod_flg.

    ELSE.
      " operation doesn't exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-003 ls_mrcp_operation-plnnr ls_mrcp_operation-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD CHANGE_PHASE.

  DATA:
    ls_mrcp_key          TYPE /plmi/s_mrcp_key,
    ls_mrcp_phase        TYPE /plmi/s_mrcp_phase,
    ls_index_failed      TYPE /plmb/s_spi_index_failed,
    lv_mod_flg           TYPE /plmi/gss_mr_mod_flg,
    lt_message           TYPE /plmb/t_spi_msg
    .

  FIELD-SYMBOLS:
    <ls_buffer>          TYPE ty_mrcp_buffer,
    <ls_phase_mod>       TYPE ty_mrcp_phase_mod
    .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Update phase in the buffer
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_phase INTO ls_mrcp_phase.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_phase_mod>.

    CLEAR ls_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_phase TO ls_mrcp_key.
    me->buffer_recipe(
      EXPORTING
        iv_plnnr = ls_mrcp_phase-plnnr
        iv_plnal = ls_mrcp_phase-plnal
        iv_datuv = ls_mrcp_phase-datuv
        iv_aennr = ls_mrcp_phase-aennr
      IMPORTING
       et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_phase-plnnr
               plnal = ls_mrcp_phase-plnal
               datuv = ls_mrcp_phase-datuv.

    " check phase existence
    READ TABLE <ls_buffer>-phase ASSIGNING <ls_phase_mod>
      WITH KEY  plnnr = ls_mrcp_phase-plnnr
                plnal = ls_mrcp_phase-plnal
                plnkn = ls_mrcp_phase-plnkn.

    IF <ls_phase_mod> IS ASSIGNED.

      IF <ls_phase_mod>-mod_flg EQ me->gc_mod_flag_delete.
        " object has been marked for deletion -> message and continue
        MESSAGE e025(/plmi/al_gss_mrcp) WITH text-004 INTO me->gv_msg.
        /plmb/cl_rcp_message=>add_message(
          EXPORTING
            iv_msg_index = ls_index_failed-index
          CHANGING
            ct_message   = et_message
            cv_severity  = ev_severity
        ).
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      IF <ls_phase_mod>-mod_flg NE me->gc_mod_flag_insert.
        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-phase       " Object Type
            is_mrcp_key    = ls_mrcp_key    " Master Recipe Key
            is_mrcp_object = <ls_phase_mod> " Master Recipe Object
        ).
      ENDIF.

      " unchangeble fields (even if the input contains different values for these fields, the old value will be used)
      ls_mrcp_phase-zaehl = <ls_phase_mod>-zaehl.
      ls_mrcp_phase-andat = <ls_phase_mod>-andat. " Changed On
      ls_mrcp_phase-annam = <ls_phase_mod>-annam. " Changed By
      ls_mrcp_phase-vornr = <ls_phase_mod>-vornr. " Sequence Number
      ls_mrcp_phase-pvzkn = <ls_phase_mod>-pvzkn. " Parent

      " do not allow delete in change method
      ls_mrcp_phase-loekz = space.

      " update phase in the buffer
      lv_mod_flg = <ls_phase_mod>-mod_flg.
      IF lv_mod_flg IS INITIAL.
        lv_mod_flg = me->gc_mod_flag_update.
      ENDIF.

      CLEAR <ls_phase_mod>.
      MOVE-CORRESPONDING ls_mrcp_phase TO <ls_phase_mod>.
      <ls_phase_mod>-mod_flg = lv_mod_flg.

    ELSE.
      " phase doesn't exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-004 ls_mrcp_phase-plnnr ls_mrcp_phase-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD CHANGE_PI.

  DATA:
        ls_mrcp_key         TYPE /plmi/s_mrcp_key,
        ls_mrcp_pi          TYPE /plmi/s_mrcp_pi,
        ls_index_failed     TYPE /plmb/s_spi_index_failed,
        lv_mod_flg          TYPE /plmi/gss_mr_mod_flg,
        lt_message          TYPE /plmb/t_spi_msg
        .

  FIELD-SYMBOLS:
       <ls_buffer>          TYPE ty_mrcp_buffer,
       <ls_pi_mod>          TYPE ty_mrcp_pi_mod
       .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Update pi in the buffer
*--------------------------------------------------------------------*

  LOOP AT it_mrcp_pi INTO ls_mrcp_pi.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_pi_mod>.

    CLEAR ls_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_pi TO ls_mrcp_key.
    me->buffer_recipe(
      EXPORTING
        iv_plnnr    = ls_mrcp_pi-plnnr
        iv_plnal    = ls_mrcp_pi-plnal
        iv_datuv    = ls_mrcp_pi-datuv
        iv_aennr    = ls_mrcp_pi-aennr
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_pi-plnnr
               plnal = ls_mrcp_pi-plnal
               datuv = ls_mrcp_pi-datuv.

    " check pi existence
    READ TABLE <ls_buffer>-pi ASSIGNING <ls_pi_mod>
      WITH KEY plnnr = ls_mrcp_pi-plnnr
               plnal = ls_mrcp_pi-plnal
               plnft = ls_mrcp_pi-plnft.

    IF <ls_pi_mod> IS ASSIGNED.

      IF <ls_pi_mod>-mod_flg EQ me->gc_mod_flag_delete.
        " object has been marked for deletion -> message and continue
        MESSAGE e025(/plmi/al_gss_mrcp) WITH text-005 INTO me->gv_msg.
        /plmb/cl_rcp_message=>add_message(
          EXPORTING
            iv_msg_index = ls_index_failed-index
          CHANGING
            ct_message   = et_message
            cv_severity  = ev_severity
        ).
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      IF <ls_pi_mod>-mod_flg NE me->gc_mod_flag_insert.
        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-pi          " Object Type
            is_mrcp_key    = ls_mrcp_key    " Master Recipe Key
            is_mrcp_object = <ls_pi_mod>    " Master Recipe Object
        ).
      ENDIF.

      " unchangeble fields (even if the input contains different values for these fields, the old value will be used)
      ls_mrcp_pi-zaehl = <ls_pi_mod>-zaehl.
      ls_mrcp_pi-andat = <ls_pi_mod>-andat. " Created On
      ls_mrcp_pi-annam = <ls_pi_mod>-annam. " Created By
      ls_mrcp_pi-ftrnr = <ls_pi_mod>-ftrnr. " Sequence Number

      " do not allow delete in change method
      ls_mrcp_pi-loekz = space.

      " in case of modified PLNKN this child object will be moved to another parent
      " if it is empty, it remains under the current parent
      IF ls_mrcp_pi-plnkn IS INITIAL.
        ls_mrcp_pi-plnkn = <ls_pi_mod>-plnkn.
      ELSE.
        " check parent existence
        READ TABLE <ls_buffer>-phase TRANSPORTING NO FIELDS
          WITH KEY  plnnr = ls_mrcp_pi-plnnr
                    plnal = ls_mrcp_pi-plnal
                    plnkn = ls_mrcp_pi-plnkn
                    .
        IF sy-subrc NE 0.
          " superordinate object does not exist in the buffer -> message and continue
          MESSAGE e030(/plmi/al_gss_mrcp) WITH text-004 text-005 ls_mrcp_pi-plnnr ls_mrcp_pi-plnal INTO me->gv_msg.
          /plmb/cl_rcp_message=>add_message(
            EXPORTING
              iv_msg_index = ls_index_failed-index
            CHANGING
              ct_message   = et_message
              cv_severity  = ev_severity
          ).
          APPEND ls_index_failed TO et_index_failed.
          CONTINUE.
        ENDIF.

      ENDIF.

      " update pi in the buffer
      lv_mod_flg = <ls_pi_mod>-mod_flg.
      IF lv_mod_flg IS INITIAL.
        lv_mod_flg = me->gc_mod_flag_update.
      ENDIF.

      CLEAR <ls_pi_mod>.
      MOVE-CORRESPONDING ls_mrcp_pi TO <ls_pi_mod>.
      <ls_pi_mod>-mod_flg = lv_mod_flg.

    ELSE.
      " pi doesn't exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-005 ls_mrcp_pi-plnnr ls_mrcp_pi-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD CHANGE_PI_CHAR_VAL.

  DATA:
        ls_mrcp_key         TYPE /plmi/s_mrcp_key,
        ls_mrcp_pi_char_val TYPE /plmi/s_mrcp_pi_char_val,
        ls_index_failed     TYPE /plmb/s_spi_index_failed,
        lv_mod_flg          TYPE /plmi/gss_mr_mod_flg,
        lt_message          TYPE /plmb/t_spi_msg
        .

  FIELD-SYMBOLS:
       <ls_buffer>          TYPE ty_mrcp_buffer,
       <ls_pi_char_val_mod> TYPE ty_mrcp_pi_char_val_mod
       .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Update pi_char_val in the buffer
*--------------------------------------------------------------------*

  LOOP AT it_mrcp_pi_char_val INTO ls_mrcp_pi_char_val.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_pi_char_val_mod>.

    CLEAR ls_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_pi_char_val TO ls_mrcp_key.
    me->buffer_recipe(
      EXPORTING
        iv_plnnr    = ls_mrcp_pi_char_val-plnnr
        iv_plnal    = ls_mrcp_pi_char_val-plnal
        iv_datuv    = ls_mrcp_pi_char_val-datuv
        iv_aennr    = ls_mrcp_pi_char_val-aennr
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_pi_char_val-plnnr
               plnal = ls_mrcp_pi_char_val-plnal
               datuv = ls_mrcp_pi_char_val-datuv.

    " check pi_char_val existence
    READ TABLE <ls_buffer>-pi_char_val ASSIGNING <ls_pi_char_val_mod>
      WITH KEY plnnr = ls_mrcp_pi_char_val-plnnr
               plnal = ls_mrcp_pi_char_val-plnal
               plnkn = ls_mrcp_pi_char_val-plnkn
               plnft = ls_mrcp_pi_char_val-plnft
               mkmzl = ls_mrcp_pi_char_val-mkmzl.

    IF <ls_pi_char_val_mod> IS ASSIGNED.

      IF <ls_pi_char_val_mod>-mod_flg EQ me->gc_mod_flag_delete.
        " object has been marked for deletion -> message and continue
        MESSAGE e025(/plmi/al_gss_mrcp) WITH text-006 INTO me->gv_msg.
        /plmb/cl_rcp_message=>add_message(
          EXPORTING
            iv_msg_index = ls_index_failed-index
          CHANGING
            ct_message   = et_message
            cv_severity  = ev_severity
        ).
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      IF <ls_pi_char_val_mod>-mod_flg NE me->gc_mod_flag_insert.
        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-pi_cv       " Object Type
            is_mrcp_key    = ls_mrcp_key          " Master Recipe Key
            is_mrcp_object = <ls_pi_char_val_mod> " Master Recipe Object
        ).
      ENDIF.

      " unchangeble fields (even if the input contains different values for these fields, the old value will be used)
      ls_mrcp_pi_char_val-zaehl = <ls_pi_char_val_mod>-zaehl.
      ls_mrcp_pi_char_val-andat = <ls_pi_char_val_mod>-andat. " Created On
      ls_mrcp_pi_char_val-annam = <ls_pi_char_val_mod>-annam. " Created By
      ls_mrcp_pi_char_val-fvlnr = <ls_pi_char_val_mod>-fvlnr. " Sequence Number

      ls_mrcp_pi_char_val-loekz = space. " do not allow delete in change method

      " in case of modified PLNKN and/or PLNFT this child object will be moved to another parent
      " if it is empty, it remains under the current parent
      IF ls_mrcp_pi_char_val-plnkn IS INITIAL.
        ls_mrcp_pi_char_val-plnkn = <ls_pi_char_val_mod>-plnkn. " Parent
      ENDIF.
      IF ls_mrcp_pi_char_val-plnft IS INITIAL.
        ls_mrcp_pi_char_val-plnft = <ls_pi_char_val_mod>-plnft. " Parent
      ENDIF.

      " check parent existence
      READ TABLE <ls_buffer>-pi TRANSPORTING NO FIELDS
        WITH KEY plnnr = ls_mrcp_pi_char_val-plnnr
                 plnal = ls_mrcp_pi_char_val-plnal
                 plnkn = ls_mrcp_pi_char_val-plnkn
                 plnft = ls_mrcp_pi_char_val-plnft
                 .
      IF sy-subrc NE 0.
        " superordinate object does not exist in the buffer -> message and continue
        MESSAGE e030(/plmi/al_gss_mrcp) WITH text-005 text-006 ls_mrcp_pi_char_val-plnnr ls_mrcp_pi_char_val-plnal INTO me->gv_msg.
        /plmb/cl_rcp_message=>add_message(
          EXPORTING
            iv_msg_index = ls_index_failed-index
          CHANGING
            ct_message   = et_message
            cv_severity  = ev_severity
        ).
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      " update pi_char_val in the buffer
      lv_mod_flg = <ls_pi_char_val_mod>-mod_flg.
      IF lv_mod_flg IS INITIAL.
        lv_mod_flg = me->gc_mod_flag_update.
      ENDIF.

      CLEAR <ls_pi_char_val_mod>.
      MOVE-CORRESPONDING ls_mrcp_pi_char_val TO <ls_pi_char_val_mod>.
      <ls_pi_char_val_mod>-mod_flg = lv_mod_flg.

    ELSE.
      " pi_char_val doesn't exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-006 ls_mrcp_pi_char_val-plnnr ls_mrcp_pi_char_val-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD CHANGE_PRODVER.

  DATA:
         ls_mrcp_key            TYPE /plmi/s_mrcp_key,
         ls_mrcp_prodver        TYPE ty_mrcp_prodver_mod,
         ls_index_failed        TYPE /plmb/s_spi_index_failed,
         lt_message             TYPE /plmb/t_spi_msg,
         lv_mod_flg             TYPE /plmi/gss_mr_mod_flg,
         lv_lines               TYPE int4
         .

  FIELD-SYMBOLS:
         <ls_buffer>            TYPE ty_mrcp_buffer,
         <ls_mrcp_prodver_mod>  TYPE ty_mrcp_prodver_mod
         .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Set new production version for the recipe, insert it into buffer
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_prodver INTO ls_mrcp_prodver.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_mrcp_prodver_mod>.

    " check if it_mrcp_prodver contains at most one row for each recipe
    CLEAR lv_lines.
    LOOP AT it_mrcp_prodver TRANSPORTING NO FIELDS
      WHERE plnnr = ls_mrcp_prodver-plnnr
        AND alnal = ls_mrcp_prodver-alnal
        AND datuv = ls_mrcp_prodver-datuv.
      ADD 1 TO lv_lines.
      IF lv_lines GT 1.
        EXIT.
      ENDIF.
    ENDLOOP.
    IF lv_lines GT 1.
      " multiple production versions cannot be assigned to the same recipe
      MESSAGE e024(/plmi/al_gss_mrcp) INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity ).

      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    CLEAR ls_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_prodver TO ls_mrcp_key ##ENH_OK.
    " this line is needed because of different field name in prod. version structure (ALNAL vs. PLNAL)
    ls_mrcp_key-plnal = ls_mrcp_prodver-alnal.
    me->buffer_recipe(
      EXPORTING
        iv_plnnr = ls_mrcp_prodver-plnnr
        iv_plnal = ls_mrcp_prodver-alnal
        iv_datuv = ls_mrcp_prodver-datuv
*        iv_aennr = ls_mrcp_prodver-aennr
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign production version
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH TABLE KEY  plnnr = ls_mrcp_prodver-plnnr
                      plnal = ls_mrcp_prodver-alnal
                      datuv = ls_mrcp_prodver-datuv.

    " check production version existence
    READ TABLE <ls_buffer>-prodver ASSIGNING <ls_mrcp_prodver_mod>
      WITH KEY  plnnr = ls_mrcp_prodver-plnnr
                alnal = ls_mrcp_prodver-alnal.

    IF <ls_mrcp_prodver_mod> IS ASSIGNED.

      IF <ls_mrcp_prodver_mod>-mod_flg NE me->gc_mod_flag_insert.
        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-prod_ver
            is_mrcp_key    = ls_mrcp_key
            is_mrcp_object = <ls_mrcp_prodver_mod>
        ).
      ENDIF.

      " unchangeble fields (even if the input contains different values for these fields, the old value will be used)
      ls_mrcp_prodver-matnr = <ls_mrcp_prodver_mod>-matnr.
      ls_mrcp_prodver-werks = <ls_mrcp_prodver_mod>-werks.
      ls_mrcp_prodver-stlan = <ls_mrcp_prodver_mod>-stlan.
      ls_mrcp_prodver-stlal = <ls_mrcp_prodver_mod>-stlal.
      ls_mrcp_prodver-verid = <ls_mrcp_prodver_mod>-verid.
      ls_mrcp_prodver-plnty = <ls_mrcp_prodver_mod>-plnty.

      " update in the buffer
      lv_mod_flg = <ls_mrcp_prodver_mod>-mod_flg.
      IF lv_mod_flg IS INITIAL.
        lv_mod_flg = me->gc_mod_flag_update.
      ENDIF.

      CLEAR <ls_mrcp_prodver_mod>.
      MOVE-CORRESPONDING ls_mrcp_prodver TO <ls_mrcp_prodver_mod>.
      <ls_mrcp_prodver_mod>-mod_flg = lv_mod_flg.

    ELSE.
      " Production version does not exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-009 ls_mrcp_prodver-plnnr ls_mrcp_prodver-alnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).

      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD CHANGE_RESOURCE.

  DATA:
        ls_mrcp_key         TYPE /plmi/s_mrcp_key,
        ls_mrcp_resource    TYPE /plmi/s_mrcp_resource,
        ls_plpod            TYPE plpod,                        "2633669
        ls_index_failed     TYPE /plmb/s_spi_index_failed,
        lv_mod_flg          TYPE /plmi/gss_mr_mod_flg,
        lt_message          TYPE /plmb/t_spi_msg
        .

  FIELD-SYMBOLS:
       <ls_buffer>          TYPE ty_mrcp_buffer,
       <ls_resource_mod>    TYPE ty_mrcp_resource_mod
       .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Update resource in the buffer
*--------------------------------------------------------------------*

  LOOP AT it_mrcp_resource INTO ls_mrcp_resource.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_resource_mod>.

    CLEAR ls_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_resource TO ls_mrcp_key.
    me->buffer_recipe(
      EXPORTING
        iv_plnnr    = ls_mrcp_resource-plnnr
        iv_plnal    = ls_mrcp_resource-plnal
        iv_datuv    = ls_mrcp_resource-datuv
        iv_aennr    = ls_mrcp_resource-aennr
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_resource-plnnr
               plnal = ls_mrcp_resource-plnal
               datuv = ls_mrcp_resource-datuv.

    " check resource existence
    READ TABLE <ls_buffer>-resource ASSIGNING <ls_resource_mod>
      WITH KEY plnnr = ls_mrcp_resource-plnnr
               plnal = ls_mrcp_resource-plnal
               plnkn = ls_mrcp_resource-plnkn
               sumnr = ls_mrcp_resource-sumnr.

    IF <ls_resource_mod> IS ASSIGNED.

      IF <ls_resource_mod>-mod_flg EQ me->gc_mod_flag_delete.
        " object has been marked for deletion -> message and continue
        MESSAGE e025(/plmi/al_gss_mrcp) WITH text-007 INTO me->gv_msg.
        /plmb/cl_rcp_message=>add_message(
          EXPORTING
            iv_msg_index = ls_index_failed-index
          CHANGING
            ct_message   = et_message
            cv_severity  = ev_severity
        ).
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      IF <ls_resource_mod>-mod_flg NE me->gc_mod_flag_insert.
        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-resource        " Object Type
            is_mrcp_key    = ls_mrcp_key        " Master Recipe Key
            is_mrcp_object = <ls_resource_mod>  " Master Recipe Object
        ).
      ENDIF.

      " Unchangeble fields (even if the input contains different values for these fields, the old value will be used)
      ls_mrcp_resource-zaehl = <ls_resource_mod>-zaehl. " Change Number
      ls_mrcp_resource-andat = <ls_resource_mod>-andat. " Created On
      ls_mrcp_resource-annam = <ls_resource_mod>-annam. " Created By
      ls_mrcp_resource-vornr = <ls_resource_mod>-vornr. " Sequence Number

      ls_mrcp_resource-loekz = space. " do not allow delete in change method

      " in case of modified SUMNR this child object will be moved to another parent
      " if it is empty, it remains under the current parent
      IF ls_mrcp_resource-sumnr IS INITIAL.
        ls_mrcp_resource-sumnr = <ls_resource_mod>-sumnr.
      ELSE.
        " check parent existence
        READ TABLE <ls_buffer>-operation TRANSPORTING NO FIELDS
          WITH KEY  plnnr = ls_mrcp_resource-plnnr
                    plnal = ls_mrcp_resource-plnal
                    plnkn = ls_mrcp_resource-sumnr.
        IF sy-subrc NE 0.
          READ TABLE <ls_buffer>-phase TRANSPORTING NO FIELDS
            WITH KEY  plnnr = ls_mrcp_resource-plnnr
                      plnal = ls_mrcp_resource-plnal
                      plnkn = ls_mrcp_resource-sumnr.
          IF sy-subrc NE 0.
            " superordinate object does not exist in the buffer -> message and continue
            DATA lv_msgparam1 TYPE string.
            CONCATENATE text-003 '/' text-004 INTO lv_msgparam1.
            MESSAGE e030(/plmi/al_gss_mrcp) WITH lv_msgparam1 text-007 ls_mrcp_resource-plnnr ls_mrcp_resource-plnal INTO me->gv_msg.
            /plmb/cl_rcp_message=>add_message(
              EXPORTING
                iv_msg_index = ls_index_failed-index
              CHANGING
                ct_message   = et_message
                cv_severity  = ev_severity
            ).
            APPEND ls_index_failed TO et_index_failed.
            CONTINUE.
          ENDIF.
        ENDIF.
      ENDIF.

      " update resource in the buffer
      lv_mod_flg = <ls_resource_mod>-mod_flg.
      IF lv_mod_flg IS INITIAL.
        lv_mod_flg = me->gc_mod_flag_update.
      ENDIF.

      CLEAR <ls_resource_mod>.
* note 2633669
      IF ls_mrcp_resource-arbid IS NOT INITIAL.
        MOVE-CORRESPONDING ls_mrcp_resource TO ls_plpod ##ENH_OK.
        me->get_default_values_workcenter(
          CHANGING
            cs_plpod = ls_plpod
        ).
        MOVE-CORRESPONDING ls_plpod TO ls_mrcp_resource ##ENH_OK.
      ENDIF.
* note 2633669
      MOVE-CORRESPONDING ls_mrcp_resource TO <ls_resource_mod>.
      <ls_resource_mod>-mod_flg = lv_mod_flg.

    ELSE.
      " resource doesn't exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-007 ls_mrcp_resource-plnnr ls_mrcp_resource-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD CHANGE_RSC.

  DATA:
    ls_mrcp_rsc          TYPE /plmi/s_mrcp_rsc,
    ls_index_failed      TYPE /plmb/s_spi_index_failed,
    lv_mod_flg           TYPE /plmi/gss_mr_mod_flg,
    lt_message           TYPE /plmb/t_spi_msg
    .

  FIELD-SYMBOLS:
    <ls_buffer>          TYPE ty_mrcp_buffer,
    <ls_rsc_mod>         TYPE ty_mrcp_rsc_mod
    .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Update RSC in the buffer
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_rsc INTO ls_mrcp_rsc.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_rsc_mod>.

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = ls_mrcp_rsc-plnnr
        iv_plnal = ls_mrcp_rsc-plnal
        iv_datuv = ls_mrcp_rsc-datuv
*        iv_aennr = ls_mrcp_rsc-aennr
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_rsc-plnnr
               plnal = ls_mrcp_rsc-plnal
               datuv = ls_mrcp_rsc-datuv.

    " check rsc existence
    READ TABLE <ls_buffer>-rsc ASSIGNING <ls_rsc_mod>
      WITH KEY  plnnr = ls_mrcp_rsc-plnnr
                plnal = ls_mrcp_rsc-plnal
                plnkn = ls_mrcp_rsc-plnkn.

    IF <ls_rsc_mod> IS ASSIGNED.

      IF <ls_rsc_mod>-mod_flg EQ me->gc_mod_flag_delete.
        " object has been marked for deletion -> message and continue
        MESSAGE e025(/plmi/al_gss_mrcp) WITH text-008 INTO me->gv_msg.
        /plmb/cl_rcp_message=>add_message(
          EXPORTING
            iv_msg_index = ls_index_failed-index
          CHANGING
            ct_message   = et_message
            cv_severity  = ev_severity
        ).
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      " update rsc in the buffer
      lv_mod_flg = <ls_rsc_mod>-mod_flg.
      IF lv_mod_flg IS INITIAL.
        lv_mod_flg = me->gc_mod_flag_update.
      ENDIF.

      CLEAR <ls_rsc_mod>.
      MOVE-CORRESPONDING ls_mrcp_rsc TO <ls_rsc_mod>.
      <ls_rsc_mod>-mod_flg = lv_mod_flg.

    ELSE.
      " RSC doesn't exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-008 ls_mrcp_rsc-plnnr ls_mrcp_rsc-plnal INTO me->gv_msg.
      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD CHECK_EXISTENCE.

  DATA:
        ls_mrcp_existence TYPE gty_s_mrcp_existence,
        ls_mrcp_header    TYPE /plmi/s_mrcp_header,
        lt_plkob          TYPE TABLE OF plkob
        .

  FIELD-SYMBOLS:
        <ls_mrcp_key>     TYPE /plmi/s_mrcp_key,
        <ls_plkob>        TYPE plkob
        .

*--------------------------------------------------------------------*
* clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_mrcp_existence, et_mrcp_header, et_message, ev_severity.

*--------------------------------------------------------------------*
* check existence
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_key ASSIGNING <ls_mrcp_key>.

    CLEAR: ls_mrcp_existence, lt_plkob.

    " Check existence of master recipe
    " Remark: this FM returns master recipes with deletion flag as well
    CALL FUNCTION 'CP_DB_PLKO_READ'
      EXPORTING
*       datub      = <ls_mrcp_key>-datuv " check existence independently from key date
        plnal      = <ls_mrcp_key>-plnal
        plnnr      = <ls_mrcp_key>-plnnr
        plnty      = me->gc_plnty_mrcp
      TABLES
        planko     = lt_plkob
      EXCEPTIONS
        no_records = 1
        OTHERS     = 2.

    IF sy-subrc EQ 0.
      " master recipe already exists
      ls_mrcp_existence-exists = abap_true.
      MESSAGE i020(/plmi/al_gss_mrcp) WITH <ls_mrcp_key>-plnnr <ls_mrcp_key>-plnal INTO me->gv_msg.
    ELSE.
      " master recipe does not exist
      ls_mrcp_existence-exists = abap_false.
      MESSAGE i010(/plmi/al_gss_mrcp) WITH <ls_mrcp_key>-plnnr <ls_mrcp_key>-plnal INTO me->gv_msg.
    ENDIF.

    /plmb/cl_rcp_message=>add_message(
      CHANGING
        ct_message     =  et_message
        cv_severity    =  ev_severity
    ).

    ls_mrcp_existence-plnal = <ls_mrcp_key>-plnal.
    ls_mrcp_existence-plnnr = <ls_mrcp_key>-plnnr.
*    ls_mrcp_existence-datuv = <ls_mrcp_key>-datuv. " check existence independently from key date
    APPEND ls_mrcp_existence TO et_mrcp_existence.

    LOOP AT lt_plkob ASSIGNING <ls_plkob>.
      MOVE-CORRESPONDING <ls_plkob> TO ls_mrcp_header ##ENH_OK.
      APPEND ls_mrcp_header TO et_mrcp_header.
    ENDLOOP.

  ENDLOOP.

ENDMETHOD.


METHOD CLEAN_UP.

* Clear buffers in case of commmit
  IF iv_reason = /plmb/if_spi_c=>gs_c_cleanup_reason-commit.
    CLEAR me->mt_buffer.
    CLEAR me->mt_buffer_old.
  ENDIF.

  " Unlock Master Recipe
  me->unlock( ).

ENDMETHOD.


METHOD CONSTRUCTOR.

  me->mv_plnkn  = '99999999'.
  me->mv_plnft  = '99999999'.
  me->mv_mkmzl  = '99999999'.
  me->init( ).

ENDMETHOD.


METHOD COPY_ELEMENT_TO_BUFFER_OLD.

  DATA:
    ls_buffer_old      TYPE ty_mrcp_buffer,
    ls_mrcp_operation  TYPE /plmi/s_mrcp_operation,
    ls_mrcp_phase      TYPE /plmi/s_mrcp_phase,
    ls_mrcp_resource   TYPE /plmi/s_mrcp_resource,
    ls_mrcp_pi         TYPE /plmi/s_mrcp_pi,
    ls_mrcp_pi_cv      TYPE /plmi/s_mrcp_pi_char_val,
    ls_mrcp_prodver    TYPE /plmi/s_mrcp_prodver,
    ls_mrcp_mat_assgnm TYPE /plmi/s_mrcp_mat_assignment.

  FIELD-SYMBOLS:
    <ls_buffer_old>    TYPE ty_mrcp_buffer.

  " get the proper buffer for old content
  READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
    WITH KEY  plnnr = is_mrcp_key-plnnr
              plnal = is_mrcp_key-plnal
              datuv = is_mrcp_key-datuv.

  " if it does not exist, then create one
  IF <ls_buffer_old> IS NOT ASSIGNED.
    ls_buffer_old-plnnr = is_mrcp_key-plnnr.
    ls_buffer_old-plnal = is_mrcp_key-plnal.
    ls_buffer_old-datuv = is_mrcp_key-datuv.
    ls_buffer_old-aennr = is_mrcp_key-aennr.
    APPEND ls_buffer_old TO me->mt_buffer_old ASSIGNING <ls_buffer_old>.
  ENDIF.

  " check whether the original object is already in the old buffer
  " if yes, simple return, otherwise put the object into the buffer
  CASE iv_type.
    WHEN gs_c_mrcp_subobj_type-header.
      IF <ls_buffer_old>-header IS NOT INITIAL.
        RETURN.
      ELSE.
        <ls_buffer_old>-header = is_mrcp_object.
      ENDIF.

    WHEN gs_c_mrcp_subobj_type-operation.
      ls_mrcp_operation = is_mrcp_object.
      READ TABLE <ls_buffer_old>-operation TRANSPORTING NO FIELDS WITH TABLE KEY
         plnnr = ls_mrcp_operation-plnnr
         plnal = ls_mrcp_operation-plnal
         plnkn = ls_mrcp_operation-plnkn.
      IF sy-subrc = 0.
        RETURN.
      ELSE.
        APPEND ls_mrcp_operation TO <ls_buffer_old>-operation.
      ENDIF.

    WHEN gs_c_mrcp_subobj_type-phase.
      ls_mrcp_phase = is_mrcp_object.
      READ TABLE <ls_buffer_old>-phase TRANSPORTING NO FIELDS WITH TABLE KEY
         plnnr = ls_mrcp_phase-plnnr
         plnal = ls_mrcp_phase-plnal
         plnkn = ls_mrcp_phase-plnkn.
      IF sy-subrc = 0.
        RETURN.
      ELSE.
        APPEND ls_mrcp_phase TO <ls_buffer_old>-phase.
      ENDIF.

    WHEN gs_c_mrcp_subobj_type-resource.
      ls_mrcp_resource = is_mrcp_object.
      READ TABLE <ls_buffer_old>-resource TRANSPORTING NO FIELDS WITH TABLE KEY
         plnnr = ls_mrcp_resource-plnnr
         plnal = ls_mrcp_resource-plnal
         plnkn = ls_mrcp_resource-plnkn.
      IF sy-subrc = 0.
        RETURN.
      ELSE.
        APPEND ls_mrcp_resource TO <ls_buffer_old>-resource.
      ENDIF.

    WHEN gs_c_mrcp_subobj_type-pi.
      ls_mrcp_pi = is_mrcp_object.
      READ TABLE <ls_buffer_old>-pi TRANSPORTING NO FIELDS WITH TABLE KEY
         plnnr = ls_mrcp_pi-plnnr
         plnal = ls_mrcp_pi-plnal
         plnkn = ls_mrcp_pi-plnkn
         plnft = ls_mrcp_pi-plnft.
      IF sy-subrc = 0.
        RETURN.
      ELSE.
        APPEND ls_mrcp_pi TO <ls_buffer_old>-pi.
      ENDIF.

    WHEN gs_c_mrcp_subobj_type-pi_cv.
      ls_mrcp_pi_cv = is_mrcp_object.
      READ TABLE <ls_buffer_old>-pi_char_val TRANSPORTING NO FIELDS WITH TABLE KEY
         plnnr = ls_mrcp_pi_cv-plnnr
         plnal = ls_mrcp_pi_cv-plnal
         plnkn = ls_mrcp_pi_cv-plnkn
         plnft = ls_mrcp_pi_cv-plnft
         mkmzl = ls_mrcp_pi_cv-mkmzl.
      IF sy-subrc = 0.
        RETURN.
      ELSE.
        APPEND ls_mrcp_pi_cv TO <ls_buffer_old>-pi_char_val.
      ENDIF.

    WHEN gs_c_mrcp_subobj_type-mat_assignment.
      ls_mrcp_mat_assgnm = is_mrcp_object.
      READ TABLE <ls_buffer_old>-mat_assignment TRANSPORTING NO FIELDS WITH TABLE KEY
        plnnr = ls_mrcp_mat_assgnm-plnnr
        plnal = ls_mrcp_mat_assgnm-plnal.
      IF sy-subrc = 0.
        RETURN.
      ELSE.
        APPEND ls_mrcp_mat_assgnm TO <ls_buffer_old>-mat_assignment.
      ENDIF.

    WHEN gs_c_mrcp_subobj_type-prod_ver.
      ls_mrcp_prodver = is_mrcp_object.
      READ TABLE <ls_buffer_old>-prodver TRANSPORTING NO FIELDS WITH TABLE KEY
        plnnr = ls_mrcp_prodver-plnnr
        alnal = ls_mrcp_prodver-alnal.
      IF sy-subrc = 0.
        RETURN.
      ELSE.
        APPEND ls_mrcp_prodver TO <ls_buffer_old>-prodver.
      ENDIF.

    WHEN OTHERS.
      ASSERT 1 = 2.

  ENDCASE.

ENDMETHOD.


METHOD CREATE.

  DATA:
        ls_buffer            TYPE ty_mrcp_buffer,
        ls_mrcp_key          TYPE /plmi/s_mrcp_key,
        lt_mrcp_key          TYPE /plmi/t_mrcp_key,
        lt_mrcp_existence    TYPE gty_t_mrcp_existence,
        ls_index_failed      TYPE /plmb/s_spi_index_failed
        .

  FIELD-SYMBOLS:
        <ls_mrcp_header>     TYPE /plmi/s_mrcp_header,
        <ls_mrcp_existence>  TYPE gty_s_mrcp_existence
        .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Insert new master recipe data into buffer
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_header ASSIGNING <ls_mrcp_header>.

    ls_index_failed-index = sy-tabix.

    CLEAR: ls_mrcp_key, lt_mrcp_key.
    UNASSIGN: <ls_mrcp_existence>.

    ls_mrcp_key-plnnr = <ls_mrcp_header>-plnnr.
    ls_mrcp_key-plnal = <ls_mrcp_header>-plnal.
    APPEND ls_mrcp_key TO lt_mrcp_key.

    " check existence in the DB
    me->check_existence(
      EXPORTING
        it_mrcp_key       = lt_mrcp_key
      IMPORTING
        et_mrcp_existence = lt_mrcp_existence
    ).

    READ TABLE lt_mrcp_existence INDEX 1 ASSIGNING <ls_mrcp_existence>.

    IF <ls_mrcp_existence>-exists EQ abap_true. " master recipe already exists in DB -> error message

      MESSAGE i020(/plmi/al_gss_mrcp) WITH <ls_mrcp_header>-plnnr <ls_mrcp_header>-plnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        EXPORTING
          iv_msg_index = ls_index_failed-index
        CHANGING
          ct_message   = et_message
          cv_severity  = ev_severity
      ).

      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.

    ELSE. " master recipe does not exist in DB

      " check existence in the buffer
      READ TABLE me->mt_buffer TRANSPORTING NO FIELDS
        WITH TABLE KEY plnnr = <ls_mrcp_header>-plnnr
                       plnal = <ls_mrcp_header>-plnal
                       datuv = <ls_mrcp_header>-datuv.

      IF sy-subrc EQ 0. " master recipe already exists in buffer -> error message

        MESSAGE i020(/plmi/al_gss_mrcp) WITH <ls_mrcp_header>-plnnr <ls_mrcp_header>-plnal INTO me->gv_msg.

        /plmb/cl_rcp_message=>add_message(
          EXPORTING
            iv_msg_index = ls_index_failed-index
          CHANGING
            ct_message   = et_message
            cv_severity  = ev_severity
        ).

        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.

      ELSE. " master recipe does not exist in buffer -> insert

        CLEAR ls_buffer.
        ls_buffer-plnnr = <ls_mrcp_header>-plnnr.
        ls_buffer-plnal = <ls_mrcp_header>-plnal.
        ls_buffer-datuv = <ls_mrcp_header>-datuv.
        ls_buffer-aennr = <ls_mrcp_header>-aennr.
        MOVE-CORRESPONDING <ls_mrcp_header> TO ls_buffer-header ##ENH_OK.
        ls_buffer-header-mod_flg = me->gc_mod_flag_insert.
        APPEND ls_buffer TO me->mt_buffer.

      ENDIF.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


  METHOD DELETE.

    DATA:
          ls_mrcp_key           TYPE /plmi/s_mrcp_key,
          ls_mrcp_operation_key TYPE /plmi/s_mrcp_operation_key,
          lt_mrcp_operation_key TYPE /plmi/t_mrcp_operation_key,
          ls_index_failed       TYPE /plmb/s_spi_index_failed,
          lt_message            TYPE /plmb/t_spi_msg
          .

    FIELD-SYMBOLS:
                   <ls_buffer>           TYPE ty_mrcp_buffer,
                   <ls_operation_mod>    TYPE ty_mrcp_operation_mod
                   .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
    CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Delete Master Recipe
*--------------------------------------------------------------------*
    LOOP AT it_mrcp_key INTO ls_mrcp_key.

      ls_index_failed-index = sy-tabix.
      UNASSIGN: <ls_buffer>.

      me->buffer_recipe(
        EXPORTING
          iv_plnnr = ls_mrcp_key-plnnr
          iv_plnal = ls_mrcp_key-plnal
          iv_datuv = ls_mrcp_key-datuv
        IMPORTING
          et_message  = lt_message ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity ).

      " if Master Recipe does not exists or other problem occured then continue
      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      " assign Master Recipe
      READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
        WITH KEY plnnr = ls_mrcp_key-plnnr
                 plnal = ls_mrcp_key-plnal
                 datuv = ls_mrcp_key-datuv.

      IF <ls_buffer> IS ASSIGNED.

        IF <ls_buffer>-header-mod_flg EQ me->gc_mod_flag_insert.
          CLEAR <ls_buffer>.
          CONTINUE.
        ELSEIF <ls_buffer>-header-mod_flg EQ me->gc_mod_flag_delete.
          CONTINUE.
        ELSE.
          " previous version has to be stored in buffer_old
          me->copy_element_to_buffer_old(
            EXPORTING
              iv_type        = gs_c_mrcp_subobj_type-header
              is_mrcp_key    = ls_mrcp_key
              is_mrcp_object = <ls_buffer>-header
          ).
          " update operation in the buffer, set deletion flag
          <ls_buffer>-header-loekz    = abap_true.
          <ls_buffer>-header-mod_flg  = me->gc_mod_flag_delete.
        ENDIF.

        " delete child objects
        CLEAR: lt_mrcp_operation_key.
        " delete related operations
        LOOP AT <ls_buffer>-operation ASSIGNING <ls_operation_mod>.
          ls_mrcp_operation_key-plnnr = <ls_operation_mod>-plnnr.
          ls_mrcp_operation_key-plnal = <ls_operation_mod>-plnal.
          ls_mrcp_operation_key-aennr = <ls_operation_mod>-aennr.
          ls_mrcp_operation_key-datuv = <ls_operation_mod>-datuv.
          ls_mrcp_operation_key-plnkn = <ls_operation_mod>-plnkn.
          APPEND ls_mrcp_operation_key TO lt_mrcp_operation_key.
        ENDLOOP.
        me->delete_operation(
          EXPORTING
            it_mrcp_operation_key = lt_mrcp_operation_key
          IMPORTING
            et_message            = lt_message
        ).
        me->change_messages(
          EXPORTING
            iv_index    = ls_index_failed-index
            it_message  = lt_message
          CHANGING
            ct_message  = et_message
            cv_severity = ev_severity ).

        IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
          APPEND ls_index_failed TO et_index_failed.
          CONTINUE.
        ENDIF.

      ELSE.

        " Master Recipe does not exist
        MESSAGE e010(/plmi/al_gss_mrcp) WITH ls_mrcp_key-plnnr ls_mrcp_key-plnal INTO me->gv_msg.

        /plmb/cl_rcp_message=>add_message(
          CHANGING
            ct_message     =  et_message
            cv_severity    =  ev_severity
        ).

        APPEND ls_index_failed TO et_index_failed.

        CONTINUE.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.


METHOD DELETE_OPERATION.

  DATA:
    ls_mrcp_operation_key TYPE /plmi/s_mrcp_operation_key,
    ls_mrcp_phase_key     TYPE /plmi/s_mrcp_phase_key,
    lt_mrcp_phase_key     TYPE /plmi/t_mrcp_phase_key,
    ls_mrcp_resource_key  TYPE /plmi/s_mrcp_resource_key,
    lt_mrcp_resource_key  TYPE /plmi/t_mrcp_resource_key,
    ls_mrcp_rsc_key       TYPE /plmi/s_mrcp_rsc_key,
    lt_mrcp_rsc_key       TYPE /plmi/t_mrcp_rsc_key,
    ls_mrcp_key           TYPE /plmi/s_mrcp_key,
    ls_index_failed       TYPE /plmb/s_spi_index_failed,
    lt_message            TYPE /plmb/t_spi_msg
    .

  FIELD-SYMBOLS:
    <ls_buffer>           TYPE ty_mrcp_buffer,
    <ls_operation_mod>    TYPE ty_mrcp_operation_mod,
    <ls_phase_mod>        TYPE ty_mrcp_phase_mod,
    <ls_resource_mod>     TYPE ty_mrcp_resource_mod,
    <ls_rsc_mod>          TYPE ty_mrcp_rsc_mod
    .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Delete operation and the related child objects
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_operation_key INTO ls_mrcp_operation_key.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_operation_mod>.

    CLEAR ls_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_operation_key TO ls_mrcp_key.
    me->buffer_recipe(
      EXPORTING
        iv_plnnr = ls_mrcp_operation_key-plnnr
        iv_plnal = ls_mrcp_operation_key-plnal
        iv_datuv = ls_mrcp_operation_key-datuv
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_operation_key-plnnr
               plnal = ls_mrcp_operation_key-plnal
               datuv = ls_mrcp_operation_key-datuv.

    " check operation existence
    READ TABLE <ls_buffer>-operation ASSIGNING <ls_operation_mod>
      WITH KEY  plnnr = ls_mrcp_operation_key-plnnr
                plnal = ls_mrcp_operation_key-plnal
                plnkn = ls_mrcp_operation_key-plnkn.

    IF <ls_operation_mod> IS ASSIGNED.

      IF <ls_operation_mod>-mod_flg EQ me->gc_mod_flag_delete.
        CONTINUE.
      ENDIF.

      " Delete child objects
      CLEAR: lt_mrcp_phase_key, lt_mrcp_resource_key, lt_mrcp_rsc_key.

      " Delete related phases
      LOOP AT <ls_buffer>-phase ASSIGNING <ls_phase_mod>
        WHERE pvzkn EQ ls_mrcp_operation_key-plnkn.
        ls_mrcp_phase_key-plnnr = <ls_phase_mod>-plnnr.
        ls_mrcp_phase_key-plnal = <ls_phase_mod>-plnal.
        ls_mrcp_phase_key-aennr = <ls_phase_mod>-aennr.
        ls_mrcp_phase_key-datuv = ls_mrcp_operation_key-datuv.
        ls_mrcp_phase_key-plnkn = <ls_phase_mod>-plnkn.
        APPEND ls_mrcp_phase_key TO lt_mrcp_phase_key.
      ENDLOOP.

      me->delete_phase(
        EXPORTING
          it_mrcp_phase_key = lt_mrcp_phase_key
        IMPORTING
          et_message        = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      " Delete secondary resources
      LOOP AT <ls_buffer>-resource ASSIGNING <ls_resource_mod>
        WHERE sumnr EQ ls_mrcp_operation_key-plnkn.
        ls_mrcp_resource_key-plnnr = <ls_resource_mod>-plnnr.
        ls_mrcp_resource_key-plnal = <ls_resource_mod>-plnal.
        ls_mrcp_resource_key-aennr = <ls_resource_mod>-aennr.
        ls_mrcp_resource_key-datuv = ls_mrcp_operation_key-datuv.
        ls_mrcp_resource_key-plnkn = <ls_resource_mod>-plnkn.
        APPEND ls_mrcp_resource_key TO lt_mrcp_resource_key.
      ENDLOOP.

      me->delete_resource(
        EXPORTING
          it_mrcp_resource_key = lt_mrcp_resource_key
        IMPORTING
          et_message           = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      " Delete resource selection criteria
      LOOP AT <ls_buffer>-rsc ASSIGNING <ls_rsc_mod>
        WHERE plnkn EQ ls_mrcp_operation_key-plnkn.
        ls_mrcp_rsc_key-plnnr = <ls_rsc_mod>-plnnr.
        ls_mrcp_rsc_key-plnal = <ls_rsc_mod>-plnal.
        ls_mrcp_rsc_key-datuv = ls_mrcp_operation_key-datuv.
        ls_mrcp_rsc_key-plnkn = <ls_rsc_mod>-plnkn.
        APPEND ls_mrcp_rsc_key TO lt_mrcp_rsc_key.
      ENDLOOP.

      me->delete_rsc(
        EXPORTING
          it_mrcp_rsc_key = lt_mrcp_rsc_key
        IMPORTING
          et_message      = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      " Shift sequence numbers accordingly
      me->shift_sequence(
        EXPORTING
          iv_type           = gs_c_mrcp_subobj_type-operation
          is_from           = <ls_operation_mod>
          iv_backwards      = abap_true
          iv_including_from = abap_false " otherwise it might would drop to zero
          iv_plnnr          = ls_mrcp_operation_key-plnnr
          iv_plnal          = ls_mrcp_operation_key-plnal
          iv_datuv          = ls_mrcp_operation_key-datuv
        IMPORTING
          et_message    = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      IF <ls_operation_mod>-mod_flg EQ me->gc_mod_flag_insert.

        DELETE <ls_buffer>-operation WHERE plnkn = ls_mrcp_operation_key-plnkn.

      ELSE.

        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-operation       " Object Type
            is_mrcp_key    = ls_mrcp_key        " Master Recipe Key
            is_mrcp_object = <ls_operation_mod> " Master Recipe Object
        ).

        " update operation in the buffer, set deletion flag
        <ls_operation_mod>-loekz = abap_true.
        <ls_operation_mod>-mod_flg = me->gc_mod_flag_delete.

      ENDIF.

    ELSE.

      " Operation does not exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-003 ls_mrcp_operation_key-plnnr ls_mrcp_operation_key-plnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        CHANGING
          ct_message     =  et_message
          cv_severity    =  ev_severity
      ).

      APPEND ls_index_failed TO et_index_failed.

      CONTINUE.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD DELETE_PHASE.

  DATA:
    ls_mrcp_phase_key     TYPE /plmi/s_mrcp_phase_key,
    ls_mrcp_pi_key        TYPE /plmi/s_mrcp_pi_key,
    lt_mrcp_pi_key        TYPE /plmi/t_mrcp_pi_key,
    ls_mrcp_resource_key  TYPE /plmi/s_mrcp_resource_key,
    lt_mrcp_resource_key  TYPE /plmi/t_mrcp_resource_key,
    ls_mrcp_key           TYPE /plmi/s_mrcp_key,
    ls_index_failed       TYPE /plmb/s_spi_index_failed,
    lt_message            TYPE /plmb/t_spi_msg
    .

  FIELD-SYMBOLS:
    <ls_buffer>           TYPE ty_mrcp_buffer,
    <ls_phase_mod>        TYPE ty_mrcp_phase_mod,
    <ls_pi_mod>           TYPE ty_mrcp_pi_mod,
    <ls_resource_mod>     TYPE ty_mrcp_resource_mod.

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Delete phase and the related child objects
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_phase_key INTO ls_mrcp_phase_key.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_phase_mod>.

    CLEAR ls_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_phase_key TO ls_mrcp_key.
    me->buffer_recipe(
      EXPORTING
        iv_plnnr = ls_mrcp_phase_key-plnnr
        iv_plnal = ls_mrcp_phase_key-plnal
        iv_datuv = ls_mrcp_phase_key-datuv
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_phase_key-plnnr
               plnal = ls_mrcp_phase_key-plnal
               datuv = ls_mrcp_phase_key-datuv.

    " check phase existence
    READ TABLE <ls_buffer>-phase ASSIGNING <ls_phase_mod>
      WITH KEY  plnnr = ls_mrcp_phase_key-plnnr
                plnal = ls_mrcp_phase_key-plnal
                plnkn = ls_mrcp_phase_key-plnkn.

    IF <ls_phase_mod> IS ASSIGNED.

      IF <ls_phase_mod>-mod_flg EQ me->gc_mod_flag_delete.
        CONTINUE.
      ENDIF.

      " Delete child objects
      CLEAR: lt_mrcp_pi_key, lt_mrcp_resource_key.

      " Delete related process instructions
      LOOP AT <ls_buffer>-pi ASSIGNING <ls_pi_mod>
        WHERE plnkn EQ ls_mrcp_phase_key-plnkn.
        ls_mrcp_pi_key-plnnr = <ls_pi_mod>-plnnr.
        ls_mrcp_pi_key-plnal = <ls_pi_mod>-plnal.
        ls_mrcp_pi_key-aennr = <ls_pi_mod>-aennr.
        ls_mrcp_pi_key-datuv = ls_mrcp_phase_key-datuv.
        ls_mrcp_pi_key-plnkn = <ls_pi_mod>-plnkn.
        ls_mrcp_pi_key-plnft = <ls_pi_mod>-plnft.
        APPEND ls_mrcp_pi_key TO lt_mrcp_pi_key.
      ENDLOOP.

      me->delete_pi(
        EXPORTING
          it_mrcp_pi_key  = lt_mrcp_pi_key
        IMPORTING
          et_message      = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      " Delete secondary resources
      LOOP AT <ls_buffer>-resource ASSIGNING <ls_resource_mod>
        WHERE sumnr EQ ls_mrcp_phase_key-plnkn.
        ls_mrcp_resource_key-plnnr = <ls_resource_mod>-plnnr.
        ls_mrcp_resource_key-plnal = <ls_resource_mod>-plnal.
        ls_mrcp_resource_key-aennr = <ls_resource_mod>-aennr.
        ls_mrcp_resource_key-datuv = ls_mrcp_phase_key-datuv.
        ls_mrcp_resource_key-plnkn = <ls_resource_mod>-plnkn.
        APPEND ls_mrcp_resource_key TO lt_mrcp_resource_key.
      ENDLOOP.

      me->delete_resource(
        EXPORTING
          it_mrcp_resource_key = lt_mrcp_resource_key
        IMPORTING
          et_message           = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      " set sequence numbers accordingly
      me->shift_sequence(
        EXPORTING
          iv_type           = gs_c_mrcp_subobj_type-phase
          is_from           = <ls_phase_mod>
          iv_backwards      = abap_true
          iv_including_from = abap_false
          iv_plnnr          = ls_mrcp_phase_key-plnnr
          iv_plnal          = ls_mrcp_phase_key-plnal
          iv_datuv          = ls_mrcp_phase_key-datuv
        IMPORTING
          et_message = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      IF <ls_phase_mod>-mod_flg EQ me->gc_mod_flag_insert.

        DELETE <ls_buffer>-phase WHERE plnkn = ls_mrcp_phase_key-plnkn.

      ELSE.

        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-phase       " Object Type
            is_mrcp_key    = ls_mrcp_key    " Master Recipe Key
            is_mrcp_object = <ls_phase_mod> " Master Recipe Object
        ).

        " update phase in the buffer, set deletion flag
        <ls_phase_mod>-loekz = abap_true.
        <ls_phase_mod>-mod_flg = me->gc_mod_flag_delete.

      ENDIF.

    ELSE.

      " Phase does not exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-004 ls_mrcp_phase_key-plnnr ls_mrcp_phase_key-plnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        CHANGING
          ct_message     =  et_message
          cv_severity    =  ev_severity
      ).

      APPEND ls_index_failed TO et_index_failed.

      CONTINUE.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD DELETE_PI.

  DATA:
    ls_mrcp_pi_key          TYPE /plmi/s_mrcp_pi_key,
    ls_mrcp_pi_char_val_key TYPE /plmi/s_mrcp_pi_char_val_key,
    lt_mrcp_pi_char_val_key TYPE /plmi/t_mrcp_pi_char_val_key,
    ls_mrcp_key             TYPE /plmi/s_mrcp_key,
    ls_index_failed         TYPE /plmb/s_spi_index_failed,
    lt_message              TYPE /plmb/t_spi_msg
    .

  FIELD-SYMBOLS:
    <ls_buffer>             TYPE ty_mrcp_buffer,
    <ls_pi_mod>             TYPE ty_mrcp_pi_mod,
    <ls_pi_char_val_mod>    TYPE ty_mrcp_pi_char_val_mod
    .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Delete PI and the related child objects
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_pi_key INTO ls_mrcp_pi_key.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_pi_mod>.

    CLEAR ls_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_pi_key TO ls_mrcp_key.
    me->buffer_recipe(
      EXPORTING
        iv_plnnr = ls_mrcp_pi_key-plnnr
        iv_plnal = ls_mrcp_pi_key-plnal
        iv_datuv = ls_mrcp_pi_key-datuv
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_pi_key-plnnr
               plnal = ls_mrcp_pi_key-plnal
               datuv = ls_mrcp_pi_key-datuv.

    " check PI existence
    READ TABLE <ls_buffer>-pi ASSIGNING <ls_pi_mod>
      WITH KEY  plnnr = ls_mrcp_pi_key-plnnr
                plnal = ls_mrcp_pi_key-plnal
                plnkn = ls_mrcp_pi_key-plnkn
                plnft = ls_mrcp_pi_key-plnft.

    IF <ls_pi_mod> IS ASSIGNED.

      IF <ls_pi_mod>-mod_flg EQ me->gc_mod_flag_delete.
        CONTINUE.
      ENDIF.

      " Delete child objects
      CLEAR: lt_mrcp_pi_char_val_key.

      " Delete related proc. instr. char. val.
      LOOP AT <ls_buffer>-pi_char_val ASSIGNING <ls_pi_char_val_mod>
         WHERE  plnkn EQ ls_mrcp_pi_key-plnkn AND
                plnft EQ ls_mrcp_pi_key-plnft.
        ls_mrcp_pi_char_val_key-plnnr = <ls_pi_char_val_mod>-plnnr.
        ls_mrcp_pi_char_val_key-plnal = <ls_pi_char_val_mod>-plnal.
        ls_mrcp_pi_char_val_key-aennr = <ls_pi_char_val_mod>-aennr.
        ls_mrcp_pi_char_val_key-datuv = ls_mrcp_pi_key-datuv.
        ls_mrcp_pi_char_val_key-plnkn = <ls_pi_char_val_mod>-plnkn.
        ls_mrcp_pi_char_val_key-plnft = <ls_pi_char_val_mod>-plnft.
        ls_mrcp_pi_char_val_key-mkmzl = <ls_pi_char_val_mod>-mkmzl.
        APPEND ls_mrcp_pi_char_val_key TO lt_mrcp_pi_char_val_key.
      ENDLOOP.

      me->delete_pi_char_val(
        EXPORTING
          it_mrcp_pi_char_val_key = lt_mrcp_pi_char_val_key
        IMPORTING
          et_message              = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      " Set sequence numbers accordingly
      me->shift_sequence(
        EXPORTING
          iv_type           = gs_c_mrcp_subobj_type-pi
          is_from           = <ls_pi_mod>
          iv_backwards      = abap_true
          iv_including_from = abap_false
          iv_plnnr          = ls_mrcp_pi_key-plnnr
          iv_plnal          = ls_mrcp_pi_key-plnal
          iv_datuv          = ls_mrcp_pi_key-datuv
        IMPORTING
          et_message = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      IF <ls_pi_mod>-mod_flg EQ me->gc_mod_flag_insert.

        DELETE <ls_buffer>-pi WHERE plnkn = ls_mrcp_pi_key-plnkn AND plnft = ls_mrcp_pi_key-plnft.

      ELSE.

        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-pi        " Object Type
            is_mrcp_key    = ls_mrcp_key  " Master Recipe Key
            is_mrcp_object = <ls_pi_mod>  " Master Recipe Object
        ).

        " update PI in the buffer, set deletion flag
        <ls_pi_mod>-loekz = abap_true.
        <ls_pi_mod>-mod_flg = me->gc_mod_flag_delete.

      ENDIF.

    ELSE.

      " PI does not exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-005 ls_mrcp_pi_key-plnnr ls_mrcp_pi_key-plnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        CHANGING
          ct_message     =  et_message
          cv_severity    =  ev_severity
      ).

      APPEND ls_index_failed TO et_index_failed.

      CONTINUE.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD DELETE_PI_CHAR_VAL.

  DATA:
    ls_mrcp_pi_char_val_key TYPE /plmi/s_mrcp_pi_char_val_key,
    ls_mrcp_key             TYPE /plmi/s_mrcp_key,
    ls_index_failed         TYPE /plmb/s_spi_index_failed,
    lt_message              TYPE /plmb/t_spi_msg
    .

  FIELD-SYMBOLS:
    <ls_buffer>             TYPE ty_mrcp_buffer,
    <ls_pi_char_val_mod>    TYPE ty_mrcp_pi_char_val_mod.

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Delete PI Char. Val.
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_pi_char_val_key INTO ls_mrcp_pi_char_val_key.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_pi_char_val_mod>.

    CLEAR ls_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_pi_char_val_key TO ls_mrcp_key.
    me->buffer_recipe(
      EXPORTING
        iv_plnnr = ls_mrcp_pi_char_val_key-plnnr
        iv_plnal = ls_mrcp_pi_char_val_key-plnal
        iv_datuv = ls_mrcp_pi_char_val_key-datuv
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_pi_char_val_key-plnnr
               plnal = ls_mrcp_pi_char_val_key-plnal
               datuv = ls_mrcp_pi_char_val_key-datuv.

    " check PI Char. Val. existence
    READ TABLE <ls_buffer>-pi_char_val ASSIGNING <ls_pi_char_val_mod>
      WITH KEY  plnnr = ls_mrcp_pi_char_val_key-plnnr
                plnal = ls_mrcp_pi_char_val_key-plnal
                plnkn = ls_mrcp_pi_char_val_key-plnkn
                plnft = ls_mrcp_pi_char_val_key-plnft
                mkmzl = ls_mrcp_pi_char_val_key-mkmzl.

    IF <ls_pi_char_val_mod> IS ASSIGNED.

      IF <ls_pi_char_val_mod>-mod_flg EQ me->gc_mod_flag_delete.
        CONTINUE.
      ENDIF.

      " set sequence numbers accordingly
      me->shift_sequence(
        EXPORTING
          iv_type           = gs_c_mrcp_subobj_type-pi_cv
          is_from           = <ls_pi_char_val_mod>
          iv_backwards      = abap_true
          iv_including_from = abap_false
          iv_plnnr          = ls_mrcp_pi_char_val_key-plnnr
          iv_plnal          = ls_mrcp_pi_char_val_key-plnal
          iv_datuv          = ls_mrcp_pi_char_val_key-datuv
        IMPORTING
          et_message = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      IF <ls_pi_char_val_mod>-mod_flg EQ me->gc_mod_flag_insert.

        DELETE <ls_buffer>-pi_char_val WHERE plnkn = ls_mrcp_pi_char_val_key-plnkn AND plnft = ls_mrcp_pi_char_val_key-plnft AND mkmzl = ls_mrcp_pi_char_val_key-mkmzl.

      ELSE.

        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-pi_cv       " Object Type
            is_mrcp_key    = ls_mrcp_key          " Master Recipe Key
            is_mrcp_object = <ls_pi_char_val_mod> " Master Recipe Object
        ).

        " update PI Char. Val. in the buffer, set deletion flag
        <ls_pi_char_val_mod>-loekz = abap_true.
        <ls_pi_char_val_mod>-mod_flg = me->gc_mod_flag_delete.

      ENDIF.

    ELSE.

      " PI Char. Val. does not exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-006 ls_mrcp_pi_char_val_key-plnnr ls_mrcp_pi_char_val_key-plnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        CHANGING
          ct_message     =  et_message
          cv_severity    =  ev_severity
      ).

      APPEND ls_index_failed TO et_index_failed.

      CONTINUE.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD DELETE_RESOURCE.

  DATA:
    ls_mrcp_resource_key  TYPE /plmi/s_mrcp_resource_key,
    ls_mrcp_key           TYPE /plmi/s_mrcp_key,
    ls_index_failed       TYPE /plmb/s_spi_index_failed,
    lt_message            TYPE /plmb/t_spi_msg
    .

  FIELD-SYMBOLS:
    <ls_buffer>           TYPE ty_mrcp_buffer,
    <ls_resource_mod>     TYPE ty_mrcp_resource_mod.

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Delete Resource
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_resource_key INTO ls_mrcp_resource_key.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_resource_mod>.

    CLEAR ls_mrcp_key.
    MOVE-CORRESPONDING ls_mrcp_resource_key TO ls_mrcp_key.
    me->buffer_recipe(
      EXPORTING
        iv_plnnr = ls_mrcp_resource_key-plnnr
        iv_plnal = ls_mrcp_resource_key-plnal
        iv_datuv = ls_mrcp_resource_key-datuv
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_resource_key-plnnr
               plnal = ls_mrcp_resource_key-plnal
               datuv = ls_mrcp_resource_key-datuv.

    " check resource existence
    READ TABLE <ls_buffer>-resource ASSIGNING <ls_resource_mod>
      WITH KEY  plnnr = ls_mrcp_resource_key-plnnr
                plnal = ls_mrcp_resource_key-plnal
                plnkn = ls_mrcp_resource_key-plnkn.

    IF <ls_resource_mod> IS ASSIGNED.

      IF <ls_resource_mod>-mod_flg EQ me->gc_mod_flag_delete.
        CONTINUE.
      ENDIF.

      " Set sequence numbers accordingly
      me->shift_sequence(
        EXPORTING
          iv_type           = gs_c_mrcp_subobj_type-resource
          is_from           = <ls_resource_mod>
          iv_including_from = abap_false
          iv_backwards      = abap_true
          iv_plnnr          = ls_mrcp_resource_key-plnnr
          iv_plnal          = ls_mrcp_resource_key-plnal
          iv_datuv          = ls_mrcp_resource_key-datuv
        IMPORTING
          et_message        = lt_message
      ).

      me->change_messages(
        EXPORTING
          iv_index    = ls_index_failed-index
          it_message  = lt_message
        CHANGING
          ct_message  = et_message
          cv_severity = ev_severity ).

      IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

      IF <ls_resource_mod>-mod_flg EQ me->gc_mod_flag_insert.

        DELETE <ls_buffer>-resource WHERE plnkn = ls_mrcp_resource_key-plnkn.

      ELSE.

        " previous version has to be stored in buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-resource        " Object Type
            is_mrcp_key    = ls_mrcp_key        " Master Recipe Key
            is_mrcp_object = <ls_resource_mod>  " Master Recipe Object
        ).

        " update resource in the buffer, set deletion flag
        <ls_resource_mod>-loekz = abap_true.
        <ls_resource_mod>-mod_flg = me->gc_mod_flag_delete.

      ENDIF.

    ELSE.

      " Resource does not exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-007 ls_mrcp_resource_key-plnnr ls_mrcp_resource_key-plnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        CHANGING
          ct_message     =  et_message
          cv_severity    =  ev_severity
      ).

      APPEND ls_index_failed TO et_index_failed.

      CONTINUE.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD DELETE_RSC.

  DATA:
    ls_mrcp_rsc_key       TYPE /plmi/s_mrcp_rsc_key,
    ls_index_failed       TYPE /plmb/s_spi_index_failed,
    lt_message            TYPE /plmb/t_spi_msg
    .

  FIELD-SYMBOLS:
    <ls_buffer>           TYPE ty_mrcp_buffer,
    <ls_rsc_mod>          TYPE ty_mrcp_rsc_mod.

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Delete RSC
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_rsc_key INTO ls_mrcp_rsc_key.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_rsc_mod>.

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = ls_mrcp_rsc_key-plnnr
        iv_plnal = ls_mrcp_rsc_key-plnal
        iv_datuv = ls_mrcp_rsc_key-datuv
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_rsc_key-plnnr
               plnal = ls_mrcp_rsc_key-plnal
               datuv = ls_mrcp_rsc_key-datuv.

    " check RSC existence
    READ TABLE <ls_buffer>-rsc ASSIGNING <ls_rsc_mod>
      WITH KEY  plnnr = ls_mrcp_rsc_key-plnnr
                plnal = ls_mrcp_rsc_key-plnal
                plnkn = ls_mrcp_rsc_key-plnkn.

    IF <ls_rsc_mod> IS ASSIGNED.

      IF <ls_rsc_mod>-mod_flg EQ me->gc_mod_flag_insert.
        DELETE <ls_buffer>-rsc WHERE plnkn = ls_mrcp_rsc_key-plnkn.
      ELSEIF <ls_rsc_mod>-mod_flg EQ me->gc_mod_flag_delete.
        CONTINUE.
      ELSE.
        " update RSC in the buffer, set deletion flag
        CLEAR <ls_rsc_mod>-char_val.
        <ls_rsc_mod>-mod_flg = me->gc_mod_flag_delete.

      ENDIF.

    ELSE.

      " RSC does not exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-008 ls_mrcp_rsc_key-plnnr ls_mrcp_rsc_key-plnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        CHANGING
          ct_message     =  et_message
          cv_severity    =  ev_severity
      ).

      APPEND ls_index_failed TO et_index_failed.

      CONTINUE.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


  method GET_DEFAULT_VALUES_WORKCENTER.
* 2633669 - Transfer of the default value into the master recipe
    DATA: lv_arbpl      TYPE arbpl,
          ls_t430       TYPE t430,
          ls_rcr01      TYPE rcr01.

*----------------------------------------------------------------------
    IF cs_plpod-arbid IS NOT INITIAL AND
       cs_plpod-arbpl IS INITIAL.
* Get workcenter
      CALL FUNCTION 'CR_WORKSTATION_READ'
        EXPORTING
          id        = cs_plpod-arbid
        IMPORTING
          arbpl     =  lv_arbpl
        EXCEPTIONS
          not_found = 1
          OTHERS    = 2.

      IF sy-subrc = 0.
        cs_plpod-arbpl = lv_arbpl.
      ENDIF.
    ENDIF.

    IF cs_plpod-arbpl IS NOT INITIAL.
* Check workcenter along with task list type
      CALL FUNCTION 'CR_WORKSTATION_READ_ROUTING'
        EXPORTING
          arbpl             = cs_plpod-arbpl
          plnty             = cs_plpod-plnty
          werks             = cs_plpod-werks
          plnty_chk_allowed = abap_true
        IMPORTING
          works             = ls_rcr01
        EXCEPTIONS
          not_found         = 1
          type_not_allowed  = 2
          wrong_parameters  = 3
          OTHERS            = 4.

      IF sy-subrc = 0.
* Reference
        CALL FUNCTION 'CP_PLPO_RCR01_REFERENCE_FILL'
          EXPORTING
            plpod_imp = cs_plpod
            rcr01_imp = ls_rcr01
          IMPORTING
            plpod_exp = cs_plpod.

* Fill operation with standard values from workcenter
        CALL FUNCTION 'CP_PLPOD_RCR01_DEFAULT_FILL'
          EXPORTING
            plpod_imp = cs_plpod
            rcr01_imp = ls_rcr01
          IMPORTING
            plpod_exp = cs_plpod.
      ENDIF.
    ENDIF.

* Get Costing relevance indicator from control key
    IF cs_plpod-steus IS NOT INITIAL AND
       cs_plpod-plnty EQ gc_plnty_mrcp AND
       ( cs_plpod-phflg EQ abap_true     OR      "phase
         cs_plpod-sumnr IS NOT INITIAL ).        "sec.res.
      CALL FUNCTION 'T430_READ'
        EXPORTING
          steus    = cs_plpod-steus
        IMPORTING
          struct   = ls_t430
        EXCEPTIONS
          no_entry = 1
          others   = 2.

      IF sy-subrc = 0.
        MOVE ls_t430-kalkz TO cs_plpod-ckselkz.
      ENDIF.
    ENDIF.

  endmethod.


METHOD GET_DETAILS.

  DATA:
    lt_mrcp_key               TYPE /plmi/t_mrcp_key,
    ls_mrcp_key               TYPE /plmi/s_mrcp_key,
    ls_mrcp_details           TYPE /plmi/s_mrcp_details,
    ls_mrcp_operation         TYPE /plmi/s_mrcp_operation,
    ls_mrcp_phase             TYPE /plmi/s_mrcp_phase,
    ls_mrcp_pi                TYPE /plmi/s_mrcp_pi,
    ls_mrcp_pi_cv             TYPE /plmi/s_mrcp_pi_char_val,
    ls_mrcp_resource          TYPE /plmi/s_mrcp_resource,
    ls_mrcp_rsc               TYPE /plmi/s_mrcp_rsc,
    ls_mrcp_prodver           TYPE /plmi/s_mrcp_prodver,
    ls_mrcp_mat_assignment    TYPE /plmi/s_mrcp_mat_assignment,
    lt_mrcp_existence         TYPE gty_t_mrcp_existence,
    lv_verid                  TYPE verid,
    ls_index_failed           TYPE /plmb/s_spi_index_failed,
    lt_message                TYPE /plmb/t_spi_msg
    .

  FIELD-SYMBOLS:
    <ls_mrcp_key>             TYPE /plmi/s_mrcp_key,
    <ls_mrcp_existence>       TYPE gty_s_mrcp_existence,
    <ls_mrcp_buffer>          TYPE ty_mrcp_buffer,
    <ls_mrcp_prodver_mod>     TYPE ty_mrcp_prodver_mod,
    <ls_mrcp_mat_assign_mod>  TYPE ty_mrcp_mat_assign_mod,
    <ls_mrcp_operation_mod>   TYPE ty_mrcp_operation_mod,
    <ls_mrcp_phase_mod>       TYPE ty_mrcp_phase_mod,
    <ls_mrcp_pi_mod>          TYPE ty_mrcp_pi_mod,
    <ls_mrcp_pi_cv_mod>       TYPE ty_mrcp_pi_char_val_mod,
    <ls_mrcp_resource_mod>    TYPE ty_mrcp_resource_mod,
    <ls_mrcp_rsc_mod>         TYPE ty_mrcp_rsc_mod,
    <ls_mrcp_verid>           TYPE /plmi/cl_gss_mrcp=>ty_mrcp_verid
    .

  CHECK it_mrcp_key IS NOT INITIAL.

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_mrcp, et_message, ev_severity, et_index_failed.

*--------------------------------------------------------------------*
* Read data for each existing master recipe
*--------------------------------------------------------------------*

  LOOP AT it_mrcp_key ASSIGNING <ls_mrcp_key>.

    ls_index_failed-index = sy-tabix.


    READ TABLE it_mrcp_verid WITH KEY plnnr = <ls_mrcp_key>-plnnr "2191166
                                      plnal = <ls_mrcp_key>-plnal
                                      datuv = <ls_mrcp_key>-datuv
                                      aennr = <ls_mrcp_key>-aennr
                                      ASSIGNING <ls_mrcp_verid>.
    IF sy-subrc IS INITIAL.
      lv_verid = <ls_mrcp_verid>-verid.
    ELSE.
      CLEAR lv_verid.
    ENDIF.                                                        "2191166

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = <ls_mrcp_key>-plnnr
        iv_plnal = <ls_mrcp_key>-plnal
        iv_datuv = <ls_mrcp_key>-datuv
        iv_aennr = <ls_mrcp_key>-aennr
        iv_verid = lv_verid                                       "2191166
        iv_lock  = iv_lock
      IMPORTING
        et_message = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    READ TABLE me->mt_buffer ASSIGNING <ls_mrcp_buffer>
      WITH TABLE KEY plnnr = <ls_mrcp_key>-plnnr
                     plnal = <ls_mrcp_key>-plnal
                     datuv = <ls_mrcp_key>-datuv.

    ls_index_failed-index = sy-tabix.

    IF iv_only_from_db EQ abap_true. " Read master recipe from DB only -> check existence in DB

      CLEAR: lt_mrcp_key, ls_mrcp_key.
      ls_mrcp_key-plnnr = <ls_mrcp_buffer>-plnnr.
      ls_mrcp_key-plnal = <ls_mrcp_buffer>-plnal.
      ls_mrcp_key-datuv = <ls_mrcp_buffer>-datuv.
      APPEND ls_mrcp_key TO lt_mrcp_key.

      me->check_existence(
        EXPORTING
          it_mrcp_key       = lt_mrcp_key
        IMPORTING
          et_mrcp_existence = lt_mrcp_existence
      ).

      READ TABLE lt_mrcp_existence INDEX 1 ASSIGNING <ls_mrcp_existence>.

      IF <ls_mrcp_existence>-exists EQ abap_false.
        " Master recipe does not exist
        MESSAGE e010(/plmi/al_gss_mrcp) WITH <ls_mrcp_buffer>-plnnr <ls_mrcp_buffer>-plnal INTO me->gv_msg.
        /plmb/cl_rcp_message=>add_message(
          CHANGING
            ct_message     =  et_message
            cv_severity    =  ev_severity
        ).
        APPEND ls_index_failed TO et_index_failed.
        CONTINUE.
      ENDIF.

    ENDIF.

    CLEAR ls_mrcp_details.

    " Key & Header
    IF <ls_mrcp_buffer>-header-mod_flg NE me->gc_mod_flag_delete.
      ls_mrcp_details-plnnr = <ls_mrcp_buffer>-plnnr.
      ls_mrcp_details-plnal = <ls_mrcp_buffer>-plnal.
      ls_mrcp_details-datuv = <ls_mrcp_buffer>-datuv.
      ls_mrcp_details-aennr = <ls_mrcp_buffer>-aennr.
      MOVE-CORRESPONDING <ls_mrcp_buffer>-header TO ls_mrcp_details-header ##ENH_OK.
    ENDIF.

    " Production Versions
    LOOP AT <ls_mrcp_buffer>-prodver ASSIGNING <ls_mrcp_prodver_mod>
      WHERE mod_flg <> me->gc_mod_flag_delete.

      MOVE-CORRESPONDING <ls_mrcp_prodver_mod> TO ls_mrcp_prodver.
      APPEND ls_mrcp_prodver TO ls_mrcp_details-prodver.
      CLEAR ls_mrcp_prodver.

    ENDLOOP.

    " Material Assignments
    LOOP AT <ls_mrcp_buffer>-mat_assignment ASSIGNING <ls_mrcp_mat_assign_mod>
      WHERE mod_flg <> me->gc_mod_flag_delete.

      MOVE-CORRESPONDING <ls_mrcp_mat_assign_mod> TO ls_mrcp_mat_assignment ##ENH_OK.
      APPEND ls_mrcp_mat_assignment TO ls_mrcp_details-mat_assignment.

    ENDLOOP.

    " Operations
    LOOP AT <ls_mrcp_buffer>-operation ASSIGNING <ls_mrcp_operation_mod>
      WHERE mod_flg <> me->gc_mod_flag_delete.

      MOVE-CORRESPONDING <ls_mrcp_operation_mod> TO ls_mrcp_operation.
      APPEND ls_mrcp_operation TO ls_mrcp_details-operation.

    ENDLOOP.

    " Phases
    LOOP AT <ls_mrcp_buffer>-phase ASSIGNING <ls_mrcp_phase_mod>
      WHERE mod_flg <> me->gc_mod_flag_delete.

      MOVE-CORRESPONDING <ls_mrcp_phase_mod> TO ls_mrcp_phase.
      APPEND ls_mrcp_phase TO ls_mrcp_details-phase.

    ENDLOOP.

    " Process instructions
    LOOP AT <ls_mrcp_buffer>-pi ASSIGNING <ls_mrcp_pi_mod>
      WHERE mod_flg <> me->gc_mod_flag_delete.

      MOVE-CORRESPONDING <ls_mrcp_pi_mod> TO ls_mrcp_pi.
      APPEND ls_mrcp_pi TO ls_mrcp_details-proc_instr.

    ENDLOOP.

    " PI characteristics
    LOOP AT <ls_mrcp_buffer>-pi_char_val ASSIGNING <ls_mrcp_pi_cv_mod>
      WHERE mod_flg <> me->gc_mod_flag_delete.

      MOVE-CORRESPONDING <ls_mrcp_pi_cv_mod> TO ls_mrcp_pi_cv.
      APPEND ls_mrcp_pi_cv TO ls_mrcp_details-pi_char_val.

    ENDLOOP.

    " Resources
    LOOP AT <ls_mrcp_buffer>-resource ASSIGNING <ls_mrcp_resource_mod>
      WHERE mod_flg <> me->gc_mod_flag_delete.

      MOVE-CORRESPONDING <ls_mrcp_resource_mod> TO ls_mrcp_resource.
      APPEND ls_mrcp_resource TO ls_mrcp_details-resource.
    ENDLOOP.

    " Resource Selection Criteria
    LOOP AT <ls_mrcp_buffer>-rsc ASSIGNING <ls_mrcp_rsc_mod>
      WHERE mod_flg <> me->gc_mod_flag_delete.

      MOVE-CORRESPONDING <ls_mrcp_rsc_mod> TO ls_mrcp_rsc.
      APPEND ls_mrcp_rsc TO ls_mrcp_details-rsc.
    ENDLOOP.

    APPEND ls_mrcp_details TO et_mrcp.

  ENDLOOP.

ENDMETHOD.


METHOD GET_INSTANCE.

*--------------------------------------------------------------------*
* use singleton pattern
*--------------------------------------------------------------------*
  IF go_mrcp IS NOT BOUND.
    CREATE OBJECT go_mrcp.
  ENDIF.

  ro_mrcp = go_mrcp.

ENDMETHOD.


METHOD GET_INTERNAL_KEY_MAPPING.

*--------------------------------------------------------------------*
* Temporary internal keys are used in ADD_...() methods until save.
* The final ones are generated by lower level function module.
* This method provides the temporary-final internal key mapping after save.
*--------------------------------------------------------------------*

  " PLNKN is the internal key of Operation, Pase and Secondary Resource
  et_plnkn_mapping = me->mt_plnkn_mapping.

  " PLNFT is the internal key of Process Instruction
  et_plnft_mapping = me->mt_plnft_mapping.

  " MKMZL is the internal key of Process Instruction Characteristic Values
  et_mkmzl_mapping = me->mt_mkmzl_mapping.

ENDMETHOD.


METHOD GET_PI.

  DATA:
    ls_mrcp_pi_key          TYPE /plmi/s_mrcp_pi_key,
    ls_index_failed         TYPE /plmb/s_spi_index_failed,
    lt_message              TYPE /plmb/t_spi_msg
    .

  FIELD-SYMBOLS:
    <ls_buffer>             TYPE ty_mrcp_buffer,
    <ls_pi_mod>             TYPE ty_mrcp_pi_mod,
    <ls_pi_char_val_mod>    TYPE ty_mrcp_pi_char_val_mod
    .

*--------------------------------------------------------------------*
* Clear exporting parameters
*-------- ------------------------------------------------------------*
  CLEAR:
   et_pi,
   et_pi_char_val,
   et_message,
   ev_severity,
   et_index_failed.

*--------------------------------------------------------------------*
* Get PI and the related child objects
*--------------------------------------------------------------------*
  LOOP AT it_mrcp_pi_key INTO ls_mrcp_pi_key.

    ls_index_failed-index = sy-tabix.
    UNASSIGN: <ls_buffer>, <ls_pi_mod>.

    me->buffer_recipe(
      EXPORTING
        iv_plnnr = ls_mrcp_pi_key-plnnr
        iv_plnal = ls_mrcp_pi_key-plnal
        iv_datuv = ls_mrcp_pi_key-datuv
      IMPORTING
        et_message  = lt_message ).

    me->change_messages(
      EXPORTING
        iv_index    = ls_index_failed-index
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    " if Master Recipe does not exists or other problem occured then continue
    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      APPEND ls_index_failed TO et_index_failed.
      CONTINUE.
    ENDIF.

    " assign Master Recipe
    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY plnnr = ls_mrcp_pi_key-plnnr
               plnal = ls_mrcp_pi_key-plnal
               datuv = ls_mrcp_pi_key-datuv.

    " check PI existence
    READ TABLE <ls_buffer>-pi ASSIGNING <ls_pi_mod>
      WITH KEY  plnnr = ls_mrcp_pi_key-plnnr
                plnal = ls_mrcp_pi_key-plnal
                plnkn = ls_mrcp_pi_key-plnkn
                plnft = ls_mrcp_pi_key-plnft.

    IF <ls_pi_mod> IS ASSIGNED AND <ls_pi_mod>-mod_flg <> me->gc_mod_flag_delete.

      APPEND <ls_pi_mod> TO et_pi.

      IF iv_whole_subtree = abap_true.
        LOOP AT <ls_buffer>-pi_char_val ASSIGNING <ls_pi_char_val_mod>
           WHERE  plnkn EQ ls_mrcp_pi_key-plnkn AND
                  plnft EQ ls_mrcp_pi_key-plnft.

          APPEND <ls_pi_char_val_mod> TO et_pi_char_val.
        ENDLOOP.
      ENDIF.

    ELSE.

      " PI does not exist
      MESSAGE e011(/plmi/al_gss_mrcp) WITH text-005 ls_mrcp_pi_key-plnnr ls_mrcp_pi_key-plnal INTO me->gv_msg.

      /plmb/cl_rcp_message=>add_message(
        CHANGING
          ct_message     =  et_message
          cv_severity    =  ev_severity
      ).

      APPEND ls_index_failed TO et_index_failed.

      CONTINUE.

    ENDIF.

  ENDLOOP.

ENDMETHOD.


METHOD GET_SEQ_INCREMENT.

  DATA:
        lv_increment  TYPE numc4,
        ls_profile    TYPE ty_profile
        .

  " Clear exporting parameters
  CLEAR: ev_increment, et_message.

  " Try to read if from buffer
  READ TABLE mt_profile WITH TABLE KEY profile = iv_profile INTO ls_profile.

  " If failed then try to read it from customizing and put it to buffer
  IF sy-subrc <> 0.

    ls_profile-profile    = iv_profile.
    TRY.
        /plmb/cl_gss_r2mr_customizing=>get_default_values_for_profile(
          EXPORTING
            iv_profidnetz = ls_profile-profile
          IMPORTING
            ev_vornr_inc    = ls_profile-pe_inc
            ev_ftnr_inc     = ls_profile-pi_inc
            ev_fvnr_inc     = ls_profile-pi_char_val_inc
            ev_resource_inc = ls_profile-resource_inc
        ).
      CATCH /plmb/cx_gss_r2mr_customizing.
        " You have not maintained customizing for profile &1
        MESSAGE w058(/plmi/al_gss_r2mr_su) WITH ls_profile-profile INTO me->gv_msg.
        /plmb/cl_rcp_message=>add_message(
          CHANGING
            ct_message = et_message
        ).
        " In case of no customizing use our default value
        ev_increment = gc_def_seq_inc.
        RETURN.
    ENDTRY.
    APPEND ls_profile TO mt_profile.

  ENDIF.

  " Return value based on type
  CASE iv_type.
    WHEN gs_c_mrcp_subobj_type-operation OR gs_c_mrcp_subobj_type-phase.
      lv_increment = ls_profile-pe_inc.
    WHEN gs_c_mrcp_subobj_type-pi.
      lv_increment = ls_profile-pi_inc.
    WHEN gs_c_mrcp_subobj_type-pi_cv.
      lv_increment = ls_profile-pi_char_val_inc.
    WHEN gs_c_mrcp_subobj_type-resource.
      lv_increment = ls_profile-resource_inc.
    WHEN OTHERS.
      ASSERT 0 = 1.
      "this means that we don't know where to search in the customizing for the increment of this type
  ENDCASE.

  " If value is not maintaned in customizing then use our default value
  IF lv_increment EQ 0000.

    MESSAGE w040(/plmi/al_gss_mrcp) WITH ls_profile-profile INTO me->gv_msg.
    /plmb/cl_rcp_message=>add_message(
      CHANGING
        ct_message = et_message
    ).

    ev_increment = gc_def_seq_inc.
    RETURN.

  ELSE.

    ev_increment = lv_increment.
    RETURN.

  ENDIF.

ENDMETHOD.


METHOD GET_SEQ_NUM.

*--------------------------------------------------------------------*
* The TYPE parameter indicates wether you search for an operation, phase,
* process instruction, process instruction characteristics or resource.
*
* You can either get the sequence number of a specific operation, phase etc.
* by setting the PLNNR, PLNAL and ID parameters,
* OR you can get the first or last element of a node by setting the PLNNR,
* PLNAL and parent parameters.
*
* The IV_GET_LAST is used in the second case, you can set whether you want
* to get the first or last element of the parent element.
*--------------------------------------------------------------------*

  TYPES:
    BEGIN OF lty_seq_num,
      index   TYPE sytabix,
      seq_num TYPE numc4,
      mod_flg TYPE /plmi/gss_mr_mod_flg,
    END OF lty_seq_num.

  DATA:
        lv_id_is_set          TYPE boole_d,
        ls_seq_num            TYPE lty_seq_num,
        lt_seq_num            TYPE STANDARD TABLE OF lty_seq_num,
        lv_sibling_missing    TYPE boole_d.

  FIELD-SYMBOLS:
        <ls_buffer>           TYPE ty_mrcp_buffer,
        <ls_mrcp_operation>   TYPE ty_mrcp_operation_mod,
        <ls_mrcp_phase>       TYPE ty_mrcp_phase_mod,
        <ls_mrcp_pi>          TYPE ty_mrcp_pi_mod,
        <ls_mrcp_pi_char_val> TYPE ty_mrcp_pi_char_val_mod,
        <ls_mrcp_resource>    TYPE ty_mrcp_resource_mod.

  CLEAR: es_item, ev_seq_num, et_message, ev_severity.

  " Check input parameters
  CASE is_id-type.
    WHEN gs_c_mrcp_subobj_type-operation. "Operation
      " No parameter is obligatory in this case
      " It is normal that the parent is not set -> Get first or last element
    WHEN gs_c_mrcp_subobj_type-phase. " Phase
      IF is_id-plnkn IS INITIAL AND is_id-pvzkn IS INITIAL.
        IF iv_get_last EQ abap_true.
          " In case of phase, it is also valid to to get the last one
          " (if you insert a new operation as last one, it shall be inserted after the last phase if its
          " Sequence Number is bigger than the last operations sequence number)
        ELSE.
          ASSERT 0 = 1. " Parameter is missing
        ENDIF.
      ENDIF.
    WHEN gs_c_mrcp_subobj_type-pi. " Process Instruction
      IF is_id-plnft IS INITIAL AND is_id-plnkn IS INITIAL.
        ASSERT 0 = 1. " Parameter is missing
      ENDIF.
    WHEN gs_c_mrcp_subobj_type-pi_cv. " Process Instruction Characteristic
      IF is_id-mkmzl IS INITIAL AND is_id-plnft IS INITIAL.
        ASSERT 0 = 1. " Parameter is missing
      ENDIF.
    WHEN gs_c_mrcp_subobj_type-resource. " Secondary Resource
      IF is_id-plnkn IS INITIAL AND is_id-sumnr IS INITIAL.
        ASSERT 0 = 1. " Parameter is missing
      ENDIF.
    WHEN OTHERS.
      ASSERT 0 = 1. " Not yet supported
  ENDCASE.

*--------------------------------------------------------------------*
* Assigning <ls_buffer> with the needed Master Recipe
*--------------------------------------------------------------------*
  READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
    WITH TABLE KEY plnnr = iv_plnnr
                   plnal = iv_plnal
                   datuv = iv_datuv.

*--------------------------------------------------------------------*
* If sibling is set then check the existence of the reference
* And get the sequence number of the sibling in the meantime
*--------------------------------------------------------------------*
  CASE is_id-type.
    WHEN gs_c_mrcp_subobj_type-operation OR gs_c_mrcp_subobj_type-phase OR gs_c_mrcp_subobj_type-resource. "Operation
      IF is_id-plnkn IS NOT INITIAL.
        lv_id_is_set = abap_true.
      ENDIF.
    WHEN gs_c_mrcp_subobj_type-pi. " Process Instruction
      IF is_id-plnkn IS NOT INITIAL AND is_id-plnft IS NOT INITIAL.
        lv_id_is_set = abap_true.
      ENDIF.
    WHEN gs_c_mrcp_subobj_type-pi_cv. " Process Instruction Characteristic
      IF is_id-plnkn IS NOT INITIAL AND is_id-plnft IS NOT INITIAL AND is_id-mkmzl IS NOT INITIAL.
        lv_id_is_set = abap_true.
      ENDIF.
  ENDCASE.
  IF lv_id_is_set EQ abap_true.

    CASE is_id-type.
      WHEN gs_c_mrcp_subobj_type-operation. "Operation
        READ TABLE <ls_buffer>-operation ASSIGNING <ls_mrcp_operation>
          WITH KEY  plnkn = is_id-plnkn.

        IF sy-subrc NE 0.
          lv_sibling_missing = abap_true.
        ELSE.
          IF es_item IS REQUESTED.
            es_item = <ls_mrcp_operation>.
          ENDIF.
          ev_seq_num = <ls_mrcp_operation>-vornr.
        ENDIF.

      WHEN gs_c_mrcp_subobj_type-phase. " Phase
        READ TABLE <ls_buffer>-phase ASSIGNING <ls_mrcp_phase>
          WITH KEY  plnkn = is_id-plnkn.

        IF sy-subrc NE 0.
          lv_sibling_missing = abap_true.
        ELSE.
          IF es_item IS REQUESTED.
            es_item = <ls_mrcp_phase>.
          ENDIF.
          ev_seq_num = <ls_mrcp_phase>-vornr.
        ENDIF.

      WHEN gs_c_mrcp_subobj_type-pi. " Process Instruction
        READ TABLE <ls_buffer>-pi ASSIGNING <ls_mrcp_pi>
          WITH KEY  plnkn = is_id-plnkn
                    plnft = is_id-plnft.

        IF sy-subrc NE 0.
          lv_sibling_missing = abap_true.
        ELSE.
          IF es_item IS REQUESTED.
            es_item = <ls_mrcp_pi>.
          ENDIF.
          ev_seq_num = <ls_mrcp_pi>-ftrnr.
        ENDIF.

      WHEN gs_c_mrcp_subobj_type-pi_cv. " Process Instruction Characteristic
        READ TABLE <ls_buffer>-pi_char_val ASSIGNING <ls_mrcp_pi_char_val>
          WITH KEY  plnkn = is_id-plnkn
                    plnft = is_id-plnft
                    mkmzl = is_id-mkmzl.

        IF sy-subrc NE 0.
          lv_sibling_missing = abap_true.
        ELSE.
          IF es_item IS REQUESTED.
            es_item = <ls_mrcp_pi_char_val>.
          ENDIF.
          ev_seq_num = <ls_mrcp_pi_char_val>-fvlnr.
        ENDIF.

      WHEN gs_c_mrcp_subobj_type-resource. " Resource
        READ TABLE <ls_buffer>-resource ASSIGNING <ls_mrcp_resource>
          WITH KEY  plnkn = is_id-plnkn.

        IF sy-subrc NE 0.
          lv_sibling_missing = abap_true.
        ELSE.
          IF es_item IS REQUESTED.
            es_item = <ls_mrcp_resource>.
          ENDIF.
          ev_seq_num = <ls_mrcp_resource>-vornr.
        ENDIF.

    ENDCASE.

    IF lv_sibling_missing EQ abap_true. " Sibling does not exists in the buffer -> message and continue

      CASE is_id-type.
        WHEN gs_c_mrcp_subobj_type-operation OR gs_c_mrcp_subobj_type-phase OR gs_c_mrcp_subobj_type-resource.
          MESSAGE e006(/plmi/al_gss_mrcp) WITH is_id-plnkn INTO me->gv_msg.
        WHEN gs_c_mrcp_subobj_type-pi.
          MESSAGE e006(/plmi/al_gss_mrcp) WITH is_id-plnft INTO me->gv_msg.
        WHEN gs_c_mrcp_subobj_type-pi_cv.
          MESSAGE e006(/plmi/al_gss_mrcp) WITH is_id-mkmzl INTO me->gv_msg.
      ENDCASE.

      /plmb/cl_rcp_message=>add_message(
        CHANGING
          ct_message     =  et_message
          cv_severity    =  ev_severity
      ).

      RETURN.

    ENDIF.

*--------------------------------------------------------------------*
* If no sibling is set then figoure out a reference sequence number anyway
* based on the insert direction
*--------------------------------------------------------------------*
  ELSE.

    " Get the corresponding operations/phases of the selected recipe to a generic local internal table
    CASE is_id-type.
      WHEN gs_c_mrcp_subobj_type-operation. "Operation
        LOOP AT <ls_buffer>-operation ASSIGNING <ls_mrcp_operation>.
          ls_seq_num-index    = sy-tabix.
          ls_seq_num-seq_num  = <ls_mrcp_operation>-vornr.
          ls_seq_num-mod_flg  = <ls_mrcp_operation>-mod_flg.
          APPEND ls_seq_num TO lt_seq_num.
        ENDLOOP.

      WHEN gs_c_mrcp_subobj_type-phase. " Phase
        LOOP AT <ls_buffer>-phase ASSIGNING <ls_mrcp_phase>.
          IF <ls_mrcp_phase>-pvzkn EQ is_id-pvzkn  " Select only the rows corresponding to the parent
            OR is_id-pvzkn IS INITIAL AND iv_get_last EQ abap_true. " or all of them if you want the last one
            ls_seq_num-index    = sy-tabix.
            ls_seq_num-seq_num  = <ls_mrcp_phase>-vornr.
            ls_seq_num-mod_flg  = <ls_mrcp_phase>-mod_flg.
            APPEND ls_seq_num TO lt_seq_num.
          ENDIF.

        ENDLOOP.

      WHEN gs_c_mrcp_subobj_type-pi. " Process Instruction
        LOOP AT <ls_buffer>-pi ASSIGNING <ls_mrcp_pi>.
          IF <ls_mrcp_pi>-plnkn EQ is_id-plnkn. " Select only the rows corresponding to the parent
            ls_seq_num-index    = sy-tabix.
            ls_seq_num-seq_num  = <ls_mrcp_pi>-ftrnr.
            ls_seq_num-mod_flg  = <ls_mrcp_pi>-mod_flg.
            APPEND ls_seq_num TO lt_seq_num.
          ENDIF.
        ENDLOOP.

      WHEN gs_c_mrcp_subobj_type-pi_cv. " Process Instruction Characteristics
        LOOP AT <ls_buffer>-pi_char_val ASSIGNING <ls_mrcp_pi_char_val>.
          IF <ls_mrcp_pi_char_val>-plnkn EQ is_id-plnkn AND <ls_mrcp_pi_char_val>-plnft EQ is_id-plnft. " Select only the rows corresponding to the parent
            ls_seq_num-index    = sy-tabix.
            ls_seq_num-seq_num  = <ls_mrcp_pi_char_val>-fvlnr.
            ls_seq_num-mod_flg  = <ls_mrcp_pi_char_val>-mod_flg.
            APPEND ls_seq_num TO lt_seq_num.
          ENDIF.
        ENDLOOP.

      WHEN gs_c_mrcp_subobj_type-resource. "Resource
        LOOP AT <ls_buffer>-resource ASSIGNING <ls_mrcp_resource>.
          IF <ls_mrcp_resource>-sumnr EQ is_id-sumnr. " Select only the rows corresponding to the parent
            ls_seq_num-index    = sy-tabix.
            ls_seq_num-seq_num  = <ls_mrcp_resource>-vornr.
            ls_seq_num-mod_flg  = <ls_mrcp_resource>-mod_flg.
            APPEND ls_seq_num TO lt_seq_num.
          ENDIF.
        ENDLOOP.

    ENDCASE.

    " Delete the ones from the internal table that will be deleted anyway
    DELETE lt_seq_num WHERE mod_flg = gc_mod_flag_delete.

    IF lt_seq_num IS NOT INITIAL.

      IF iv_get_last EQ abap_true.
        " In case of insert before but no sibling set, the element shall be put to the end of the list
        SORT lt_seq_num DESCENDING BY seq_num.
        READ TABLE lt_seq_num INTO ls_seq_num INDEX 1.
      ELSE.
        " In case of insert after but no sibling set, the element shall be put to the beginning of the list
        SORT lt_seq_num ASCENDING BY seq_num.
        READ TABLE lt_seq_num INTO ls_seq_num INDEX 1.
      ENDIF.

      ev_seq_num = ls_seq_num-seq_num.

      IF es_item IS REQUESTED.
        CASE is_id-type.
          WHEN gs_c_mrcp_subobj_type-operation. "Operation
            READ TABLE <ls_buffer>-operation INDEX ls_seq_num-index INTO es_item.
          WHEN gs_c_mrcp_subobj_type-phase. " Phase
            READ TABLE <ls_buffer>-phase INDEX ls_seq_num-index INTO es_item.
          WHEN gs_c_mrcp_subobj_type-pi. " Process Instruction
            READ TABLE <ls_buffer>-pi INDEX ls_seq_num-index INTO es_item.
          WHEN gs_c_mrcp_subobj_type-pi_cv. " Process Instruction Characteristics
            READ TABLE <ls_buffer>-pi_char_val INDEX ls_seq_num-index INTO es_item.
          WHEN gs_c_mrcp_subobj_type-resource. "Resource
            READ TABLE <ls_buffer>-resource INDEX ls_seq_num-index INTO es_item.
        ENDCASE.
      ENDIF.

    ELSE. "#EC NEEDED
      " There's no elements yet (or they are newly inserted and they shall be ignored)
      " Nothing to do in this case
    ENDIF.

  ENDIF.

ENDMETHOD.


METHOD INIT.

  CALL FUNCTION 'MRTRS300_MASTER_RECIPE_INIT'
    EXPORTING
      i_plnty   = me->gc_plnty_mrcp
    EXCEPTIONS
      not_found = 1
      OTHERS    = 2.
  IF sy-subrc NE 0.
    " internal error
    ASSERT 0 = 1.
  ENDIF.

  " initialize production version data
  CALL FUNCTION 'CM_FV_MKAL_BT_INITIALIZE'.

ENDMETHOD.


METHOD LOCK.

*--------------------------------------------------------------------*
* Implement database locking
*--------------------------------------------------------------------*
  DATA: ls_lock TYPE ty_lock.
  CLEAR rv_success.

*--------------------------------------------------------------------*
* Validate call
*--------------------------------------------------------------------*
  ASSERT NOT iv_plnnr IS INITIAL.

  " Check if sync unit header is already locked
  READ TABLE me->mt_lock_buffer
    WITH KEY plnnr = iv_plnnr
    TRANSPORTING NO FIELDS.
  IF sy-subrc EQ 0.
    " We have already locked the object set, no further lock needed
    rv_success = abap_true.
    RETURN.
  ENDIF.

*--------------------------------------------------------------------*
* Lock Sync. Unit Header
*--------------------------------------------------------------------*
  CALL FUNCTION 'ENQUEUE_EPPLKO'
    EXPORTING
      mandt          = sy-mandt
      plnty          = gc_plnty_mrcp
      plnnr          = iv_plnnr
    EXCEPTIONS
      foreign_lock   = 1
      system_failure = 2
      OTHERS         = 3.
  IF sy-subrc = 0.
    " Lock found by the ENQUEUE fuction module

    " buffer locking state
    ls_lock-plnnr = iv_plnnr.
    INSERT ls_lock INTO TABLE me->mt_lock_buffer.

    rv_success = abap_true.
  ENDIF.

ENDMETHOD.


METHOD MOVE.

*--------------------------------------------------------------------*
*   WHY do you need this method?
*   This method is for reordering items and for changing
*   the parent of an item. It works with operations, phases,
*   process instuctions, process instruction characteristics
*   and resources.

*   HOW to use this method
*   First you have to select a recipe by setting the IV_PLNNR,
*   IV_PLNAL and IV_DATUV parametrs. Then you have to give an item
*   that you want to move by setting the corresponding fields of the
*   incoming IS_ID structure. This structure can be used to describe
*   multiple type of objects; the type itself is also part of the
*   structure (you don't have to set all the fields, just the ones
*   that corresponds for the incoming type). You also have to set a
*   sibling that describes the item next to the target. If only the parent
*   is set in the sibling structure (not an exact sibling is set)
*   then the item will be moved to the first or last position of the parent
*   (this depends on the iv_get_last field; see GET_SEQ_NUM for further
*   information).
*--------------------------------------------------------------------*


*--------------------------------------------------------------------*
* What is this method doing?
* Removing an element from its old place (shift sequence backwards at its old location)
* Inserting the element to it's new place (shft sequence forward and changeing parent and change number)
*
* How do we know where to insert the element?
* A sibling is given. The sibling might be exact or abstract. An exact sibling designates an
* existing element, an abstract sibling designates only the future parent of the selected element.
* In case of exact sibling the item will be moved after or before the sibling, in case of abstract
* sibling the item will be first or last element of the designated parent (the direction depends on
* the insert before parameter).
*
* How do we know the sequence number of the new position?
* In case of exact sibling
*   Insert before
*     The sequence number of the sibling will be the items new sequence number
*   Insert after
*     The sequence number of the sibling plus increment will be the items new sequence number
* In case of abstract sibling
*   Insert before -> Insert as last
*     Last element as sibling will be retrieved
*     The sequence number of the sibling plus increment will be the items new sequence number
*   Insert after -> Insert as first
*     First element as sibling will be retrieved
*     The sequence number of the sibling will be the items new sequence number
*--------------------------------------------------------------------*


  DATA:
        lv_to                 TYPE numc4,
        lt_message            TYPE /plmb/t_spi_msg,
        lv_by                 TYPE i,
        lv_gap                TYPE i,
        lv_moved_backwards    TYPE boole_d,
        ls_mrcp_key           TYPE /plmi/s_mrcp_key.

  FIELD-SYMBOLS:
        <ls_buffer>           TYPE ty_mrcp_buffer,
        <ls_mrcp_operation>   TYPE ty_mrcp_operation_mod,
        <ls_mrcp_phase>       TYPE ty_mrcp_phase_mod,
        <ls_mrcp_resource>    TYPE ty_mrcp_resource_mod.

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: et_message, ev_severity.

*--------------------------------------------------------------------*
* Initialization
*--------------------------------------------------------------------*

  " Target and source type must be the same
  IF is_id-type <> is_sibling-type.
    ASSERT 0 = 1.
  ENDIF.

  " Get the Master Recipe
  READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
  WITH TABLE KEY plnnr = iv_plnnr
                 plnal = iv_plnal
                 datuv = iv_datuv.

*--------------------------------------------------------------------*
* Setting the multiplier
*--------------------------------------------------------------------*
  lv_by = 1.
  IF is_id-type EQ gs_c_mrcp_subobj_type-operation.
    LOOP AT <ls_buffer>-phase TRANSPORTING NO FIELDS WHERE pvzkn = is_id-plnkn.
      ADD 1 TO lv_by. " Counting the corresponding phases (plus the parent itselft)
    ENDLOOP.
  ENDIF.

*--------------------------------------------------------------------*
* Shift backwards to hide the old place
*--------------------------------------------------------------------*
  me->shift_items(
    EXPORTING
      iv_plnnr          = iv_plnnr
      iv_plnal          = iv_plnal
      iv_datuv          = iv_datuv
      is_item           = is_id
      iv_by             = lv_by
      iv_including_from = abap_false
      iv_backwards      = abap_true
    IMPORTING
      et_message        = lt_message
      ev_severity       = ev_severity
  ).

  me->change_messages(
    EXPORTING
      it_message  = lt_message
    CHANGING
      ct_message  = et_message
      cv_severity = ev_severity ).

  IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
    RETURN.
  ENDIF.

*--------------------------------------------------------------------*
* Shift the sibling forward
*--------------------------------------------------------------------*
  me->shift_items(
    EXPORTING
      iv_plnnr          = iv_plnnr
      iv_plnal          = iv_plnal
      iv_datuv          = iv_datuv
      is_item           = is_sibling
      iv_by             = lv_by
      iv_including_from = iv_insert_before
    IMPORTING
      ev_shifted_from   = lv_to
      et_message        = lt_message
      ev_severity       = ev_severity
  ).

  me->change_messages(
    EXPORTING
      it_message  = lt_message
    CHANGING
      ct_message  = et_message
      cv_severity = ev_severity ).

  IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
    RETURN.
  ENDIF.

*--------------------------------------------------------------------*
* Change sequence number
*--------------------------------------------------------------------*
  ls_mrcp_key-plnnr = iv_plnnr.
  ls_mrcp_key-plnal = iv_plnal.
  ls_mrcp_key-datuv = iv_datuv.
  CASE is_id-type.
    WHEN gs_c_mrcp_subobj_type-operation. "Operation
      READ TABLE <ls_buffer>-operation ASSIGNING <ls_mrcp_operation>
        WITH KEY  plnkn = is_id-plnkn.

      me->copy_element_to_buffer_old(
        EXPORTING
          iv_type        = is_id-type
          is_mrcp_key    = ls_mrcp_key
          is_mrcp_object = <ls_mrcp_operation>
      ).

      " Calculating the gap between the old and the new position
      IF <ls_mrcp_operation>-vornr > lv_to.
        lv_gap = <ls_mrcp_operation>-vornr - lv_to.
        lv_moved_backwards = abap_true.
      ELSE.
        lv_gap = lv_to - <ls_mrcp_operation>-vornr.
        lv_moved_backwards = abap_false.
      ENDIF.

      " Set new sequence number for the Operation
      <ls_mrcp_operation>-vornr = lv_to.
      <ls_mrcp_operation>-mod_flg = gc_mod_flag_update.

      " Set new sequence number for all it's Phases
      LOOP AT <ls_buffer>-phase ASSIGNING <ls_mrcp_phase> WHERE pvzkn = is_id-plnkn.
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-phase
            is_mrcp_key    = ls_mrcp_key
            is_mrcp_object = <ls_mrcp_phase>
        ).

        IF lv_moved_backwards EQ abap_true.
          lv_to = <ls_mrcp_phase>-vornr - lv_gap.
        ELSE.
          lv_to = <ls_mrcp_phase>-vornr + lv_gap.
        ENDIF.
        <ls_mrcp_phase>-vornr = lv_to.
      ENDLOOP.

    WHEN gs_c_mrcp_subobj_type-phase. " Phase
      READ TABLE <ls_buffer>-phase ASSIGNING <ls_mrcp_phase>
        WITH KEY  plnkn = is_id-plnkn.

      me->copy_element_to_buffer_old(
        EXPORTING
          iv_type        = is_id-type
          is_mrcp_key    = ls_mrcp_key
          is_mrcp_object = <ls_mrcp_phase>
      ).

      <ls_mrcp_phase>-vornr = lv_to.
      <ls_mrcp_phase>-pvzkn = is_sibling-pvzkn. " Parent
      <ls_mrcp_phase>-mod_flg = gc_mod_flag_update.

    WHEN gs_c_mrcp_subobj_type-resource. " Resource
      READ TABLE <ls_buffer>-resource ASSIGNING <ls_mrcp_resource>
        WITH KEY  plnkn = is_id-plnkn.

      me->copy_element_to_buffer_old(
        EXPORTING
          iv_type        = is_id-type
          is_mrcp_key    = ls_mrcp_key
          is_mrcp_object = <ls_mrcp_resource>
      ).

      <ls_mrcp_resource>-vornr = lv_to.
      <ls_mrcp_resource>-sumnr = is_sibling-sumnr. " Parent
      <ls_mrcp_resource>-mod_flg = gc_mod_flag_update.

  ENDCASE.

ENDMETHOD.


METHOD MOVE_OPERATION.

  DATA:
        ls_item_id      TYPE ty_id,
        ls_sibling_id   TYPE ty_id.

  CLEAR: et_message, ev_severity.

  ls_item_id-type = gs_c_mrcp_subobj_type-operation.
  ls_item_id-plnkn = iv_item_plnkn.

  ls_sibling_id-type = gs_c_mrcp_subobj_type-operation.
  ls_sibling_id-plnkn = iv_sibling_plnkn.

  me->move(
    EXPORTING
      iv_plnnr          = is_mrcp_key-plnnr
      iv_plnal          = is_mrcp_key-plnal
      iv_datuv          = is_mrcp_key-datuv
      is_id             = ls_item_id
      is_sibling        = ls_sibling_id
      iv_insert_before  = iv_insert_before
    IMPORTING
      et_message        = et_message
      ev_severity       = ev_severity
  ).

ENDMETHOD.


METHOD MOVE_PHASE.

  DATA:
        ls_item_id      TYPE ty_id,
        ls_sibling_id   TYPE ty_id.

  CLEAR: et_message, ev_severity.

  ls_item_id-type = gs_c_mrcp_subobj_type-phase.
  ls_item_id-plnkn = iv_item_plnkn.

  ls_sibling_id-type = gs_c_mrcp_subobj_type-phase.
  ls_sibling_id-plnkn = iv_sibling_plnkn.
  ls_sibling_id-pvzkn = iv_sibling_pvzkn.

  me->move(
    EXPORTING
      iv_plnnr          = is_mrcp_key-plnnr
      iv_plnal          = is_mrcp_key-plnal
      iv_datuv          = is_mrcp_key-datuv
      is_id             = ls_item_id
      is_sibling        = ls_sibling_id
      iv_insert_before  = iv_insert_before
    IMPORTING
      et_message        = et_message
      ev_severity       = ev_severity
  ).

ENDMETHOD.


METHOD MOVE_PI.

  DATA:
       ls_mrcp_pi_add       TYPE /plmi/s_mrcp_pi_add,
       lt_mrcp_pi_add       TYPE /plmi/t_mrcp_pi_add,
       ls_mrcp_pi_add_key   TYPE /plmi/s_mrcp_pi_key,
       lt_mrcp_pi_add_key   TYPE /plmi/t_mrcp_pi_key,
       ls_mrcp_pi           TYPE /plmi/s_mrcp_pi,
       lt_mrcp_pi           TYPE /plmi/t_mrcp_pi,
       lt_index_failed      TYPE /plmb/t_spi_rtr_index_failed
       .

  FIELD-SYMBOLS:
        <ls_buffer>           TYPE ty_mrcp_buffer,
        <ls_mrcp_pi_add>          TYPE ty_mrcp_pi_mod,
        <ls_mrcp_pi_add_char_val> TYPE ty_mrcp_pi_char_val_mod.

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: es_mrcp_pi, et_message, ev_severity.

*--------------------------------------------------------------------*
* Get the item that shall be moved
*--------------------------------------------------------------------*
  READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
  WITH TABLE KEY plnnr = is_mrcp_key-plnnr
                 plnal = is_mrcp_key-plnal
                 datuv = is_mrcp_key-datuv.

  READ TABLE <ls_buffer>-pi ASSIGNING <ls_mrcp_pi_add>
        WITH KEY  plnft = iv_item_plnft
                  plnkn = iv_item_plnkn.

*--------------------------------------------------------------------*
* Add to it's new place
*--------------------------------------------------------------------*
  MOVE-CORRESPONDING <ls_mrcp_pi_add> TO ls_mrcp_pi_add ##ENH_OK.
  ls_mrcp_pi_add-sibling  = iv_sibling_plnft.
  ls_mrcp_pi_add-plnkn    = iv_sibling_plnkn.
  ls_mrcp_pi_add-datuv    = is_mrcp_key-datuv.
  ls_mrcp_pi_add-aennr    = is_mrcp_key-aennr.
  APPEND ls_mrcp_pi_add TO lt_mrcp_pi_add.

  me->add_pi(
    EXPORTING
      iv_insert_before    = iv_insert_before
      it_mrcp_pi          = lt_mrcp_pi_add
    IMPORTING
      et_mrcp_pi          = lt_mrcp_pi
      et_message          = et_message
      ev_severity         = ev_severity
      et_index_failed     = lt_index_failed
  ).

  IF lt_index_failed IS NOT INITIAL.
    RETURN.
  ENDIF.

  READ TABLE lt_mrcp_pi INTO ls_mrcp_pi INDEX 1.
  IF lines( lt_mrcp_pi ) NE 1.
    ASSERT 0 = 1.
  ENDIF.

  READ TABLE lt_mrcp_pi INDEX 1 INTO es_mrcp_pi.

*--------------------------------------------------------------------*
* Move its children
*--------------------------------------------------------------------*
  SORT <ls_buffer>-pi_char_val ASCENDING BY fvlnr.
  LOOP AT <ls_buffer>-pi_char_val ASSIGNING <ls_mrcp_pi_add_char_val>
        WHERE  plnft = iv_item_plnft AND
               plnkn = iv_item_plnkn.

    me->move_pi_char_val(
      EXPORTING
        is_mrcp_key      = is_mrcp_key
        iv_item_mkmzl    = <ls_mrcp_pi_add_char_val>-mkmzl
        iv_item_plnft    = iv_item_plnft
        iv_item_plnkn    = iv_item_plnkn
        iv_sibling_plnft = ls_mrcp_pi-plnft " iv_sibling_plnft
        iv_sibling_plnkn = ls_mrcp_pi-plnkn " iv_sibling_plnkn
      IMPORTING
        et_message       = et_message
        ev_severity      = ev_severity
    ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      RETURN.
    ENDIF.

  ENDLOOP.

*--------------------------------------------------------------------*
* Delete it from its old place
*--------------------------------------------------------------------*
  MOVE-CORRESPONDING <ls_mrcp_pi_add> TO ls_mrcp_pi_add_key ##ENH_OK.
  ls_mrcp_pi_add_key-datuv    = is_mrcp_key-datuv.
  APPEND ls_mrcp_pi_add_key TO lt_mrcp_pi_add_key.
  me->delete_pi(
    EXPORTING
      it_mrcp_pi_key          = lt_mrcp_pi_add_key
    IMPORTING
      et_message              = et_message
      ev_severity             = ev_severity
      et_index_failed         = lt_index_failed
  ).

ENDMETHOD.


METHOD MOVE_PI_CHAR_VAL.

  DATA:
         ls_mrcp_pi_char_val      TYPE /plmi/s_mrcp_pi_char_val_add,
         lt_mrcp_pi_char_val      TYPE /plmi/t_mrcp_pi_char_val_add,
         ls_mrcp_pi_char_val_key  TYPE /plmi/s_mrcp_pi_char_val_key,
         lt_mrcp_pi_char_val_key  TYPE /plmi/t_mrcp_pi_char_val_key,
         lt_index_failed          TYPE /plmb/t_spi_rtr_index_failed
         .

  FIELD-SYMBOLS:
        <ls_buffer>               TYPE ty_mrcp_buffer,
        <ls_mrcp_pi_char_val>     TYPE ty_mrcp_pi_char_val_mod.

*--------------------------------------------------------------------*
* Get the item that shall be moved
*--------------------------------------------------------------------*
  READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
  WITH TABLE KEY plnnr = is_mrcp_key-plnnr
                 plnal = is_mrcp_key-plnal
                 datuv = is_mrcp_key-datuv.

  READ TABLE <ls_buffer>-pi_char_val ASSIGNING <ls_mrcp_pi_char_val>
        WITH KEY  plnkn = iv_item_plnkn
                  plnft = iv_item_plnft
                  mkmzl = iv_item_mkmzl.

*--------------------------------------------------------------------*
* Add to it's new place
*--------------------------------------------------------------------*
  MOVE-CORRESPONDING <ls_mrcp_pi_char_val> TO ls_mrcp_pi_char_val ##ENH_OK.
  ls_mrcp_pi_char_val-sibling = iv_sibling_mkmzl.
  ls_mrcp_pi_char_val-plnft   = iv_sibling_plnft.
  ls_mrcp_pi_char_val-plnkn   = iv_sibling_plnkn.
  ls_mrcp_pi_char_val-datuv   = is_mrcp_key-datuv.
  ls_mrcp_pi_char_val-aennr   = is_mrcp_key-aennr.
  APPEND ls_mrcp_pi_char_val TO lt_mrcp_pi_char_val.
  me->add_pi_char_val(
    EXPORTING
      iv_insert_before    = iv_insert_before
      it_mrcp_pi_char_val = lt_mrcp_pi_char_val
    IMPORTING
      et_message          = et_message
      ev_severity         = ev_severity
      et_index_failed     = lt_index_failed
  ).

  IF lt_index_failed IS NOT INITIAL.
    RETURN.
  ENDIF.

*--------------------------------------------------------------------*
* Delete it from its old place
*--------------------------------------------------------------------*
  MOVE-CORRESPONDING <ls_mrcp_pi_char_val> TO ls_mrcp_pi_char_val_key ##ENH_OK.
  ls_mrcp_pi_char_val_key-datuv   = is_mrcp_key-datuv.
  APPEND ls_mrcp_pi_char_val_key TO lt_mrcp_pi_char_val_key.
  me->delete_pi_char_val(
    EXPORTING
      it_mrcp_pi_char_val_key = lt_mrcp_pi_char_val_key
    IMPORTING
      et_message              = et_message
      ev_severity             = ev_severity
      et_index_failed         = lt_index_failed
  ).

ENDMETHOD.


METHOD MOVE_RESOURCE.

  DATA:
       ls_mrcp_res_add      TYPE /plmi/s_mrcp_resource_add,
       lt_mrcp_res_add      TYPE /plmi/t_mrcp_resource_add,
       ls_mrcp_res_key      TYPE /plmi/s_mrcp_resource_key,
       lt_mrcp_res_key      TYPE /plmi/t_mrcp_resource_key,
       ls_mrcp_res          TYPE /plmi/s_mrcp_resource,
       lt_mrcp_res          TYPE /plmi/t_mrcp_resource,
       lt_index_failed      TYPE /plmb/t_spi_rtr_index_failed
       .

  FIELD-SYMBOLS:
      <ls_buffer>           TYPE ty_mrcp_buffer,
      <ls_mrcp_res_add>     TYPE ty_mrcp_resource_mod.

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: es_mrcp_resource, et_message, ev_severity.

*--------------------------------------------------------------------*
* Get the item that shall be moved
*--------------------------------------------------------------------*
  READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
  WITH TABLE KEY plnnr = is_mrcp_key-plnnr
                 plnal = is_mrcp_key-plnal
                 datuv = is_mrcp_key-datuv.

  READ TABLE <ls_buffer>-resource ASSIGNING <ls_mrcp_res_add>
        WITH KEY  plnkn = iv_item_plnkn.

*--------------------------------------------------------------------*
* Add to it's new place
*--------------------------------------------------------------------*
  MOVE-CORRESPONDING <ls_mrcp_res_add> TO ls_mrcp_res_add ##ENH_OK.
  ls_mrcp_res_add-sibling  = iv_sibling_plnkn.
  ls_mrcp_res_add-sumnr    = iv_sibling_sumnr.
  ls_mrcp_res_add-datuv    = is_mrcp_key-datuv.
  ls_mrcp_res_add-aennr    = is_mrcp_key-aennr.
  APPEND ls_mrcp_res_add TO lt_mrcp_res_add.
  me->add_resource(
    EXPORTING
      iv_insert_before    = iv_insert_before
      it_mrcp_resource    = lt_mrcp_res_add
    IMPORTING
      et_mrcp_resource    = lt_mrcp_res
      et_message          = et_message
      ev_severity         = ev_severity
      et_index_failed     = lt_index_failed
  ).

  IF lt_index_failed IS NOT INITIAL.
    RETURN.
  ENDIF.

  READ TABLE lt_mrcp_res INTO ls_mrcp_res INDEX 1.
  IF lines( lt_mrcp_res ) NE 1.
    ASSERT 0 = 1.
  ENDIF.

  READ TABLE lt_mrcp_res INDEX 1 INTO es_mrcp_resource.

*--------------------------------------------------------------------*
* Delete it from its old place
*--------------------------------------------------------------------*
  MOVE-CORRESPONDING <ls_mrcp_res_add> TO ls_mrcp_res_key ##ENH_OK.
  ls_mrcp_res_key-datuv    = is_mrcp_key-datuv.
  APPEND ls_mrcp_res_key TO lt_mrcp_res_key.
  me->delete_resource(
    EXPORTING
      it_mrcp_resource_key    = lt_mrcp_res_key
    IMPORTING
      et_message              = et_message
      ev_severity             = ev_severity
      et_index_failed         = lt_index_failed
  ).

ENDMETHOD.


METHOD READ_MRCP_FROM_DB.

  DATA:
        ls_rc271              TYPE rc271,
        ls_rc27m              TYPE rc27m,
        ls_rc27s              TYPE rc27s,
        ls_plkob              TYPE plkob,
        lt_mkal               TYPE mrtrsty_mkal,
        lt_operation          TYPE mrtrsty_plpo_opr,
        lt_phase              TYPE mrtrsty_plpo_ph,
        lt_sec_resource       TYPE mrtrsty_plpo_sres,
        lt_mapl               TYPE mrtrsty_mapl,
        lt_plft               TYPE mrtrsty_plft,
        lt_plfv               TYPE mrtrsty_plfv,
        lt_resclas            TYPE mrtrsty_resclas,

        ls_buffer             TYPE ty_mrcp_buffer,
        ls_operation_buf      TYPE ty_mrcp_operation_mod,
        ls_phase_buf          TYPE ty_mrcp_phase_mod,
        ls_pi_buf             TYPE ty_mrcp_pi_mod,
        ls_pi_char_val_buf    TYPE ty_mrcp_pi_char_val_mod,
        ls_sec_resource_buf   TYPE ty_mrcp_resource_mod,
        ls_rsc_buf            TYPE ty_mrcp_rsc_mod,
        ls_prodver_buf        TYPE ty_mrcp_prodver_mod,
        ls_mat_assign_buf     TYPE ty_mrcp_mat_assign_mod,
        ls_rsc_char_val       TYPE /plmi/s_mrcp_rsc_char_val,

        lx_mrcp_bl            TYPE REF TO /plmi/cx_mrcp_bl
        .

  FIELD-SYMBOLS:
        <ls_buffer>           TYPE ty_mrcp_buffer,
        <ls_operation>        TYPE mrtrss_plpo_opr,
        <ls_phase>            TYPE mrtrss_plpo_ph,
        <ls_pi>               TYPE mrtrss_plft,
        <ls_pi_char_val>      TYPE mrtrss_plfv,
        <ls_sec_resource>     TYPE mrtrss_plpo_opr,
        <ls_resclas>          TYPE mrtrss_resclas,
        <ls_mkal>             TYPE mkal,
        <ls_mapl>             TYPE maplb,
        <ls_t_val_r>          TYPE api_val_r
        .

*--------------------------------------------------------------------*
* Read data from DB
*--------------------------------------------------------------------*
  ls_rc271-plnty = me->gc_plnty_mrcp.
  ls_rc271-plnnr = is_mrcp_key-plnnr.
  ls_rc271-plnal = is_mrcp_key-plnal.

  IF is_mrcp_key-datuv IS INITIAL.
    ls_rc271-datuv = sy-datum.
    ls_rc271-sttag = sy-datum.
    ls_rc27s-sttag = sy-datum.
  ELSE.
    ls_rc271-datuv = is_mrcp_key-datuv.
    ls_rc271-sttag = is_mrcp_key-datuv.
    ls_rc27s-sttag = is_mrcp_key-datuv.
  ENDIF.

  ls_rc27m-verid = iv_verid.                             "2191166

  " clean up BOM assignment in buffer of FM
  " this is needed because if we synchronize to an already existing
  " MR group with a new group counter, the buffer in the FM will
  " not contain the BOM assignment that we have just created
  CALL FUNCTION 'CZ_BT_FREE_TABLES'.

  TRY .
    CALL FUNCTION 'MRTRS300_MASTER_RECIPE_READ'
      EXPORTING
        is_rc271           = ls_rc271
        is_rc27m           = ls_rc27m
        is_rc27s           = ls_rc27s
      IMPORTING
        es_plkob           = ls_plkob
        et_mkal            = lt_mkal
        et_operation       = lt_operation
        et_phase           = lt_phase
        et_sec_resource    = lt_sec_resource
        et_mapl            = lt_mapl
        et_plft            = lt_plft
        et_plfv            = lt_plfv
        et_resclas         = lt_resclas
      EXCEPTIONS
        key_not_qualified  = 1
        key_invalid        = 2
        key_number_invalid = 3
        not_found          = 4
        existing           = 5
        internal_error     = 6
        foreign_lock       = 7
        OTHERS             = 8.
  CATCH CX_SY_SEND_DYNPRO_NO_RECEIVER.
     RAISE EXCEPTION TYPE /plmi/cx_mrcp_bl.
  ENDTRY.

  IF sy-subrc NE 0.
    CREATE OBJECT lx_mrcp_bl.
    lx_mrcp_bl->set_message(
      iv_msgid = sy-msgid
      iv_msgty = /plmb/cl_rcp_message=>gc_sv_error
      iv_msgno = sy-msgno
      iv_msgv1 = sy-msgv1
      iv_msgv2 = sy-msgv2
      iv_msgv3 = sy-msgv3
      iv_msgv4 = sy-msgv4 ).
    RAISE EXCEPTION lx_mrcp_bl.
  ELSEIF ls_plkob IS INITIAL.
    RAISE EXCEPTION TYPE /plmi/cx_mrcp_bl.
  ENDIF.

*--------------------------------------------------------------------*
* Add new objects to the buffer.
* The existing ones shall not be overwritten.
*--------------------------------------------------------------------*

  READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
    WITH KEY plnnr = is_mrcp_key-plnnr
             plnal = is_mrcp_key-plnal
             datuv = is_mrcp_key-datuv.

  IF <ls_buffer> IS NOT ASSIGNED.
    " Key
    ls_buffer-plnnr = is_mrcp_key-plnnr.
    ls_buffer-plnal = is_mrcp_key-plnal.
    ls_buffer-datuv = is_mrcp_key-datuv.
    ls_buffer-aennr = is_mrcp_key-aennr.
    " Header
    MOVE-CORRESPONDING ls_plkob TO ls_buffer-header.
  ENDIF.

  " Operations
  LOOP AT lt_operation ASSIGNING <ls_operation>.

    CLEAR ls_operation_buf.
    MOVE-CORRESPONDING <ls_operation> TO ls_operation_buf ##ENH_OK.

    IF <ls_buffer> IS NOT ASSIGNED.
      APPEND ls_operation_buf TO ls_buffer-operation.
    ELSE.
      READ TABLE <ls_buffer>-operation
        WITH KEY plnnr = ls_operation_buf-plnnr
                 plnal = ls_operation_buf-plnal
                 plnkn = ls_operation_buf-plnkn
                 TRANSPORTING NO FIELDS.
      IF sy-subrc NE 0.
        APPEND ls_operation_buf TO <ls_buffer>-operation.
      ENDIF.
    ENDIF.

  ENDLOOP.

  " Phases
  LOOP AT lt_phase ASSIGNING <ls_phase>.

    CLEAR ls_phase_buf.
    MOVE-CORRESPONDING <ls_phase> TO ls_phase_buf ##ENH_OK.

    IF <ls_buffer> IS NOT ASSIGNED.
      APPEND ls_phase_buf TO ls_buffer-phase.
    ELSE.
      READ TABLE <ls_buffer>-phase
        WITH KEY plnnr = ls_phase_buf-plnnr
                 plnal = ls_phase_buf-plnal
                 plnkn = ls_phase_buf-plnkn
                 TRANSPORTING NO FIELDS.
      IF sy-subrc NE 0.
        APPEND ls_phase_buf TO <ls_buffer>-phase.
      ENDIF.
    ENDIF.

  ENDLOOP.

  " Process Instructions
  LOOP AT lt_plft ASSIGNING <ls_pi>.

    UNASSIGN: <ls_phase>.
    CLEAR ls_pi_buf.
    MOVE-CORRESPONDING <ls_pi> TO ls_pi_buf ##ENH_OK.

    READ TABLE lt_phase ASSIGNING <ls_phase>
      WITH KEY plnnr = ls_pi_buf-plnnr
               plnal = ls_pi_buf-plnal
               plnkn = ls_pi_buf-plnkn.


    IF <ls_buffer> IS NOT ASSIGNED.
      APPEND ls_pi_buf TO ls_buffer-pi.
    ELSE.
      READ TABLE <ls_buffer>-pi
        WITH KEY plnnr = ls_pi_buf-plnnr
                 plnal = ls_pi_buf-plnal
                 plnkn = ls_pi_buf-plnkn
                 plnft = ls_pi_buf-plnft
                 TRANSPORTING NO FIELDS.
      IF sy-subrc NE 0.
        APPEND ls_pi_buf TO <ls_buffer>-pi.
      ENDIF.
    ENDIF.

  ENDLOOP.

  " Process Instruction Characteristic Values
  LOOP AT lt_plfv ASSIGNING <ls_pi_char_val>.

    UNASSIGN: <ls_phase>, <ls_pi>.
    CLEAR ls_pi_char_val_buf.
    MOVE-CORRESPONDING <ls_pi_char_val> TO ls_pi_char_val_buf ##ENH_OK.

    READ TABLE lt_phase ASSIGNING <ls_phase>
      WITH KEY plnnr = ls_pi_char_val_buf-plnnr
               plnal = ls_pi_char_val_buf-plnal
               plnkn = ls_pi_char_val_buf-plnkn.

    READ TABLE lt_plft ASSIGNING <ls_pi>
     WITH KEY plnnr = ls_pi_char_val_buf-plnnr
              plnal = ls_pi_char_val_buf-plnal
              plnkn = ls_pi_char_val_buf-plnkn
              plnft = ls_pi_char_val_buf-plnft.

    IF <ls_buffer> IS NOT ASSIGNED.
      APPEND ls_pi_char_val_buf TO ls_buffer-pi_char_val.
    ELSE.
      READ TABLE <ls_buffer>-pi_char_val
        WITH KEY plnnr = ls_pi_char_val_buf-plnnr
                 plnal = ls_pi_char_val_buf-plnal
                 plnkn = ls_pi_char_val_buf-plnkn
                 plnft = ls_pi_char_val_buf-plnft
                 mkmzl = ls_pi_char_val_buf-mkmzl
                 TRANSPORTING NO FIELDS.
      IF sy-subrc NE 0.
        APPEND ls_pi_char_val_buf TO <ls_buffer>-pi_char_val.
      ENDIF.
    ENDIF.

  ENDLOOP.

  " Secondary Resources
  LOOP AT lt_sec_resource ASSIGNING <ls_sec_resource>.

    UNASSIGN: <ls_operation>, <ls_phase>.
    CLEAR ls_sec_resource_buf.
    MOVE-CORRESPONDING <ls_sec_resource> TO ls_sec_resource_buf ##ENH_OK.

    IF <ls_buffer> IS NOT ASSIGNED.
      APPEND ls_sec_resource_buf TO ls_buffer-resource.
    ELSE.
      READ TABLE <ls_buffer>-resource
        WITH KEY plnnr = ls_sec_resource_buf-plnnr
                 plnal = ls_sec_resource_buf-plnal
                 plnkn = ls_sec_resource_buf-plnkn
                 TRANSPORTING NO FIELDS.
      IF sy-subrc NE 0.
        APPEND ls_sec_resource_buf TO <ls_buffer>-resource.
      ENDIF.
    ENDIF.

  ENDLOOP.

  " Resource Selection Criteria
  LOOP AT lt_resclas ASSIGNING <ls_resclas>.

    UNASSIGN: <ls_operation>.
    CLEAR ls_rsc_buf.
    MOVE-CORRESPONDING <ls_resclas> TO ls_rsc_buf.

    LOOP AT <ls_resclas>-t_val_r ASSIGNING <ls_t_val_r> WHERE val_assign EQ abap_true.
      CLEAR: ls_rsc_char_val.
      MOVE-CORRESPONDING <ls_t_val_r> TO ls_rsc_char_val ##ENH_OK.
      APPEND ls_rsc_char_val TO ls_rsc_buf-char_val.
    ENDLOOP.

    READ TABLE lt_operation ASSIGNING <ls_operation>
      WITH KEY  plnnr = ls_rsc_buf-plnnr
                plnal = ls_rsc_buf-plnal
                plnkn = ls_rsc_buf-plnkn.

    IF <ls_operation> IS ASSIGNED.
      ls_rsc_buf-plnty = <ls_operation>-plnty.
    ENDIF.

    IF <ls_buffer> IS NOT ASSIGNED.
      APPEND ls_rsc_buf TO ls_buffer-rsc.
    ELSE.
      READ TABLE <ls_buffer>-rsc
        WITH KEY plnnr = ls_rsc_buf-plnnr
                 plnal = ls_rsc_buf-plnal
                 plnkn = ls_rsc_buf-plnkn
                 TRANSPORTING NO FIELDS.
      IF sy-subrc NE 0.
        APPEND ls_rsc_buf TO <ls_buffer>-rsc.
      ENDIF.
    ENDIF.

  ENDLOOP.

  " Production version
  LOOP AT lt_mkal ASSIGNING <ls_mkal>.

    CLEAR ls_prodver_buf.
    MOVE-CORRESPONDING <ls_mkal> TO ls_prodver_buf ##ENH_OK.
    READ TABLE lt_mapl ASSIGNING <ls_mapl>
      WITH KEY matnr = ls_prodver_buf-matnr
               werks = ls_prodver_buf-werks.
    IF sy-subrc EQ 0.
      ls_prodver_buf-datuv = <ls_mapl>-datuv.
    ENDIF.

    IF <ls_buffer> IS NOT ASSIGNED.
      APPEND ls_prodver_buf TO ls_buffer-prodver.
    ELSE.
      READ TABLE <ls_buffer>-prodver
        WITH KEY plnnr = ls_prodver_buf-plnnr
                 alnal = ls_prodver_buf-alnal
                 TRANSPORTING NO FIELDS.
      IF sy-subrc NE 0.
        APPEND ls_prodver_buf TO <ls_buffer>-prodver.
      ENDIF.
    ENDIF.

  ENDLOOP.

  " Material assignment
  LOOP AT lt_mapl ASSIGNING <ls_mapl>.

    CLEAR ls_mat_assign_buf.
    MOVE-CORRESPONDING <ls_mapl> TO ls_mat_assign_buf.

    IF <ls_buffer> IS NOT ASSIGNED.
      APPEND ls_mat_assign_buf TO ls_buffer-mat_assignment.
    ELSE.
      READ TABLE <ls_buffer>-mat_assignment
        WITH KEY plnnr = ls_mat_assign_buf-plnnr
                 plnal = ls_mat_assign_buf-plnal
                 TRANSPORTING NO FIELDS.
      IF sy-subrc NE 0.
        APPEND ls_mat_assign_buf TO <ls_buffer>-mat_assignment.
      ENDIF.
    ENDIF.

  ENDLOOP.

  IF <ls_buffer> IS NOT ASSIGNED.
    INSERT ls_buffer INTO TABLE me->mt_buffer.
  ENDIF.

ENDMETHOD.


METHOD SAVE.

  DATA:
        lv_aktyp            TYPE aktyp,
        lt_aktyp            TYPE TABLE OF aktyp,
        lt_message          TYPE /plmb/t_spi_msg
        .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: ev_failed, et_message, ev_severity.

*--------------------------------------------------------------------*
* Save data
*--------------------------------------------------------------------*
  CLEAR lt_aktyp.
  lv_aktyp = 'H'. " AkTyp: Hinzufügen - Create/Add
  APPEND lv_aktyp TO lt_aktyp.
  lv_aktyp = 'V'. " Aktyp: Verändern - Change
  APPEND lv_aktyp TO lt_aktyp.

  LOOP AT lt_aktyp INTO lv_aktyp.

    me->save_int(
      EXPORTING
        iv_aktyp    = lv_aktyp
      IMPORTING
        ev_failed   = ev_failed
        et_message  = lt_message
        ev_severity = ev_severity
    ).

    me->change_messages(
      EXPORTING
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    IF ev_failed = abap_true.

      CLEAR: me->mt_resclas.

      " remove misleading success message(s) in case of error(s)
      READ TABLE et_message WITH KEY msgty = /plmb/if_spi_c=>gs_c_msgty-error TRANSPORTING NO FIELDS.
      IF sy-subrc EQ 0.
        DELETE et_message WHERE msgty = /plmb/if_spi_c=>gs_c_msgty-success.
      ENDIF.

      RETURN.

    ENDIF.

  ENDLOOP.

  CLEAR: me->mt_resclas.

ENDMETHOD.


METHOD SAVE_INT.

  DATA:
          ls_rc271            TYPE rc271,
          ls_rc27s            TYPE rc27s,
          ls_rc27m            TYPE rc27m,
          ls_plkob            TYPE plkob,
          lv_plnnr_prev       TYPE plnnr,

          lv_write_was_called TYPE boole_d VALUE abap_false,

          lx_mrcp_bl          TYPE REF TO /plmi/cx_mrcp_bl,

          lv_msgid            TYPE symsgid,
          lv_msgty            TYPE symsgty,
          lv_msgno            TYPE symsgno,
          lv_msgv1            TYPE symsgv,
          lv_msgv2            TYPE symsgv,
          lv_msgv3            TYPE symsgv,
          lv_msgv4            TYPE symsgv
          .

  FIELD-SYMBOLS:
                 <ls_mrcp_buffer>        TYPE ty_mrcp_buffer,
                 <ls_prodver>            TYPE ty_mrcp_prodver_mod
                 .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: ev_failed, et_message, ev_severity.

*--------------------------------------------------------------------*
* Check buffer
*--------------------------------------------------------------------*
  IF me->mt_buffer IS INITIAL.
    " No data changes need to be saved

    ev_failed = abap_true.

    MESSAGE w004(/plmi/al_gss_mrcp) INTO me->gv_msg.

    /plmb/cl_rcp_message=>add_message(
      CHANGING
        ct_message     =  et_message
        cv_severity    =  ev_severity
    ).

    RETURN.

  ENDIF.

*--------------------------------------------------------------------*
* Sort buffer table by recipe group and recipe number
*--------------------------------------------------------------------*
  SORT me->mt_buffer BY plnnr plnal datuv.

*--------------------------------------------------------------------*
* Write & Save Data
*--------------------------------------------------------------------*

  CLEAR lv_plnnr_prev.

  LOOP AT me->mt_buffer ASSIGNING <ls_mrcp_buffer>. " loop at buffer

* Dummy read (per Recipe Group) before write
* in order to set internal counters appropriately
*--------------------------------------------------------------------*
    IF lv_plnnr_prev NE <ls_mrcp_buffer>-plnnr.

      CLEAR: ls_rc271, ls_rc27m, ls_rc27s, ls_plkob.

      ls_rc271-plnty = me->gc_plnty_mrcp.
      ls_rc271-plnnr = <ls_mrcp_buffer>-plnnr.
      ls_rc271-plnal = <ls_mrcp_buffer>-plnal.                                   "2193538
      ls_rc271-sttag = <ls_mrcp_buffer>-datuv.
      ls_rc271-datuv = <ls_mrcp_buffer>-datuv.
      ls_rc271-aennr = <ls_mrcp_buffer>-aennr.

      ls_rc27s-sttag  = <ls_mrcp_buffer>-datuv.                                  "2193538
      ls_rc27s-aennr = <ls_mrcp_buffer>-aennr.                                   "2193538

      ls_rc27s-aktyp = iv_aktyp.

      " Set prod. version (see also CHANGE_PRODVER)
      READ TABLE <ls_mrcp_buffer>-prodver WITH KEY plnnr = <ls_mrcp_buffer>-plnnr
                                                   alnal = <ls_mrcp_buffer>-plnal
                                                   "datuv = <ls_mrcp_buffer>-datuv  "2200419
                                                   plnty = me->gc_plnty_mrcp
                                         ASSIGNING <ls_prodver>.
      IF sy-subrc IS INITIAL.
        ls_rc27m-verid = <ls_prodver>-verid.
      ELSE.
        CLEAR ls_rc27m-verid.
      ENDIF.                                                                      "2193538

      TRY .
        CALL FUNCTION 'MRTRS300_MASTER_RECIPE_READ'
          EXPORTING
            is_rc271           = ls_rc271
            is_rc27m           = ls_rc27m
            is_rc27s           = ls_rc27s
          EXCEPTIONS
*            key_not_qualified  = 1
*            key_invalid        = 2
*            key_number_invalid = 3
*            not_found          = 4
*            existing           = 5
*            internal_error     = 6
*            foreign_lock       = 7
            OTHERS             = 0.

      CATCH CX_SY_SEND_DYNPRO_NO_RECEIVER.

        ev_failed = abap_true.

        MESSAGE e002(/plmi/al_gss_mrcp) WITH <ls_mrcp_buffer>-plnnr <ls_mrcp_buffer>-plnal INTO me->gv_msg.

        /plmb/cl_rcp_message=>add_message(
          CHANGING
            ct_message  = et_message
            cv_severity = ev_severity ).

        lx_mrcp_bl->get_message(
          IMPORTING
            ev_msgid = lv_msgid
            ev_msgty = lv_msgty
            ev_msgno = lv_msgno
            ev_msgv1 = lv_msgv1
            ev_msgv2 = lv_msgv2
            ev_msgv3 = lv_msgv3
            ev_msgv4 = lv_msgv4 ).

        MESSAGE ID lv_msgid TYPE lv_msgty NUMBER lv_msgno WITH lv_msgv1 lv_msgv2 lv_msgv3 lv_msgv4 INTO me->gv_msg.

        /plmb/cl_rcp_message=>add_message(
          CHANGING
            ct_message  = et_message
            cv_severity = ev_severity ).

        RETURN.
      ENDTRY.

    ENDIF.

* Write MRCP
*--------------------------------------------------------------------*
    TRY .

        me->write_mrcp(
          EXPORTING
            is_mrcp_buffer      = <ls_mrcp_buffer>
            iv_aktyp            = iv_aktyp
          CHANGING
            cv_write_was_called = lv_write_was_called
        ).

      CATCH /plmi/cx_mrcp_bl INTO lx_mrcp_bl.
        " Write error

        ev_failed = abap_true.

        MESSAGE e002(/plmi/al_gss_mrcp) WITH <ls_mrcp_buffer>-plnnr <ls_mrcp_buffer>-plnal INTO me->gv_msg.

        /plmb/cl_rcp_message=>add_message(
          CHANGING
            ct_message  = et_message
            cv_severity = ev_severity ).

        lx_mrcp_bl->get_message(
          IMPORTING
            ev_msgid = lv_msgid
            ev_msgty = lv_msgty
            ev_msgno = lv_msgno
            ev_msgv1 = lv_msgv1
            ev_msgv2 = lv_msgv2
            ev_msgv3 = lv_msgv3
            ev_msgv4 = lv_msgv4 ).

        MESSAGE ID lv_msgid TYPE lv_msgty NUMBER lv_msgno WITH lv_msgv1 lv_msgv2 lv_msgv3 lv_msgv4 INTO me->gv_msg.

        /plmb/cl_rcp_message=>add_message(
          CHANGING
            ct_message  = et_message
            cv_severity = ev_severity ).

        RETURN.

    ENDTRY.

* Save Master Recipe into DB ( per Recipe Group )
*--------------------------------------------------------------------*
    AT END OF plnnr.

      IF lv_write_was_called = abap_true.

        CLEAR: ls_rc271, ls_rc27m, ls_rc27s, ls_plkob.

        ls_rc271-plnty = me->gc_plnty_mrcp.
        ls_rc271-plnnr = <ls_mrcp_buffer>-plnnr.
        ls_rc271-plnal = <ls_mrcp_buffer>-plnal.
        ls_rc271-sttag = <ls_mrcp_buffer>-datuv.
        ls_rc271-datuv = <ls_mrcp_buffer>-datuv.
        ls_rc271-aennr = <ls_mrcp_buffer>-aennr.

        ls_rc27s-sttag = <ls_mrcp_buffer>-datuv.
        ls_rc27s-aennr = <ls_mrcp_buffer>-aennr.
        ls_rc27s-aktyp = iv_aktyp.

        CALL FUNCTION 'MRTRS300_MASTER_RECIPE_SAVE'
          EXPORTING
            is_rc271   = ls_rc271
            is_rc27m   = ls_rc27m
            is_rc27s   = ls_rc27s
            is_plkob   = ls_plkob
          EXCEPTIONS
            save_error = 1
            OTHERS     = 2.

        IF sy-subrc NE 0.

          " Save error
          MESSAGE e003(/plmi/al_gss_mrcp) WITH <ls_mrcp_buffer>-plnnr <ls_mrcp_buffer>-plnal INTO me->gv_msg.

          /plmb/cl_rcp_message=>add_message(
            CHANGING
              ct_message     =  et_message
              cv_severity    =  ev_severity
          ).

          " Reinitialization after internal error
          me->init( ).

          RETURN.

        ELSE.

          " Master recipe has been saved
          MESSAGE s005(/plmi/al_gss_mrcp) INTO me->gv_msg.
          /plmb/cl_rcp_message=>add_message(
            CHANGING
              ct_message     =  et_message
              cv_severity    =  ev_severity
          ).

          " Reinitialization after save
          me->init( ).

        ENDIF.

        lv_write_was_called = abap_false.

      ENDIF.

    ENDAT.

    lv_plnnr_prev = <ls_mrcp_buffer>-plnnr.

  ENDLOOP. " loop at buffer

ENDMETHOD.


METHOD SHIFT_ITEMS.

  " EV_SHIFTED_FROM is the sequence number wherefrom the shifting is performed
  " Obviousely after the shift this value wont be the starting point of the shifted sequence

  DATA:
        ls_id                 TYPE ty_id,
        lv_shifted_from       TYPE numc4,
        lv_vornr              TYPE vornr,
        lv_type               TYPE char2,
        lt_message            TYPE /plmb/t_spi_msg,
        lr_item               TYPE REF TO data,
        lv_increment          TYPE numc4,
        lv_sibling_is_exact   TYPE boole_d,
        lv_including_from     TYPE boole_d,
        ls_mrcp_phase         TYPE ty_mrcp_phase_mod.

  FIELD-SYMBOLS:
        <ls_item>             TYPE any,
        <ls_buffer>           TYPE ty_mrcp_buffer,
        <ls_mrcp_operation>   TYPE ty_mrcp_operation_mod
        .

*--------------------------------------------------------------------*
* Clear exporting parameters
*--------------------------------------------------------------------*
  CLEAR: ev_shifted_from, et_message, ev_severity.

*--------------------------------------------------------------------*
* Initialization
*--------------------------------------------------------------------*
  " Get the Master Recipe
  READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
  WITH TABLE KEY plnnr = iv_plnnr
                 plnal = iv_plnal
                 datuv = iv_datuv.

  " Sequence Increment
  me->get_seq_increment(
    EXPORTING
      iv_profile  = <ls_buffer>-header-profidnetz
      iv_type     = is_item-type
    IMPORTING
     ev_increment = lv_increment
     et_message   = lt_message
  ).

  me->change_messages(
    EXPORTING
      it_message  = lt_message
    CHANGING
      ct_message  = et_message
      cv_severity = ev_severity ).

  IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
    RETURN.
  ENDIF.

  CASE is_item-type.
    WHEN gs_c_mrcp_subobj_type-operation. "Operation
      CREATE DATA lr_item TYPE ty_mrcp_operation_mod.
      ASSIGN lr_item->* TO <ls_item>.
    WHEN gs_c_mrcp_subobj_type-phase. " Phase
      CREATE DATA lr_item TYPE ty_mrcp_phase_mod.
      ASSIGN lr_item->* TO <ls_item>.
    WHEN gs_c_mrcp_subobj_type-pi. " Process Instruction
      ASSERT 0 = 1.
      CREATE DATA lr_item TYPE ty_mrcp_pi_mod.
      ASSIGN lr_item->* TO <ls_item>.
    WHEN gs_c_mrcp_subobj_type-pi_cv. " Process Instruction Characteristics
      ASSERT 0 = 1.
      CREATE DATA lr_item TYPE ty_mrcp_pi_char_val_mod.
      ASSIGN lr_item->* TO <ls_item>.
    WHEN gs_c_mrcp_subobj_type-resource. " Resource
      CREATE DATA lr_item TYPE ty_mrcp_resource_mod.
      ASSIGN lr_item->* TO <ls_item>.
  ENDCASE.

*--------------------------------------------------------------------*
* Get the sibling
*--------------------------------------------------------------------*
  " Get sequence number of the target
  me->get_seq_num(
    EXPORTING
      iv_plnnr      = iv_plnnr
      iv_plnal      = iv_plnal
      iv_datuv      = iv_datuv
      is_id         = is_item
      iv_get_last   = iv_including_from
    IMPORTING
      ev_seq_num    = ev_shifted_from
      es_item       = <ls_item>
      et_message    = lt_message
  ).

  me->change_messages(
  EXPORTING
    it_message  = lt_message
  CHANGING
    ct_message  = et_message
    cv_severity = ev_severity ).

  IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
    RETURN.
  ENDIF.

*--------------------------------------------------------------------*
* Figouring out shifting parameters:
* - lv_type
* - <ls_item>
* - lv_including_from
* Setting the new sequence number
* - ev_shifted_from
*--------------------------------------------------------------------*
  lv_type = is_item-type.      " That's only the default
  lv_including_from = abap_true.  " That's only the default

  IF ev_shifted_from IS NOT INITIAL.
*--------------------------------------------------------------------*
* Item recieved
* Meaning that exact sibling ID was set
* Or the given parent has at least one element
* (then the first or last was recieved using the get_seg_num method)
*--------------------------------------------------------------------*
    " Figouring out whether an exact sibling was retrieved or not
    CASE is_item-type.
      WHEN gs_c_mrcp_subobj_type-operation OR gs_c_mrcp_subobj_type-phase OR gs_c_mrcp_subobj_type-resource. "Operation
        IF is_item-plnkn IS NOT INITIAL.
          lv_sibling_is_exact = abap_true.
        ENDIF.
      WHEN gs_c_mrcp_subobj_type-pi. " Process Instruction
        IF is_item-plnkn IS NOT INITIAL AND is_item-plnft IS NOT INITIAL.
          lv_sibling_is_exact = abap_true.
        ENDIF.
      WHEN gs_c_mrcp_subobj_type-pi_cv. " Process Instruction Characteristic
        IF is_item-plnkn IS NOT INITIAL AND is_item-plnft IS NOT INITIAL AND is_item-mkmzl IS NOT INITIAL.
          lv_sibling_is_exact = abap_true.
        ENDIF.
    ENDCASE.

    " Setting lv_including_from
    IF lv_sibling_is_exact EQ abap_true.
      lv_including_from = iv_including_from.
    ELSEIF iv_including_from EQ abap_true. " including from = insert before -> insert as last
      lv_including_from = abap_false. " Inserting to the last place shouldm't shift anything
    ELSE.
      lv_including_from = abap_true. " Inserting to the first place shall shift everything, including the sibling
    ENDIF.

*--------------------------------------------------------------------*
* No item recieved
* In case of no exact sibling ID was set and
* no child objects existing with the given parent
*--------------------------------------------------------------------*
  ELSE.
    " We have to figure out the new sequence number anyway

    CASE is_item-type.
      WHEN gs_c_mrcp_subobj_type-phase.
        " In case of phase this is the parent sequence number plus increment
        " (we need the oparation field symbol temporary only)
        READ TABLE <ls_buffer>-operation ASSIGNING <ls_mrcp_operation>
          WITH KEY  plnkn = is_item-pvzkn.
        ev_shifted_from = <ls_mrcp_operation>-vornr + lv_increment.

        " We shall shift all the Operations that follows the operation next
        " to the future parent of the item. For doing this we need a sibling.
        lv_vornr = ev_shifted_from.
        READ TABLE <ls_buffer>-operation ASSIGNING <ls_mrcp_operation>
          WITH KEY  vornr = lv_vornr.

        IF sy-subrc EQ 0.
          lv_type = gs_c_mrcp_subobj_type-operation.
          ASSIGN <ls_mrcp_operation> TO <ls_item>.
        ELSE.
          " If there's no such operation, then there's nothing to be shifted
          RETURN.
        ENDIF.

      WHEN OTHERS.
        " In every other case numbering starts from beginning
        ev_shifted_from = lv_increment.

        " In this case there's nothing to shift
    ENDCASE.
  ENDIF.

*--------------------------------------------------------------------*
* Adjusting ev_shifted_from if shift shall be executed from the next element
*--------------------------------------------------------------------*
  IF lv_including_from EQ abap_false.
    CASE is_item-type.
      WHEN gs_c_mrcp_subobj_type-operation.
        " In case of operation the next one is after the phases of the current one, so
        " here we are retrieving the sequence number of the last corresponding phase.
        " It can also happen that no exact sibling is set. This case the sequence number
        " of the very last phase will be retrieved
        CLEAR ls_id.
        ls_id-type = gs_c_mrcp_subobj_type-phase.
        ls_id-pvzkn = is_item-plnkn.
        me->get_seq_num(
          EXPORTING
            iv_plnnr      = iv_plnnr
            iv_plnal      = iv_plnal
            iv_datuv      = iv_datuv
            is_id         = ls_id
            iv_get_last   = abap_true
         IMPORTING
           es_item        = ls_mrcp_phase
           ev_seq_num     = lv_shifted_from
        ).

        " The retrieved sequence number will be initial if the selected operation has
        " no phase assigned to it, or if no exact sibling is set, then it can be smaller
        " than the sequence number of the last operation if it is not attached to
        " the last operation.
        IF lv_shifted_from IS NOT INITIAL AND lv_shifted_from > ev_shifted_from.
          ev_shifted_from = lv_shifted_from.
          ASSIGN ls_mrcp_phase TO <ls_item>.
        ENDIF.
    ENDCASE.

    " Shift with the increment
    ADD lv_increment TO ev_shifted_from.
  ENDIF.

*--------------------------------------------------------------------*
* Shift
*--------------------------------------------------------------------*
  IF <ls_item> IS NOT INITIAL.

    me->shift_sequence(
      EXPORTING
        iv_type           = lv_type
        is_from           = <ls_item>
        iv_by             = iv_by
        iv_including_from = lv_including_from
        iv_backwards      = iv_backwards
        iv_plnnr          = iv_plnnr
        iv_plnal          = iv_plnal
        iv_datuv          = iv_datuv
      IMPORTING
        et_message        = lt_message
    ).

    me->change_messages(
      EXPORTING
        it_message  = lt_message
      CHANGING
        ct_message  = et_message
        cv_severity = ev_severity ).

    IF ev_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
      RETURN.
    ENDIF.

  ENDIF.

ENDMETHOD.


METHOD SHIFT_SEQUENCE.

  DATA:
    lv_from               TYPE numc4,
    ls_mrcp_key           TYPE /plmi/s_mrcp_key,
    lv_seq_num            TYPE numc4,
    lv_increment          TYPE numc4,
    lt_message            TYPE /plmb/t_spi_msg,
    lv_severity           TYPE /plmb/spi_msg_severity.

  FIELD-SYMBOLS:
    <ls_buffer>           TYPE ty_mrcp_buffer,

    <ls_oper_shift_from>  TYPE ty_mrcp_operation_mod,
    <ls_phase_shift_from> TYPE ty_mrcp_phase_mod,
    <ls_pi_shift_from>    TYPE ty_mrcp_pi_mod,
    <ls_pi_cv_shift_from> TYPE ty_mrcp_pi_char_val_mod,
    <ls_res_shift_from>   TYPE ty_mrcp_resource_mod,

    <ls_operation>       TYPE ty_mrcp_operation_mod,
    <ls_phase>           TYPE ty_mrcp_phase_mod,
    <ls_pi>              TYPE ty_mrcp_pi_mod,
    <ls_pi_char_val>     TYPE ty_mrcp_pi_char_val_mod,
    <ls_resource>        TYPE ty_mrcp_resource_mod.

  " Assigning <ls_buffer> with the needed Master Recipe
  READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
    WITH TABLE KEY plnnr = iv_plnnr
                   plnal = iv_plnal
                   datuv = iv_datuv.

  " Get increment
  me->get_seq_increment(
    EXPORTING
      iv_profile  = <ls_buffer>-header-profidnetz
      iv_type     = iv_type
    IMPORTING
     ev_increment = lv_increment
     et_message   = et_message
  ).

  me->change_messages(
    EXPORTING
      it_message  = lt_message
    CHANGING
      ct_message  = et_message
      cv_severity = lv_severity ).

  IF lv_severity CA /plmb/if_spi_c=>gs_c_severity_category-error_or_worse.
    RETURN.
  ENDIF.

  MULTIPLY lv_increment BY iv_by.

  CASE iv_type.

*--------------------------------------------------------------------*
    WHEN gs_c_mrcp_subobj_type-operation OR gs_c_mrcp_subobj_type-phase. "Operation and actions

      IF iv_type EQ gs_c_mrcp_subobj_type-operation.
        ASSIGN is_from TO <ls_oper_shift_from>.
        lv_from = <ls_oper_shift_from>-vornr.
      ELSE.
        ASSIGN is_from TO <ls_phase_shift_from>.
        lv_from = <ls_phase_shift_from>-vornr.
      ENDIF.
      IF iv_including_from NE abap_true.
        ADD 1 TO lv_from.
      ENDIF.

      " Shift operations
      LOOP AT <ls_buffer>-operation ASSIGNING <ls_operation>
        WHERE vornr >= lv_from AND
        mod_flg NE me->gc_mod_flag_delete.

        IF <ls_operation>-mod_flg NE me->gc_mod_flag_insert.
          " previous version has to be stored in buffer_old
          CLEAR ls_mrcp_key.
          MOVE-CORRESPONDING <ls_operation> TO ls_mrcp_key.
          CLEAR ls_mrcp_key-aennr. " not used in copy, set rather null than remain inconsistent
          ls_mrcp_key-datuv = iv_datuv.
          me->copy_element_to_buffer_old(
            EXPORTING
              iv_type        = gs_c_mrcp_subobj_type-operation     " Object Type
              is_mrcp_key    = ls_mrcp_key      " Master Recipe Key
              is_mrcp_object = <ls_operation>   " Master Recipe Object
          ).
        ENDIF.

        IF iv_backwards NE abap_true.
          lv_seq_num = <ls_operation>-vornr + lv_increment.
        ELSE.
          lv_seq_num = <ls_operation>-vornr - lv_increment.
        ENDIF.
        <ls_operation>-vornr = lv_seq_num.
        IF <ls_operation>-mod_flg = ''.
          <ls_operation>-mod_flg = gc_mod_flag_update.
        ENDIF.
      ENDLOOP.

      " Shift phases
      LOOP AT <ls_buffer>-phase ASSIGNING <ls_phase>
        WHERE vornr >= lv_from AND
        mod_flg NE me->gc_mod_flag_delete.

        IF <ls_phase>-mod_flg NE me->gc_mod_flag_insert.
          " previous version has to be stored in buffer_old
          CLEAR ls_mrcp_key.
          MOVE-CORRESPONDING <ls_phase> TO ls_mrcp_key.
          CLEAR ls_mrcp_key-aennr. " not used in copy, set rather null than remain inconsistent
          ls_mrcp_key-datuv = iv_datuv.
          me->copy_element_to_buffer_old(
            EXPORTING
              iv_type        = gs_c_mrcp_subobj_type-phase         " Object Type
              is_mrcp_key    = ls_mrcp_key      " Master Recipe Key
              is_mrcp_object = <ls_phase>       " Master Recipe Object
          ).
        ENDIF.

        IF iv_backwards NE abap_true.
          lv_seq_num = <ls_phase>-vornr + lv_increment.
        ELSE.
          lv_seq_num = <ls_phase>-vornr - lv_increment.
        ENDIF.
        <ls_phase>-vornr = lv_seq_num.
        IF <ls_phase>-mod_flg = ''.
          <ls_phase>-mod_flg = gc_mod_flag_update.
        ENDIF.
      ENDLOOP.

*--------------------------------------------------------------------*
    WHEN gs_c_mrcp_subobj_type-pi. " Process Instruction
      ASSIGN is_from TO <ls_pi_shift_from>.
      lv_from = <ls_pi_shift_from>-ftrnr.
      IF iv_including_from NE abap_true.
        ADD 1 TO lv_from.
      ENDIF.

      LOOP AT <ls_buffer>-pi ASSIGNING <ls_pi>
         WHERE  plnkn = <ls_pi_shift_from>-plnkn AND
                ftrnr >= lv_from AND
                mod_flg NE me->gc_mod_flag_delete.

        IF <ls_pi>-mod_flg NE me->gc_mod_flag_insert.
          " previous version has to be stored in buffer_old
          CLEAR ls_mrcp_key.
          MOVE-CORRESPONDING <ls_pi> TO ls_mrcp_key.
          CLEAR ls_mrcp_key-aennr. " not used in copy, set rather null than remain inconsistent
          ls_mrcp_key-datuv = iv_datuv.
          me->copy_element_to_buffer_old(
            EXPORTING
              iv_type        = gs_c_mrcp_subobj_type-pi    " Object Type
              is_mrcp_key    = ls_mrcp_key    " Master Recipe Key
              is_mrcp_object = <ls_pi>  " Master Recipe Object
          ).
        ENDIF.

        IF iv_backwards NE abap_true.
          lv_seq_num = <ls_pi>-ftrnr + lv_increment.
        ELSE.
          lv_seq_num = <ls_pi>-ftrnr - lv_increment.
        ENDIF.
        <ls_pi>-ftrnr = lv_seq_num.
        IF <ls_pi>-mod_flg = ''.
          <ls_pi>-mod_flg = gc_mod_flag_update.
        ENDIF.
      ENDLOOP.

*--------------------------------------------------------------------*
    WHEN gs_c_mrcp_subobj_type-pi_cv. " Process Instruction Characteristics
      ASSIGN is_from TO <ls_pi_cv_shift_from>.
      lv_from = <ls_pi_cv_shift_from>-fvlnr.
      IF iv_including_from NE abap_true.
        ADD 1 TO lv_from.
      ENDIF.

      LOOP AT <ls_buffer>-pi_char_val ASSIGNING <ls_pi_char_val>
        WHERE plnkn = <ls_pi_cv_shift_from>-plnkn AND
              plnft = <ls_pi_cv_shift_from>-plnft AND
              fvlnr >= lv_from AND
              mod_flg NE me->gc_mod_flag_delete.

        IF <ls_pi_char_val>-mod_flg NE me->gc_mod_flag_insert.
          " previous version has to be stored in buffer_old
          CLEAR ls_mrcp_key.
          MOVE-CORRESPONDING <ls_pi_char_val> TO ls_mrcp_key.
          CLEAR ls_mrcp_key-aennr. " not used in copy, set rather null than remain inconsistent
          ls_mrcp_key-datuv = iv_datuv.
          me->copy_element_to_buffer_old(
            EXPORTING
              iv_type        = gs_c_mrcp_subobj_type-pi_cv    " Object Type
              is_mrcp_key    = ls_mrcp_key    " Master Recipe Key
              is_mrcp_object = <ls_pi_char_val>  " Master Recipe Object
          ).
        ENDIF.

        IF iv_backwards NE abap_true.
          lv_seq_num = <ls_pi_char_val>-fvlnr + lv_increment.
        ELSE.
          lv_seq_num = <ls_pi_char_val>-fvlnr - lv_increment.
        ENDIF.
        <ls_pi_char_val>-fvlnr = lv_seq_num.
        IF <ls_pi_char_val>-mod_flg = ''.
          <ls_pi_char_val>-mod_flg = gc_mod_flag_update.
        ENDIF.
      ENDLOOP.

*--------------------------------------------------------------------*
    WHEN gs_c_mrcp_subobj_type-resource. " Resource
      ASSIGN is_from TO <ls_res_shift_from>.
      lv_from = <ls_res_shift_from>-vornr.
      IF iv_including_from NE abap_true.
        ADD 1 TO lv_from.
      ENDIF.

      LOOP AT <ls_buffer>-resource ASSIGNING <ls_resource>
        WHERE sumnr = <ls_res_shift_from>-sumnr AND
              vornr >= lv_from AND
              mod_flg NE me->gc_mod_flag_delete.

        IF <ls_resource>-mod_flg NE me->gc_mod_flag_insert.
          " previous version has to be stored in buffer_old
          CLEAR ls_mrcp_key.
          MOVE-CORRESPONDING <ls_resource> TO ls_mrcp_key.
          CLEAR ls_mrcp_key-aennr. " not used in copy, set rather null than remain inconsistent
          ls_mrcp_key-datuv = iv_datuv.
          me->copy_element_to_buffer_old(
            EXPORTING
              iv_type        = gs_c_mrcp_subobj_type-resource    " Object Type
              is_mrcp_key    = ls_mrcp_key    " Master Recipe Key
              is_mrcp_object = <ls_resource>  " Master Recipe Object
          ).
        ENDIF.

        IF iv_backwards NE abap_true.
          lv_seq_num = <ls_resource>-vornr + lv_increment.
        ELSE.
          lv_seq_num = <ls_resource>-vornr - lv_increment.
        ENDIF.
        <ls_resource>-vornr = lv_seq_num.
        IF <ls_resource>-mod_flg = ''.
          <ls_resource>-mod_flg = gc_mod_flag_update.
        ENDIF.
      ENDLOOP.

  ENDCASE.

ENDMETHOD.


METHOD UNLOCK.

  DATA: ls_lock TYPE ty_lock.

  LOOP AT me->mt_lock_buffer INTO ls_lock.

    CALL FUNCTION 'DEQUEUE_EPPLKO'
      EXPORTING
        mandt = sy-mandt
        plnty = '2'
        plnnr = ls_lock-plnnr.

  ENDLOOP.

  " Clear Lock buffer
  CLEAR me->mt_lock_buffer.

ENDMETHOD.


METHOD WRITE_MRCP.

  DATA:
        ls_mrcp_key         TYPE /plmi/s_mrcp_key,

        ls_rc271            TYPE rc271,
        ls_rc27s            TYPE rc27s,
        ls_rc27m            TYPE rc27m,
        ls_plkob            TYPE plkob,
        ls_plkob_old        TYPE plkob,

        ls_mkal             TYPE mkal,
        ls_mkal_old         TYPE mkal,

        ls_operation        TYPE mrtrss_plpo_opr,
        lt_operation        TYPE mrtrsty_plpo_opr,
        ls_operation_old    TYPE mrtrss_plpo_opr,
        lt_operation_old    TYPE mrtrsty_plpo_opr,

        ls_phase            TYPE mrtrss_plpo_ph,
        lt_phase            TYPE mrtrsty_plpo_ph,
        ls_phase_old        TYPE mrtrss_plpo_ph,
        lt_phase_old        TYPE mrtrsty_plpo_ph,

        lt_relation         TYPE mrtrsty_plab,
        lt_relation_old     TYPE mrtrsty_plab,

        ls_sec_res          TYPE mrtrss_plpo_opr,
        lt_sec_res          TYPE mrtrsty_plpo_sres,
        ls_sec_res_old      TYPE mrtrss_plpo_opr,
        lt_sec_res_old      TYPE mrtrsty_plpo_sres,

        lt_mapl             TYPE mrtrsty_mapl,
        ls_mapl             TYPE maplb,
        ls_mapl_old         TYPE maplb,
        lt_mapl_old         TYPE mrtrsty_mapl,

        ls_plmz             TYPE plmzb,
        lt_plmz             TYPE mrtrsty_plmz,
        ls_plmz_old         TYPE plmzb,
        lt_plmz_old         TYPE mrtrsty_plmz,

        ls_plft             TYPE mrtrss_plft,
        lt_plft             TYPE mrtrsty_plft,
        ls_plft_old         TYPE mrtrss_plft,
        lt_plft_old         TYPE mrtrsty_plft,

        ls_plfv             TYPE mrtrss_plfv,
        lt_plfv             TYPE mrtrsty_plfv,
        ls_plfv_old         TYPE mrtrss_plfv,
        lt_plfv_old         TYPE mrtrsty_plfv,

        lt_plmk             TYPE mrtrsty_plmk,
        lt_plmk_old         TYPE mrtrsty_plmk,

        lt_plmw             TYPE mrtrsty_plmw,
        lt_plmw_old         TYPE mrtrsty_plmw,

        ls_rsc_obkey        TYPE api_ob_key,
        ls_rsc_ausp         TYPE api_ausp,
        ls_resclas          TYPE mrtrss_resclas,
        lt_resclas          TYPE mrtrsty_resclas,

        lt_ltext            TYPE mrtrsty_ltxt,
        lt_ltext_old        TYPE mrtrsty_ltxt,

        ls_stkob            TYPE stkob,
        ls_stkok            TYPE stkok,
        lt_stpob            TYPE mrtrsty_stpob,

        lt_operation_e      TYPE mrtrsty_plpo_opr,
        ls_operation_e      TYPE mrtrss_plpo_opr,
        lt_phase_e          TYPE mrtrsty_plpo_ph,
        ls_phase_e          TYPE mrtrss_plpo_ph,
        lt_sec_resource_e   TYPE mrtrsty_plpo_sres,
        ls_sec_resource_e   TYPE mrtrss_plpo_opr,
        lt_plft_e           TYPE mrtrsty_plft,
        ls_plft_e           TYPE mrtrss_plft,
        lt_plfv_e           TYPE mrtrsty_plfv,
        ls_plfv_e           TYPE mrtrss_plfv,

        lv_parent_mod_flg   TYPE char1,
        lv_mod_flg_set      TYPE string,

        ls_plnkn_mapping    TYPE gty_s_plnkn_mapping,
        ls_plnft_mapping    TYPE gty_s_plnft_mapping,
        ls_mkmzl_mapping    TYPE gty_s_mkmzl_mapping,

        lx_mrcp_bl          TYPE REF TO /plmi/cx_mrcp_bl,

        ls_pi_cat_details   TYPE v_tc50_2
        .

  FIELD-SYMBOLS:
       <ls_operation>       TYPE mrtrss_plpo_opr,
       <ls_phase>           TYPE mrtrss_plpo_ph,
       <ls_pi>              TYPE mrtrss_plft,
       <ls_pi_cv>           TYPE mrtrss_plfv,

       <ls_buffer>          TYPE ty_mrcp_buffer,
       <ls_buffer_old>      TYPE ty_mrcp_buffer,
       <ls_prodver_buf>     TYPE ty_mrcp_prodver_mod,
       <ls_prodver_old>     TYPE ty_mrcp_prodver_mod,
       <ls_mat_assign_buf>  TYPE ty_mrcp_mat_assign_mod,
       <ls_mat_assign_old>  TYPE ty_mrcp_mat_assign_mod,
       <ls_operation_buf>   TYPE ty_mrcp_operation_mod,
       <ls_operation_old>   TYPE ty_mrcp_operation_mod,
       <ls_phase_buf>       TYPE ty_mrcp_phase_mod,
       <ls_phase_old>       TYPE ty_mrcp_phase_mod,
       <ls_secres_buf>      TYPE ty_mrcp_resource_mod,
       <ls_secres_old>      TYPE ty_mrcp_resource_mod,
       <ls_pi_buf>          TYPE ty_mrcp_pi_mod,
       <ls_pi_old>          TYPE ty_mrcp_pi_mod,
       <ls_pi_cv_buf>       TYPE ty_mrcp_pi_char_val_mod,
       <ls_pi_cv_old>       TYPE ty_mrcp_pi_char_val_mod,
       <ls_rsc_buf>         TYPE ty_mrcp_rsc_mod,
       <ls_rsc_char_val>    TYPE /plmi/s_mrcp_rsc_char_val.

*--------------------------------------------------------------------*
* Map importing parameters to FM parameters
*--------------------------------------------------------------------*

  ls_rc271-plnty      = me->gc_plnty_mrcp.
  ls_rc271-plnnr      = is_mrcp_buffer-plnnr.
  ls_rc271-plnal      = is_mrcp_buffer-plnal.
  ls_rc271-aennr      = is_mrcp_buffer-aennr.
  ls_rc271-sttag      = is_mrcp_buffer-datuv.
  ls_rc271-datuv      = is_mrcp_buffer-datuv.
  ls_rc271-profidnetz = is_mrcp_buffer-header-profidnetz.

  ls_rc27s-aennr      = is_mrcp_buffer-aennr.
  ls_rc27s-sttag      = is_mrcp_buffer-datuv.
  ls_rc27s-aktyp      = iv_aktyp.

  ls_rc27m-werks      = is_mrcp_buffer-header-werks.

*--------------------------------------------------------------------*
* Map header data
*--------------------------------------------------------------------*
  CASE iv_aktyp.

    WHEN 'H'. "AkTyp: Hinzufuegen - Create/Add
      lv_mod_flg_set = gc_mod_flag_insert.

      CASE is_mrcp_buffer-header-mod_flg.

        WHEN space.
          " the 'plkob_old' structure has to be also filled out in case of child object creation/modification
          MOVE-CORRESPONDING is_mrcp_buffer-header TO ls_plkob.
          ls_plkob_old = ls_plkob.

        WHEN gc_mod_flag_insert.
          MOVE-CORRESPONDING is_mrcp_buffer-header TO ls_plkob.

        WHEN gc_mod_flag_update.
          " the 'plkob_old' structure has to be also filled out in case of child object creation/modification
          MOVE-CORRESPONDING is_mrcp_buffer-header TO ls_plkob.
          ls_plkob_old = ls_plkob.

      ENDCASE.

    WHEN 'V'. "Aktyp: Veraendern - Change
      CONCATENATE gc_mod_flag_update
                  gc_mod_flag_delete INTO lv_mod_flg_set.

      CASE is_mrcp_buffer-header-mod_flg.

        WHEN space.
          " the 'plkob_old' structure has to be also filled out in case of child object creation/modification
          MOVE-CORRESPONDING is_mrcp_buffer-header TO ls_plkob.
          ls_plkob_old = ls_plkob.

        WHEN gc_mod_flag_insert.
          " there is nothing to do here

        WHEN gc_mod_flag_update.
          MOVE-CORRESPONDING is_mrcp_buffer-header TO ls_plkob.

          READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
            WITH KEY  plnnr = is_mrcp_buffer-plnnr
                      plnal = is_mrcp_buffer-plnal
                      datuv = is_mrcp_buffer-datuv.

          IF <ls_buffer_old> IS ASSIGNED.
            MOVE-CORRESPONDING <ls_buffer_old>-header TO ls_plkob_old.
            ls_plkob-datuv = ls_plkob_old-datuv.
            ls_plkob-aennr = ls_plkob_old-aennr.
          ELSE.
            ASSERT 0 = 1.
          ENDIF.

      ENDCASE.

    WHEN OTHERS.
      ASSERT 0 = 1.

  ENDCASE.

*--------------------------------------------------------------------*
* Map operations
*--------------------------------------------------------------------*
  LOOP AT is_mrcp_buffer-operation ASSIGNING <ls_operation_buf>
    WHERE mod_flg CA lv_mod_flg_set.

    CLEAR: ls_operation, ls_operation_old.
    MOVE-CORRESPONDING <ls_operation_buf> TO ls_operation ##ENH_OK.

    IF iv_aktyp EQ 'V'.

      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      IF <ls_buffer_old> IS ASSIGNED.

        READ TABLE <ls_buffer_old>-operation ASSIGNING <ls_operation_old>
          WITH KEY  plnnr = <ls_operation_buf>-plnnr
                    plnal = <ls_operation_buf>-plnal
                    plnkn = <ls_operation_buf>-plnkn
                    zaehl = <ls_operation_buf>-zaehl
                    .

        IF <ls_operation_old> IS ASSIGNED.

          MOVE-CORRESPONDING <ls_operation_old> TO ls_operation_old ##ENH_OK.
          APPEND ls_operation_old TO lt_operation_old.

          IF ls_operation-datuv NE <ls_operation_old>-datuv.
            ls_operation-datuv = <ls_operation_old>-datuv.
            ls_operation-aennr = <ls_operation_old>-aennr.
          ENDIF.

        ELSE.
          ASSERT 0 = 1.
        ENDIF.

      ELSE.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

    APPEND ls_operation TO lt_operation.

  ENDLOOP.

*--------------------------------------------------------------------*
* Map phases
*--------------------------------------------------------------------*
  LOOP AT is_mrcp_buffer-phase ASSIGNING <ls_phase_buf>
    WHERE mod_flg CA lv_mod_flg_set.

    CLEAR: ls_phase, ls_phase_old, ls_operation.
    UNASSIGN: <ls_operation_buf>.

    " the related (already existing )operation has to be also provided for the phase
    READ TABLE is_mrcp_buffer-operation ASSIGNING <ls_operation_buf>
    WITH KEY  plnnr   = <ls_phase_buf>-plnnr
              plnal   = <ls_phase_buf>-plnal
              plnkn   = <ls_phase_buf>-pvzkn.

    lv_parent_mod_flg = <ls_operation_buf>-mod_flg.

    IF iv_aktyp EQ 'H' AND <ls_operation_buf>-mod_flg = gc_mod_flag_update.
      " if we are in add mode (H), but the parent operation was modified,
      " then we need to add the original parent to the tables

      " read old buffer
      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      " read old operation
      READ TABLE <ls_buffer_old>-operation ASSIGNING <ls_operation_buf>
      WITH KEY  plnnr   = <ls_phase_buf>-plnnr
                plnal   = <ls_phase_buf>-plnal
                plnkn   = <ls_phase_buf>-pvzkn.

      IF sy-subrc NE 0.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

    " the '_old' structure has to be also filled out with the same data in the following cases:
    IF ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ space ) OR
       ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ gc_mod_flag_update ) OR
       ( iv_aktyp EQ 'V' AND lv_parent_mod_flg EQ space ).

      MOVE-CORRESPONDING <ls_operation_buf> TO ls_operation ##ENH_OK.
      APPEND ls_operation TO lt_operation.
      APPEND ls_operation TO lt_operation_old.
      SORT lt_operation BY plnnr plnal plnkn.
      SORT lt_operation_old BY plnnr plnal plnkn.
      DELETE ADJACENT DUPLICATES FROM lt_operation COMPARING plnnr plnal plnkn.
      DELETE ADJACENT DUPLICATES FROM lt_operation_old COMPARING plnnr plnal plnkn.

    ENDIF.

    MOVE-CORRESPONDING <ls_phase_buf> TO ls_phase ##ENH_OK.

    IF iv_aktyp EQ 'V'.

      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      IF <ls_buffer_old> IS ASSIGNED.

        READ TABLE <ls_buffer_old>-phase ASSIGNING <ls_phase_old>
          WITH KEY  plnnr = <ls_phase_buf>-plnnr
                    plnal = <ls_phase_buf>-plnal
                    plnkn = <ls_phase_buf>-plnkn
                    zaehl = <ls_phase_buf>-zaehl
                    .

        IF <ls_phase_old> IS ASSIGNED.

          MOVE-CORRESPONDING <ls_phase_old> TO ls_phase_old ##ENH_OK.
          APPEND ls_phase_old TO lt_phase_old.

          IF ls_phase-datuv NE <ls_phase_old>-datuv.
            ls_phase-datuv = <ls_phase_old>-datuv.
            ls_phase-aennr = <ls_phase_old>-aennr.
          ENDIF.

        ELSE.
          ASSERT 0 = 1.
        ENDIF.

      ELSE.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

    APPEND ls_phase TO lt_phase.

  ENDLOOP.

*--------------------------------------------------------------------*
* Map secondary resources
*--------------------------------------------------------------------*
  LOOP AT is_mrcp_buffer-resource ASSIGNING <ls_secres_buf>
    WHERE mod_flg CA lv_mod_flg_set.

    CLEAR: ls_sec_res, ls_sec_res_old, ls_operation, ls_phase.
    UNASSIGN: <ls_operation_buf>, <ls_phase_buf>.

    " the related (already existing )operation has to be also provided for the secondary resource
    READ TABLE is_mrcp_buffer-operation ASSIGNING <ls_operation_buf>
    WITH KEY  plnnr   = <ls_secres_buf>-plnnr
              plnal   = <ls_secres_buf>-plnal
              plnkn   = <ls_secres_buf>-sumnr.

    IF <ls_operation_buf> IS ASSIGNED.

      IF iv_aktyp EQ 'H' AND <ls_operation_buf>-mod_flg = gc_mod_flag_update.
        " if we are in add mode (H), but the parent operation was modified,
        " then we need to add the original parent to the tables

        " read old buffer
        READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
          WITH KEY  plnnr = is_mrcp_buffer-plnnr
                    plnal = is_mrcp_buffer-plnal
                    datuv = is_mrcp_buffer-datuv.

        " read old operation
        READ TABLE <ls_buffer_old>-operation ASSIGNING <ls_operation_buf>
        WITH KEY  plnnr   = <ls_secres_buf>-plnnr
                  plnal   = <ls_secres_buf>-plnal
                  plnkn   = <ls_secres_buf>-sumnr.

        IF sy-subrc NE 0.
          ASSERT 0 = 1.
        ENDIF.

      ENDIF.

    ENDIF.

    " the related (already existing )phase has to be also provided for the secondary resource
    READ TABLE is_mrcp_buffer-phase ASSIGNING <ls_phase_buf>
    WITH KEY  plnnr   = <ls_secres_buf>-plnnr
              plnal   = <ls_secres_buf>-plnal
              plnkn   = <ls_secres_buf>-sumnr.

    IF <ls_phase_buf> IS ASSIGNED.

      READ TABLE is_mrcp_buffer-operation ASSIGNING <ls_operation_buf>
      WITH KEY  plnnr   = <ls_phase_buf>-plnnr
                plnal   = <ls_phase_buf>-plnal
                plnkn   = <ls_phase_buf>-pvzkn.

      IF iv_aktyp EQ 'H' AND <ls_phase_buf>-mod_flg = gc_mod_flag_update.
        " if we are in add mode (H), but the parent phase was modified,
        " then we need to add the original parent to the tables

        " read old buffer
        READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
          WITH KEY  plnnr = is_mrcp_buffer-plnnr
                    plnal = is_mrcp_buffer-plnal
                    datuv = is_mrcp_buffer-datuv.

        " read old phase
        READ TABLE <ls_buffer_old>-phase ASSIGNING <ls_phase_buf>
        WITH KEY  plnnr   = <ls_secres_buf>-plnnr
                  plnal   = <ls_secres_buf>-plnal
                  plnkn   = <ls_secres_buf>-sumnr.

        IF sy-subrc NE 0.
          ASSERT 0 = 1.
        ENDIF.

        " read old operation if it is necessary
        IF <ls_operation_buf>-mod_flg EQ gc_mod_flag_update.
          READ TABLE <ls_buffer_old>-operation ASSIGNING <ls_operation_buf>
          WITH KEY  plnnr   = <ls_operation_buf>-plnnr
                    plnal   = <ls_operation_buf>-plnal
                    plnkn   = <ls_operation_buf>-plnkn.
        ENDIF.

      ENDIF.

    ENDIF.

    IF <ls_operation_buf> IS ASSIGNED.

      lv_parent_mod_flg = <ls_operation_buf>-mod_flg.

      " the '_old' structures have to be also filled out with the same data in the following cases:
      IF ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ space ) OR
         ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ gc_mod_flag_update ) OR
         ( iv_aktyp EQ 'V' AND lv_parent_mod_flg EQ space ).

        MOVE-CORRESPONDING <ls_operation_buf> TO ls_operation ##ENH_OK.
        APPEND ls_operation TO lt_operation.
        APPEND ls_operation TO lt_operation_old.
        SORT lt_operation BY plnnr plnal plnkn.
        SORT lt_operation_old BY plnnr plnal plnkn.
        DELETE ADJACENT DUPLICATES FROM lt_operation COMPARING plnnr plnal plnkn.
        DELETE ADJACENT DUPLICATES FROM lt_operation_old COMPARING plnnr plnal plnkn.

      ENDIF.

    ENDIF.

    IF <ls_phase_buf> IS ASSIGNED.

      lv_parent_mod_flg = <ls_phase_buf>-mod_flg.

      " the '_old' structures have to be also filled out with the same data in the following cases:
      IF ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ space ) OR
         ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ gc_mod_flag_update ) OR
         ( iv_aktyp EQ 'V' AND lv_parent_mod_flg EQ space ).

        MOVE-CORRESPONDING <ls_phase_buf> TO ls_phase ##ENH_OK.
        ls_phase-pvznr = <ls_operation_buf>-vornr.
        APPEND ls_phase TO lt_phase.
        APPEND ls_phase TO lt_phase_old.
        SORT lt_phase BY plnnr plnal plnkn.
        SORT lt_phase_old BY plnnr plnal plnkn.
        DELETE ADJACENT DUPLICATES FROM lt_phase COMPARING plnnr plnal plnkn.
        DELETE ADJACENT DUPLICATES FROM lt_phase_old COMPARING plnnr plnal plnkn.

      ENDIF.

    ENDIF.

    MOVE-CORRESPONDING <ls_secres_buf> TO ls_sec_res ##ENH_OK.
    ls_sec_res-uvorn = ls_sec_res-vornr.

    IF iv_aktyp EQ 'V'.

      " read old buffer
      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      IF <ls_buffer_old> IS ASSIGNED.

        READ TABLE <ls_buffer_old>-resource ASSIGNING <ls_secres_old>
          WITH KEY  plnnr = <ls_secres_buf>-plnnr
                    plnal = <ls_secres_buf>-plnal
                    plnkn = <ls_secres_buf>-plnkn
                    zaehl = <ls_secres_buf>-zaehl
                    .
        IF <ls_secres_old> IS ASSIGNED.

          MOVE-CORRESPONDING <ls_secres_old> TO ls_sec_res_old ##ENH_OK.
          APPEND ls_sec_res_old TO lt_sec_res_old.

          IF ls_sec_res-datuv NE <ls_secres_old>-datuv.
            ls_sec_res-datuv = <ls_secres_old>-datuv.
            ls_sec_res-aennr = <ls_secres_old>-aennr.
          ENDIF.

        ELSE.
          ASSERT 0 = 1.
        ENDIF.

      ELSE.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

    APPEND ls_sec_res TO lt_sec_res.

  ENDLOOP.

*--------------------------------------------------------------------*
* Map process intructions
*--------------------------------------------------------------------*
  LOOP AT is_mrcp_buffer-pi ASSIGNING <ls_pi_buf>
    WHERE mod_flg CA lv_mod_flg_set.

    CLEAR: ls_plft, ls_plft_old, ls_phase, ls_operation.
    UNASSIGN: <ls_phase_buf>, <ls_operation_buf>.

    " the related (already existing ) phase has to be also provided for the proc. instr.
    READ TABLE is_mrcp_buffer-phase ASSIGNING <ls_phase_buf>
    WITH KEY  plnnr   = <ls_pi_buf>-plnnr
              plnal   = <ls_pi_buf>-plnal
              plnkn   = <ls_pi_buf>-plnkn
              .

    IF <ls_phase_buf>-loekz EQ 'X'.
      " in case of deleted parent, the process instruction to be deleted shall not be provided to the write function module
      CONTINUE.
    ENDIF.

    IF iv_aktyp EQ 'H' AND <ls_phase_buf>-mod_flg = gc_mod_flag_update.
      " if we are in add mode (H), but the parent phase was modified,
      " then we need to add the original parent to the tables

      " read old buffer
      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      " read old phase
      READ TABLE <ls_buffer_old>-phase ASSIGNING <ls_phase_buf>
      WITH KEY  plnnr   = <ls_pi_buf>-plnnr
                plnal   = <ls_pi_buf>-plnal
                plnkn   = <ls_pi_buf>-plnkn
                .

      IF sy-subrc NE 0.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

    " the related (already existing ) operation has to be also provided for the proc. instr.
    READ TABLE is_mrcp_buffer-operation ASSIGNING <ls_operation_buf>
    WITH KEY  plnnr   = <ls_phase_buf>-plnnr
              plnal   = <ls_phase_buf>-plnal
              plnkn   = <ls_phase_buf>-pvzkn.

    IF iv_aktyp EQ 'H' AND <ls_operation_buf>-mod_flg = gc_mod_flag_update.
      " if we are in add mode (H), but the parent operation was modified,
      " then we need to add the original parent to the tables

      " read old buffer
      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      " read old operation
      READ TABLE <ls_buffer_old>-operation ASSIGNING <ls_operation_buf>
      WITH KEY  plnnr   = <ls_phase_buf>-plnnr
                plnal   = <ls_phase_buf>-plnal
                plnkn   = <ls_phase_buf>-pvzkn.

      IF sy-subrc NE 0.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

    lv_parent_mod_flg = <ls_phase_buf>-mod_flg.

    " the '_old' structures have to be also filled out with the same data in the following cases:
    IF ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ space ) OR
       ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ gc_mod_flag_update ) OR
       ( iv_aktyp EQ 'V' AND lv_parent_mod_flg EQ space ).

      MOVE-CORRESPONDING <ls_phase_buf> TO ls_phase ##ENH_OK.

      " the called FM fills the sequence number only for new objects, to ensure that new and old
      " objects remains the same (and therefore unprocessed for add), we fill the here the seq.
      " number for both objects with the same value
      ls_phase-pvznr = <ls_operation_buf>-vornr.

      APPEND ls_phase TO lt_phase.
      APPEND ls_phase TO lt_phase_old.
      SORT lt_phase BY plnnr plnal plnkn.
      SORT lt_phase_old BY plnnr plnal plnkn.
      DELETE ADJACENT DUPLICATES FROM lt_phase COMPARING plnnr plnal plnkn.
      DELETE ADJACENT DUPLICATES FROM lt_phase_old COMPARING plnnr plnal plnkn.

    ENDIF.

    lv_parent_mod_flg = <ls_operation_buf>-mod_flg.

    " the '_old' structures have to be also filled out with the same data in the following cases:
    IF ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ space ) OR
       ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ gc_mod_flag_update ) OR
       ( iv_aktyp EQ 'V' AND lv_parent_mod_flg EQ space ).

      MOVE-CORRESPONDING <ls_operation_buf> TO ls_operation ##ENH_OK.
      APPEND ls_operation TO lt_operation.
      APPEND ls_operation TO lt_operation_old.
      SORT lt_operation BY plnnr plnal plnkn.
      SORT lt_operation_old BY plnnr plnal plnkn.
      DELETE ADJACENT DUPLICATES FROM lt_operation COMPARING plnnr plnal plnkn.
      DELETE ADJACENT DUPLICATES FROM lt_operation_old COMPARING plnnr plnal plnkn.

    ENDIF.

    MOVE-CORRESPONDING <ls_pi_buf> TO ls_plft ##ENH_OK.

    IF iv_aktyp EQ 'V'.

      " read old buffer
      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      IF <ls_buffer_old> IS ASSIGNED.

        READ TABLE <ls_buffer_old>-pi ASSIGNING <ls_pi_old>
          WITH KEY  plnnr = <ls_pi_buf>-plnnr
                    plnal = <ls_pi_buf>-plnal
                    plnkn = <ls_pi_buf>-plnkn
                    plnft = <ls_pi_buf>-plnft
                    zaehl = <ls_pi_buf>-zaehl
                    .

        IF <ls_pi_old> IS ASSIGNED.

          MOVE-CORRESPONDING <ls_pi_old> TO ls_plft_old ##ENH_OK.
          APPEND ls_plft_old TO lt_plft_old.

          IF ls_plft-datuv NE <ls_pi_old>-datuv.
            ls_plft-datuv = <ls_pi_old>-datuv.
            ls_plft-aennr = <ls_pi_old>-aennr.
          ENDIF.

        ELSE.
          ASSERT 0 = 1.
        ENDIF.

      ELSE.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

    " get process instruction category type
    CALL FUNCTION 'TC50_INST_READ'
      EXPORTING
        plant                 = is_mrcp_buffer-header-werks
        process_inst_cat      = ls_plft-costr
        language              = sy-langu
      IMPORTING
        process_inst_cat_data = ls_pi_cat_details
      EXCEPTIONS
        not_found             = 1
        OTHERS                = 2.
    IF sy-subrc NE 0.
      MESSAGE e007(/plmi/al_gss_mrcp) WITH ls_plft-costr INTO me->gv_msg.
      CREATE OBJECT lx_mrcp_bl.
      lx_mrcp_bl->set_message(
        iv_msgid = sy-msgid
        iv_msgty = /plmb/cl_rcp_message=>gc_sv_error
        iv_msgno = sy-msgno
        iv_msgv1 = sy-msgv1
        iv_msgv2 = sy-msgv2
        iv_msgv3 = sy-msgv3
        iv_msgv4 = sy-msgv4 ).
      RAISE EXCEPTION lx_mrcp_bl.
    ENDIF.

    ls_plft-fttyp = ls_pi_cat_details-fttyp.
    APPEND ls_plft TO lt_plft.

  ENDLOOP.

*--------------------------------------------------------------------*
* Map process instruction characteristic values
*--------------------------------------------------------------------*
  LOOP AT is_mrcp_buffer-pi_char_val ASSIGNING <ls_pi_cv_buf>
    WHERE mod_flg CA lv_mod_flg_set.

    CLEAR: ls_plfv, ls_plfv_old, ls_phase, ls_operation, ls_plft.
    UNASSIGN: <ls_pi_buf>, <ls_phase_buf>, <ls_operation_buf>.

    " the related (already existing ) proc. instr. has to be also provided for the proc. instr. char. val.
    READ TABLE is_mrcp_buffer-pi ASSIGNING <ls_pi_buf>
    WITH KEY  plnnr   = <ls_pi_cv_buf>-plnnr
              plnal   = <ls_pi_cv_buf>-plnal
              plnkn   = <ls_pi_cv_buf>-plnkn
              plnft   = <ls_pi_cv_buf>-plnft
              .

    IF iv_aktyp EQ 'H' AND <ls_pi_buf>-mod_flg = gc_mod_flag_update.
      " if we are in add mode (H), but the parent proc. instr. was modified,
      " then we need to add the original parent to the tables

      " read old buffer
      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      " read old proc. instr.
      READ TABLE <ls_buffer_old>-pi ASSIGNING <ls_pi_buf>
      WITH KEY  plnnr   = <ls_pi_cv_buf>-plnnr
                plnal   = <ls_pi_cv_buf>-plnal
                plnkn   = <ls_pi_cv_buf>-plnkn
                plnft   = <ls_pi_cv_buf>-plnft
                .

      IF sy-subrc NE 0.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

    " the related (already existing ) phase has to be also provided for the proc. instr.
    READ TABLE is_mrcp_buffer-phase ASSIGNING <ls_phase_buf>
    WITH KEY  plnnr   = <ls_pi_buf>-plnnr
              plnal   = <ls_pi_buf>-plnal
              plnkn   = <ls_pi_buf>-plnkn
              .

    IF iv_aktyp EQ 'H' AND <ls_phase_buf>-mod_flg = gc_mod_flag_update.
      " if we are in add mode (H), but the parent phase was modified,
      " then we need to add the original parent to the tables

      " read old buffer
      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      " read old phase
      READ TABLE <ls_buffer_old>-phase ASSIGNING <ls_phase_buf>
      WITH KEY  plnnr   = <ls_pi_buf>-plnnr
                plnal   = <ls_pi_buf>-plnal
                plnkn   = <ls_pi_buf>-plnkn
                .

      IF sy-subrc NE 0.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

    " the related (already existing )operation has to be also provided for the proc. instr.
    READ TABLE is_mrcp_buffer-operation ASSIGNING <ls_operation_buf>
    WITH KEY  plnnr   = <ls_phase_buf>-plnnr
              plnal   = <ls_phase_buf>-plnal
              plnkn   = <ls_phase_buf>-pvzkn.

    IF iv_aktyp EQ 'H' AND <ls_operation_buf>-mod_flg = gc_mod_flag_update.
      " if we are in add mode (H), but the parent operation was modified,
      " then we need to add the original parent to the tables

      " read old buffer
      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      " read old operation
      READ TABLE <ls_buffer_old>-operation ASSIGNING <ls_operation_buf>
      WITH KEY  plnnr   = <ls_phase_buf>-plnnr
                plnal   = <ls_phase_buf>-plnal
                plnkn   = <ls_phase_buf>-pvzkn.

      IF sy-subrc NE 0.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

    lv_parent_mod_flg = <ls_pi_buf>-mod_flg.

    " the '_old' structure has to be also filled out with the same data in the following cases:
    IF ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ space ) OR
       ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ gc_mod_flag_update ) OR
       ( iv_aktyp EQ 'V' AND lv_parent_mod_flg EQ space ).

      MOVE-CORRESPONDING <ls_pi_buf> TO ls_plft ##ENH_OK.
      APPEND ls_plft TO lt_plft.
      APPEND ls_plft TO lt_plft_old.
      SORT lt_plft BY plnnr plnal plnkn plnft.
      SORT lt_plft_old BY plnnr plnal plnkn plnft.
      DELETE ADJACENT DUPLICATES FROM lt_plft COMPARING plnnr plnal plnkn plnft.
      DELETE ADJACENT DUPLICATES FROM lt_plft_old COMPARING plnnr plnal plnkn plnft.

    ENDIF.

    lv_parent_mod_flg = <ls_phase_buf>-mod_flg.

    " the '_old' structure has to be also filled out with the same data in the following cases:
    IF ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ space ) OR
       ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ gc_mod_flag_update ) OR
       ( iv_aktyp EQ 'V' AND lv_parent_mod_flg EQ space ).

      MOVE-CORRESPONDING <ls_phase_buf> TO ls_phase ##ENH_OK.
      ls_phase-pvznr = <ls_operation_buf>-vornr.
      APPEND ls_phase TO lt_phase.
      APPEND ls_phase TO lt_phase_old.
      SORT lt_phase BY plnnr plnal plnkn.
      SORT lt_phase_old BY plnnr plnal plnkn.
      DELETE ADJACENT DUPLICATES FROM lt_phase COMPARING plnnr plnal plnkn.
      DELETE ADJACENT DUPLICATES FROM lt_phase_old COMPARING plnnr plnal plnkn.

    ENDIF.

    lv_parent_mod_flg = <ls_operation_buf>-mod_flg.

    " the '_old' structure has to be also filled out with the same data in the following cases:
    IF ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ space ) OR
       ( iv_aktyp EQ 'H' AND lv_parent_mod_flg EQ gc_mod_flag_update ) OR
       ( iv_aktyp EQ 'V' AND lv_parent_mod_flg EQ space ).

      MOVE-CORRESPONDING <ls_operation_buf> TO ls_operation ##ENH_OK.
      APPEND ls_operation TO lt_operation.
      APPEND ls_operation TO lt_operation_old.
      SORT lt_operation BY plnnr plnal plnkn.
      SORT lt_operation_old BY plnnr plnal plnkn.
      DELETE ADJACENT DUPLICATES FROM lt_operation COMPARING plnnr plnal plnkn.
      DELETE ADJACENT DUPLICATES FROM lt_operation_old COMPARING plnnr plnal plnkn.

    ENDIF.

    MOVE-CORRESPONDING <ls_pi_cv_buf> TO ls_plfv ##ENH_OK.

    IF iv_aktyp EQ 'V'.

      " read old buffer
      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      IF <ls_buffer_old> IS ASSIGNED.

        READ TABLE <ls_buffer_old>-pi_char_val ASSIGNING <ls_pi_cv_old>
          WITH KEY  plnnr = <ls_pi_cv_buf>-plnnr
                    plnal = <ls_pi_cv_buf>-plnal
                    plnkn = <ls_pi_cv_buf>-plnkn
                    plnft = <ls_pi_cv_buf>-plnft
                    mkmzl = <ls_pi_cv_buf>-mkmzl
                    zaehl = <ls_pi_cv_buf>-zaehl
                    .
        IF <ls_pi_cv_old> IS ASSIGNED.

          MOVE-CORRESPONDING <ls_pi_cv_old> TO ls_plfv_old ##ENH_OK.
          APPEND ls_plfv_old TO lt_plfv_old.

          IF ls_plfv-datuv NE <ls_pi_cv_old>-datuv.
            ls_plfv-datuv = <ls_pi_cv_old>-datuv.
            ls_plfv-aennr = <ls_pi_cv_old>-aennr.
          ENDIF.

        ELSE.
          ASSERT 0 = 1.
        ENDIF.

      ELSE.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

    APPEND ls_plfv TO lt_plfv.

  ENDLOOP.

*--------------------------------------------------------------------*
* Map resource selection criteria
*--------------------------------------------------------------------*
  LOOP AT is_mrcp_buffer-rsc ASSIGNING <ls_rsc_buf>
    WHERE mod_flg CA lv_mod_flg_set.

    CLEAR ls_resclas.
    MOVE-CORRESPONDING <ls_rsc_buf> TO ls_resclas.

    ls_rsc_obkey-field = 'PLNKN'.
    ls_rsc_obkey-value = ls_resclas-plnkn.
    APPEND ls_rsc_obkey TO ls_resclas-t_obkey.
    ls_rsc_obkey-field = 'PLNNR'.
    ls_rsc_obkey-value = <ls_rsc_buf>-plnnr.
    APPEND ls_rsc_obkey TO ls_resclas-t_obkey.
    ls_rsc_obkey-field = 'PLNTY'.
    ls_rsc_obkey-value = gc_plnty_mrcp.
    APPEND ls_rsc_obkey TO ls_resclas-t_obkey.

    LOOP AT <ls_rsc_buf>-char_val ASSIGNING <ls_rsc_char_val>.
      ls_rsc_ausp-charact = <ls_rsc_char_val>-charact.
      ls_rsc_ausp-value   = <ls_rsc_char_val>-value.
      APPEND ls_rsc_ausp TO ls_resclas-t_ausp.
    ENDLOOP.

    APPEND ls_resclas TO me->mt_resclas.

    " to check the buffer
    APPEND ls_resclas TO lt_resclas.

  ENDLOOP.


*--------------------------------------------------------------------*
* Map production version
*--------------------------------------------------------------------*
  LOOP AT is_mrcp_buffer-prodver ASSIGNING <ls_prodver_buf>
    WHERE mod_flg CA lv_mod_flg_set AND
          plnnr = is_mrcp_buffer-plnnr AND
          alnal = is_mrcp_buffer-plnal.

    CLEAR: ls_mkal, ls_mkal_old.
    MOVE-CORRESPONDING <ls_prodver_buf> TO ls_mkal ##ENH_OK.
    " fill FM importing structure field for PV
    ls_rc27m-verid = ls_mkal-verid.

    IF lv_mod_flg_set CA gc_mod_flag_update.

      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      IF <ls_buffer_old> IS ASSIGNED.

        READ TABLE <ls_buffer_old>-prodver ASSIGNING <ls_prodver_old>
          WITH KEY  plnnr = <ls_prodver_buf>-plnnr
                    alnal = <ls_prodver_buf>-alnal.

        IF <ls_prodver_old> IS ASSIGNED.

          MOVE-CORRESPONDING <ls_prodver_old> TO ls_mkal_old ##ENH_OK.

        ELSE.
          ASSERT 0 = 1.
        ENDIF.

      ELSE.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

  ENDLOOP.

*--------------------------------------------------------------------*
* Map material assignment
*--------------------------------------------------------------------*
  LOOP AT is_mrcp_buffer-mat_assignment ASSIGNING <ls_mat_assign_buf>
    WHERE mod_flg CA lv_mod_flg_set.

    CLEAR: ls_mapl, ls_mapl_old.
    MOVE-CORRESPONDING <ls_mat_assign_buf> TO ls_mapl.
    ls_mapl-aennr = is_mrcp_buffer-aennr.

    IF iv_aktyp EQ 'V'.

      READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
        WITH KEY  plnnr = is_mrcp_buffer-plnnr
                  plnal = is_mrcp_buffer-plnal
                  datuv = is_mrcp_buffer-datuv.

      IF <ls_buffer_old> IS ASSIGNED.

        READ TABLE <ls_buffer_old>-mat_assignment ASSIGNING <ls_mat_assign_old>
          WITH KEY  plnnr = <ls_mat_assign_buf>-plnnr
                    plnal = <ls_mat_assign_buf>-plnal.

        IF <ls_mat_assign_old> IS ASSIGNED.

          MOVE-CORRESPONDING <ls_mat_assign_old> TO ls_mapl_old.
          APPEND ls_mapl_old TO lt_mapl_old.

        ELSE.
          ASSERT 0 = 1.
        ENDIF.

      ELSE.
        ASSERT 0 = 1.
      ENDIF.

    ENDIF.

    APPEND ls_mapl TO lt_mapl.

  ENDLOOP.

*--------------------------------------------------------------------*

  IF  ls_plkob EQ ls_plkob_old   AND
      lt_operation    IS INITIAL AND
      lt_phase        IS INITIAL AND
      lt_sec_res      IS INITIAL AND
      lt_plft         IS INITIAL AND
      lt_plfv         IS INITIAL AND
      lt_resclas      IS INITIAL AND
      lt_mapl         IS INITIAL AND
      ls_mkal         IS INITIAL.
    " MRCP in buffer has not been changed
    RETURN.
  ENDIF.

*--------------------------------------------------------------------*
  " phases are processed in the order of their parents, but can be added in
  " different way to the new tables therefore to have the same order in the
  " lt_phase and lt_phase_e tables (it is required to be able to map to keys)
  " for phases we need to sort them by PVZKN (lt_phase_e is used as a temp table)
  CLEAR lt_phase_e.
  LOOP AT lt_operation ASSIGNING <ls_operation>.
    LOOP AT lt_phase ASSIGNING <ls_phase> WHERE pvzkn = <ls_operation>-plnkn.
      APPEND <ls_phase> TO lt_phase_e.
    ENDLOOP.
  ENDLOOP.
  lt_phase = lt_phase_e.
  CLEAR lt_phase_e.

  " proc. instr. char. val. are processed in the order of their parents, but can be added in
  " different way to the new tables therefore to have the same order in the
  " lt_plfv and lt_plfv_e tables (it is required to be able to map to keys)
  " for proc. instr. char. val. we need to sort them by PLNFT (lt_phase_e is used as a temp table)
  CLEAR lt_plfv_e.
  LOOP AT lt_plft ASSIGNING <ls_pi>.
    LOOP AT lt_plfv ASSIGNING <ls_pi_cv> WHERE plnft = <ls_pi>-plnft.
      APPEND <ls_pi_cv> TO lt_plfv_e.
    ENDLOOP.
  ENDLOOP.
  lt_plfv = lt_plfv_e.
  CLEAR lt_plfv_e.

*--------------------------------------------------------------------*
* MATERIAL COMPONENT ASSIGNMENT
*--------------------------------------------------------------------*
LOOP AT is_mrcp_buffer-mat_comp_assign ASSIGNING FIELD-SYMBOL(<fs_mat_com_buf>)
    WHERE mod_flg CA lv_mod_flg_set.

    CLEAR: ls_plmz, ls_plmz_old.
    MOVE-CORRESPONDING <fs_mat_com_buf> TO ls_plmz.
*    ls_mapl-aennr = is_mrcp_buffer-aennr.
    append ls_plmz to lt_plmz.

  ENDLOOP.


lt_stpob = gt_stpo.
*--------------------------------------------------------------------*
* Write MRCP
*--------------------------------------------------------------------*

  cv_write_was_called = abap_true.

  CALL FUNCTION 'MRTRS300_MASTER_RECIPE_WRITE'
    EXPORTING
      is_rc271            = ls_rc271
      is_rc27s            = ls_rc27s
      is_rc27m            = ls_rc27m
      is_plkob            = ls_plkob
      is_plkob_old        = ls_plkob_old
      is_mkal             = ls_mkal
      is_mkal_old         = ls_mkal_old
      it_operation        = lt_operation
      it_operation_old    = lt_operation_old
      it_phase            = lt_phase
      it_phase_old        = lt_phase_old
      it_relation         = lt_relation
      it_relation_old     = lt_relation_old
      it_sec_resource     = lt_sec_res
      it_sec_resource_old = lt_sec_res_old
      it_mapl             = lt_mapl
      it_mapl_old         = lt_mapl_old
      it_plmz             = lt_plmz
      it_plmz_old         = lt_plmz_old
      it_plft             = lt_plft
      it_plft_old         = lt_plft_old
      it_plfv             = lt_plfv
      it_plfv_old         = lt_plfv_old
      it_plmk             = lt_plmk
      it_plmk_old         = lt_plmk_old
      it_plmw             = lt_plmw
      it_plmw_old         = lt_plmw_old
      it_resclas          = me->mt_resclas
      it_ltext            = lt_ltext
      it_ltext_old        = lt_ltext_old
      is_stkob            = ls_stkob
      is_stkok            = ls_stkok
      it_stpob            = lt_stpob
    IMPORTING
      et_operation        = lt_operation_e
      et_phase            = lt_phase_e
      et_sec_resource     = lt_sec_resource_e
      et_plft             = lt_plft_e
      et_plfv             = lt_plfv_e
    EXCEPTIONS
      not_found           = 1
      internal_error      = 2
      data_error          = 3
      OTHERS              = 4.

  IF sy-subrc NE 0.
    CREATE OBJECT lx_mrcp_bl.
    lx_mrcp_bl->set_message(
      iv_msgid = sy-msgid
      iv_msgty = /plmb/cl_rcp_message=>gc_sv_error
      iv_msgno = sy-msgno
      iv_msgv1 = sy-msgv1
      iv_msgv2 = sy-msgv2
      iv_msgv3 = sy-msgv3
      iv_msgv4 = sy-msgv4 ).
    RAISE EXCEPTION lx_mrcp_bl.
  ENDIF.

*--------------------------------------------------------------------*
* Store temporary-final internal key mapping
* and refresh buffer with final internal keys after Create/Add
*--------------------------------------------------------------------*

  IF iv_aktyp EQ 'H'. "AkTyp: Hinzufuegen - Create/Add

    CLEAR:    ls_mrcp_key.
    UNASSIGN: <ls_buffer>, <ls_buffer_old>.

    READ TABLE me->mt_buffer ASSIGNING <ls_buffer>
      WITH KEY  plnnr = is_mrcp_buffer-plnnr
                plnal = is_mrcp_buffer-plnal
                datuv = is_mrcp_buffer-datuv.

    IF <ls_buffer> IS NOT ASSIGNED.
      ASSERT 0 = 1.
    ENDIF.

    READ TABLE me->mt_buffer_old ASSIGNING <ls_buffer_old>
      WITH KEY  plnnr = is_mrcp_buffer-plnnr
                plnal = is_mrcp_buffer-plnal
                datuv = is_mrcp_buffer-datuv.

    IF <ls_buffer_old> IS ASSIGNED.
      MOVE-CORRESPONDING <ls_buffer_old> TO ls_mrcp_key.
    ENDIF.

    "--- operations

    UNASSIGN: <ls_operation_buf>, <ls_phase_buf>, <ls_secres_buf>.

    LOOP AT lt_operation INTO ls_operation.

      READ TABLE lt_operation_e INDEX sy-tabix INTO ls_operation_e.
      ls_plnkn_mapping-plnkn_tmp = ls_operation-plnkn.  " temporary internal key
      ls_plnkn_mapping-plnkn_db  = ls_operation_e-plnkn." final internal key
      APPEND ls_plnkn_mapping TO me->mt_plnkn_mapping.

      READ TABLE <ls_buffer>-operation ASSIGNING <ls_operation_buf>
        WITH KEY  plnnr = ls_operation-plnnr
                  plnal = ls_operation-plnal
                  plnkn = ls_operation-plnkn
                  zaehl = ls_operation-zaehl
                  .
      IF <ls_operation_buf> IS ASSIGNED AND <ls_operation_buf>-mod_flg EQ 'I'.

        <ls_operation_buf>-plnkn = ls_operation_e-plnkn. " final internal key
        CLEAR <ls_operation_buf>-mod_flg.

        " it has to be inserted into buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-operation
            is_mrcp_key    = ls_mrcp_key
            is_mrcp_object = <ls_operation_buf>
        ).

        " the parent-child internal key of child objects have to be updated as well:

        " phases
        LOOP AT <ls_buffer>-phase ASSIGNING <ls_phase_buf>
          WHERE plnnr = ls_operation-plnnr
            AND plnal = ls_operation-plnal
            AND pvzkn = ls_operation-plnkn.
          <ls_phase_buf>-pvzkn = ls_operation_e-plnkn.
        ENDLOOP.

        " secondary resources
        LOOP AT <ls_buffer>-resource ASSIGNING <ls_secres_buf>
          WHERE plnnr = ls_operation-plnnr
            AND plnal = ls_operation-plnal
            AND sumnr = ls_operation-plnkn.
          <ls_secres_buf>-sumnr = ls_operation_e-plnkn.
        ENDLOOP.

      ENDIF.

    ENDLOOP.

    "--- phases

    UNASSIGN: <ls_phase_buf>, <ls_secres_buf>, <ls_pi_buf>, <ls_pi_cv_buf>.

    LOOP AT lt_phase INTO ls_phase.

      READ TABLE lt_phase_e INDEX sy-tabix INTO ls_phase_e.
      ls_plnkn_mapping-plnkn_tmp = ls_phase-plnkn.  " temporary internal key
      ls_plnkn_mapping-plnkn_db  = ls_phase_e-plnkn." final internal key
      APPEND ls_plnkn_mapping TO me->mt_plnkn_mapping.

      READ TABLE <ls_buffer>-phase ASSIGNING <ls_phase_buf>
        WITH KEY  plnnr = ls_phase-plnnr
                  plnal = ls_phase-plnal
                  plnkn = ls_phase-plnkn
                  zaehl = ls_phase-zaehl
                  .
      IF <ls_phase_buf> IS ASSIGNED AND <ls_phase_buf>-mod_flg EQ 'I'.

        <ls_phase_buf>-plnkn = ls_phase_e-plnkn. " final internal key
        CLEAR <ls_phase_buf>-mod_flg.

        " it has to be inserted into buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-phase
            is_mrcp_key    = ls_mrcp_key
            is_mrcp_object = <ls_phase_buf>
        ).

        " the parent-child internal key of child objects have to be updated as well:

        " secondary resources
        LOOP AT <ls_buffer>-resource ASSIGNING <ls_secres_buf>
          WHERE plnnr = ls_phase-plnnr
            AND plnal = ls_phase-plnal
            AND sumnr = ls_phase-plnkn.
          <ls_secres_buf>-sumnr = ls_phase_e-plnkn.
        ENDLOOP.

        " process instructions
        LOOP AT <ls_buffer>-pi ASSIGNING <ls_pi_buf>
          WHERE plnnr = ls_phase-plnnr
            AND plnal = ls_phase-plnal
            AND plnkn = ls_phase-plnkn.
          <ls_pi_buf>-plnkn = ls_phase_e-plnkn.
        ENDLOOP.

        " process instruction characteristic values
        LOOP AT <ls_buffer>-pi_char_val ASSIGNING <ls_pi_cv_buf>
          WHERE  plnnr = ls_phase-plnnr
            AND  plnal = ls_phase-plnal
            AND  plnkn = ls_phase-plnkn.
          <ls_pi_cv_buf>-plnkn = ls_phase_e-plnkn.
        ENDLOOP.

      ENDIF.

    ENDLOOP.

    "--- secondary resources

    UNASSIGN: <ls_secres_buf>.

    LOOP AT lt_sec_res INTO ls_sec_res.

      READ TABLE lt_sec_resource_e INDEX sy-tabix INTO ls_sec_resource_e.
      ls_plnkn_mapping-plnkn_tmp = ls_sec_res-plnkn.        " temporary internal key
      ls_plnkn_mapping-plnkn_db  = ls_sec_resource_e-plnkn. " final internal key
      APPEND ls_plnkn_mapping TO me->mt_plnkn_mapping.

      READ TABLE <ls_buffer>-resource ASSIGNING <ls_secres_buf>
        WITH KEY  plnnr = ls_sec_res-plnnr
                  plnal = ls_sec_res-plnal
                  plnkn = ls_sec_res-plnkn
                  zaehl = ls_sec_res-zaehl
                  .
      IF <ls_secres_buf> IS ASSIGNED AND <ls_secres_buf>-mod_flg EQ 'I'.

        <ls_secres_buf>-plnkn = ls_sec_resource_e-plnkn. " final internal key
        CLEAR <ls_secres_buf>-mod_flg.

        " it has to be inserted into buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-resource
            is_mrcp_key    = ls_mrcp_key
            is_mrcp_object = <ls_secres_buf>
        ).

      ENDIF.

    ENDLOOP.

    "--- process instructions

    UNASSIGN: <ls_pi_buf>, <ls_pi_cv_buf>.

    LOOP AT lt_plft INTO ls_plft.

      READ TABLE lt_plft_e INDEX sy-tabix INTO ls_plft_e.
      ls_plnft_mapping-plnft_tmp = ls_plft-plnft.  " temporary internal key
      ls_plnft_mapping-plnft_db  = ls_plft_e-plnft." final internal key
      APPEND ls_plnft_mapping TO me->mt_plnft_mapping.

      " temporary internal key has already been replaced above, that's why we need the final one here
      READ TABLE me->mt_plnkn_mapping INTO ls_plnkn_mapping
        WITH KEY plnkn_tmp = ls_plft-plnkn.

      READ TABLE <ls_buffer>-pi ASSIGNING <ls_pi_buf>
        WITH KEY  plnnr = ls_plft-plnnr
                  plnal = ls_plft-plnal
                  plnkn = ls_plnkn_mapping-plnkn_db "ls_plft-plnkn
                  plnft = ls_plft-plnft
                  zaehl = ls_plft-zaehl
                  .
      IF <ls_pi_buf> IS ASSIGNED AND <ls_pi_buf>-mod_flg EQ 'I'.

        <ls_pi_buf>-plnft = ls_plft_e-plnft. " final internal key
        CLEAR <ls_pi_buf>-mod_flg.

        " it has to be inserted into buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-pi
            is_mrcp_key    = ls_mrcp_key
            is_mrcp_object = <ls_pi_buf>
        ).

        " the parent-child internal key of child objects have to be updated as well:

        " process instruction characteristic values
        LOOP AT <ls_buffer>-pi_char_val ASSIGNING <ls_pi_cv_buf>
          WHERE  plnnr = ls_plft-plnnr
            AND  plnal = ls_plft-plnal
            AND  plnkn =  ls_plnkn_mapping-plnkn_db "ls_plft-plnkn
            AND  plnft = ls_plft-plnft.
          <ls_pi_cv_buf>-plnft = ls_plft_e-plnft.
        ENDLOOP.

      ENDIF.

    ENDLOOP.

    "--- process instruction characteristic values

    UNASSIGN: <ls_pi_cv_buf>.

    LOOP AT lt_plfv INTO ls_plfv.

      READ TABLE lt_plfv_e INDEX sy-tabix INTO ls_plfv_e.
      ls_mkmzl_mapping-mkmzl_tmp = ls_plfv-mkmzl.  " temporary internal key
      ls_mkmzl_mapping-mkmzl_db  = ls_plfv_e-mkmzl." final internal key
      APPEND ls_mkmzl_mapping TO me->mt_mkmzl_mapping.

      " temporary internal key has already been replaced above, that's why we need the final one here
      READ TABLE me->mt_plnkn_mapping INTO ls_plnkn_mapping
        WITH KEY plnkn_tmp = ls_plfv-plnkn.

      " temporary internal key has already been replaced above, that's why we need the final one here
      READ TABLE me->mt_plnft_mapping INTO ls_plnft_mapping
        WITH KEY plnft_tmp = ls_plfv-plnft.

      READ TABLE <ls_buffer>-pi_char_val ASSIGNING <ls_pi_cv_buf>
        WITH KEY  plnnr = ls_plfv-plnnr
                  plnal = ls_plfv-plnal
                  plnkn = ls_plnkn_mapping-plnkn_db "ls_plfv-plnkn
                  plnft = ls_plnft_mapping-plnft_db "ls_plfv-plnft
                  mkmzl = ls_plfv-mkmzl
                  zaehl = ls_plfv-zaehl
                  .
      IF <ls_pi_cv_buf> IS ASSIGNED AND <ls_pi_cv_buf>-mod_flg EQ 'I'.

        <ls_pi_cv_buf>-mkmzl = ls_plfv_e-mkmzl. " final internal key
        CLEAR <ls_pi_cv_buf>-mod_flg.

        " it has to be inserted into buffer_old
        me->copy_element_to_buffer_old(
          EXPORTING
            iv_type        = gs_c_mrcp_subobj_type-pi_cv
            is_mrcp_key    = ls_mrcp_key
            is_mrcp_object = <ls_pi_cv_buf>
        ).

      ENDIF.

    ENDLOOP.

  ENDIF.

ENDMETHOD.
ENDCLASS.
