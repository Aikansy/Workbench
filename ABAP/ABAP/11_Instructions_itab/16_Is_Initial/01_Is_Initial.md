# **IS INITIAL**

Vérifier qu’une [TABLE INTERNE](../../10_Tables_Internes/01_Tables_Internes.md) n’est pas vide.

```JS
IF NOT itab[] IS INITIAL.
...
ENDIF.
```

ou

```JS
IF itab[] IS NOT INITIAL.
...
ENDIF.
```

    Les crochets [ ] après le nom d’une table interne font référence à son contenu et aux nombres de lignes enregistrées.
