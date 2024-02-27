# **CREATION D'UNE FONCTION**

Dans cette mise en pratique, un `Module fonction` sera créé pas à pas. Il s'agira d'une `fonction RFC` qui créera un nouveau conducteur dans la table de base de données `ZDRIVER_CAR`.

1. Tout d'abord, il faut créer le groupe de fonctions. Pour ce faire, exécutez la [TRANSACTION SE37](../22_Transactions/TCODE_SE37.md).

2. Dans le menu, choisissez l'option suivante :

   `Saut - Gestion groupes de fonctions - Créer groupe`

   ![](../ressources/13_03_01.png)

3. Entrez le nom du `groupe de fonctions` comme par exemple `ZCARPOOLING`.

4. Entrez une désignation comme `Covoiturage`.

   ![](../ressources/13_03_02.png)

5. Dans la nouvelle fenêtre, définissez l'objet en local ou, si vous le souhaitez, utilisez une classe de développement, puis un ordre de transport si besoin.

   Une fois le groupe de fonctions créé comme indiqué dans la barre des messages en bas de l'écran, il faudra créer le module fonction.

   ![](../ressources/13_03_03.png)

6. Dans l'écran initial de la gestion de l'éditeur, renseignez le champ avec le nom de la fonction à créer (par exemple `ZDRIVER_CREATE`) puis appuyez sur le bouton `Créer`.

7. Dans la fenêtre pop-up, entrez le nom du groupe de fonctions créé précédemment, puis désignation.

   ![](../ressources/13_03_04.png)

8. Une fenêtre de warning peut apparaître, validez simplement pour passer à l'étape suivante.

9. Allez dans l'onglet `Propriétés`.

10. Comme il s'agit d'un `module RFC` et donc exécutable à distance, cochez l'option `Module accessible à distance`.

    ![](../ressources/13_03_05.png)

11. Dans l'onglet `Importation`, nous allons avoir besoin d'une structure en entrée avec les informations nécessaires du conducteur et de son véhicule. Pour faciliter, il s'agira d'une structure utilisant la structure `ZDRIVER_CAR` comme référence. AUssi, comme il s'agit d'une `fonction RFC`, l'option `Passage par valeur` est obligatoire.

    ![](../ressources/13_03_06.png)

