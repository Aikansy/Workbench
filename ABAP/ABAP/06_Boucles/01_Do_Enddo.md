# **DO ENDDO**

```JS
DO [n TIMES].
  [statement_block]
ENDDO.
```

## `DO... ENDDO`

Une _boucle_ en programmation est un processus permettant de répéter une opération autant de fois que nécessaire. En `ABAP` il en existe trois au total dont la première est le `DO… ENDDO`.

L’option `n TIMES` permet de définir combien de fois la _boucle_ doit être répétée.

```JS
DO 5 TIMES.
  WRITE:/ SY-INDEX.
ENDDO.
```

La [VARIABLE SYSTEME SY-INDEX](../help/02_SY-SYSTEM.md) est un compteur et indique donc combien de fois la _boucle_ a été exécutée. Ainsi le `DO` a été paramétré pour être exécuté cinq fois et à chaque fois, le [SY-INDEX](../help/02_SY-SYSTEM.md) est affiché. Le résultat final sera le suivant :

![](../ressources/06_01_01.png)

Il est très important de toujours définir une sortie à une _boucle_ au risque de créer une `boucle infinie`. Dans cet exemple l’option `n TIMES` a été utilisée, mais il est également possible d’utiliser des instructions comme `EXIT`.

_Ainsi en reprenant l’exemple ci-dessus, mais sans l’utilisation de `n TIMES` :_

```JS
DO.
  IF SY-INDEX > 5.
    EXIT.
  ENDIF.
  WRITE:/ SY-INDEX.
ENDDO.
```

La _boucle_ est appelée mais sans paramètre de sortie défini au préalable, une première condition va vérifier si le [SY-INDEX](../help/02_SY-SYSTEM.md) est strictement supérieure à `5` : si oui alors le programme sortira de la _boucle_ `EXIT`, sinon, il n’entrera pas dans cette condition et affichera la valeur de [SY-INDEX](../help/02_SY-SYSTEM.md) à l’écran.

_À noter qu’il aurait été possible également d’utiliser un `ELSE` sans qu’il n’y ait de changement dans le résultat :_

```JS
DO.
  IF SY-INDEX > 5.
    EXIT.
  ELSE.
    WRITE:/ SY-INDEX.
  ENDIF.
ENDDO.
```
