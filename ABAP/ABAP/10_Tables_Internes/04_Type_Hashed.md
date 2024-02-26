# **TYPE HASHED TABLE**

`TYPE HASHED TABLE` est une `table organisée par une clé` de la table (instruction `WITH UNIQUE KEY` obligatoire) mais ne contient pas [INDEX](../../12_Instructions_dbtab/06_Index/01_Index.md).

```JS
TYPES: BEGIN OF ty_tab,
         obj1 TYPE dtel1,
         obj2 TYPE dtel2,
         obj3 TYPE dtel3,
         . . .
       END OF ty_tab.

DATA: it_tab_types TYPE HASHED TABLE OF ty_tab
                   WITH UNIQUE KEY obj1.
```

Attention, la déclaration des tables de type `HASHED` et [SORTED](./03_Type_Sorted.md) est erronée et incomplète car il est nécessaire d’inclure la notion de [CLE PRIMAIRE](./06_Primary_Key.md) !
