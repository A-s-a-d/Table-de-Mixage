

# GIT
Comme on va programmer sur raspberry ou l'application github n'est pas disponible, il faut utiliser git pour pouvoir faire des commits sur github. Pour faire ça on va utiliser la méthode d'utilisation de protocole SSH pour se connecter a notre repo et faire un clone de repo github et d'autres actions telles que commit push, pull ...etc.

Donc Voici les étapes a survies : 

## Installation des mis à jours et installation de git : 
dans le terminal linux (CTRL+ALT+T)  executer les lines suivantes: 
```bash
sudo apt update
sudo apt install git
``` 

## generer une clé SSH
```bash
ssh-keygen -t rsa -b 4096 -C "ADD_MAIL@example.com" # remplacer ADD_MAIL@example.com par votre adresse mail personnel
```
 
vous auriez une confirmation de repertiore 
`Enter file in which to save the key (/home/aetherlinx/.ssh/id_rsa):` , laisser la ligne vide et faites entrer.
Dans mon cas (SUR MON PC) `/home/aetherlinx/.ssh/id_rsa` est le chemin vers le fichier  `id_rsa`. il faut bien noter le chemin `/home/aetherlinx/.ssh`.
on va vous demande ensuite d'ajouter un mots de passe on peux laisser ça vide, une 2eme confirmation de mot de passe, encore avec touche entere on laisse ça vide.


Dans l'etape précédente nous avons noté le chemin `/home/aetherlinx/.ssh/` vers notre clé , le fichier  `id_rsa`.
avec la commande suivante on change notre repertoire de travail en allant vers `/home/aetherlinx/.ssh/` :
`cd /home/aetherlinx/.ssh/ `

ici on demarrer le program agent SSH :
` eval "$(ssh-agent -s)" `
 
puis on fournit la clé SSH a notre programme agent : 
` ssh-add ~/.ssh/id_rsa `

dans le meme repertoire on affiche notre clé SSH : 
` cat ~/.ssh/id_rsa.pub `

ON COPIE LA CLE SSH.

On revient vers notre repertoire de travail de base avec : 
` cd `

## Ajouter la clé SSH sur GitHub
Sur votre github aller sur `github>settings> SSH & GPG keys > New SSH Key > Type cle : Authentication > coller la clé SSH copie avant > Valider`



Sur Github aller dans le reop que vous voulez copier et copier le URL SSH de cette repo.
dans mon cas `git@github.com:A-s-a-d/Table-de-Mixage.git`

## Differentes actions git

### clone : On reviens vers notre linux. 
dans le terminal : on fait un clone de repo avec URL SSH: 
` git clone git@github.com:A-s-a-d/Table-de-Mixage.git `

on change de repertoire pour aller vers notre repo github qui est maintenaant disponible en local avec le Nom: 
dans mon ça c'est `Table-de-Mixage`
` cd Table-de-Mixage `


### checkout : changer de Branche et aller vers `nom_de_branche` : 
`git checkout nom_de_branche `

Maintenant on peux travailler dans c'est répertoires, avec un projet que vous pouvez crée directement dans le  répertoire.

### add , preparer les fichiers pour le commit : 
`git add .`

### commit : faire un commit 
`git commit -m "COMMENTAIRE_POUR_COMMIT" `

### push : faire un 'push' vers origin : 
` git push origin Linux_backup `

### branch : verifier la branche actuelle :
`git branch`
