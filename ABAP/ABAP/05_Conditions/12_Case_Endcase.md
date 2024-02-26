# **CASE ... ENDCASE**

## `CASE ENDCASE`

L’instruction `CASE` vérifie la valeur d’une [VARIABLE](../04_Variables/01_Variables.md) et exécute une instruction propre à chaque cas. Ainsi l’exemple en fin de la partie concernant les [OPERATEURS DE COMPARAISON](./01_Operateurs_de_Comparaison.md) pour tous les types de données, pourrait se réécrire de cette manière et aurait exactement le même résultat :

```JS
CASE operand.
  [WHEN operand1 [OR operand2 [OR operand3 [...]]].
    [statement_block1]]
  ...
  [WHEN OTHERS.
    [statement_blockn]]
ENDCASE.
```

```JS
DATA: V_MONTH TYPE i.

V_MONTH = SY-DATUM+4(2).

CASE V_MONTH.
  WHEN 12 OR 1 OR 2.
    WRITE:/'C''est l''hiver'.
  WHEN 3 OR 4 OR 5.
    WRITE:/'C''est le printemps'.
  WHEN 6 OR 7 OR 8.
    WRITE:/'C''est l''été'.
  WHEN 9 OR 10 OR 11.
    WRITE:/'C''est l''automne'.
  WHEN OTHERS.
    WRITE:/'Y a plus de saison!'.
ENDCASE.
```

Le `CASE` va isoler la [VARIABLE](../04_Variables/01_Variables.md) et vérifier chaque état renseigné (grâce aux `WHEN`) afin d’exécuter un traitement associé (`WRITE`). Si aucune valeur n’a été trouvée, exécuter le traitement sous le `WHEN OTHERS` (facultatif).
