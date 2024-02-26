# **COVERS PATTERN**

## `CP`

`CP` signifie en anglais `Covers Pattern` et vérifiera que la chaîne de caractères `oper1` respecte un modèle contenu dans `oper2`.

```JS
IF oper1 CP oper2.
  ...
ENDIF.
```

_Exemple_

```JS
DATA: c_oper1 TYPE CHAR9 VALUE 'image.png',
      c_oper2 TYPE CHAR5 VALUE '*.png'.

IF c_oper1 CP c_oper2.
  WRITE:/ 'Le fichier lu est au format PNG'.
ELSE.
  WRITE:/ 'Le fichier lu n''est pas au format PNG'.
ENDIF.
```

La constante `c_oper1` contient la chaîne de caractères `image.png` et en utilisant la condition `CP`, le programme va vérifier que celle-ci est composée du modèle contenu dans `c_oper2` à savoir `*.png`.

![](../ressources/05_10_01.png)
