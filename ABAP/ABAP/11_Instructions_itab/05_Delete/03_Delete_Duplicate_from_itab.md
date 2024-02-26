# **DELETE ADJACENT DUPLICATES**

```JS
DELETE ADJACENT DUPLICATES FROM itab
                           [COMPARING {comp1 comp2 ...}].
```

L'instruction `DELETE ADJACENT DUPLICATES` va repérer toutes les lignes en doublon, et les supprimer. Si aucun champ n'est défini par le paramètre `COMPARING`, elle va utiliser la [CLE PRIMAIRE](../../10_Tables_Internes/06_Primary_Key.md) définie lors de la déclaration de la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md).

_Exemple_

_Supprimer tous les doublons d'une [CLE PRIMAIRE](../../10_Tables_Internes/06_Primary_Key.md) de type [SORTED](../../10_Tables_Internes/03_Type_Sorted.md) ayant pour clé primaire le champ `COUNTRY`._

```JS
TYPES: BEGIN OF ty_citizen,
         country TYPE char3,
         name    TYPE char20,
         age     TYPE numc2,
       END OF ty_citizen.

DATA: t_citizen TYPE SORTED TABLE OF ty_citizen WITH NON-UNIQUE KEY country,
      s_citizen TYPE ty_citizen.

s_citizen-country = 'FR'.
s_citizen-name    = 'Thierry'.
s_citizen-age     = '24'.
INSERT s_citizen INTO TABLE t_citizen.

s_citizen-country = 'ES'.
s_citizen-name    = 'Luis'.
s_citizen-age     = '32'.
INSERT s_citizen INTO TABLE t_citizen.

s_citizen-country = 'BR'.
s_citizen-name    = 'Renata'.
s_citizen-age     = '27'.
INSERT s_citizen INTO TABLE t_citizen.

s_citizen-country = 'FR'.
s_citizen-name    = 'Floriane'.
s_citizen-age     = '32'.
INSERT s_citizen INTO TABLE t_citizen.

DELETE ADJACENT DUPLICATES FROM t_citizen.
```

**T_CITIZEN avant DELETE**

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| BR          | Renata   | 27      |
| ES          | Luis     | 32      |
| FR          | Floriane | 32      |
| FR          | Thierry  | 24      |

**T_CITIZEN après DELETE**

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| BR          | Renata   | 27      |
| ES          | Luis     | 32      |
| FR          | Floriane | 32      |

    Pour que le DELETE ADJACENT DUPLICATES fonctionne, il est impératif que la table soit ordonnée selon une clé primaire ou une liste de champs spécifiés.

_Même exemple que précédemment, mais avec une table interne de type [STANDARD](../../10_Tables_Internes/03_Type_Sorted.md)._

```JS
TYPES: BEGIN OF ty_citizen,
         country TYPE char3,
         name    TYPE char20,
         age     TYPE numc2,
       END OF ty_citizen.

DATA: t_citizen TYPE TABLE OF ty_citizen,
      s_citizen TYPE ty_citizen.

s_citizen-country = 'FR'.
s_citizen-name    = 'Thierry'.
s_citizen-age     = '24'.
APPEND s_citizen TO t_citizen.

s_citizen-country = 'ES'.
s_citizen-name    = 'Luis'.
s_citizen-age     = '32'.
APPEND s_citizen TO t_citizen.

s_citizen-country = 'BR'.
s_citizen-name    = 'Renata'.
s_citizen-age     = '27'.
APPEND s_citizen TO t_citizen.

s_citizen-country = 'FR'.
s_citizen-name    = 'Floriane'.
s_citizen-age     = '32'.
APPEND s_citizen TO t_citizen.

SORT t_citizen BY country.
DELETE ADJACENT DUPLICATES FROM t_citizen COMPARING country.
```

Lors de l'exemple avec une [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) de type [SORTED](../../10_Tables_Internes/01_Tables_Internes.md), le tri se faisait automatiquement via l'instruction [INSERT](../../11_Instructions_itab/01_Insert/01_Insert_into_itab.md) respecatant la [CLE PRIMAIRE](../../10_Tables_Internes/06_Primary_Key.md). Pour une [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) de type [STANDARD](../../10_Tables_Internes/02_Type_Standard.md), le tri doit s'effectuer avec l'instruction [SORT](../06_Sort/01_Sort_itab.md) et le `DELETE ADJACENT DUPLICATES` doit suivre exeactement les mêmes nombre et séquence que le [SORT](../06_Sort/01_Sort_itab.md).

**T_CITIZEN avant DELETE après le SORT**

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| BR          | Renata   | 27      |
| ES          | Luis     | 32      |
| FR          | Floriane | 32      |
| FR          | Thierry  | 24      |

**T_CITIZEN après DELETE**

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| BR          | Renata   | 27      |
| ES          | Luis     | 32      |
| FR          | Floriane | 32      |
