# **CLE PRIMAIRE**

```JS
... [UNIQUE|NON-UNIQUE] KEY ...
```

Deux types de `clé primaires` peuvent être déclarées :

- `Unique`

- `Non unique`

et comme leur nom l'indique, elles autorisent ou non les doublons, dans la [TABLE INTERNE](./01_Tables_Internes.md), de données de même clé.

_Exemple :_

```JS
TYPES: BEGIN OF ty_citizen,
         country TYPE CHAR3,
         name    TYPE CHAR20,
         age     TYPE NUMC2,
       END OF ty_citizen.

DATA: t_citizen TYPE HASHED TABLE OF ty_citizen
                WITH UNIQUE KEY country.
```

La référence `TY_CITIZEN` est créée contenant trois champs :

- `COUNTRY` de type `CHAR3`

- `NAME` de type `CHAR20`

- `AGE` de type `NUMC2`

La [TABLE INTERNE](./01_Tables_Internes.md) `T_CITIZEN` est ensuite déclarée de type `HASHED` ayant une `clé primaire unique` définie par le champ `COUNTRY`. Ainsi, losque les données seront renseignées, il sera impossible d'insérer deux lignes avec la même valeur pour le champ `COUNTRY` (code retour [SY-SUBRC](../help/02_SY-SYSTEM.md) égal à 4 et la [TABLE INTERNE](./01_Tables_Internes.md) n'est pas mise à jour avec le deuxième enregistrement), alors que le type `NON-UNIQUE` laisse le cas se produire.

Cependant, chaque type de `table interne` a sa règle concernant la `clé primaire` :

- [STANDARD](./02_Type_Standard.md) : `clé primaire facultative` et uniquement de type `NON-UNIQUE`
- [HASHED](./04_Type_Hashed.md) : `clé primaire obligatoire` et uniquement de type `UNIQUE`
- [SORTED](./03_Type_Sorted.md) : `clé primaire obligatoire` et peut être de type `UNIQUE` ou `NON-UNIQUE`
