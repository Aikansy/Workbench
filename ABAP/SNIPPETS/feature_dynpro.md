# **DYNPROP**

`DYNPRO 0001 CREATION`

![DYNPRO_CREATION](./ressources/dynpro_001.png)

`DYNPRO 0001 SETTINGS & MODULE CREATION`

![DYNPRO_SETTINGS](./ressources/dynpro_002.png)

![DYNPRO_SETTINGS](./ressources/dynpro_003.png)

![DYNPRO_SETTINGS](./ressources/dynpro_004.png)

`STATUT GUI CREATION`

![DYNPRO_STATUT_GUI_CREATION](./ressources/dynpro_005.png)

![DYNPRO_STATUT_GUI_CREATION](./ressources/dynpro_006.png)

`STATUT GUI SETTINGS`

![DYNPRO_STATUT_GUI_SETTINGS](./ressources/dynpro_007.png)

`DYNPRO 0001 BINDING & ASSIGNING SHORTCUTS`

![DYNPRO_SETTINGS](./ressources/dynpro_008.png)

`PROGRAM`

```abap
REPORT zfgi_prog NO STANDARD PAGE HEADING.

INCLUDE zfgi_prog_top.
INCLUDE zfgi_prog_scr.
INCLUDE zfgi_prog_f01.

INITIALIZATION.

START-OF-SELECTION.

  CALL SCREEN 0001.

END-OF-SELECTION.
```
