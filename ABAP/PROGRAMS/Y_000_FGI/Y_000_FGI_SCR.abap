*&---------------------------------------------------------------------*
*&  Include           Y_000_FGI_SCR
*&---------------------------------------------------------------------*

* SUBSCREEN 1 ---------------------------------------------------------*

SELECTION-SCREEN BEGIN OF SCREEN 100 AS SUBSCREEN.

  SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME.

    SELECTION-SCREEN BEGIN OF LINE.
    PARAMETERS: P1(34) TYPE C.
    SELECTION-SCREEN COMMENT 38(34) TEXT-101 FOR FIELD P1.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN BEGIN OF LINE.
    PARAMETERS: P2(34) TYPE C.
    SELECTION-SCREEN COMMENT 38(34) TEXT-102 FOR FIELD P2.
    SELECTION-SCREEN END OF LINE.

    SELECTION-SCREEN SKIP 2.

    SELECTION-SCREEN PUSHBUTTON 38(35) LB1 USER-COMMAND PB1.

  SELECTION-SCREEN END OF BLOCK B1.

SELECTION-SCREEN END OF SCREEN 100.

* SUBSCREEN 2 ---------------------------------------------------------*

SELECTION-SCREEN BEGIN OF SCREEN 200 AS SUBSCREEN.

    SELECTION-SCREEN BEGIN OF BLOCK B2 WITH FRAME.
      PARAMETERS: Q1(10) TYPE C,
                  Q2(10) TYPE C,
                  Q3(10) TYPE C.
    SELECTION-SCREEN END OF BLOCK B2.

SELECTION-SCREEN END OF SCREEN 200.

* STANDARD SELECTION SCREEN -------------------------------------------*

SELECTION-SCREEN: BEGIN OF TABBED BLOCK MYTAB FOR 35 LINES,
                    TAB (20) BUTTON1 USER-COMMAND PUSH1,
                    TAB (20) BUTTON2 USER-COMMAND PUSH2,
                    TAB (20) BUTTON3 USER-COMMAND PUSH3,
                    TAB (20) BUTTON4 USER-COMMAND PUSH4,
                  END OF BLOCK MYTAB.

AT SELECTION-SCREEN.
  CASE SY-DYNNR.
    WHEN 1000.
      CASE SY-UCOMM.
        WHEN 'PUSH1'.
          MYTAB-DYNNR = 100.
          MYTAB-ACTIVETAB = 'BUTTON1'.
        WHEN 'PUSH2'.
          MYTAB-DYNNR = 200.
          MYTAB-ACTIVETAB = 'BUTTON2'.
      ENDCASE.
  ENDCASE.

  CASE SSCRFIELDS.
    WHEN 'PB1'.
      PERFORM LF_COMMON_FIELDS.
      CALL SCREEN 110.
    WHEN OTHERS.
  ENDCASE.