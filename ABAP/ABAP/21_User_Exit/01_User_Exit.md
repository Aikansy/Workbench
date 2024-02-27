# **USER-EXIT**

## **USER-EXIT**

Astuce : rechercher les exits les plus récents.

### **TYPE PERFORM**

Un `User-Exit` de type `Perform` est un type spécifique de `User-Exit` dans **SAP** qui permet d'exécuter une [ROUTINE](../17_Organisation/01_Organisation_Finale.md) personnalisée pendant l'exécution d'un programme standard **SAP**.

Ce type de `User-Exit` est généralement utilisé pour ajouter une logique de traitement spécifique à un programme standard **SAP**, sans avoir besoin d'accéder au code source de ce programme. Il permet aux développeurs de personnaliser les programmes **SAP** sans les modifier directement.

Le `User-Exit` de type `Perform` est appelé à partir du programme standard **SAP** à un moment donné de l'exécution, en général lorsque certaines conditions sont remplies. Le code exécuté par le `User-Exit` peut être développé par le client lui-même ou par un prestataire de services tiers.

Les `User-Exit` de type `Perform` sont souvent utilisés dans les modules **SAP** tels que les ventes et la distribution, la gestion des stocks ou la gestion de production. Ils sont généralement configurés à l'aide de la [TRANSACTION SMOD]() ou la [TRANSACTION CMOD]() dans **SAP**.

### **TYPE FONCTION OU EXIT DE FONCTION**

Un `User-Exit` de type `Function` est un type spécifique de `User-Exit` dans **SAP** qui permet de remplacer une fonction standard **SAP** par une fonction personnalisée.

Ce type de `User-Exit` est généralement utilisé pour personnaliser les traitements standard **SAP** et pour les adapter aux besoins spécifiques d'une entreprise. Il permet aux développeurs de remplacer une fonction standard **SAP** par une fonction personnalisée qui correspond mieux à leur besoin.

Le `User-Exit` de type `Function` est appelé à partir d'un programme standard **SAP** lorsqu'une fonction standard **SAP** est appelée. Le code de la fonction personnalisée est alors exécuté à la place de la fonction standard **SAP**. Cela permet d'adapter les traitements standard **SAP** aux besoins spécifiques de l'entreprise.

Les `User-Exit` de type `Function` sont souvent utilisés dans les modules **SAP** tels que la finance, la logistique ou la production. Ils sont généralement configurés à l'aide de la transaction SMOD ou CMOD dans **SAP**. Il est important de noter que l'utilisation des `User-Exit` de type `Function` peut avoir des implications en termes de maintenance et de mise à jour du système, car toute modification apportée à une fonction standard **SAP** doit être soigneusement testée avant d'être mise en production.

### **TYPE TABLE**

Un `User-Exit` de type `Table` est un type spécifique de `User-Exit` dans **SAP** qui permet de personnaliser le contenu d'une `Table` **SAP** en ajoutant ou en modifiant des données.

Ce type de `User-Exit` est souvent utilisé pour personnaliser les traitements standard **SAP** et pour les adapter aux besoins spécifiques d'une entreprise. Il permet aux développeurs d'ajouter ou de modifier des données dans une `Table` **SAP**, sans avoir à accéder directement à son code source.

Le `User-Exit` de type `Table` est appelé à partir d'un programme standard **SAP** lorsque certaines conditions sont remplies. Le code exécuté par le `User-Exit` permet d'ajouter ou de modifier des données dans la `Table` **SAP**. Cela permet de personnaliser les traitements standard **SAP** et de les adapter aux besoins spécifiques de l'entreprise.

Les `User-Exit` de type `Table` sont souvent utilisés dans les modules **SAP** tels que la finance, la logistique ou la production. Ils sont généralement configurés à l'aide de la transaction SMOD ou CMOD dans **SAP**.

Il est important de noter que l'utilisation des `User-Exit` de type `Table` peut avoir des implications en termes de maintenance et de mise à jour du système, car toute modification apportée à une `Table` **SAP** doit être soigneusement testée avant d'être mise en production. De plus, les changements apportés à une `Table` **SAP** peuvent affecter d'autres modules **SAP** qui utilisent cette `Table`, il est donc important de prendre en compte ces interdépendances lors de la personnalisation des `Table` **SAP**.

### **TYPE MENU**

