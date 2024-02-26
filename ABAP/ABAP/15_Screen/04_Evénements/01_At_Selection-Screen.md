# **AT SELECTION SCREEN**

Il a été vu dans la section précédente concernant les _champs_ de l’[ECRAN DE SELECTION](../01_Ecran_de_Sélection/README.md), l’événement `AT SELECTION-SCREEN OUTPUT` exécuté avant l’affichage de l’[ECRAN DE SELECTION](../01_Ecran_de_Sélection/README.md), permettant ainsi de renseigner un _paramètre_. Cette section aura donc pour but de lister les principaux _événements_ d’un [ECRAN DE SELECTION](../01_Ecran_de_Sélection/README.md), utilisés dans un _programme ABAP_.

```JS
AT SELECTION-SCREEN   { OUTPUT }
                    | { ON {para|selcrit} }
                    | { ON END OF selcrit }
                    | { ON BLOCK block }
                    | { ON RADIOBUTTON GROUP group }
                    | { ON VALUE-REQUEST
                           FOR {para|selcrit-low|selcrit-high} }
                    | { ON EXIT-COMMAND }
                    | (...).
```

Pour la suite de ce chapitre, l’exemple du `BEGIN OF BLOCK` sera repris pour être complété avec les _événements_.
