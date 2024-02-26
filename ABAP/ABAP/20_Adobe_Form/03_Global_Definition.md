## **GLOBAL DEFINITION**

1. **DEFINITIONS GLOABLES**

  - **Utilisation**

    Les définitions globales appartiennent à l'interface du générateur de formulaires. Ici, vous avez la possibilité de définir vos propres champs à utiliser n'importe où dans le formulaire. Vous pouvez initialiser données globales avant de commencer à traiter le formulaire, par exemple pour convertir les données d'application sélectionnées.

  - **Caractéristiques**

    - Données gloables

      Ici, vous définissez toutes les données nécessaires au formulaire, mais qui n'ont pas été fournies par l'interface du formulaire (par exemple, pour afficher les totaux).
  
    - Les types

      Ici, vous créez des types de données sous forme de code ABAP libre, si le dictionnaire ABAP ne fournit pas de type.

    - Field Symbols

      Vous pouvez utiliser des [FIELD SYMBOLS]() comme pointeurs lorsque vous extrayez des données de [TABLES INTERNES](../10_Tables_Internes/README.md).

2. **INITIALIZATION**

  - **Utilisation**

    Vous pouvez initialiser les données globales avant de commencer à traiter le formulaire, par exemple pour convertir les données d'application sélectionnées.
 
  - **Conditions préalables**

    Vous avez défini des données globales.

  - **Caractéristiques**

    Vous utilisez l'éditeur ABAP pour écrire le code du programme (initialisation du code) qui est exécuté avant le traitement du formulaire. Vous pouvez inclure des sous-programmes (Form Routines) quand vous faîtes ça.

3. **SPECIFICATION D'UNE REFERENCE DE DEVISE OU DE QUANTITE**

  - **Utilisation**

    Dans le [DICTIONNAIRE ABAP](../08_SE11/README.md), vous pouvez affecter un champ de devise ou de quantité à un champ de table. Dans l'édition de ces champs, le système peut alors insérer la devise appropriée ou unité.

    Si le champ de valeur se trouve dans la même table que le champ de devise ou de quantité correspondant, le système reconnaît automatiquement la référence et formate le champ de valeur selon la devise ou l'unité indiquée dans le champ attribué.

    Si la zone de valeur se trouve dans une table différente de la zone de devise ou de quantité, le système ne peut pas reconnaître automatiquement cette référence.