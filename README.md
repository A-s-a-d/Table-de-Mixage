
<!--
Use this for formatting the image : 
  <a href="url"><img src="image-3.png" align="center" height="50%" width="50%" ></a>
  
-->

<!-- 
for centering stuff
   <div align="center">
   </div>
-->

<!-- 
Use this to open / render the html file that's stored on github in browser without deploying it on a site or using github pages .
   <a href="https://raw.githack.com/A-s-a-d/branch/...file.html" title="File_title">FILE_NAME</a>
-->

<!--
Use this to download a file -- use raw instead of blob to download the file
   [Télécharger Liste de Matériel](https://github.com/a-s-a-d/Table-de-Mixage/raw/branch/...file.html)

or HTML 
   
   <a href="https://github.com/a-s-a-d/Table-de-Mixage/raw/branch/...file.html" download>Download Liste de Matériel</a>
-->

<!-- 

Use this for coloring the text :
   <font color="red">This text is red!</font>

-->

<!-- *********** formatting Headings *********** --> 
<!--  
Code	Appearing
$${\color{red}Red}$$	$${\color{red}Red}$$
$${\color{green}Green}$$	$${\color{green}Green}$$
$${\color{lightgreen}Light \space Green}$$	$${\color{lightgreen}Light \space Green}$$
$${\color{blue}Blue}$$	$${\color{blue}Blue}$$
$${\color{lightblue}Light \space Blue}$$	$${\color{lightblue}Light \space Blue}$$
$${\color{black}Black}$$	$${\color{black}Black}$$
$${\color{white}White}$$	$${\color{white}White}$$
--> 

- [x] #739



## TOC
- [Table-de-Mixage :  Conditionnement de signal](#table-de-mixage---conditionnement-de-signal)
- [I. Introduction](#i-introduction)
- [II. Modules](#ii-modules)
  - [A. Connecteur Entree](#a-connecteur-entree)
  - [B. Synchronisation](#b-synchronisation)
    - [1. Que signifie la synchronisation ?](#1-que-signifie-la-synchronisation)
    - [2. Comment savoir si le retard est exprès ou pas?](#2-comment-savoir-si-le-retard-est-exprès-ou-pas)
    - [3. Alors comment synchroniser les signaux analogiques ou comment les signaux analogiques sont synchronisé généralement?](#3-alors-comment-synchroniser-les-signaux-analogiques-ou-comment-les-signaux-analogiques-sont-synchronisé-généralement)
  - [4. Filtre Passe Bande](#4-filtre-passe-bande)
- [5. Module : Detection de Niveau + Adaptation de Niveau](#5-module--detection-de-niveau--adaptation-de-niveau)
- [6. Indicateur de niveau](#6-indicateur-de-niveau)
- [7. Selection Voie](#7-selection-voie)
- [8. Amplification](#8-amplification)
- [9. Interface utilisateur et retour d’état](#9-interface-utilisateur-et-retour-détat)
- [10. Sécurité](#10-sécurité)
- [11. Optimisation et validation finale](#11-optimisation-et-validation-finale)
- [12. Tests à réaliser pour validation](#12-tests-à-réaliser-pour-validation)

# Table-de-Mixage :  Conditionnement de signal 

# I. Introduction 
Pour notre Table de Mixage nous avons besoins de (au moins) 2 entrées analogiques.
Cette partie de Projet est sur le conditionnement de ces signaux pour avoir un signal dans la plage de tension de notre entree de ADC [0; 3.3V].

Deux types de signaux sont possibles : 
- Amplifié niveau ligne(ref level (consumer)) [ $1.414 Vpk$ ] ou [ $1.736Vpk$ ] ou [ $3.3Vpp$ ]


![alt text](Images/LineLevel.png)

- Non Amplifié ( entre niveau micro et niveau ligne)

Mesures sur  Micro : 
On fait des mesures de tension sur notre  signale de micro pour avoir une idée de ce qu'on peux avoir en sortie d'un micro.



<div align="center">


   | $f_{\text{entrée}}[Hz]$ | $Vpp_{\text{micro}}[mV]$ |
   | :---------------------: | :----------------------: |
   |           100           |           2.5            |
   |           200           |            4             |
   |           300           |           5.5            |
   |           400           |            8             |
   |           500           |           9.5            |
   |          1000           |            11            |
   |          2000           |            26            |
   |          3000           |            40            |
   |          4000           |            77            |
   |          5000           |           230            |
   |          6000           |            55            |
   |          7000           |            20            |
   |          8000           |           14.5           |
   |          10000          |            17            |


![alt text](Images/Micro_output.png)
</div>

> [lien vers Excel](https://1drv.ms/x/c/44e5248c228d5751/ETUEaSnJRSJNqgbVf3nIVEgBYADid3KxOARgrQHJ6OK-Tg?e=khQeDF)

Dans les deux cas il faudrait amplifier et mettre un offset sur le signal pour être dans la plage de notre ADC de microcontrôleur.


#  II. Modules 

##  A. Connecteur Entree 

Pour l'instant nous avons decides d'utiliser un connecteur jack 3.5mm avec 3 poles.
![alt text](Images/Connecteur_Jack_3-5mm.png)

> lien : [Connecteur Jack 3,5 mm Femelle Lumberg, Montage sur CI, 3 Pôles](https://fr.rs-online.com/web/p/connecteurs-jacks/9092238)



## B. Synchronisation 
La synchronisation des signaux audio consiste généralement à les **aligner dans le temps** afin qu'ils puissent jouer ensemble de manière harmonieuse sans retards ou décalages involontaires.

### 1. Que signifie la synchronisation ?
Alignement temporel :
- Les signaux doivent démarrer au bon moment les uns par rapport aux autres.
- Par exemple, si un instrument joue un rythme et qu'un autre est censé le rejoindre une seconde plus tard, les signaux doivent refléter ce timing avec précision.

Cohérence de phase :
- Si les signaux font partie de la même performance (par exemple, deux microphones capturant le même instrument ou ensemble), ils ne doivent pas avoir de différences de phase qui pourraient provoquer des interférences (par exemple, écho, annulations).

Cohérence entre les appareils :
- Lors des concerts, plusieurs instruments ou sources sonores sont souvent mixés. Ces signaux sont synchronisés pour garantir qu'ils sont joués en synchronisation avec le tempo et le rythme globaux.

<p class="highlight"> 
Dans notre cas :
Si l'un des instruments commence en retard ou en avance, la musique risque de ne pas sonner comme prévu. Mais dans le cas des signaux analogiques nous n'avons pas le moyen de savoir si l'utilisateur joue délibérément avec retard ou c'est un facteur externe qui ajoute le retard sur les signaux.
</p>

### 2. Comment savoir si le retard est exprès ou pas?
> <br> </br>
>  <div align="center"> 
> ........ UNDER CONSTRUCTION .........
> 
> <a href="url"><img src="Images/UnderConstruction.png" align="center" height="40%" width="40%" > </a> </div>
> <br> </br>
> 

### 3. Alors comment synchroniser les signaux analogiques ou comment les signaux analogiques sont synchronisé généralement?
Calibration:
> On peux faire une calibration au démarrage de tous les instruments pour les synchroniser sur un signal de démarrage (start pulse) et prendre ne compte le retard ou latence sur ces signaux par rapport au signal de démarrage.

le chemin du signal
> Une des moyens c'est d'assurer que les deux signaux mettent le même temps pour se déplacer de leurs sources (instruments) au point de mixage.
> 
> Facteurs à prendre en compte :
> - Longueurs de câble : les câbles longs peuvent introduire de petits retards.
> - Traitement du signal : les effets analogiques tels que les égaliseurs ou les unités de réverbération peuvent ajouter de la latence.
> - Utilisation des chemins de signal identiques ou correctement compensés pour les deux instruments.

Ajuster la phase
> Si les signaux semblent mal alignés, nous pouvons utiliser un déphaseur pour les aligner correctement. Cela garantira que les pics et les creux des formes d'onde s'alignent lorsqu'ils sont mixés.
> 
> 
> <br></br>
> <div align="center"> 
> ........ UNDER CONSTRUCTION .........
> 
> <a href="url"><img src="Images/UnderConstruction.png" align="center" height="40%" width="40%" > </a> </div>
><br></br>
>
> Utilisation d'un signal de référence ou oscilloscope :
>> Nous pouvons utiliser une référence (par exemple, [une piste de clic ](https://moises.ai/fr/blog/astuces/qu-est-ce-qu-une-piste-de-click/ "https://moises.ai/fr/blog/astuces/qu-est-ce-qu-une-piste-de-click/") ou un oscilloscope visuel) pour s'assurer que les signaux sont correctement alignés et ajuster leur synchronisation et leur phase jusqu'à ce que les formes d'onde s'alignent comme prévu.
.
>

<!--Pour ajouter un retard sur nos signaux analogiques (pour les synchroniser) nous pouvons utiliser un filtre passe tout qui ajoute un déphasage sur notre signal
-->




## 4. Filtre Passe Bande


........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)


# 5. Module : Detection de Niveau + Adaptation de Niveau


........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)


# 6. Indicateur de niveau


........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)


# 7. Selection Voie


........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)


# 8. Amplification


........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)


# 9. Interface utilisateur et retour d’état
   

........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)


# 10. Sécurité 


........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)


#  11. Optimisation et validation finale



........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)

# 12. Tests à réaliser pour validation


........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)
