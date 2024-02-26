# **DOMAINES**

Un `domaine` va définir les `caractéristiques techniques de base` d’un [CHAMP](../15_Screen/02_Champs/README.md) contenu dans une [TABLE](../09_Tables_DB/01_Tables.md). Il peut être de plusieurs types dont voici les principaux :

- `CHAR` : chaîne de caractères alphanumériques (et donc contenant aussi bien des chiffres que des lettres), mais toujours considérée comme un texte.

- `CURR` : pour l’anglais Currency, devise d’un montant (euro, dollar...).

- `DATS` : format date.

- `DEC` : décimal pouvant contenir bien sûr une décimale mais aussi un signe (+ ou -), et un séparateur de milliers. Sa longueur maximale est de 31 positions.

- `FLTP` : nombre flottant incluant aussi une décimale, mais dont la longueur maximale ne peut être supérieure à 16 positions.

- `INT1`, `INT2` et `INT4` : utilisés pour les nombres entiers.

- `NUMC` : texte numérique, ou plus précisément un nombre qui sera considéré à la fois comme une valeur numérique et un texte (utile lors d’une concaténation d’un texte et d’un chiffre incrémenté dans une boucle cf. chapitre Instructions basiques ABAP - Opérations sur variable texte).

- `STRING` : chaîne de caractères ayant une longueur importante (utilisé pour une description, par exemple).

      Il existe beaucoup plus de choix mais ils restent peu utilisés.

Afin de comprendre comment se définit un domaine, le domaine `MATNR` (numéro d’article) sera pris comme exemple. Pour cela, la [TRANSACTION `SE11`](01_SE11.md) doit être exécutée, puis dans l’écran initial de la gestion du _dictionnaire ABAP_, l’option `Domaine` doit être cochée, puis dans la zone texte, `MATNR` doit être renseigné.

![](../ressources/08_02_01.png)

## Menu

![](../ressources/08_02_02.png)

- **Deux flèches** (Objet précédent et Objet suivant) afin de naviguer entre les écrans comme une navigation web.

- **Afficher <-> Modifier** : pour passer à la modification en cas d’affichage et inversement.

  [Ctrl][F1]

- **Actif <-> Inactif** permet de naviguer entre la version active et la version inactive (utile pour voir les modifications en cours avant activation finale).

- **Autre Objet** : pour sélectionner un autre domaine sans repasser par l’écran initial de la [TRANSACTION `SE11`]().

  `Domaine - Autre objet...` [Shift][F5]

- **Contrôler**

  `Domaine - Contrôler - Contrôler` [Ctrl][F2]

- **Activation**

  `Domaine - Activer` [Ctrl][F3]

- **Cas d’Emploi**

  `Utilitaires - Cas d’Emploi` [Ctrl][Shift][F3]

- **Afficher Liste d’objets** : affichage de tous les objets ayant une même caractéristique, comme par exemple, tous les objets utilisant la même `classe de développement` (cf. chapitre [03_PROGRAMMATION - HELLO WORLD](../03_Programmation/04_Hello_World.md)).

  `Utilitaires - Afficher liste d’objets` [Ctrl][Shift][F5]

- **Afficher fenêtre de navigation** : ouvre un volet situé en bas de l’écran avec tous les objets modifiés facilitant le passage de l’un à l’autre.

  `Utilitaires - Afficher fenêtre de navigation` [Ctrl][Shift][F4]

- **Activer/Désactiver plein écran** va afficher ou masquer les deux options citées précédemment, si elles ont déjà été activées.

- **Manuel en ligne Saut** : est l’aide **SAP** disponible.

  `Manuel en ligne` [Ctrl][F8]
