# **CONSTANTES**

## `CONSTANTS` :

Une constante est un symbole informatique associant un nom à une valeur qui peut varier durant l’exécution du programme. Cette définition s’applique également à une [VARIABLE](./01_Variables.md), à la différence près que sa valeur n'est pas fixée dès le début et peut changer au cours de l’exécution du programme.

L’instruction commencera par `CONSTANTS` et devra comporter obligatoirement une valeur fixe avec `VALUE`.

## `I` (Integer)

```JS
CONSTANTS: C_INTEGER TYPE I VALUE 10.
```

## `F` (Float)

```JS
CONSTANTS: C_FLOAT TYPE F VALUE '3.14'.
```

## `DECFLOAT`

```JS
CONSTANTS: C_DECIMAL TYPE DECFLOAT34 VALUE '1234567890123456789012345678901234'.
```

## `STRING`

```JS
CONSTANTS: C_STRING TYPE STRING VALUE 'Hello, World!'.
```

## `C` (Char)

```JS
CONSTANTS: C_CHAR TYPE C LENGTH 1 VALUE 'F'.
```

## `BOOLEAN` / `ABAP_BOOL`

```JS
CONSTANTS: C_BOOL TYPE BOOLEAN VALUE ABAP_TRUE.
CONSTANTS: C_BOOLEAN TYPE ABAP_BOOL VALUE ABAP_FALSE.
```

## `SY-DATUM` (AAAAMMJJ)

```JS
CONSTANTS: C_DATE TYPE D VALUE SY-DATUM.
CONSTANTS: C_DATE TYPE D VALUE 1986110.
```

## `SY-UZEIT` (HHMMSS)

```JS
CONSTANTS: C_TIME TYPE T VALUE SY-UZEIT.
CONSTANTS: C_TIME TYPE T VALUE 183045.
```

# `P DECIMALS`

Il est à noter qu’en `ABAP`, le point (.) est utilisé pour les décimales.

    Le type P doit être accompagné par l’instruction DECIMALS qui va définir le nombre de chiffres après la virgule, sinon la variable associée sera considérée comme un nombre entier.

```JS
CONSTANTS: C_PI TYPE P DECIMALS 2 VALUE '3.14'.
```