Un `User-Exit` de type `Menu` est un type spécifique de `User-Exit` dans **SAP** qui permet de personnaliser les `Menus` **SAP** en ajoutant ou en modifiant des options de `Menu`.

Ce type de `User-Exit` est souvent utilisé pour personnaliser les `Menus` **SAP** et pour les adapter aux besoins spécifiques d'une entreprise. Il permet aux développeurs d'ajouter ou de modifier des options de `Menu` dans les `Menus` **SAP**, sans avoir à accéder directement à son code source.

Le `User-Exit` de type `Menu` est appelé à partir d'un programme standard **SAP** lorsqu'un _utilisateur_ sélectionne une option de `Menu` personnalisée. Le code exécuté par le `User-Exit` permet de fournir des fonctionnalités supplémentaires à l'_utilisateur_, qui ne sont pas disponibles dans le `Menu` standard **SAP**.

Les `User-Exit` de type `Menu` sont souvent utilisés dans les modules **SAP** tels que la finance, la logistique ou la production. Ils sont généralement configurés à l'aide de la [TRANSACTION SMOD]() ou la [TRANSACTION CMOD]() dans **SAP**.

Il est important de noter que l'utilisation des `User-Exit` de type `Menu` peut avoir des implications en termes de maintenance et de mise à jour du système, car toute modification apportée à un `Menu` **SAP** doit être soigneusement testée avant d'être mise en production. De plus, les changements apportés à un `Menu` **SAP** peuvent affecter d'autres modules **SAP** qui utilisent ce `Menu`, il est donc important de prendre en compte ces interdépendances lors de la personnalisation des `Menus` **SAP**.

### **TYPE ECRAN**

Un `User-Exit` de type `écran` est un type spécifique de `User-Exit` dans **SAP** qui permet de personnaliser l'interface _utilisateur_ **SAP** en ajoutant ou en modifiant des champs ou des `écrans`.

Ce type de `User-Exit` est souvent utilisé pour personnaliser l'interface _utilisateur_ **SAP** et pour l'adapter aux besoins spécifiques d'une entreprise. Il permet aux développeurs d'ajouter ou de modifier des champs ou des `écrans` dans l'interface _utilisateur_ **SAP**, sans avoir à accéder directement à son code source.

Le `User-Exit` de type `écran` est appelé à partir d'un programme standard **SAP** lorsqu'un _utilisateur_ accède à une transaction personnalisée ou à une transaction standard **SAP**. Le code exécuté par le `User-Exit` permet de fournir des fonctionnalités supplémentaires à l'_utilisateur_, qui ne sont pas disponibles dans l'interface _utilisateur_ standard **SAP**.

Les `User-Exit` de type `écran` sont souvent utilisés dans les modules **SAP** tels que la finance, la logistique ou la production. Ils sont généralement configurés à l'aide de la [TRANSACTION SMOD]() ou la [TRANSACTION CMOD]() dans **SAP**.

Il est important de noter que l'utilisation des `User-Exit` de type `écran` peut avoir des implications en termes de maintenance et de mise à jour du système, car toute modification apportée à l'interface _utilisateur_ **SAP** doit être soigneusement testée avant d'être mise en production. De plus, les changements apportés à l'interface _utilisateur_ **SAP** peuvent affecter d'autres modules **SAP** qui utilisent cette interface, il est donc important de prendre en compte ces interdépendances lors de la personnalisation de l'interface _utilisateur_ **SAP**.

### **CUSTOMER EXIT**

Un `Customer Exit` est un type de `User-Exit` spécifique à **SAP** qui permet aux développeurs de personnaliser ou d'étendre les fonctionnalités d'un module **SAP** en ajoutant leur propre code spécifique à un point d'entrée prévu à cet effet.

Les `Customer Exit` sont des points d'entrée prévus à cet effet dans le code **SAP**, qui sont spécialement conçus pour permettre aux développeurs de personnaliser ou d'étendre les fonctionnalités d'un module **SAP** en y ajoutant leur propre code.

Les `Customer Exit` sont généralement fournis par **SAP** sous la forme d'un module standard **SAP**, mais ils peuvent également être créés par les développeurs pour répondre aux besoins spécifiques d'une entreprise.

