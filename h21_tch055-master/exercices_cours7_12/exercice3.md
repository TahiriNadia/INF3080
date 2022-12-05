# Exercice SQL 3

Vous avez le schema suivant:

![](images/3_schema_figure.png)


* Afin de faire les exercices, vous devez executer le script correspondant a l'exercice que vous pouvez trouvez [ici](scripts/)
* A noter, utiliser le nom des tables/colonnes donner dans le schema ci-haut ou le script (ils sont en anglais)

## Cours 7
1. Selectionner tous les warehouses
2. Selectionner tous les boites avec une valeur plus grande que 150$
3. Selectionner tous les boites avec des contenus distincts
4. Selectionner les boites qui sont à 'Chicago' ( Code 3 ou 4)
5. Sélectionner les boites contenat du papier dont le prix varie entre 60$ et 200$
6. Sélectionner les entrepôts avec une capacité inférieure à 5
7. Sélectionner la liste distincte des emplacements des entrepôts
8. Sélectionner les entrepôts dont l'emplacement contient deux mots (par exemple San Francisco). 
9. Créer une vue appelée ChicagoBoxes affichant les informations des boites qui sont à 'Chicago' (Code 3 ou 4)
10. Selectionner les boites ne contenat pas du papier dont le prix dépasse 100$

## Cours 8
1. Selectionner la moyenne de valeur de tous les boites
2. Selectionner le nombre de boite par entrepôt 
3. Selectionner la valeur totale des boites groupés par par entrepôt
4. Selectionner l'entrepot contenant la boite la moins chère 
5. Selectionner l'entrepot contenant la boite du Papier la plus chère
6. Selectionner tous le code des warehouses ainsi que la valeur moyenne des boites dans chacune des warehouses
7. Meme chose que l'exercice precedent mais seulement selectionner les moyennes plus grande que 150$.
8. Selectionner le code de chaque boite avec le nom de la ville ou la boite est localisee.
9. Selectionner les warehouses qui sont satures (soit que leur nombre de boite depasse leur capacite)
10. Selectionner le code de tous les boites qui sont a Chicago

## Cours 9
1. Creer un nouveau warehouse a Montreal avec une capacite de 9 boites 
2. Creer une nouvelle boite avec code "H5RT" et contenant des ciseaux et qui a une valeur de 200$. Cette Boite sera dans la warehouse de San Francisco
3. Tranferer tout les boites du papier à Montreal.
4. Fusionner les entrepôts de Chicago. Pour se faire vous devez :
    - Augmenter la capacité de l'entrepôt de Chicago ayant la plus grande capacité. La nouvelle capacité sera égale à la somme des anciennes capapcités
    - Transférer les boîtes de l'entrepôt à fermer.
    - Supprimer l'entrepôt fermé.   
5. Reduire la valeur de tous les boites du papier de 15%
6. Selectionner les boites ayant une valeur qui dépasse la moyenne des valeurs des boites des ciseaux 
7. Effacer tous les boites sous 100$
8. Effacer tous les boites des warehouses saturees.

## Cours 10

1. Écrire une fonction f_ValeurMarchandise qui calcule et retourne la valeur totale des marchandises d'un entrepôt dont le code est reçu en paramètre. 
2. Écrire une fonction f_BoiteAbordable qui retourne le code de la boite la plus abordable dans les entrepôts. La fonction prend en parametre le contenu cherché.
3. Écrire une procédure p_EntrepotApprovisionnement qui affiche les informations de la boite avec la valeur la moins chere (Code, Contenu) et de l'entrepôt correspondant (Code , Capacité). Cette procédure prend en paramètre le contenu recherché.
4. Écrire une procédure p_TransfertBoite qui permet de transférer une boite de son entrepot A à un entrepot B. La procédure reçoit en parametres, le code de la boite et le code de l'entrepôt B.


## Cours 11
1. Ecrire un déclencheur TRG_PetitWarehouse pour tolérer (via une gestion d'exception) la création d’une nouveau entrepôt avec une capacité inférieure. Çad, vous devez catcher une excpetion pour accepter la création de cet entrepôt.

2. Transformer la fonction f_BoiteAbordable en une procédure p_BoiteAbordable qui retourne en parametre CodeAbordable le code de la boite la plus abordable dans les entrepôts. La procédure prend en parametre le contenu cherché.

3. Écrire une procédure p_InfosEntrepotWithCursor permettant d’afficher d'abord l'adresse et la capacité d'un entrepôt, dont le code  est passé en paramètre. Cette procédure affichera (à l'aide d'un Curseur) ensuite la liste des boites (Code,Contents,Value) se trouvant dans l'entre en question.

## Cours 12
1. Etablir la connection entre la JDBC et votre DB. De plus, pour tous les fonctions, vous devez mettre autocommit = False et completer les transactions a la main.
2. Ecrire une fonction qui insert avec une requete statique un nouveau Warehouses
3. Ecrire une fonction qui insert avec une requete precompilees (tous les colonnes devraient etre parametrable) un nouveau Warehouses
4. Ecrire une fonction qui utilise le code du cours 10 de la procedure p_TransfertBoite . Si vous n'avez pas le code de la procedure, vous pouvez aller la chercher sur Gitlab/la coder.
5. Ecrire une fonction qui mimique la fonctionalite de la procedure p_EntrepotApprovisionnement  en Java. La fonction ne pourra qu'utiliser les fonctions de LMD (ie: tout refaire le code en Java)