12. Dans l'onglet `Export`, il y aura seulement le numéro d'identification à retourner (même si le champ est renseigné dans la structure en entrée, il ne sera pas pris en compte, car c'est la `fonction` qui devra en contrôler la numérotation). Le champ aura comme référence l'[ELEMENT DE DONNEES](../08_SE11/07_Elements_de_Donnees.md) défini pour le champ `DRIVER_ID` de la table `ZDRIVER_CAR`. Là encore, comme il s'agit d'une fonction `RFC`, l'option `Passage par valeur` est obligatoire.

    ![](../ressources/13_03_07.png)

13. Enfin, l'onglet `Exceptions` listera les erreurs rencontrées comme : le conducteur existe déjà, les informations concernant le conducteur dont incomplètes, les informations concernant le véhicule sont incomplètes.

    ![](../ressources/13_03_08.png)

14. Puis le programme sera développé selon l'[ALGORITHME](../01_Introduction/03_Algorithme.md) suivant :

    a. Vérifiez si les informations du conducteur sont renseignées sinon renvoyez l'exception `ERROR_INFO_DRIVER` à l'aide de l'instruction `RAISE`.

    ```JS
    IF is_driver-surname    IS INITIAL OR
       is_driver-name       IS INITIAL OR
       is_driver-date_birth IS INITIAL OR
       is_driver-city       IS INITIAL OR
       is_driver-country    IS INITIAL.
      RAISE error_info_driver.
    ENDIF.
    ```

    b. Vérifiez que les informations du véhicule sont renseignées, sinon renvoyez l'exception `ERROR_INFO_CAR`.

    ```JS
    IF is_driver-car_brand IS INITIAL OR
       is_driver-car_model IS INITIAL OR
       is_driver-car_year  IS INITIAL OR
       is_driver-car_color IS INITIAL OR
       is_driver-car_id    IS INITIAL.
      RAISE error_info_car.
    ENDIF.
    ```

    c. Vérifiez que le conducteur (nom et prénom) n'existe pas dans la table `ZDRIVER_CAR` sinon renvoyez l'exception `ERROR_ALREADYEXIST`, ou mettre à jour la structure locale `WA_DRIVER_CAR` déclarée en début de programme.

    ```JS
    DATA: wa_driver_car TYPE zdriver_car.
    ...
    SELECT SINGLE id_driver FROM zdriver_car
      INTO @DATA(v_id_driver)
      WHERE surname = @is_driver-surname
      AND name    = @is_driver-name.

    IF sy-subrc = 0.
      RAISE error_alreadyexist.
    ELSE.
      MOVE-CORRESPONDING is_driver TO wa_driver_car.
    ENDIF.
    ```

    d. Importez le dernier numéro d'identifiant du conducteur dans la variable `V_ID_DRIVER`. Comme il s'agir d'un champ alphanumérique, il va falloir isoler le numéro (quatre positions à partir de la première position), le stocker dans la variable de type numérique `V_NUM`, l'incrémenter de 1 pour le réattribuer à la variable `V_ID_DRIVER` concaténée à la lettre `C` :

    ```JS
    SELECT MAX( id_driver ) FROM zdriver_car
      INTO @v_id_driver.

    v_num       = v_id_driver+1(4) + 1.
    CONCATENATE 'C' v_num INTO v_id_driver.
    CONDENSE v_id_driver NO-GAPS.
    ```

    e. Mettez à jour le champ `ID_DRIVER` de la structure `WA_DRIVER_CAR`, puis utilisez l'instruction `INSERT` pour ajouter l'enregistrement à la table de la base de données `ZDRIVER_CAR`. Si tout s'est bien déroulé (variable système de code retour [SY-SUBRC](../help/02_SY-SYSTEM.md) égal à `0`), le paramètre de sortie `EV_ID_DRIVER` est mis à jour avec l'identifiant trouvé précédemment.

    ```JS
    wa_driver_car-id_driver = v_id_driver.

    INSERT zdriver_car FROM wa_driver_car.
    IF sy-subrc = 0.
      ev_id_driver = v_id_driver.
    ENDIF.
    ```

Il est possible de tester la fonction en cliquant sur le bouton `Exécuter` de la barre d'outils ou via le manu suivant :

`Module fonction - Exécuter - Tests de module`

L'écran de test s'affiche avec une barre d'outils comprenant les fonctionnalités suivantes :

![](../ressources/13_03_09.png)

- `Exécuter` :

  pour lancer le programme.
  `Modules fonction - Exécuter` [F8]

- `Débogage` :

  Exécuter le programme en mode debugger.
  `Modules fonction - Débogage` [Ctrl][F7]

- `Sélectionner` :

  permet, après avoir sélectionné un paramètre d'entrée de la partie principale, d'en voir le contenu.
  `Traiter - Sélectionner` [F2]

- `Répertoire des données de test` :

  liste les cas de test sauvegardés grâce au bouton de sauvegarde de la barre de commande (ou `Traiter - Sauvegarder enregistrement de données` [Ctrl][S])
  `Saut - Répertoire des données de test` [Ctrl][Shift][F6]

Dans la partie principale de l'écran sont listés les paramètres de la `fonction`.

![](../ressources/13_03_10.png)

Pour cet exemple, il n'y aura que `IS_DRIVER`. Il suffira de cliquer sur l'icône `Vue détaillée/Traiter` pour remplir les champs de la [STRUCTURE](../09_Tables_DB/11_Structures.md).

![](../ressources/13_03_11.png)

Une fois les champs renseignés, il faudra revenir en arrière avec le bouton `Retour` de la barre de commande. Puis, avec le boutin `Exécuter, la fonction sera lancée et le résultat affiché avec le paramètre de sortie renseigné, la durée d'éxécution...

![](../ressources/13_03_12.png)