Les `Customer Exit` peuvent être de différents types, tels que les `Customer Exit` de fonction, les `Customer Exit` d'écran, les `Customer Exit` de menu, etc. Ils sont généralement configurés à l'aide de la transaction SMOD ou CMOD dans **SAP**.

L'utilisation de `Customer Exit` peut permettre aux entreprises de personnaliser les fonctionnalités **SAP** afin de répondre à leurs besoins spécifiques, sans avoir à modifier directement le code **SAP** standard. Cela peut également faciliter la mise à jour et la maintenance du système **SAP**, car les modifications apportées à un `Customer Exit` peuvent être maintenues séparément du code **SAP** standard.

Il est important de noter que l'utilisation de `Customer Exit` peut également avoir des implications en termes de maintenance et de mise à jour du système, car toute modification apportée à un `Customer Exit` doit être soigneusement testée avant d'être mise en production, afin de garantir qu'elle ne perturbe pas les fonctionnalités existantes de **SAP**.

### **BADI (Business ADd-Ins) SE18**

La `BAdI` est une interface object.

`BAdI` est l'acronyme de Business Add-In, qui est un mécanisme d'extension de **SAP** permettant de personnaliser et d'étendre les fonctionnalités des applications **SAP** standard sans avoir à modifier directement leur code source.

Un `BAdI` est un point d'entrée spécifique dans le code **SAP** standard, qui est conçu pour permettre aux développeurs d'ajouter leur propre code pour personnaliser ou étendre les fonctionnalités d'une application **SAP**. Les `BAdI` sont des interfaces fournies par **SAP** pour permettre aux développeurs de créer leur propre implémentation de `BAdI` et de l'attacher à l'application **SAP** standard.

Les `BAdI` sont généralement configurés à l'aide de la transaction SE18 dans **SAP**. Ils peuvent être de différents types, tels que les `BAdI` de fonction, les `BAdI` d'écran, les `BAdI` de menu, etc.

L'utilisation de `BAdI` permet aux entreprises de personnaliser les fonctionnalités **SAP** afin de répondre à leurs besoins spécifiques, sans avoir à modifier directement le code **SAP** standard. Cela peut également faciliter la mise à jour et la maintenance du système **SAP**, car les modifications apportées à un `BAdI` peuvent être maintenues séparément du code **SAP** standard.

Il est important de noter que l'utilisation de `BAdI` peut également avoir des implications en termes de maintenance et de mise à jour du système, car toute modification apportée à un `BAdI` doit être soigneusement testée avant d'être mise en production, afin de garantir qu'elle ne perturbe pas les fonctionnalités existantes de **SAP**.

Google : `BAdI` + nom transaction

> CONSIGNES:
> Si la valeur du champs du Numéro de Société n'est pas présent dans la TVARVC (zcom_achat), afficher un message.

[SE18](../22_Transactions/TCODE_SE18.md)

[NOM_BADI]: ME_PROCESS_PO_CUST

_Implémentation de la BADI_

[IMPLEMENTATION] > [CREER] > [NOM_IMPLEMENTATION]: zfgi_po2 > [SVG]

_Implémentation de l'extension_

- NOM: zfgi_po1
- DESIGNATION: Implémentation badi FGI

[process_header]

```JS
  METHOD if_ex_me_process_po_cust~process_header.

    DATA: lt_tvarvc TYPE STANDARD TABLE OF tvarvc,
          lr_bukrs  TYPE RANGE OF bukrs,
          ls_bukrs  LIKE LINE OF lr_bukrs,
          lv_bukrs  TYPE bukrs,
          ls_header TYPE mepoheader.

    SET PARAMETER ID 'BUK' FIELD lv_bukrs.

    SELECT *
      FROM tvarvc
      INTO TABLE lt_tvarvc
      WHERE name = 'zcom_achat'
      AND type = 'S'.

    IF sy-subrc = 0.
      LOOP AT lt_tvarvc ASSIGNING FIELD-SYMBOL(<fs_tvarvc>).
        ls_bukrs-sign = <fs_tvarvc>-sign.
        ls_bukrs-option = <fs_tvarvc>-opti.
        ls_bukrs-low = <fs_tvarvc>-low.
        APPEND ls_bukrs TO lr_bukrs.
      ENDLOOP.
    ENDIF.

    ls_header = im_header->get_data( ).

    IF ls_header-bukrs NOT IN lr_bukrs.
      MESSAGE 'Pouet' TYPE 'I'.
    ENDIF.

  ENDMETHOD.
```

