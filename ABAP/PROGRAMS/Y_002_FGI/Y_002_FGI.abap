*&---------------------------------------------------------------------*
*                               .,,,,,,,,,,,,
*                        ,;%%%%uuuuuuuuuuuuu%%%\
*                     /%%%%%uuuu====####uuuuuu%%%%
*                   /%%%%%uuuu.....===###uuuuu%%%%%%
*            , `````\%%%%%uuu....##.===##uuuu%%%%%%%%
*           ,````````)####\%u....../==#/uuu%%%%%%%%%%%
*           ,`````/#########\%mmmmmmmmmmmmm%%%%%%%%%%%;
*           #\``/##########(mmmmmmmmmmmmmmmmnu%%`%%%%%%%
*           ###############(mmmmmmmmmmmmmmmmmnuu%%`%%%%%%;
*           u\###########/ (mmmmmmmmmmmmmmmmmmnuu%%`%%%%%%%%
*          uuuuuEEE         \mmmmmmmmmmmmmmmmmnuuu%%`%%%%%%%%%
*          uuuuuEEE    .:::,#u,mmmmnnmmmmmmmmmnuuu%%;; %%%%%%%%%
*           uuuuuu\##\:::::##uuummmmmmmmmmmmmmnuu%%;;;; :...%%%%%%
*              uuuuu\#######/uuuuuuuuuu,mmmmmmnu%%...;;;  ::...%%%%
*                 \uuuuuuuuuuuuuuuuuuuuuuuu,mmnu/ \...;;;   ::...%%%
*                   >####&&################<%%%%    \;;;/    ::...%%%
*               (#####&&&################%%%%%%%              ::..%%%
*           (######&&&&##############(%%%%%%%%%%                ::%/
*          (####&&&&&&#############(%%%%%%%%%%%%%
*        (#######&&&&&############(%%%%%%%%%%%%%%%%
*       (#########################(%%%%%%%%%%%%%%%%%%
*       (# (######################(%%%%%%%%%%%%%%%%%%%%
*          (#######################(%%%%%%%%%%%%%%%%%%%%%
*         %%%(#####################(%%%%%%%%%%%%%%%%%%%%%%%
*        %%%%%%(####################(%%%%%%%%%%%%%%%%%%%%%%%
*       ;%%%%%%; (#################n`%%%%%%%%`%%%%%%%%%%%%%%%
*      (%%%%%%%(  ;%nn############nn`%%%%%%%%`%%%%%%%%%%%%%%%%
*       ;%%%%%%%  %%%nnnnnnnnnnnnn`%%%%%%%%%`%%%%%%%%%%%%%%%%%%(@@@)
*        \%%%%%;  %%%%nnnnnnnn`%%%%%%%%%`%%`n%%%%%%%%%%%%%%%%%(@@@@@)
*         (%(%/   %%%%%nnnnnn`%%%%%%%%%%%`nnnn%%%%%%%%%%%%%%%%(@@@@@@
*                %%%%%%nnnnnn`%%%%%%%%`nnnnnnnn%%%%%%%%%%%%%%(@@@@@@@
*               %%%%%%%nnnnnnn(%(%)nnnnnnnnnnnn%%%%%%%%%%%%%(@@@@@@@)
*           .,;%%%%%%%%nnnnnnnnnnnnnnnnnnnnnnn%%%%%%%%%%%%%(@@@@@@@@
*    ,nnnnnnn%%%%%%%%%nnnnnn)nnnnnnnnnnnnnnn%%%%%%%%%%%%%%(@@@@@@@)
* /nnnnnnnnnnn%%%%%%nnnnnnnnnnn)nnnnnnnnn%%%%%%%%%%%%%%%/  (@@@@)
*(uu(uuuuuuuuuuuuuuuuuuuuuuuuuuu/   (uu;;;;;;;;;;;uu)
*                                    (uu;;;;;;;;;;uu)
*                                     (uuuuuuuuuuuuu)
*                                       (uu)(uu)(uu)
*
*&---------------------------------------------------------------------*
*& REPORT                : Y_002_FGI
*& VERSION               : 1.00
*& AUTHOR                : EH7MM63  -  EH7MM63
*& FUNCTION / DEPARTMENT :  /
*&---------------------------------------------------------------------*
*& CREATION DATE         : 2023.06.02
*& PURPOSE               :
*&---------------------------------------------------------------------*
*& CORRECTION ON VERSION : 1.00
*& NEW VERSION           : 1.01
*& AUTHOR                :
*& DATE                  :
*& REASON                :
*& CHANGE                :
*&---------------------------------------------------------------------*
*& HISTORY
*&---------------------------------------------------------------------*

REPORT Y_002_FGI NO STANDARD PAGE HEADING.

INCLUDE Y_002_FGI_LCL.
INCLUDE Y_002_FGI_TOP.
INCLUDE Y_002_FGI_SCR.
INCLUDE Y_002_FGI_F01.

INITIALIZATION.

  PERFORM DATA_INITIALIZATION.

START-OF-SELECTION.

*  GET RUN TIME FIELD DATA(wvl_t0).

  PERFORM DATA_PROCESSING.
  PERFORM DATA_DISPLAY.

*  GET RUN TIME FIELD DATA(wvl_t1).
*  DATA(wvl_tot) = wvl_t1 - wvl_t0.
*  WRITE wvl_tot.

END-OF-SELECTION.