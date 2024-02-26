# **VARIABLES**

## `VARIABLE`

Une variable est un symbole informatique associant un nom à une valeur qui peut varier durant l’exécution du programme. Cette définition s’applique également à une [CONSTANTE](./02_Constants.md), à la différence près que sa valeur est fixée dès le début et ne changera jamais au cours de l’exécution du programme.

_Types de variables ABAP :_

| **Type**  | **Description**       | **Default length** | **Default value** | **Value**  |
| --------- | --------------------- | ------------------ | ----------------- | ---------- |
| `C`       | _Alphanumeric string_ | 1                  | "                 | 'ABC012'   |
| `N`       | _Numeric_             | 1                  | 0                 | 5          |
| `D`       | _Date_                | 8                  | 00000000          | 20090412   |
| `T`       | _Hour_                | 6                  | 000000            | 134523     |
| `X`       | _Hexadecimal_         | 1                  | X'0'              | 65AF       |
| `I`       | _Integer_             | 4                  | 0                 | 5          |
| `P`       | _Decimal number_      | 8                  | 0                 | 5.6        |
| `F`       | _Scientific format_   | 8                  | 0                 | 2.2 E+209  |
| `STRING`  | _Long text_           | Any length         | "                 | Any string |
| `XSTRING` | _Hexadecimal string_  | Any length         |                   | Any string |

## `TYPE` / `LIKE`

l’instruction de référence peut être égale à `TYPE` ou `LIKE`. Pour comprendre la différence entre les deux, voici un exemple :

```JS
DATA: LV_NAME(10) TYPE C,
      LV_NAME2    LIKE LV_NAME.
```

La variable `LV_NAME` est déclarée avec un type chaîne de caractères et de longueur `10` et `LV_NAME2` quant à elle prend comme référence la variable `LV_NAME`. Ainsi, `TYPE` va pointer directement vers un type spécifique alors que le `LIKE` va en prendre indirectement une `référence`. Dans une [PROGRAMMATION OBJET](../14_Classes/01_ABAP_Object/01_ABAP_Object.md), le `TYPE` est à privilégier.

## `C` (Char)

```JS
DATA: LV_CHAR TYPE CHAR255,
      LV_NAME(9) TYPE C.

* LV_CHAR = 'Aikansy'.
* LV_NAME = 'Aikansy Anysing'.              Reverra 'Aikansy A' uniquement
```

## `I` (Integer) / `N` (Numeric)

Si le type entier `I` et le type numérique `N` sont comparés, il apparaît qu’ils sont sensiblement les mêmes :

- Type entier `I` :

  est une chaîne numérique de nombres entiers.

- Type numérique `N` :

  est aussi une chaîne numérique mais stockée sous forme de caractères, ce qui est pratique lors d’un travail avec des instructions sur des variables texte comme le [CONCATENATE](04_Concatenate.md)

```JS
DATA: LV_INTEGER TYPE I,
      LV_YEAR TYPE N.

* LV_INTEGER = 10.
```

## `SY-DATUM` (AAAAMMJJ)

Le format date [SY-DATUM](../help/02_SY-SYSTEM.md) est de type AnnéeMoisJour (AAAAMMJJ), pour un affichage plus adéquat, il faudra toujours modifier la variable date.

```JS
DATA: LV_DATE TYPE D.

* LV_DATE = SY-DATUM.
* LV_DATE = 19861102.
```

## `SY-UZEIT` (HHMMSS)

Le format time [SY-UZEIT](../help/02_SY-SYSTEM.md) est de type HeuresMinutesSecondes (AAAAMMJJ), pour un affichage plus adéquat, il faudra toujours modifier la variable date.

```JS
DATA: LV_TIME TYPE T.

* LV_TIME = SY-UZEIT.
* LV_TIME = 183045.
```

## `FLOAT`

```JS
DATA: LV_FLOAT TYPE F.

* LV_FLOAT = '3.14'.
```

## `P DECIMALS`

```JS
DATA: LV_DECIMAL TYPE P DECIMALS 2.

* LV_DECIMAL = 1234.56.
```

## `STRING`

```JS
DATA: LV_STRING TYPE STRING.

* LV_STRING = 'Bonjour le monde'.
```

## `BOOLEAN`

```JS
DATA: LV_BOOL TYPE BOOLEAN,
      LV_BOOLEAN TYPE ABAP_BOOL.

* LV_BOOL = ABAP_TRUE.
* LV_BOOLEAN = ABAP_FALSE.
```
