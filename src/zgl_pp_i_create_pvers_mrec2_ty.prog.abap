*&---------------------------------------------------------------------*
*&  Include           ZTEST_MREC_TOP
*&---------------------------------------------------------------------*
* NUNO
DATA: sttag_ss LIKE rc271-sttag,
      plnty_ss LIKE plko-plnty,
      plnnr_ss LIKE plko-plnnr,
      plnal_ss LIKE plko-plnal,
      aktyp_ss LIKE rc27s-aktyp. "Zu 4.0A für Pläne kopieren

DATA: source_matnr LIKE rc27m-matnr,
      source_werks LIKE rc27m-werks,
      source_vbeln LIKE rc271-vbeln,
      source_posnr LIKE rc271-posnr,
      source_pspnr LIKE rc271-pspnr.
* Exportparameter:
DATA BEGIN OF copy_maplb_old OCCURS 5.                      "P30K117658
INCLUDE STRUCTURE pmapl.                                    "P30K117658
DATA END OF   copy_maplb_old.                               "P30K117658

DATA BEGIN OF copy_mapl OCCURS 5.
INCLUDE STRUCTURE mapl.
DATA END OF   copy_mapl.

DATA BEGIN OF copy_maplb OCCURS 5.                          "P30K117658
INCLUDE STRUCTURE maplb.                                    "P30K117658
DATA END OF   copy_maplb.                                   "P30K117658

DATA BEGIN OF copy_plkob OCCURS 5.
INCLUDE STRUCTURE plkob.
DATA END OF   copy_plkob.

DATA BEGIN OF copy_plflb OCCURS 5.
INCLUDE STRUCTURE plflb.
DATA END OF   copy_plflb.

DATA BEGIN OF copy_plasb OCCURS 20.
INCLUDE STRUCTURE plasb.
DATA END OF   copy_plasb.

DATA BEGIN OF copy_plpob OCCURS 50.
INCLUDE STRUCTURE plpob.
DATA END OF   copy_plpob.

DATA BEGIN OF copy_plfhb OCCURS 20.
INCLUDE STRUCTURE plfhb.
DATA END OF   copy_plfhb.

DATA BEGIN OF copy_plmzb OCCURS 0.
INCLUDE STRUCTURE plmzb.
DATA END OF   copy_plmzb.

TYPES: BEGIN OF type_plmzb.
    INCLUDE STRUCTURE plmzb.
TYPES: END OF type_plmzb.

DATA: new_plmzb TYPE SORTED TABLE OF type_plmzb WITH UNIQUE KEY
*data: new_plmzb type sorted table of type_plmzb with non-unique key
                            stlty_w stlnr_w stlal_w kante stlty stlnr
                            stlal stlkn plnty plnnr plnal plnfl plnkn.

DATA BEGIN OF copy_plmzb_old OCCURS 0.                      "P30K117658
INCLUDE STRUCTURE pplmz.                                    "P30K117658
DATA END OF   copy_plmzb_old.                               "P30K117658

DATA BEGIN OF copy_plabb OCCURS 0.
INCLUDE STRUCTURE plabb.
DATA END OF   copy_plabb.

DATA BEGIN OF copy_pltxb OCCURS 0.
INCLUDE STRUCTURE pltxb.
DATA END OF   copy_pltxb.

DATA BEGIN OF copy_mlstb OCCURS 0.
INCLUDE STRUCTURE mlstb.
DATA END OF   copy_mlstb.

DATA BEGIN OF copy_plwpb OCCURS 0.
INCLUDE STRUCTURE plwpb.
DATA END OF   copy_plwpb.

DATA BEGIN OF copy_plmkb OCCURS 10.
INCLUDE STRUCTURE plmkb.
DATA END OF   copy_plmkb.

DATA BEGIN OF copy_plmwb OCCURS 10.
INCLUDE STRUCTURE plmwb.
DATA END OF   copy_plmwb.

DATA BEGIN OF copy_plphb OCCURS 0.
INCLUDE STRUCTURE plphb.
DATA END OF   copy_plphb.

DATA BEGIN OF copy_plftb OCCURS 0.     " hinzugefügt 10.11.94 Jonas
INCLUDE STRUCTURE plftb.
DATA END OF   copy_plftb.

DATA BEGIN OF copy_plfvb OCCURS 0.   " hinzugefügt 10.11.94 Jonas
INCLUDE STRUCTURE plfvb.
DATA END OF   copy_plfvb.

DATA BEGIN OF copy_lst OCCURS 100.
INCLUDE STRUCTURE rclst.
DATA END OF   copy_lst.

DATA BEGIN OF filter_tab OCCURS 0.
INCLUDE STRUCTURE rcflt.
DATA END OF   filter_tab.


DATA: BEGIN OF obj_di_tab OCCURS 10.
    INCLUDE STRUCTURE txt_obj_di.
DATA: END OF obj_di_tab.

DATA: BEGIN OF text_tab OCCURS 10.
    INCLUDE STRUCTURE  tline.
DATA: END OF text_tab.

