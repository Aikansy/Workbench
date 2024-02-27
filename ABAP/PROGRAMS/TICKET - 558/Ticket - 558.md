# **TICKET 558**

## DOCUMENT HISTORY

| Version(s)  | Rédacteur(s)  | Date                | Modification(s)      |
|-------------|---------------|---------------------|----------------------|
| 1.0         | XXXXXXXX      | XX/XX/XXXX          | XXXXXXXXX            |

## OVERVIEW

Le client souhaiterait créer du surplus en quantité sur les OF fils crées au lancement des OF père.

## FUNCTIONNAL REQUIREMENT

Pour cela, il faudrait modifier le form en objet ou éventuellement le MF ZPP_CREATE_OF_SF, je vous laisse juge de l'endroit le plus adapté.  

## TECHNICAL DETAILS

## SCOPE

## CONTROLS

RG : Ce surplus ne doit être généré que sur les codes articles (OF fils) dont le code gestionnaire (lv_dispo) = Z_GESTIONNAIRE_TALON_SURPLUS (liste en tvarv). La quantité de surplus est défini par la quantité de base iv_menge = iv_menge*Z_TALON_SURPLUS_QUANTITE (variable tvarv).  

## TEST CASE

Pour faire des tests en dév, vous devriez pouvoir créer des OF sur le code ZU01V36E003 (CO01), division 1000. Au lancement de l'OF (drapeau vert en haut à gauche), on devrait entrer dans ce programme, à moins que ce ne soit à l'enregistrement après lancement.  

## PATCH

26/02/24 : modifications non validées, pouvez-vous svp faire un retour arrière sur tout ce qui a été fait svp ? OT DE2K902891. Je m'occupe de supprimer les variables TVARV. Si on pouvait juste commenter le code au cas où ils changent encore d'avis.

## TECHNICAL SOLUTION DESCRIPTION

## OBJETCS

| OT Type   | OT mat           | OT Description                                               |
|-----------|------------------|--------------------------------------------------------------|
| Workbench | DE2K903107       | FGI - M10305 - Création OF fils poudre - Ajout 10% - RetourA |

| Creation/Modification | Object type     | Object                 | Description                                    |
|-----------------------|-----------------|------------------------|------------------------------------------------|
| Modification          | Module Fonction | ZPP_ENSACH_TALONF01    | Module Fonction                                |
|                       | - Perfom        | Create_of              | Perform                                        |

## UNIT TEST

## PROGRAM

### [SE80]() ZPP_ENSACH_TALONF01

