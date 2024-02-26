# **TABLES - ZONES**

![](../ressources/09_06_01.png)

_On y retrouve tout d’abord une nouvelle `barre d’outils` propre à la gestion des champs :_

![](../ressources/09_06_02.png)

- Les fonctions d’édition basique des trois C à savoir `Couper`, `Copier` et `Coller` (la ligne doit être sélectionnée au préalable).

- `Insérer ligne`

- `Supprimer ligne`

- `Développer tout` permet d’ouvrir et de voir tous les champs des [INCLUDES](./02_Tables_Include.md) et des [APPENDS](./03_Tables_Append.md) de la [STRUCTURE](./11_Structures.md) ou de la [TABLE](./01_Tables.md).

- `Décomprimer include` permet d’ouvrir et de voir tous les champs d’un [INCLUDE](./02_Tables_Include.md) ou d’un [APPEND](./03_Tables_Append.md) sélectionné au préalable, de la [STRUCTURE](./11_Structures.md) ou de la [TABLE](./01_Tables.md).

- `Comprimer include` permet de fermer et de masquer tous les champs d’un [INCLUDE](./02_Tables_Include.md) ou d’un [APPEND](./03_Tables_Append.md) sélectionné au préalable, de la [STRUCTURE](./11_Structures.md) ou de la [TABLE](./01_Tables.md).

- `Comprimer tout` permet de fermer et de masquer tous les champs des [INCLUDE](02_Tables_Include.md) et des [APPENDS](./03_Tables_Append.md) de la [STRUCTURE](./11_Structures.md) ou de la [TABLE](./01_Tables.md).

- `Clés externes` fait le lien entre le champ et une [TABLE](./01_Tables.md) de valeurs. En cliquant sur ce bouton, **SAP** va automatiquement importer les informations contenues dans le domaine (cette partie sera un peu plus détaillée dans un exemple à la fin de ce chapitre).

- `Aide à la recherche` permet d’en attribuer un manuellement si celui-ci n’a pas été configuré dans un élément de données.

- `Type prédéfini` laisse au développeur le choix de renseigner directement les types, longueur, décimales, et description d’un champ, au lieu d’utiliser un élément de données.

À la fin de la barre d’outils se trouve un `compteur de champs` défini par le numéro de la ligne lue / nombre de zones au total.

![](../ressources/09_06_03.png)

Sous cette barre d’outils se trouve donc la liste des champs de la [TABLE](./01_Tables.md) définis par :

- Un `nom de champ` (appelé ici `Zone`).

- `Clé` : indiquant si le champ est une clé ou non. Dans une [TABLE](./01_Tables.md) de données, une clé va définir les champs ne devant pas avoir les mêmes valeurs. L’exemple de la [TABLE](./01_Tables.md) `MARA` présente deux champs [CLES](../10_Tables_Internes/06_Primary_Key.md) : le [MANDANT](../03_Programmation/01_Mandant.md) (`MANDT`) et le numéro d’article (`MATNR`). Ainsi, il est impossible de créer deux numéros d’article identiques dans le même [MANDANT](../03_Programmation/01_Mandant.md), **SAP** bloquera automatiquement et retournera un message d’erreur, voire dans certaines situations un [DUMP](../07_Dump/01_Dump.md).

- `Valeurs init.` autorise ou non une valeur nulle pour la zone (coché : valeur nulle interdite, décoché : valeur nulle autorisée).

- `Eléments de données` remplissant automatiquement les champs `Type de données`, `Longueur`, `Décimales`, et `Description synthétique` (sauf si le développeur a choisi de définir la zone manuellement avec l’option `Type prédéfini`).

- `Groupe` est spécifique aux [INCLUDES](./02_Tables_Include.md) et permet de leur attribuer un groupe.

La première zone définit si la [TABLE](./01_Tables.md) est mandant-dépendante (champ `MANDT` absent), ou intermandant (`MANDT` présent).
