## TOC
- [Table-de-Mixage :  Conditionnement de signal](#table-de-mixage---conditionnement-de-signal)
- [1. Introduction](#1-introduction)
- [2. Connecteur Entree](#2-connecteur-entree)
- [3. Sync](#3-sync)
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
<!--
  Use this for formatting the image : 
  <a href="url"><img src="image-3.png" align="center" height="50%" width="50%" ></a>
  
   -->


# 1. Introduction
Pour notre Table de Mixage nous avons besoins de (au moins) 2 entrées analogiques.
Cette partie de Projet est sur le conditionnement de ces signaux pour avoir un signal dans la plage de tension de notre entree de ADC [0; 3.3V].

Deux types de signaux sont possibles : 
- Amplifié niveau ligne(ref level (consumer)) [$1.414 Vpk$] ou [$1.736Vpk$] ou [$3.3Vpp$]
<center >

![alt text](Images/LineLevel.png)
</center>

- Non Amplifié ( entre niveau micro et niveau ligne)

Mesures sur  Micro : 
On fait des mesures de tension sur notre  signale de micro pour avoir une idée de ce qu'on peux avoir en sortie d'un micro.

<center>

| $f_{\text{entrée}}[Hz]$ | $Vpp_{\text{micro}}[mV]$ |
| ----------------------- | ------------------------ |
| 100                     | 2.5                      |
| 200                     | 4                        |
| 300                     | 5.5                      |
| 400                     | 8                        |
| 500                     | 9.5                      |
| 1000                    | 11                       |
| 2000                    | 26                       |
| 3000                    | 40                       |
| 4000                    | 77                       |
| 5000                    | 230                      |
| 6000                    | 55                       |
| 7000                    | 20                       |
| 8000                    | 14.5                     |
| 10000                   | 17                       |

![alt text](Images/Micro_output.png)
</center>

> [lien vers Excel](https://1drv.ms/x/c/44e5248c228d5751/ETUEaSnJRSJNqgbVf3nIVEgBYADid3KxOARgrQHJ6OK-Tg?e=khQeDF)

Dans les deux cas il faudrait amplifier et mettre un offset sur le signal pour être dans la plage de notre ADC de microcontrôleur.





# 2. Connecteur Entree
<center>

........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)
</center>


# 3. Sync
<center>

........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)
</center>


# 4. Filtre Passe Bande
<center>

........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)
</center>


# 5. Module : Detection de Niveau + Adaptation de Niveau
<center>

........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)
</center>


# 6. Indicateur de niveau
<center>

........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)
</center>


# 7. Selection Voie
<center>

........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)
</center>


# 8. Amplification
<center>

........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)
</center>


# 9. Interface utilisateur et retour d’état
   <center>

........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)
</center>


# 10. Sécurité 
<center>

........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)
</center>


#  11. Optimisation et validation finale

<center>

........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)
</center>

# 12. Tests à réaliser pour validation
<center>

........ UNDER CONSTRUCTION .........

![UNDER_CONSTRUCTION](Images/UnderConstruction.png)
</center>
