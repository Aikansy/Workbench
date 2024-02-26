# SAP PROGRAMS

### **PROGRAMME - Y_002_FGI - RECUPERATION DE FACTURE & CALCUL PERFORMANCE**

> Récupération des factures `FI` ayant un poste client sur une société donnée créées depuis une date donnée.
>
> - Récupération des `entêtes`
>
> - Récupération des `postes de facture FI`
>
> - Récupération des `données des pièces de référence`
>
> Les pièces de référence peuvent être de 2 types : facture ou pièce FI.
>
> - Récupération des `factures de référence`
>
> - Récupération des `pièces FI de référence`
>
> - Restitution sous `format ALV` des champs avec couleurs
>
> - Ajouter un champ de saisie d'un fichier en `local` pour sauvegarde de l'ALV
>
> - Ajouter un `bouton de traitement` sur l'ALV
>
> - Quand le bouton `Export` est activé, un fichier `CSV` doit être créé avec les données de l'ALV.
>
> - Calcul de la `performance` d'execution du programme

---

PROGRAM - [Y_002_FGI](./Y_002_FGI.abap)

- INCLUDE - [LCL](./Y_002_FGI_LCL.abap)

- INCLUDE - [TOP](./Y_002_FGI_TOP.abap)

- INCLUDE - [SCR](./Y_002_FGI_SCR.abap)

- INCLUDE - [F01](./Y_002_FGI_F01.abap)
