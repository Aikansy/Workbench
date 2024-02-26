# **FEATURE DYNAMIZED SCREEN**

`PROGRAM`

```abap
REPORT zfgi_prog NO STANDARD PAGE HEADING.

INCLUDE zfgi_prog_top.
INCLUDE zfgi_prog_scr.
INCLUDE zfgi_prog_f01.

INITIALIZATION.

START-OF-SELECTION.

END-OF-SELECTION.
```

`INCLUDE TOP`

```abap
TABLES: vbak, vbap.
```

`INCLUDE SCR`

```abap
SELECTION-SCREEN BEGIN OF BLOCK b0 WITH FRAME TITLE TEXT-001.

    PARAMETERS : p_crea TYPE xfeld RADIOBUTTON GROUP rb1 USER-COMMAND trait DEFAULT 'X'.

    SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-002.
        PARAMETERS: p_rad1  RADIOBUTTON GROUP rb2 USER-COMMAND fcode MODIF ID g1 DEFAULT 'X',
                    p_fname TYPE localfile MODIF ID g1.
        SELECTION-SCREEN SKIP 1.
        PARAMETERS: p_rad2       RADIOBUTTON GROUP rb2 MODIF ID g1,
                    p_lpath(500) TYPE c MODIF ID g1,
                    p_lname(100) TYPE c MODIF ID g1,
                    p_arch(500)  TYPE c MODIF ID g1.
    SELECTION-SCREEN END OF BLOCK b1.

    PARAMETERS : p_alv TYPE xfeld RADIOBUTTON GROUP rb1.

    SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-003.
        PARAMETERS : p_ernam TYPE vbak-ernam MODIF ID g2 DEFAULT sy-uname.
        SELECT-OPTIONS : s_vbeln FOR vbak-vbeln MODIF ID g2,
                         s_auart FOR vbak-auart MODIF ID g2,
                         s_vkorg FOR vbak-vkorg MODIF ID g2 MATCHCODE OBJECT zkdev_matnr, " SE11
                         s_vtweg FOR vbak-vtweg MODIF ID g2,
                         s_spart FOR vbak-spart MODIF ID g2,
                         s_matnr FOR vbap-matNr MODIF ID g2,
                         s_plant FOR vbap-werks MODIF ID g2,
                         s_kunnr FOR vbap-kunnr_ana MODIF ID g2,
                         s_erdat FOR vbak-erdat MODIF ID g2.
    SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN END OF BLOCK b0.
```

```abap
AT SELECTION-SCREEN OUTPUT.

    FREE MEMORY ID sy-cprog. "  la mémoire allouée par le programme en cours d'exécution sera libérée

    LOOP AT SCREEN.

        IF p_crea IS NOT INITIAL.

            IF screen-group1 = 'G1'.
                screen-active = 1.
            ELSEIF screen-group1 = 'G2'.
                screen-active = 0.
            ENDIF.
            MODIFY SCREEN.

        ELSEIF p_alv IS NOT INITIAL.

            IF screen-group1 = 'G1'.
                screen-active = 0.
            ELSE.
                screen-active = 1.
            ENDIF.
            MODIFY SCREEN.
        ENDIF.
    ENDLOOP.

    LOOP AT SCREEN.

        IF screen-name = 'P_FNAME'.
            IF p_rad1 IS NOT INITIAL.
                screen-input  = 1.
            ELSE.
                screen-input  = 0.
            ENDIF.
            MODIFY SCREEN.

        ELSEIF screen-name = 'P_LPATH' OR screen-name  = 'P_LNAME' OR screen-name  = 'P_ARCH'.
      
            IF p_rad2 IS NOT INITIAL.
                screen-input = 1.
            ELSE.
                screen-input  = 0.
            ENDIF.
            MODIFY SCREEN.
        ENDIF.

    ENDLOOP.
```