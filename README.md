# Table-de-Mixage :  Conditionnement de signal
<!--
  Use this for formatting the image : 
  <a href="url"><img src="image-3.png" align="center" height="50%" width="50%" ></a>
  
   -->

## TOC
- [Table-de-Mixage :  Conditionnement de signal](#table-de-mixage---conditionnement-de-signal)
  - [TOC](#toc)
- [I. Introduction](#i-introduction)
- [II. Modules](#ii-modules)
  - [1. Connecteur Entree](#1-connecteur-entree)
  - [2. Sync](#2-sync)
- [4. Filtre Passe Bande](#4-filtre-passe-bande)
- [5. Module : Detection de Niveau + Adaptation de Niveau](#5-module--detection-de-niveau--adaptation-de-niveau)
- [6. Indicateur de niveau](#6-indicateur-de-niveau)
- [7. Selection Voie](#7-selection-voie)
- [8. Amplification](#8-amplification)
- [9. Interface utilisateur et retour d’état](#9-interface-utilisateur-et-retour-détat)
- [10. Sécurité](#10-sécurité)
- [11. Optimisation et validation finale](#11-optimisation-et-validation-finale)
- [12. Tests à réaliser pour validation](#12-tests-à-réaliser-pour-validation)



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


# II. Modules 


## 1. Connecteur Entree

Pour l'instant nous avons decides d'utiliser un connecteur jack 3.5mm avec 3 poles.
![alt text](Images/Connecteur_Jack_3-5mm.png)

> lien : [Connecteur Jack 3,5 mm Femelle Lumberg, Montage sur CI, 3 Pôles](https://fr.rs-online.com/web/p/connecteurs-jacks/9092238)



## 2. Sync


Pour ajouter un retard sur nos signaux analogiques nous pouvons utiliser un filtre passe tout qui ajoute un déphasage sur notre signal


........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)


# 4. Filtre Passe Bande


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
