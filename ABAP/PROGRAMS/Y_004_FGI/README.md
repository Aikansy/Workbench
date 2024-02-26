# SAP PROGRAMS

### **PROGRAMME - Y_004_FGI - AFFICHER UNE PIECE JOINTE D'UNE COMMANDE D'ACHAT**

> En `ME23N` il est possible d'afficher les commande d'achat (Table `EKKO`/`EKPO` via `EBELN` etc) -> bouton `Autre commande`.
>
> Dans la partie service objet (bouton jaune tout en haut a gauche de la fiche de commande d'achat), il est possible de voir et enregistrer des pièces jointes liés à une commande d'achat spécifique.
>
> - Dans cet exercice on souhaite à partir d'une saisie d'un ou plusieurs numéro de document d'achat (`EKKO-EBELN`)
> - Afficher la liste des pièces jointes dans un `ALV`
>
> - Pouvoir sélectioner une en double clickant pour l'afficher/la télécharger.

---

PROGRAM - [Y_004_FGI](./Y_004_FGI.abap)

- INCLUDE - [TOP](./Y_004_FGI_TOP.abap)

- INCLUDE - [SCR](./Y_004_FGI_SCR.abap)

- INCLUDE - [F01](./Y_004_FGI_F01.abap)
