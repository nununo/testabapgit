*****----------------------------------------------------------------------
* Program : Report  Z_GL_PP_R_CREATE_PVERS_MREC
* Description : Maintain Recipe Templates
*  Reference of the development request :   D01K904342
*  GAP number : MFG034
* ---------------------------------------------------------------------
* Author : Francisco López
* Creation date : 19/12/2007
* ---------------------------------------------------------------------
*    Date                 Author                    Text
*  07/04/08     Fco López Mateo       Defect 3981: MFG034 execute performence issue
*                                     Transp. request number:  D01K908651
* ---------------------------------------------------------------------
* 04/02/22     Washington Almeida     CR 42510: MFG034_KNW1_MFG_Formula
*                                     Industrialization Tools v1.8
*                                     Transp. request number:  DN1K9C0NRJ
* ---------------------------------------------------------------------

REPORT  z_gl_pp_r_create_pvers_mrec
        MESSAGE-ID z_mfg.

INCLUDE ZGL_PP_I_CREATE_PVERS_MREC2TOP.
*INCLUDE z_gl_pp_i_create_pvers_mrectop.

*----------------------------------------------------------------------*
* Selection Screen, Parameters and Select-Options                      *
*----------------------------------------------------------------------*
* Parameters for ALV report.
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-000.
* Variant to use for displaying the report.
PARAMETERS:     p_werks	TYPE t001w-werks OBLIGATORY.
SELECTION-SCREEN BEGIN OF BLOCK req.
SELECT-OPTIONS: s_matnr FOR mara-matnr,
                s_labor FOR t024l-labor,
                s_plan_i FOR t437p-plan_id.
SELECTION-SCREEN END OF BLOCK req.
SELECT-OPTIONS: s_mmsta FOR marc-mmsta,
                s_beskz FOR marc-beskz,
                s_sobsl FOR marc-sobsl,
                s_pvnum	FOR zgl_rectempl-pv_num.
SELECTION-SCREEN BEGIN OF BLOCK pmod.
PARAMETERS: p_prgmod TYPE z_gl_pp_prog_mode OBLIGATORY DEFAULT c_dysplay.
SELECTION-SCREEN END OF BLOCK pmod.
* Begin - ALM-115874 - 06.24.2022 - RFMORAIS
SELECTION-SCREEN BEGIN OF BLOCK zmip.
*PARAMETERS: p_zmip TYPE zgl_rectempl-zmip.
SELECT-OPTIONS: s_zmip FOR zgl_rectempl-zmip NO INTERVALS.
SELECTION-SCREEN END OF BLOCK zmip.
* End - ALM-115874 - 06.24.2022 - RFMORAIS
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-028.
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN: COMMENT (34) TEXT-027.
PARAMETERS: p_recrsc RADIOBUTTON GROUP prec DEFAULT 'X'.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN: COMMENT (34) TEXT-029.
PARAMETERS: p_recrpm RADIOBUTTON GROUP prec.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN: FUNCTION KEY 1, FUNCTION KEY 2, FUNCTION KEY 3.

INCLUDE ZGL_PP_I_CREATE_PVERS_MREC2_F1.
*INCLUDE z_gl_pp_i_create_pvers_mrec_f1.

DATA ls_select TYPE zgl_rect_sel_log.


*----------------------------------------------------------------------*
* LOAD_OF_PROGRAM                                                    *
*----------------------------------------------------------------------*
LOAD-OF-PROGRAM.
  PERFORM f_load_program. "16.09.2008 - Defect 10338

*----------------------------------------------------------------------*
* INITIALIZATION                                                       *
*----------------------------------------------------------------------*
INITIALIZATION.
  PERFORM f_initialitation.

*----------------------------------------------------------------------*
* AT SELECTION-SCREEN ON                                               *
*----------------------------------------------------------------------*
AT SELECTION-SCREEN ON p_werks.
  CHECK ( sy-ucomm <> c_fc01 AND sy-ucomm <> c_fc02 AND sy-ucomm <> c_fc03 ).
  PERFORM f_val_werks.

AT SELECTION-SCREEN.
  CASE sy-ucomm.
    WHEN c_fc01.
      PERFORM f_back_pvers.
    WHEN c_fc02. "Factors
      PERFORM f_go_factors.
    WHEN c_fc03. "Production Version Grouping
      PERFORM f_go_pv_grp.
  ENDCASE.

AT SELECTION-SCREEN OUTPUT.
  CHECK ( sy-ucomm <> c_fc01 AND sy-ucomm <> c_fc02 AND sy-ucomm <> c_fc03 ).
  PERFORM f_val_input_pmod.


*----------------------------------------------------------------------*
* START-OF-SELECTION                                                   *
*----------------------------------------------------------------------*
START-OF-SELECTION.

*--> Begin of modification - BENJAMIT - CR#114848 - 31.10.2022
  PERFORM f_val_z_fver_wrk.
*<-- End of modification - BENJAMIT - CR#114848 - 31.10.2022

  PERFORM f_init_variables.
  PERFORM f_get_hardcode.
  PERFORM f_get_data.

  CHECK gv_flag IS INITIAL.

  PERFORM save_selection CHANGING ls_select.
  PERFORM check_activation.

  PERFORM f_check_from_to_qty.
   PERFORM CALL_BAPI.
  CHECK gv_flag IS INITIAL.

*----------------------------------------------------------------------*
* END-OF-SELECTION                                                     *
*----------------------------------------------------------------------*
END-OF-SELECTION.
  CHECK NOT it_fullreturn[] IS INITIAL.
  PERFORM f_alv_log USING ls_select.
  PERFORM f_init_variables.
