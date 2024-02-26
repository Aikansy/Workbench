# **UPDATE DBTAB**

Ce type de requête permet de mettre à jour une ou plusieurs lignes de la [TABLE](../../09_Tables_DB/01_Tables.md) de la [BASE DE DONNEES]() de trois manières différentes, et mettra à jour deux variables système :

- [SY-SUBRC](../../help/02_SY-SYSTEM.md) pour indiquer l'état de l'opération :

  - 0 - la ou les lignes ont été correctement insérées.

  - 4 - une ou plusieurs erreurs se sont produites pendant le traitement.

- [SY-DBCNT](../../help/02_SY-SYSTEM.md) retourne le nombre de ligne insérées

```JS
UPDATE dbtab FROM TABLE itab [ACCEPTING DUPLICATE KEYS].
```

Le système va tout d'abord vérifier que les [CLE PRIMAIRES](../../10_Tables_Internes/06_Primary_Key.md) des enregistrements contenus dans la [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) `itab` n'existent pas dans la [TABLE](../../09_Tables_DB/01_Tables.md) de la [BASE DE DONNEES]() `sbtab`, pour ainsi les insérer et retourner un code retour à 0. Si une des [CLE PRIMAIRES](../../10_Tables_Internes/06_Primary_Key.md) existe déjà, le programme s'arrêtera et retournera un [DUMP](../../07_Dump/01_Dump.md). Aucun enregistrement ne sera alors inséré.

Cependant, l'option, `ACCEPTING DUPLICATE KEYS`, permet de mettre de côté le ou les enregistrement(s) déjà existant(s) et d'insérer ceux qui n'existent pas, en retournant toutefois un code retour à 4.

Dans tous les cas, la variable [SY-DBCNT]() retournera le nombre de lignes insérées dans la [TABLE](../../09_Tables_DB/01_Tables.md) de la [BASE DE DONNEES]().
