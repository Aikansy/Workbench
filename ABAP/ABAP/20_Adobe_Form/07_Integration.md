# **INTEGRATION**

Les 5 étapes de base impliquées sont :

1. Récupération de données dans le programme de rapport.

2. Appelez la fonction `FP_FUNCTION _MODULE_NAME` (pour obtenir le nom du module fonction généré).

3. Appelez la fonction `FP_JOB_OPEN`.

4. `Call Function <nom du module de fonction généré>`.

5. Appelez la fonction `FP_JOB_CLOSE`.

Si vous avez besoin de générer des copies du même formulaire, vous pouvez appeler le [MODULE FONCTION](../13_Fonctions/README.md) en utilisant les boucles `do ('n' times) - enddo`.

Il existe des formulaires de test standard pour la formation fournie par **SAP**. Recherchez `FP*` dans la [TRANSACTION SFP](../22_Transactions/TCODE_SFP.md).

_Demo of Print Program for executing PDF Forms_

```JS
* DECLARATIONS:
  DATA: CUSTOMER        TYPE SCUSTOM,
        BOOKINGS        TYPE TY_BOOKINGS,
        CONNECTIONS     TYPE TY_CONNECTIONS,
        FM_NAME         TYPE RS38L_FNAM,
        FP_DOCPARAMS    TYPE SFPDOCPARAMS,
        FP_OUTPUTPARAMS TYPE SFPOUTPUTPARAMS.

* GETTING THE DATA:
  <data selection>

* PRINT:

* Sets the output parameters and opens the spool job
  CALL FUNCTION 'FP_JOB_OPEN'
    CHANGING
    IE_OUTPUTPARAMS       = FP_OUTPUTPARAMS
    EXCEPTIONS
    CANCEL                = 1
    USAGE_ERROR           = 2
    SYSTEM_ERROR          = 3
    INTERNAL_ERROR        = 4
    OTHERS                = 5.
  IF SY-SUBRC <> 0.
    <error handling>
  ENDIF.

* Get the name of the generated function module
  CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
    EXPORTING
    I_NAME                     = '<form name>'
    IMPORTING
    E_FUNCNAME                 = FM_NAME.
  IF SY-SUBRC <> 0.
    <error handling>
  ENDIF.

* Call the generated function module
  CALL FUNCTION FM_NAME
    EXPORTING
    /1BCDWB/DOCPARAMS        = FP_DOCPARAMS
    CUSTOMER                 = CUSTOMER
    BOOKINGS                 = BOOKINGS
    CONNECTIONS              = CONNECTIONS
*IMPORTING
* /1BCDWB/FORMOUTPUT       =
  EXCEPTIONS
    USAGE_ERROR              = 1
    SYSTEM_ERROR             = 2
    INTERNAL_ERROR           = 3.
  IF SY-SUBRC <> 0.
    <error handling>
  ENDIF.

* Close the spool job
  CALL FUNCTION 'FP_JOB_CLOSE'
* IMPORTING
*   E_RESULT             =
    EXCEPTIONS
      USAGE_ERROR           = 1
      SYSTEM_ERROR          = 2
      INTERNAL_ERROR        = 3
    OTHERS                = 4.
  IF SY-SUBRC <> 0.
    <error handling>
  ENDIF.
```