# **INTERFACES**

La différence entre une _classe_ et une _interface_ est qu’une _classe_ possède une définition et une implémentation (par exemple, elle possède des [METHODES](../03_Méthodes/01_Méthodes.md) avec leurs _paramètres en entrée_, _sortie_... et le code _ABAP_ qui va traiter ces _paramètres_) alors qu’une _interface_ ne possède que la définition (toujours avec le même exemple, elle possède des [METHODES](../03_Méthodes/01_Méthodes.md) avec leurs _paramètres en entrée_, _sortie_... mais sans le _code ABAP_ qui va traiter ces _paramètres_).

L’_interface_ est donc un squelette utilisé par une ou plusieurs _classes_. Aussi, une _classe_ peut utiliser une à plusieurs _interfaces_ notamment lors de l’_héritage_.

La `classe CL_GUI_ALV_GRID` possède trois _interfaces_ : `IF_CACHED_PROP`, `IF_CACHED_PROP` (héritées d’une _surclasse_) et `IF_DRAGDROP`.

![](../../ressources/14_02_03_01.png)
