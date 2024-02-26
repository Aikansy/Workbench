# **AVG**

Plusieurs fonctions d'agrégats existent sur **SAP** pour les requêtes [SQL](./01_SQL.md).

`AVG ( [DISTINCT] col )` détermine la moyenne de la colonne sélectionnée (`AVG` pour `Average` en anglais).

_Exemple_

_Connaître la moyenne des coûts de péage payés de tous les voyages de covoiturage effectués :_

```JS
DATA v_toll TYPE ztravel_toll.

SELECT AVG( toll )
    FROM ztravel
    INTO @v_toll.
```

Selon les valeurs enregistrées dans le chapitre [DICTIONNAIRE DE DONNEES](../../08_SE11/01_SE11.md), `V_TOLL` aura la valeur de 13.75 : (16 + 17 + 16 + 6) / 4.

- L’option `DISTINCT` comme déjà vu sur les tables va supprimer les doublons. Ainsi le code suivant :

```JS
DATA v_toll TYPE ztravel_toll.

SELECT AVG( DISTINCT toll )
    FROM ztravel
    INTO @v_toll.
```

Retournera la [VARIABLE](../../04_Variables/01_Variables.md) `V_TOLL` avec la valeur `13` : (16 + 17 + 6) / 3. La valeur `16` apparaissant deux fois, une des deux valeurs ne sera pas prise en compte.
