# **EVENEMENTS**

Comme son nom l’indique, la classe a listé une liste d’événements qu’il sera possible de capter et de traiter dans un _programme ABAP_.

Pour la `classe CL_GUI_ALV_GRID`, les événements suivants sont listés avec toujours en bleu ceux hérités des _surclasses_ et en noir, ceux spécifiques de la _classe_.

![](../../ressources/14_02_06_01.png)

Ils sont caractérisés par les informations suivantes :

- `Événement` (nom de l’événement)

- `Catégorisation`

  - `Instance Event` (événement d’instance) propre à la _classe_.

  - `Static Event` (événement statique) exécuté à partir d’une méthode statique (cf. prochaine section sur les méthodes).

- `Visibilité` est la même définition que pour les attributs.

- `Description`

Il a été vu que cette _classe_ permet d’afficher des données dans un [RAPPORT ALV](../../16_ALV/README.md). Si, par exemple, les documents comptables sont listés dans un rapport de ce type, et qu’on souhaite double-cliquer dessus afin d’en afficher le détail dans une transaction standard, il sera alors possible d’implémenter l’événement `DOUBLE_CLICK`.

    L’acronyme ALV, signifiant ABAP List Viewer, permet d’afficher des données d’une table ou plusieurs tables de base de données, dans un tableau représenté en lignes et en colonnes.

En sélectionnant l’événement et en cliquant sur le bouton `Paramètres`, il est intéressant de voir que trois paramètres (facultatifs) pourraient être retournés : une `structure de type LVC_S_ROW` contenant le numéro de la ligne lue (`E_ROW`), une `structure de type LVC_S_COL` contenant le numéro de la colonne lue (`E_COLUMN`), ou une autre `structure de type LVC_S_ROID` contenant de nouveau le numéro de la ligne lue (`ES_ROW_NO`), ce qui sera une information essentielle pour la suite du traitement.

![](../../ressources/14_02_06_02.png)
