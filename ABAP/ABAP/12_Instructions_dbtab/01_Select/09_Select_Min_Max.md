# **MIN MAX**

Plusieurs fonctions d'agrégats existent sur **SAP** pour les requêtes [SQL](./01_SQL.md).

`MAX ( [DISTINCT] col )` et `min ( [DISTINCT] col )` Renvoient la valeur maximum ou minimum de la [TABLE](../../09_Tables_DB/01_Tables.md) selon la colonne sélectionnée.

_Exemple_

_Retourner la valeur maximum ou minimum de la table selon la colonne sélectionnée._

```JS
DATA: v_min TYPE ztravel-duration,
      v_max TYPE ztravel-duration.

SELECT MAX( duration ), MIN( duration )
    FROM ztravel
    INTO (@v_max, @v_min).
```

Les [VARIABLES](../../04_Variables/01_Variables.md) `V_MAX` et `V_MIN` `100` auront respectivement les valeurs `150` et `100`.

La fonctionnalité `DISTINCT` peut être utilisée également mais n’est pas d’une très grande utilité avec le `MIN` et le `MAX`.