DATA: BEGIN OF knowl_alloc_di_tab OCCURS 10.
    INCLUDE STRUCTURE rcuob1.
DATA: END OF knowl_alloc_di_tab.

DATA: BEGIN OF knowl_alloc_obj_di_tab OCCURS 10.
    INCLUDE STRUCTURE rcuob1_di.
DATA: END OF knowl_alloc_obj_di_tab.

DATA: BEGIN OF null_field_tab OCCURS 10.
    INCLUDE STRUCTURE obj_nfield.
DATA: END OF null_field_tab.

DATA:
  plko_di_tab TYPE STANDARD TABLE OF plko_di,
  mapl_di_tab TYPE STANDARD TABLE OF mapl_di,
  plpo_di_tab TYPE STANDARD TABLE OF plpo_di,
  plfl_di_tab TYPE STANDARD TABLE OF plfl_di,
  plmz_di_tab TYPE STANDARD TABLE OF plmz_di,
  plfh_di_tab TYPE STANDARD TABLE OF plfh_di.

DATA : rc271              TYPE rc271_di,
       rc27m              TYPE rc27m_di,
       save               TYPE save_di,
       obj_null_field_tab TYPE STANDARD TABLE OF obj_nfield,
       error_plan_di_tab  TYPE STANDARD TABLE OF  error_di,
       error_plan_tab     TYPE STANDARD TABLE OF  cmfmsg.


DATA:
IS_RC271  TYPE  RC271,
IS_RC27S  TYPE  RC27S,
IS_RC27M  TYPE  RC27M,
IS_PLKOB  TYPE  PLKOB,
IS_PLKOB_OLD  TYPE  PLKOB,
IS_MKAL TYPE  MKAL,
IS_MKAL_OLD TYPE  MKAL,
IT_OPERATION  TYPE  MRTRSTY_PLPO_OPR,
IT_OPERATION_OLD  TYPE  MRTRSTY_PLPO_OPR,
IT_PHASE  TYPE  MRTRSTY_PLPO_PH,
IT_PHASE_OLD  TYPE  MRTRSTY_PLPO_PH,
IT_RELATION TYPE  MRTRSTY_PLAB,
IT_RELATION_OLD TYPE  MRTRSTY_PLAB,
IT_SEC_RESOURCE TYPE  MRTRSTY_PLPO_SRES,
IT_SEC_RESOURCE_OLD TYPE  MRTRSTY_PLPO_SRES,
IT_MAPL TYPE  MRTRSTY_MAPL,
IT_MAPL_OLD TYPE  MRTRSTY_MAPL,
IT_PLMZ TYPE  MRTRSTY_PLMZ,
IT_PLMZ_OLD TYPE  MRTRSTY_PLMZ,
IT_PLFT TYPE  MRTRSTY_PLFT,
IT_PLFT_OLD TYPE  MRTRSTY_PLFT,
IT_PLFV TYPE  MRTRSTY_PLFV,
IT_PLFV_OLD TYPE  MRTRSTY_PLFV,
IT_PLMK TYPE  MRTRSTY_PLMK,
IT_PLMK_OLD TYPE  MRTRSTY_PLMK,
IT_PLMW TYPE  MRTRSTY_PLMW,
IT_PLMW_OLD TYPE  MRTRSTY_PLMW,
IT_RESCLAS  TYPE  MRTRSTY_RESCLAS,
IT_LTEXT  TYPE  MRTRSTY_LTXT,
IT_LTEXT_OLD  TYPE  MRTRSTY_LTXT,
IS_STKOB  TYPE  STKOB,
IS_STKOK  TYPE  STKOK,
IT_STPOB  TYPE  MRTRSTY_STPOB,
ES_PLKOB  TYPE  PLKOB,
ES_MKAL TYPE  MKAL,
ET_OPERATION  TYPE  MRTRSTY_PLPO_OPR,
ET_PHASE  TYPE  MRTRSTY_PLPO_PH,
ET_RELATION TYPE  MRTRSTY_PLAB,
ET_SEC_RESOURCE TYPE  MRTRSTY_PLPO_SRES,
ET_MAPL TYPE  MRTRSTY_MAPL,
ET_PLMZ TYPE  MRTRSTY_PLMZ,
ET_PLFT TYPE  MRTRSTY_PLFT,
ET_PLFV TYPE  MRTRSTY_PLFV,
ET_PLMK TYPE  MRTRSTY_PLMK,
ET_PLMW TYPE  MRTRSTY_PLMW,
ET_RESCLAS  TYPE  MRTRSTY_RESCLAS,
ET_LTEXT  TYPE  MRTRSTY_LTXT,
ET_PLNKN_OPR  TYPE  MRT00_TY_PLNKN,
ET_PLNKN_PH TYPE  MRT00_TY_PLNKN,
ET_PLNKN_SOP  TYPE  MRT00_TY_PLNKN,
ET_PLMK_REL TYPE  MRTRSTY_PLMK_REL,
ET_PI_KEY TYPE  MRT00_TY_PLNFT,
ET_PI_CHAR_KEY  TYPE  MRT00_TY_MKMZL.