```abap
*&---------------------------------------------------------------------*
*&      Form  create_of
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->IV_MATNR       text
*      -->IV_WERKS       text
*      -->IV_AUFNR_PERE  text
*      -->IV_MATNR_PERE  text
*      -->IV_GLTRP_PERE  text
*      -->IV_GSUZS_PERE  text
*      -->CV_AUFNR       text
*----------------------------------------------------------------------*
* Historique des modifications :
*
*  - 27/02/2024 - FGI : Retour arrière
*
*    Modifications OT DE2K902891 et DE2K901263 non validées
*    -> DE2K902891 / DE2K901263 commenté
*    Retour arrière vers DE2K901263
*
*    Modifications faites sur
*       OT : DE2K903107 STMS_DEV
*       "FGI - M10305 - Création OF fils poudre - Ajout 10% - RetourA"
*----------------------------------------------------------------------*

FORM create_of USING    iv_matnr           TYPE matnr
                        iv_werks           TYPE werks_d
                        iv_routing_type    TYPE mapl-plnty
                        iv_routing_group   TYPE mapl-plnnr
                        iv_routing_counter TYPE mapl-plnal
                        iv_aufnr_pere      TYPE aufnr
                        iv_matnr_pere      TYPE matnr
                        iv_gltrp_pere      TYPE sy-datum
                        iv_gsuzs_pere      TYPE sy-uzeit
                        iv_menge           TYPE  bstmg
                        iv_meins           TYPE  bstme
                        iv_log_handle      TYPE balloghndl
               CHANGING cv_aufnr           TYPE aufnr.

  DATA : ls_pp_order_create TYPE bapi_pp_order_create.
  "DATA : ls_pp_order_create TYPE quan DECIMALS 2.
  DATA : lv_aufnr_txt(12) TYPE c,
         lv_verid         TYPE mkal-verid,  "RCO01(+) - Passage ECC6
         lv_dispo         TYPE marc-dispo.  "RCO02(+) - Passage ECC6

" ------------------------------------- Début Retour arrière OF - (FGI-)
*         lv_taux          TYPE tvarvc-low,         "BBO(+)
*         lv_taux_num      TYPE p DECIMALS 2,         "BBO(+)
*         lr_gestionnaire  TYPE RANGE OF marc-dispo.
" --------------------------------------- Fin Retour arrière OF - (FGI-)

  ls_pp_order_create-material_long = iv_matnr.
  ls_pp_order_create-plant = iv_werks.
  ls_pp_order_create-order_type = 'ZP30'.
  ls_pp_order_create-basic_end_date = iv_gltrp_pere.
  ls_pp_order_create-quantity = iv_menge.
  ls_pp_order_create-routing_type	= iv_routing_type.
  ls_pp_order_create-routing_group = iv_routing_group.
  ls_pp_order_create-routing_counter = iv_routing_counter.

* <<< Begin of RCO01(+) - Passage ECC6
* Lecture de la version de fabrication
* <<< Begin of RCO02(+) - Passage ECC6
* Seulement pour les OF de Talon pas Poudre
  SELECT SINGLE dispo INTO lv_dispo
    FROM marc
    WHERE matnr = iv_matnr
      AND werks = iv_werks.

" ------------------------------------- Début Retour arrière OF - (FGI-)
** Begin of BBO001(+) - OF Fils : Ajout 10%.
*  " TVARVC pour selection des articles OF fils à traiter.
*  SELECT SINGLE low
*    FROM tvarvc
*    INTO lv_taux
*    WHERE name = 'Z_TALON_SURPLUS_QUANTITE'.
*  IF sy-subrc = 0.
*    REPLACE ALL OCCURRENCES OF ',' IN lv_taux WITH '.'.
*    MOVE  lv_taux TO lv_taux_num .
*  ELSE.
*    lv_taux_num  = 1.
*  ENDIF.
*
*  SELECT *
*   FROM tvarvc
*   INTO TABLE @DATA(lt_tvarvc)
*   WHERE name = 'Z_GESTIONNAIRE_TALON_SURPLUS'.
*  IF sy-subrc = 0.
*
*    LOOP AT lt_tvarvc ASSIGNING FIELD-SYMBOL(<fs_tvarvc>).
*      APPEND INITIAL LINE TO lr_gestionnaire ASSIGNING FIELD-SYMBOL(<fs_gestionnaire>).
*      <fs_gestionnaire>-sign = <fs_tvarvc>-sign.
*      <fs_gestionnaire>-option = <fs_tvarvc>-opti.
*      <fs_gestionnaire>-low = <fs_tvarvc>-low.
*      <fs_gestionnaire>-high = <fs_tvarvc>-high.
*    ENDLOOP.
*
*  ENDIF.
*
*  IF lv_dispo IN lr_gestionnaire.
*    ls_pp_order_create-quantity = round( val = ls_pp_order_create-quantity * lv_taux_num  dec = 2 ).
*  ENDIF.
*
** End of BBO001(+)- OF Fils : Ajout 10%.
" --------------------------------------- Fin Retour arrière OF - (FGI-)

  IF   lv_dispo = 'SF3' "Gestionnaire 'Sachet Talon'
    OR lv_dispo = 'SF7'.                    "(+) M7490 - Pb version de fab lancement OF pére/fils

* >>> End of RCO02(+) - Passage ECC6
    SELECT verid INTO lv_verid
      FROM mkal UP TO 1 ROWS
      WHERE matnr = iv_matnr
        AND werks = iv_werks
        AND plnty = iv_routing_type
        AND plnnr = iv_routing_group
        AND alnal = iv_routing_counter
        AND bdatu GE sy-datum
        AND adatu LE sy-datum
 ORDER BY PRIMARY KEY .
    ENDSELECT.
    IF sy-subrc = 0 AND lv_verid IS NOT INITIAL.
      ls_pp_order_create-prod_version = lv_verid.
    ENDIF.
  ENDIF.   "RCO02(+) - Passage ECC6
* >>> End of RCO01(+) - Passage ECC6

  CLEAR gv_aufnr.
  CLEAR f_flag.
  gv_log_handle = iv_log_handle.

  CALL FUNCTION 'BAPI_PRODORD_CREATE'       "#EC CI_USAGE_OK[2438131]
    STARTING NEW TASK 'CREATE_OF'
    PERFORMING receive_res ON END OF TASK
    EXPORTING
      orderdata = ls_pp_order_create.

  WAIT UNTIL f_flag = 'X'.


  CHECK gv_aufnr IS NOT INITIAL.

  PERFORM creation_wait USING gv_aufnr.


  CALL FUNCTION 'ZPP_UPDATE_OF_TALON'
    EXPORTING
      i_aufnr      = gv_aufnr
      i_aufnr_pere = iv_aufnr_pere
      i_matnr_pere = iv_matnr_pere
      i_gstrs_pere = iv_gltrp_pere
      i_gsuzs_pere = iv_gsuzs_pere.

  cv_aufnr = gv_aufnr.



  "============================================================================================
  "============================================================================================
*  DATA : lv_dispo   TYPE dispo,                          "BBO(+)
*         lr_surplus TYPE RANGE OF tvarv_val,
*         lt_tvarvc  TYPE STANDARD TABLE OF tvarvc,
*         lv_surplus type menge.
*
*  RANGES : r_gestionnaire FOR marc-dispo.
*
*  SELECT low
*  FROM tvarvc
*  INTO lv_dipo
*
*  WHERE name = 'Z_TALON_SURPLUS_QUANTITE'.
*
*    IF sy-subrc = 0.
*    ENDIF.
*
*    SELECT sign opti low high
*     FROM tvarvc
*     INTO TABLE lr_surplus
*     WHERE name = 'Z_GESTIONNAIRE_TALON_SURPLUS'.
*
*    IF sy-subrc = 0.
*
*      LOOP AT lr_surplus INTO ls_surplus.
*        r_gestionnaire-sign = 'I'.
*        r_gestionnaire-option = 'EQ'.
*        r_gestionnaire-low = ls_surplus-low.
*        APPEND r_gestionnaire.
*      ENDLOOP.
*
*    ENDIF.



*    " Vérifier si lv_dispo est égal à Z_GESTIONNAIRE_TALON_SURPLUS
*    IF lv_dispo = 'Z_GESTIONNAIRE_TALON_SURPLUS'.
*
*      " Calculer la quantité de surplus
*      .
*      lv_surplus = iv_menge * z_talon_surplus_quantite.
*
*      " Créer l'ordre de fabrication (OF) fils
*      CALL FUNCTION 'ZPP_CREATE_OF'
*        EXPORTING
*          iv_menge = iv_menge + lv_surplus             " Ajouter le surplus à la quantité de base
*ENDIF.

  "================================================================================================
  "===============================================================================================

*  DATA : lv_date(10) TYPE c,
*         lv_heure(8) TYPE c,
*         lv_aufnr_txt(12) TYPE c,
*         lv_mode TYPE c,
*         lv_update TYPE c,
*         lt_msg TYPE STANDARD TABLE OF bdcmsgcoll,
*         ls_msg TYPE bdcmsgcoll,
*         lv_quant_txt(18) TYPE c,
*         lv_meins_txt(3) TYPE c,
*         ls_bal_msg TYPE bal_s_msg.
*
*
*
*****On crée l'OF via BATCH INPUT *****
*  CLEAR : gt_bdcdata[].
*
** Ecran initial CO01
*  PERFORM bdc_dynpro      USING 'SAPLCOKO1' '0100'.
*  PERFORM bdc_field       USING 'BDC_CURSOR'    'AUFPAR-PP_AUFART'.
*  PERFORM bdc_field       USING 'BDC_OKCODE'    '/00'.
*  PERFORM bdc_field       USING 'CAUFVD-MATNR'  iv_matnr.       "Article
*  PERFORM bdc_field       USING 'CAUFVD-WERKS'  iv_werks.       "Division
*  PERFORM bdc_field       USING 'AUFPAR-PP_AUFART' 'ZP30'.      "Type ordre
*
***Ecran "Généralités" --> saisie données
*  WRITE iv_menge TO lv_quant_txt
*                              NO-GROUPING
*                              RIGHT-JUSTIFIED.
*
*  WRITE iv_meins TO lv_meins_txt
*                              NO-GROUPING
*                              RIGHT-JUSTIFIED.
*
*
*  PERFORM bdc_dynpro      USING 'SAPLCOKO1' '0115'.
*  PERFORM bdc_field       USING 'BDC_OKCODE'    '/00'.
*  WRITE iv_gltrp_pere TO lv_date.
*  PERFORM bdc_field       USING 'CAUFVD-GLTRP'  lv_date.
*  PERFORM bdc_field       USING 'CAUFVD-GAMNG'  lv_quant_txt. "iv_menge.
*  PERFORM bdc_field       USING 'CAUFVD-GMEIN'  lv_meins_txt. "iv_meins.
*
** Ecran "Groupe de gammes" --> on annule
*  PERFORM bdc_dynpro      USING 'SAPLCPSL' '2120'.
*  PERFORM bdc_field       USING 'BDC_OKCODE'    '=EESC'.
*
** Ecran "Groupe de gammes" --> on choisie gamme de référence
*  PERFORM bdc_dynpro      USING 'SAPLCOSD' '0310'.
*  PERFORM bdc_field       USING 'BDC_OKCODE'    '=OPT1'.
*
** Ecran "Groupe de gammes" --> saisie données
*  PERFORM bdc_dynpro      USING 'SAPLCOSD' '0129'.
*  PERFORM bdc_field       USING 'BDC_OKCODE'    'BACK'.
*  PERFORM bdc_field       USING 'CAUFVD-PLNNR'  iv_routing_group.
*  PERFORM bdc_field       USING 'CAUFVD-PLNTY'  iv_routing_type.
*
** Validation de la gamme
*  PERFORM bdc_dynpro      USING 'SAPLCPSL' '2120'.
*  PERFORM bdc_field       USING 'BDC_OKCODE'   '=PICK'.
*  PERFORM bdc_field       USING 'BDC_CURSOR'   'PLKO-PLNNR(01)'.
*
** Ecran "Généralités" --> navigation vers liste des opérations
*  PERFORM bdc_dynpro      USING 'SAPLCOKO1' '0115'.
*  PERFORM bdc_field       USING 'BDC_OKCODE'   '=VGUE'.
*
** Ecran liste des opérations --> navigation vers détail opération 0010
**                                Onglet zones utilis
*  PERFORM bdc_dynpro      USING 'SAPLCOVG' '0100'.
*  PERFORM bdc_field       USING 'BDC_OKCODE'   '=PICK'.
*  PERFORM bdc_field       USING 'BDC_CURSOR'   'AFVGD-VORNR(01)'.
*
*** Ecran liste des opérations --> Onglet zones utilis
*  PERFORM bdc_dynpro      USING 'SAPLCOVF' '0100'.
*  PERFORM bdc_field       USING 'BDC_OKCODE'    '=VOUS'.
*
** Ecran détail opération 0010 Onglet zones utilis --> saisie données puis sauvegarde
*  PERFORM bdc_dynpro      USING 'SAPLCOVF' '0100'.
*  PERFORM bdc_field       USING 'BDC_OKCODE'    '=BU'.
*  PERFORM bdc_field       USING 'AFVGD-SLWID'   'Z000002'.
*
*
*  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
*    EXPORTING
*      input  = iv_aufnr_pere
*    IMPORTING
*      output = lv_aufnr_txt.
*
*  PERFORM bdc_field       USING 'AFVGD-USR00'   lv_aufnr_txt.
*  PERFORM bdc_field       USING 'AFVGD-USR01'   iv_matnr_pere.
*  WRITE iv_gsuzs_pere TO lv_heure.
*  PERFORM bdc_field       USING 'AFVGD-USR02'   iv_gsuzs_pere.
*  WRITE iv_gltrp_pere TO lv_date.
*  PERFORM bdc_field       USING 'AFVGD-USR08'   lv_date.
*
** Appel transaction
*  lv_mode = 'N'.
*  lv_update = 'A'.
*  REFRESH lt_msg.
*  CALL TRANSACTION 'CO01'
*              USING gt_bdcdata
*              MODE   lv_mode
*              UPDATE lv_update
*              MESSAGES INTO lt_msg.

*  IF iv_log_handle IS NOT INITIAL.
*
*
*    LOOP AT lt_msg INTO ls_msg.
*
*      ls_bal_msg-msgty = ls_msg-msgtyp.
*      ls_bal_msg-msgid = ls_msg-msgid.
*      ls_bal_msg-msgno = ls_msg-msgnr.
*      ls_bal_msg-msgv1 = ls_msg-msgv1.
*      ls_bal_msg-msgv2 = ls_msg-msgv2.
*      ls_bal_msg-msgv3 = ls_msg-msgv3.
*      ls_bal_msg-msgv4 = ls_msg-msgv4.
*
*      CALL FUNCTION 'BAL_LOG_MSG_ADD'
*        EXPORTING
*          i_log_handle     = iv_log_handle
*          i_s_msg          = ls_bal_msg
*        EXCEPTIONS
*          log_not_found    = 1
*          msg_inconsistent = 2
*          log_is_full      = 3
*          OTHERS           = 4.
*    ENDLOOP.
*  ENDIF.
*
*  LOOP AT lt_msg INTO ls_msg
*                 WHERE msgtyp = 'E'
*                   OR  msgtyp = 'A'.
*  ENDLOOP.
*
*  IF sy-subrc = 0.
*    CLEAR cv_aufnr.
*  ELSE.
**   On indique le N° OF créé
*    READ TABLE lt_msg INTO ls_msg
*           WITH KEY  msgtyp = 'S'
*                     msgid  = 'CO'
*                     msgnr  = '100'.
*    IF sy-subrc = 0.
*      cv_aufnr = ls_msg-msgv1.
*    ENDIF.
*  ENDIF.

ENDFORM.                    " create_of
```