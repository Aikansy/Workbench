# SAP PROGRAMS

### **PROGRAMME - Y_007_FGI - MODIFIER UNE DATE DE SO**

> Le but de l’exo est de modifier la delivery date (`ETDAT`), de tous les items d'une `SO` (même objet/bapi que l’exo précédent , tables `VBAK`/`VBAP`)
> `SCR` : Ecran numéro de commande (`VBELN`) , date de delivery (`ETDAT`)
>
> - Exemple : VA03 Pour afficher commande
>
> - SO de test : 17792

---

PROGRAM - [Y_007_FGI](./Y_007_FGI.abap)

- INCLUDE - [TOP](./Y_007_FGI_TOP.abap)

- INCLUDE - [SCR](./Y_007_FGI_SCR.abap)

- INCLUDE - [F01](./Y_007_FGI_F01.abap)
