# **TYPE SORTED TABLE**

`TYPE SORTED TABLE` est une `table organisée par une clé de la table`. Dans ce cas, il est nécessaire de `déclarer une clé` (instruction `WITH UNIQUE KEY` obligatoire). Elle contient également un [INDEX](../../12_Instructions_dbtab/06_Index/01_Index.md) (voir plus de détail dans la suite de ce chapitre).

```JS
TYPES: BEGIN OF ty_tab,
         obj1 TYPE dtel1,
         obj2 TYPE dtel2,
         obj3 TYPE dtel3,
         . . .
       END OF ty_tab.

DATA: it_tab_types TYPE SORTED TABLE OF ty_tab
                   WITH UNIQUE KEY obj1.
```

Attention, la déclaration des tables de type [HASHED](./04_Type_Hashed.md) et `SORTED` est erronée et incomplète car il est nécessaire d’inclure la notion de [CLE PRIMAIRE](./06_Primary_Key.md) !
