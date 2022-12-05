# Exercice SQL 1

Vous avez le schema suivant:

![](images/1_schema_figure.png)


Afin de faire les exercices, vous devez executer le script correspondant a l'exercice que vous pouvez trouvez [ici](scripts/)

## Cours 7

Ecrire les requetes pour:

1. Selectionner le nom de tous les produits.
2. Selectionner le nom et le prix de tous les produits
3. Selectionner le nom des produits avec un prix plus petit ou egal a 200.
4. Selectionner tous les produits avec un prix entre 60$ et 120$
5. Selectionner tous les produits dont le nom ne contient pas 'DVD'.
6. Selectionner la liste de Manufacturiers en renommant l'attribut nom par nom_Manufacturier.
7. Créer une vue appelée Produits_chers contenant seulement les produits dont le prix dépasse 200$.
8. Selectionner le code et le nom des produits dont le prix est égal à 240$.
9. Sélectionner le nom et le prix des produits dont 'drive' figure dans le nom.
10. Sélectionner le nom et le prix des produits manufacturier 'Creative Labs' (Code manufacturier : 2)


## Cours 8
1. Calculer le cout moyen de tous les produits
2. Calculer le cout moyen de tous les produits du manufacturier de code 2.
3. Calculer le nombre de produits qui a un prix plus grand ou egal a 180$.
4. Selectionner le nom et le prix de tous les produits qui a un prix plus grand ou egal a 180$ et ordonner les par prix (descending)
5. Selectionner tous les donnees des produits en incluant les donnes des manufacturier
6. Selectionner le nom du produit, le prix et le nom du manufacturier pour tous les produits
7. Selectionner la moyenne des prix de tous les produits de chaque manufacturier et montrer cette moyenne avec uniquement le code du manufacturier.
8. Selectionner la moyenne des prix de tous les produits de chaque manufacturier et montrer cette moyenne avec uniquement le nom du manufacturier.
9. Selectionner le nom des manufacturer dont la moyenne de prix de leur produit est superieure ou egale a 150$.
10. Selectionner le nom et le prix du produit le moins cher.
11. Selectionner le nom de chaque manufacturier avec le nom et le prix de leur produit le plus cher.

## Cours 9
1. Ajouter un nouveau produit: Loudspeakers, $70, manufacturer 2.
2. Mettre a jour le nom du produit 8 pour "Laser Printer".
3. Appliquer un rabais de 10% sur tous les produits.
4. Appliquer un rabais de 10% sur tous les produits de 120$ ou plus.
5. Selectionner la liste des produits dont le prix surpasse la moyenne des prix des produits.
6. Ajouter un nouveau manufacturier Ericsson et lui associer le nouveau produit "Network interface card", 80$.
7. Fusionner les deux manufacturiers Sony et Ericsson. Pour se faire vous devez : 
    -   Ajouter le nouveau manufacturier Sony Ericsson 
    -   Rattacher les produits de Sony et Ericsson au nouveau manufacturier
    -   Supprimer les manufacturiers Sony et Ericsson 

## Cours 10
1. Écrire une fonction p_Moyennedesprix qui calcule et retourne la moynne des prix des produits d'un manufacturier dont le code est reçu en paramètre.
2. Écrire une procédure p_AppliquerRabais qui met à jour la colonne Price de la table Products, pour le produit dont le code est passé en paramètre. Le pourcentage du rabais à appliqué est calculé est égal à 10% si le produit coute initiallement <= 100$ sinon 20%.
3. Écrire la fonction f_Produitpluscher qui calcule et retourne le code du produit le plus cher du manufacturier dont le code est reçu en paramètre. 



## Cours 11
1. Écrire une procédure p_MoyManufacturier permettant d’afficher la liste des produits de ce manufacturier et leurs prix, dont le code du manufacturier est passé en paramètre. Cette procédure retourne en parametre la moyenne des prix des produits de ce manufacturier.
2. Ecrire un déclencheur TRG_ProuduitHyperCher qui empêche la création d’un nouveau produit, en déclenechant une exception (RAISE_APPLICATION_ERROR) si le prix du produit à ajouetr dépasse 300$
3. Écrire une procédure p_InfosManufacturierWithCursor permettant d’afficher d'abord le code et le nom du manufacturier, dont le code  est passé en paramètre. Cette procédure affichera (à l'aide d'un Curseur) ensuite la liste des produits de ce manufacturier et leurs prix. 

## Cours 12
1. Etablir la connection entre la JDBC et votre DB. De plus, pour tous les fonctions, vous devez mettre autocommit = False et completer les transactions a la main.
2. Ecrire une fonction qui insert avec une requete statique un nouveau Products
3. Ecrire une fonction qui insert avec une requete precompilees (tous les colonnes devraient etre parametrable) un nouveau Products
4. Ecrire une fonction qui utilise le code du cours 10 de la procedure 4. Si vous n'avez pas le code de la procedure, vous pouvez aller la chercher sur Gitlab.
5. Ecrire une fonction qui mimique la fonctionalite de la procedure 3 en Java. La fonction ne pourra qu'utiliser les fonctions de LMD (ie: tout refaire le code en Java)
