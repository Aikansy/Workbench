# **EXIT**

```JS
DO 5 TIMES.
  WRITE:/ SY-INDEX.
ENDDO.
```

## `EXIT`

Il est très important de toujours définir une sortie à une _boucle_ au risque de créer une [BOUCLE INFINIE](./09_Boucle_Infinie.md). Dans cet exemple l’option `n TIMES` a été utilisée, mais il est également possible d’utiliser des instructions comme `EXIT`.

_Ainsi en reprenant l’exemple ci-dessus, mais sans l’utilisation de `n TIMES` :_

```JS
DO.
  IF SY-INDEX > 5.
    EXIT.
  ENDIF.
  WRITE:/ SY-INDEX.
ENDDO.
```

La _boucle_ est appelée mais sans paramètre de sortie défini au préalable, une première condition va vérifier si la variable système [SY-INDEX](../help/02_SY-SYSTEM.md) est strictement supérieure à `5` : si oui alors le programme sortira de la _boucle_ (`EXIT`), sinon, il n’entrera pas dans cette condition et affichera la valeur de [SY-INDEX](../help/02_SY-SYSTEM.md) à l’écran.

À noter qu’il aurait été possible également d’utiliser un `ELSE` sans qu’il n’y ait de changement dans le résultat :

```JS
DO.
  IF SY-INDEX > 5.
    EXIT.
  ELSE.
    WRITE:/ SY-INDEX.
  ENDIF.
ENDDO.
```