[TRANSACTION SE19]() : donne accès direct à l'implémentation

> CONSIGNES:
> SI client USCU_l10 , Nbr colis ne dois pas despasser 300 pieces

[NOM_BADI]: LE_SHP_DELIVERY_PROC

[Method] : SAVE_AND_PUBLISH_DOCUMENT

_Implémentation de la BADI_

[IMPLEMENTATION] > [CREER] > [NOM_IMPLEMENTATION]: zfgi_DELIVERY_PROC01 > [SVG]

_Implémentation de l'extension_

- NOM: zfgi_dp1
- DESIGNATION: Implémentation badi FGI

```ABAP
  method IF_EX_LE_SHP_DELIVERY_PROC~SAVE_AND_PUBLISH_DOCUMENT.

    READ TABLE ct_xlikp ASSIGNING FIELD-SYMBOL(<fs_likp>) INDEX 1.

    IF <fs_likp>-kunnr = 'USCU_L10' AND <fs_likp>-btgew > 100000.
      MESSAGE 'pouet' TYPE 'I'.
    ENDIF.

  endmethod.
```

### **ENHANCEMENT SPOT**

Un `Enhancement Spot` est un mécanisme d'extension de **SAP** qui permet aux développeurs de personnaliser ou d'étendre les fonctionnalités d'un module **SAP** en ajoutant leur propre code spécifique à un point d'entrée prévu à cet effet.

Un `Enhancement Spot` est une collection de points d'entrée (Enhancement Points) prévus à cet effet dans le code **SAP**, qui sont spécialement conçus pour permettre aux développeurs d'ajouter leur propre code à des endroits spécifiques du code **SAP** standard.

L'utilisation d'un `Enhancement Spot` permet aux développeurs de regrouper plusieurs Enhancement Points liés les uns aux autres, pour faciliter leur utilisation et leur maintenance. Les `Enhancement Spot` sont généralement configurés à l'aide de la transaction CMOD dans **SAP**.

L'utilisation d'`Enhancement Spot` permet aux entreprises de personnaliser les fonctionnalités **SAP** afin de répondre à leurs besoins spécifiques, sans avoir à modifier directement le code **SAP** standard. Cela peut également faciliter la mise à jour et la maintenance du système **SAP**, car les modifications apportées à un `Enhancement Spot` peuvent être maintenues séparément du code **SAP** standard.

Il est important de noter que l'utilisation d'`Enhancement Spot` peut également avoir des implications en termes de maintenance et de mise à jour du système, car toute modification apportée à un `Enhancement Spot` doit être soigneusement testée avant d'être mise en production, afin de garantir qu'elle ne perturbe pas les fonctionnalités existantes de **SAP**.

### **IMPLICIT ENHANCEMENT**

Un `Implicit Enhancement` est un mécanisme d'extension de **SAP** qui permet aux développeurs d'ajouter du code personnalisé directement dans le code **SAP** standard, sans avoir à modifier le code source original.

Les `Implicit Enhancement` sont des points d'entrée prévus à cet effet dans le code **SAP** standard, qui permettent aux développeurs d'ajouter leur propre code à des endroits spécifiques du code **SAP** standard. Les points d'entrée pour les `Implicit Enhancement` sont prévus dans le code **SAP** standard, mais ils sont laissés vides et leur utilisation est réservée aux développeurs qui souhaitent les étendre.

L'utilisation d'un `Implicit Enhancement` permet aux développeurs d'ajouter du code personnalisé directement dans le code **SAP** standard, sans avoir à modifier le code source original. Cela peut être utile dans des situations où il n'existe pas d'autres mécanismes d'extension disponibles, ou lorsque les autres mécanismes sont considérés comme trop complexes ou risqués.

Cependant, il est important de noter que l'utilisation d'`Implicit Enhancement` peut avoir des implications en termes de maintenance et de mise à jour du système **SAP**, car toute modification apportée à un `Implicit Enhancement` doit être soigneusement testée avant d'être mise en production, afin de garantir qu'elle ne perturbe pas les fonctionnalités existantes de **SAP**. De plus, les `Implicit Enhancement` peuvent rendre le code **SAP** plus difficile à comprendre et à maintenir, car ils introduisent du code personnalisé directement dans le code standard.
