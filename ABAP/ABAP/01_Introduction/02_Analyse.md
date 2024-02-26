# **ANALYSE**

L'étape suivante consiste à analyser ce _document fonctionnel_ et à se poser les questions suivantes :

- _La demande est-elle techniquement réalisable ?_

- _Toutes les informations (sélections de [DBTAB](../09_Tables_DB/01_Tables.md), entrées et sorties des données...) sont-elles présentes ?_

- _Si indiqués, les liens entre les différentes sélections de tables ([JOIN](../12_Instructions_dbtab/01_Select/19_Join.md)) sont-ils cohérents ?_

Si une réponse est négative, le document doit alors être retourné au _fonctionnel_ qui devra mettre à jour les informations manquantes. Si cependant tout est exploitable, il est alors temps de se pencher sur la solution technique à adopter :

- _Est-il nécessaire d'utiliser une [PROGRAMMATION ORIENTEE OBJET](../14_Classes/01_ABAP_Object/01_ABAP_Object.md) ?_

- _Y a-t-il un objet technique spécifique à créer ([SMARTFORMS](), [DBTAB](../09_Tables_DB/01_Tables.md)...) ?_

- _Combien de traitements spécifiques existe-t-il (exemple : sélection des [DBTAB](../09_Tables_DB/01_Tables.md), calcul...) ?_

Une fois cette étape terminée, il est temps de passer à l'élaboration de l'[ALGORITHME](03_Algorithme.md).
