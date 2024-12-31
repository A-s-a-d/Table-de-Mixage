## TOC
- [Table-de-Mixage :  Conditionnement de signal](#table-de-mixage---conditionnement-de-signal)
- [I. Introduction](#i-introduction)
- [II. Modules](#ii-modules)
  - [A. Connecteur Entree](#a-connecteur-entree)
  - [B. Synchronisation](#b-synchronisation)
    - [1. Que signifie la synchronisation ?](#1-que-signifie-la-synchronisation)
    - [2. Comment savoir si le retard est exprès ou pas?](#2-comment-savoir-si-le-retard-est-exprès-ou-pas)
    - [3. Alors comment synchroniser les signaux analogiques ou comment les signaux analogiques sont synchronisé généralement?](#3-alors-comment-synchroniser-les-signaux-analogiques-ou-comment-les-signaux-analogiques-sont-synchronisé-généralement)
  - [C. Entrée haute impedance](#c-entrée-haute-impedance)
    - [1. Pourquoi?](#1-pourquoi)
    - [2. Solution circuit suiveur avec AOP :](#2-solution-circuit-suiveur-avec-aop-)
      - [i. Principe du circuit suiveur avec AOP](#i-principe-du-circuit-suiveur-avec-aop)
      - [ii. Caractéristiques d'un suiveur](#ii-caractéristiques-dun-suiveur)
      - [iii. Pourquoi utiliser un suiveur ?](#iii-pourquoi-utiliser-un-suiveur-)
      - [iv . Montage](#iv--montage)
  - [D. Filtre en Entrée](#d-filtre-en-entrée)
  - [E. Module : Detection de Niveau + Adaptation de Niveau](#e-module--detection-de-niveau--adaptation-de-niveau)
  - [F. Indicateur de niveau](#f-indicateur-de-niveau)
  - [G. Selection Voie](#g-selection-voie)
  - [H. Amplification](#h-amplification)
  - [I. Interface utilisateur et retour d’état](#i-interface-utilisateur-et-retour-détat)
  - [J. Sécurité](#j-sécurité)
  - [K. Optimisation et validation finale](#k-optimisation-et-validation-finale)
  - [L. Tests à réaliser pour validation](#l-tests-à-réaliser-pour-validation)

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


![Micro_output](Images/Micro_output.png)
</div>

> [lien vers Excel](https://1drv.ms/x/c/44e5248c228d5751/ETUEaSnJRSJNqgbVf3nIVEgBYADid3KxOARgrQHJ6OK-Tg?e=khQeDF)

Dans les deux cas il faudrait amplifier et mettre un offset sur le signal pour être dans la plage de notre ADC de microcontrôleur.


#  II. Modules 
Pour la conception de notre sous-système, nous adoptons une approche modulaire. Cette méthodologie facilite le développement, la maintenance et l'évolution du système.

Deux approches principales peuvent être utilisées :
- Approche verticale
<div align="center">

![Vertical Design](Images/Vertical_module.png)
</div>

- Approche horizontale
<div align="center">
   <a href="url"><img src="Images/Horizontal_modules.png.png" align="center" height="50%" width="50%" ></a>



</div>

##  A. Connecteur Entree 

Pour l'instant nous avons decides d'utiliser un connecteur jack 3.5mm avec 3 poles.
![Connecteur_Jack_3-5mm](Images/Connecteur_Jack_3-5mm.png)

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


Dans notre cas :
Si l'un des instruments commence en retard ou en avance, la musique risque de ne pas sonner comme prévu. Mais dans le cas des signaux analogiques nous n'avons pas le moyen de savoir si l'utilisateur joue délibérément avec retard ou c'est un facteur externe qui ajoute le retard sur les signaux.


### 2. Comment savoir si le retard est exprès ou pas?
> <br> </br>
>  <div align="center"> 
> ........ InProgress .........
> 
> <a href="url"><img src="Images/InProgress.png" align="center" height="40%" width="40%" > </a> </div>
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
> ........ InProgress .........
> 
> <a href="url"><img src="Images/InProgress.png" align="center" height="40%" width="40%" > </a> </div>
><br></br>
>
> Utilisation d'un signal de référence ou oscilloscope :
>> Nous pouvons utiliser une référence (par exemple, [une piste de clic ](https://moises.ai/fr/blog/astuces/qu-est-ce-qu-une-piste-de-click/ "https://moises.ai/fr/blog/astuces/qu-est-ce-qu-une-piste-de-click/") ou un oscilloscope visuel) pour s'assurer que les signaux sont correctement alignés et ajuster leur synchronisation et leur phase jusqu'à ce que les formes d'onde s'alignent comme prévu.
.
>

Pour ajouter un retard sur nos signaux analogiques (pour les synchroniser) nous pouvons utiliser un filtre passe tout qui ajoute un déphasage sur les signaux.

## C. Entrée haute impedance

Pour nos signaux, il est nécessaire d'utiliser une source ayant une impédance de sortie faible ($entre \ R = 100 \Omega \ et \ R = 600 \Omega$) afin de minimiser les pertes de signal. L'entrée, quant à elle, doit présenter une impédance élevée ($R \gt 10k \Omega$) pour éviter de charger la source et garantir un bon transfert du signal.

### 1. Pourquoi? 
- Adaptation d'impédance (Source - Charge) : 
Impedance de source faible (basse impédance) : Une source avec une faible impédance($entre \ R = 100 \Omega \ et \ R = 600 \Omega$)  est capable de fournir plus de courant sans pertes importantes. Cela permet de compenser les pertes dues à la résistance de la source elle-même, qui pourraient autrement atténuer le signal transmis.
Impedance d'entrée élevée : L'entrée doit avoir une impédance élevée (généralement $R \gt 10k \Omega$) pour minimiser le courant qui va passer dans l'entrée. Si l'impédance d'entrée est trop faible, elle "charge" la source, c'est-à-dire qu'elle tire trop de courant, ce qui peut déformer le signal ou réduire son amplitude.

- Entrée à haute impédance
Minimiser la charge sur la source : Si l'impédance d'entrée est trop basse, elle va "tirer" trop de courant de la source, ce qui peut perturber le signal et le déformer. Par exemple, une faible impédance d'entrée va créer une baisse de tension significative à la sortie de la source, réduisant ainsi la qualité du signal.
Préserver l'intégrité du signal : Une haute impédance d'entrée assure que la quantité de courant demandée par l'entrée est minimale, de sorte que le signal source n'est pas trop perturbé. Cela permet à la source de conserver la qualité du signal sans trop de pertes de puissance.

- Minimisation de la distorsion :
Une adaptation d'impédance incorrecte peut également entraîner une distorsion du signal. Cela se produit car une source avec une impédance trop élevée par rapport à l'entrée pourrait avoir du mal à fournir un signal stable. À l'inverse, une entrée avec une impédance trop faible pourrait « siphonner » trop de courant de la source, ce qui entraînerait une diminution du signal et des déformations.

### 2. Solution circuit suiveur avec AOP : 

#### i. Principe du circuit suiveur avec AOP
- Un suiveur de tension est un montage où la sortie de l'AOP est directement connectée à son entrée inverseuse (−).
- L'entrée non-inverseuse (+) reçoit le signal que l'on souhaite transmettre.
- La tension de sortie est égale à la tension d'entrée, c'est-à-dire $V_{out}=V_{in}$.
 
#### ii. Caractéristiques d'un suiveur
- Impédance d'entrée très élevée :
    - L'entrée de l'AOP (côté non-inverseur) a une impédance extrêmement élevée, souvent de l'ordre de plusieurs mégaohms ($M\Omega$). Cela garantit que le circuit n’exerce pratiquement aucune "charge" sur la source.
    - La source ne subit qu'une très faible demande de courant, ce qui évite d'affaiblir le signal.
  
- Impédance de sortie très faible :
  - L'AOP peut fournir un courant important grâce à ses caractéristiques internes. Son impédance de sortie est très faible (souvent inférieure à  $1\Omega$). Cela garantit que la charge suivante reçoit un signal stable, même si elle a une impédance faible.
- Gain unitaire ($G=1$) :
  - Le suiveur ne modifie pas l'amplitude du signal. La tension en sortie est une copie conforme de la tension en entrée.

#### iii. Pourquoi utiliser un suiveur ?
- Isolation des impédances :
  - Le suiveur permet d'isoler une source à impédance élevée (par exemple un capteur ou un diviseur de tension) d'une charge à impédance faible. Cela évite les pertes de signal.

- Protection de la source :
  - Une source fragile, comme un capteur sensible ou une antenne, n'a pas besoin de fournir beaucoup de courant. Le suiveur agit comme un intermédiaire, protégeant la source tout en transmettant le signal.
  
- Stabilité et fiabilité : 
  - Le suiveur garantit un transfert de signal sans déformation ni chute de tension, même si la charge varie.

#### iv . Montage

## D. Filtre en Entrée


Un filtre en entrée 


........ InProgress .........

![InProgress](Images/InProgress.png)


## E. Module : Detection de Niveau + Adaptation de Niveau


........ InProgress .........

![InProgress](Images/InProgress.png)


## F. Indicateur de niveau


........ InProgress .........

![InProgress](Images/InProgress.png)


## G. Selection Voie


........ InProgress .........

![InProgress](Images/InProgress.png)


## H. Amplification


........ InProgress .........

![InProgress](Images/InProgress.png)


## I. Interface utilisateur et retour d’état
   

........ InProgress .........

![InProgress](Images/InProgress.png)


## J. Sécurité 


........ InProgress .........

![InProgress](Images/InProgress.png)


## K. Optimisation et validation finale



........ InProgress .........

![InProgress](Images/InProgress.png)

## L. Tests à réaliser pour validation


........ InProgress .........

![InProgress](Images/InProgress.png)

