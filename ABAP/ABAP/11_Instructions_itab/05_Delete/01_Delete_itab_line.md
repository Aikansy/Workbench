# **DELETE SINGLE LINE**

```JS
DELETE { TABLE itab   { FROM wa }
                    | { WITH TABLE KEY [keyname COMPONENTS]
                                {comp_name1|(name1)} = operand1
                                {comp_name2|(name2)} = operand2
                                ...}
         | itab INDEX idx }
```

_Pour la suppression d’une seule ligne d’une table interne, il existe trois possibilités :_

## 1. Suppression d'une ligne de itab à partir de la structure

Le système ira rechercher la [CLE PRIMAIRE](../../10_Tables_Internes/06_Primary_Key.md) renseignée afin de supprimer les enregistrements souhaités.

_Exemple_

```JS
TYPES: BEGIN OF ty_citizen,
         country TYPE char3,
         name    TYPE char20,
         age     TYPE numc2,
       END OF ty_citizen.

DATA: t_citizen TYPE TABLE OF ty_citizen WITH NON-UNIQUE KEY country,
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

CLEAR s_citizen.
s_citizen-country = 'FR'.

DELETE TABLE t_citizen FROM s_citizen.
```

L’instruction supprimera le premier enregistrement rencontré ayant pour clé `COUNTRY` égale à `FR`. Un`CLEAR` est effectué avant de renseigner de nouveau le champ afin de bien nettoyer la structure des valeurs renseignées.

## 2. Suppression d'une ligne de itab en renseignant un ou plusieurs composants

_Exemple_

_Reprendre l’exemple précédent en modifiant uniquement le `DELETE` :_

```JS
. . .

DELETE TABLE t_citizen WITH TABLE KEY country = 'FR'.
```

Ici encore, l’instruction supprimera le premier enregistrement rencontré ayant pour clé `COUNTRY` égale à `FR`. Il est nécessaire de renseigner la clé entière définie pour la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md). Ici, il s’agit du champ `COUNTRY` uniquement et il n’est pas possible de renseigner plus ou d’autres champs à part ceux définis dans la clé de la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md). Ainsi, l’instruction `DELETE` ne peut s’écrire :

```JS
DELETE TABLE t_citizen WITH TABLE KEY country = 'FR' age = '32'.
```

ou

```JS
DELETE TABLE t_citizen WITH TABLE KEY age = '32'.
```

De plus, si lors de la déclaration de la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md), aucune clé n’est définie avec l’instruction `WITH NON-UNIQUE KEY` ou `WITH UNIQUE KEY`, lors du `DELETE` tous les champs doivent être renseignés après `WITH TABLE KEY`.

```JS
. . .

DATA: t_citizen TYPE TABLE OF ty_citizen,
      s_citizen TYPE ty_citizen.

. . .

DELETE TABLE t_citizen WITH TABLE KEY country = 'FR'
                                      name    = 'Thierry'
                                      age     = 24.
```

## 3. Suppression d'une ligne définie par un index de itab

_Exemple_

_Reprendre l'exemple précédent en modifiant uniquement le `DELETE`._

```JS
. . .

DELETE t_citizen INDEX 1.
```

Pour tous les exemples exécutés ci-dessous, le résultat sera à chaque fois le même.

**T_CITIZEN avant DELETE**

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| FR          | Thierry  | 24      |
| ES          | Luis     | 32      |
| BR          | Renata   | 27      |
| FR          | Floriane | 32      |

**T_CITIZEN après DELETE**

| **COUNTRY** | **NAME** | **AGE** |
| ----------- | -------- | ------- |
| FR          | Thierry  | 24      |
| ES          | Luis     | 32      |
| FR          | Floriane | 32      |
