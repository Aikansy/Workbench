# **PARAMETRE AT**

_Concernant les paramètres `AT`, il en existe plusieurs :_

```JS
LOOP AT itab.
  [AT FIRST.
    ...
  ENDAT.]

  [AT NEW comp1.
    ...
  ENDAT.

  [AT NEW comp2.
    ...
  ENDAT.
  [...]
  [AT NEW compn.
    ...
  ENDAT.

  [...]

  [AT END OF compn.
    ...
  ENDAT.
  [...]
  [AT END OF comp2.
    ...
  ENDAT.]

  [AT END OF comp1.
    ...
  ENDAT.]

  [AT LAST.
    ...
  ENDAT.]

ENDLOOP.
```

- `AT FIRST`

  Pour la première ligne lue de la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) `itab`, un traitement spécifique peut être exécuté.

- `AT NEW comp1` (AT NEW comp2... AT NEW compn)

  Pour un nouvel élément (`comp1`, `comp2`,... `compn`) de la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) `itab`, un traitement spécifique peut être exécuté.

- `AT END OF compn` (... AT END OF comp2, AT END OF comp1)

  Pour un dernier élément (`comp1`, `comp2`,... `compn`) de la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) `itab`, un traitement spécifique peut être exécuté.

- `AT LAST`

  Pour la dernière ligne lue de la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) `itab`, un traitement spécifique peut être exécuté.

_Exemple_

```JS
TYPES: BEGIN OF ty_citizen,
         country TYPE char3,
         name    TYPE char20,
         age     TYPE numc2,
       END OF ty_citizen.

DATA: t_citizen TYPE STANDARD TABLE OF ty_citizen,
      s_citizen TYPE ty_citizen.

FIELD-SYMBOLS: <fs_citizen> TYPE ty_citizen.

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

LOOP AT t_citizen ASSIGNING <fs_citizen>.
  AT FIRST.
    WRITE: 'Début de la liste'.
    ULINE.
  ENDAT.

  AT NEW country.
    WRITE: / 'Début pays : ', <fs_citizen>-country.
  ENDAT.

  WRITE:/ 'Nom : ', <fs_citizen>-name, 'Age : ', <fs_citizen>-age.

  AT END OF country.
    WRITE: / 'Fin pays : ', <fs_citizen>-country.
    ULINE.
  ENDAT.

  AT LAST.
    WRITE: 'Fin de la liste'.
  ENDAT.

ENDLOOP.
```

_Résultat_

![](../../ressources/11_09_02_01.png)

Pour l'utilisation du `AT NEW` / `AT END OF`, il est recommandé de trier la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) sauf s'il s'agit d'un type [SORTED](../../10_Tables_Internes/03_Type_Sorted.md).
