# Exercice SQL 5

Vous avez le schema suivant:

![](images/5_schema_figure.png)


* Afin de faire les exercices, vous devez executer le script correspondant a l'exercice que vous pouvez trouvez [ici](scripts/)
* A noter, utiliser le nom des tables/colonnes donner dans le schema ci-haut ou le script (ils sont en anglais)

## Cours 7
1. Selectionner le nom de tous les pieces
2. Selectionner tous les donnees des providers
3. Selectionner tous les pieces qui commencent par la lettre 'S'
4. Selectionner tous les pieces dont le nom ne contient pas la lettre 'o'
5. Selectionner les prix et les codes des providers de la pièce ayant le code 2
6. Créer une vue appelée HALView qui contient les codes des pièces proposés par le provider "HAL"  ainsi que leurs prix.
7. Déterminer les codes des providers offrant des pièces ayant des prix dépassant les 40$
8. Déterminer la liste des prix du provider "HAL"
9. Déterminer les noms des providers ayant un code provider formé de 3 lettres 
10. Sélectionner le code des pièces et les code de leurs provider dont le prix la pièce varie entre 10$ et 40$


## Cours 8
1. Selectionner la moyenne de prix pour chaque piece
2. Selectionner le chiffre d'affaire (somme des prix de ses pièces) de chaque provider 
3. Selectionner les pieces dont le code du provider est "HAL"
4. Pour chaque piece, trouver l'offre la plus dispendieuse de cette piece et inclure le nom de la piece, le nom du provider et le prix (a noter que 2 providers peuvent fournir la meme piece au meme prix)
5. Déterminer la liste providers offrant tout les types de pièces  
6. Déterminer les informations des pièces offertes par plus que deux providers
7. Calculer la moyenne des prix des pièces chez le provider "Susan"
8. Déterminer le nom de pièce la plus chère, son prix et le nom de son provider
9. déterminer les information ( nom et prix et nom de provider ) de la pièce la moims chère dont son nom et le nom de son provider commencent par 'S'.

## Cours 9
1. Augmenter tous les prix de 1 cent
2. Diminuer les prix des 'Screw' chez le provider 'Clarke Enterprises' par 10%
3. Insérer une nouvelle pièce 'Wrench'
4. La nouvelle pièce sera vendu exclusivement par le provider "Susan Calvin Corp." pour un prix de 10$
5. Mettre a jour la base de donnee afinque le provider "Susan Calvin Corp." (code "RBT") ne fournisse pas de bolts (code 4)
6. Mettre a jour la base de donnee afin que le provider "Susan Calvin Corp." ne fournisse que la pièce 'Wrench'
7. Le provider "Susan Calvin Corp." est racheté par le provider 'Clarke Enterprises'. Pour se faire vous devez :
    - Fournir  la pièce 'Wrench' par 'Clarke Enterprises'
    - Augmenter son prix par 10% 
    - Supprimer le provider "Susan Calvin Corp."


## Cours 10
1. Écrire un déclencheur TRG_MAJPrix qui empêche une augmentation ou diminution de plus de 20% de la valeur d'une pièce.

2. Ecrire une procedure p_AjustementPrix qui prend un pourcentage et un Code de providers en parametre et ajuste le prix de tout ses Provides (ventes) a partir de ce pourcentage.

3. Écrire une fonction f_f_ValeurPieces  qui calcule et retourne la valeur totale des pieces founis par un provider dont le code est reçu en paramètre.
## Cours 11
1. formuler un déclencheur TRG_PrixChere pour tolérer (via une gestion d'exception) la vente d'une pièce ayant des prix dépannsant les 100$. Çad, vous devez catcher une exception pour accepter l'ajoute de cette instance à la table Provides.
2. Transformer la fonction f_ValeurPieces en une procédure p_ValeurPieces qui retourne en parametre ValeurMarchande la valeur totale des pieces founis par un provider dont le code est reçu en paramètre. 
3. Écrire une procédure p_InfosProvidesWithCursor permettant d’afficher d'abord le nom d'un provider, dont le code  est passé en paramètre. Cette procédure affichera (à l'aide d'un Curseur) ensuite la liste des pieces (Name et prix) founis par le provider en question.

## Cours 12
1. Etablir la connection entre la JDBC et votre DB. De plus, pour tous les fonctions, vous devez mettre autocommit = False et completer les transactions a la main.
2. Ecrire une fonction qui insert avec une requete statique un nouveau Pieces
3. Ecrire une fonction qui insert avec une requete precompilees (tous les colonnes devraient etre parametrable) un nouveau Providers
4. Ecrire une fonction qui utilise le code du cours 10 de la procedure p_AjustementPrix. Si vous n'avez pas le code de la procedure, vous pouvez aller la chercher sur Gitlab.
5. Ecrire une fonction qui mimique la fonctionalite de la procedure p_AjustementPrix en Java. La fonction ne pourra qu'utiliser les fonctions de LMD (ie: tout refaire le code en Java)
