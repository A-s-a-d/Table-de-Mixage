# Table-de-Mixage :  Conditionnement de signal

Pour notre Table de Mixage nous avons besoins de (au moins) 2 entrées analogiques.
Cette partie de Projet est sur le conditionnement de ces signaux pour avoir un signal dans la plage de tension de notre entree de ADC [0; 3.3V].

Deux types de signaux sont possibles : 
- Amplifié niveau ligne
- Non Amplifié ( entre niveau micro et niveau ligne)

Dans les deux cas il faudrait amplifier et mettre un offset sur le signal pour être dans la plage de notre ADC de microcontrôleur.



## 1. Test Micro
On fait des mesures de tension sur notre  signale de micro pour avoir une idée de ce qu'on peux avoir en sortie d'un micro.

| $f_{\text{entrée}}$ | $Vpp_{\text{micro}}[mV]$ |
| ------------------- | ------------------------ |
| 100                 | 2.5                      |
| 200                 | 4                        |
| 300                 | 5.5                      |
| 400                 | 8                        |
| 500                 | 9.5                      |
| 1000                | 11                       |
| 2000                | 26                       |
| 3000                | 40                       |
| 4000                | 77                       |
| 5000                | 230                      |
| 6000                | 55                       |
| 7000                | 20                       |
| 8000                | 14.5                     |
| 10000               | 17                       |


![alt text](image-7.png)

[lien vers Excel](https://1drv.ms/x/c/44e5248c228d5751/ETUEaSnJRSJNqgbVf3nIVEgBYADid3KxOARgrQHJ6OK-Tg?e=khQeDF)

# Conversion Analogique Numerique
Nous avons décidé de choisir un STM32-Nucleo-L432KC qui était deja disponible.
La liste des fonctionnalités a mettre dans le programme :

### 1. Initialisation du système
- [x] Initialisations des pins importants (SWDIO, SWCLK ...etc) 
  - [x] RCC In & Out : PC14 & PC15 
  - [X] ADC1_IN5 : PA0
  - [x] ADC1_IN6 : PA1
  - [x] GPIO_OUT : PB3 : LED3  
  - [x] SWDIO & SWCLK > Debug - Serial Wire : PA14 & PA13
  - [x] USART2 Async: PA2; PA3
- [x] Clock Configuration (RCC, HSE, PLL, etc.).
  - [x] Clock config : ![alt text](image-1.png)
- [x] Mise en place d’un gestionnaire d’interruptions (si nécessaire, NVIC & EXTI....).
  - [x] RCC global interrupt
  - [x] TIM1 Update Event

- [x] Test initial pour s’assurer que la carte est correctement alimentée et fonctionnelle 
  - [x] par exemple, faire clignoter LED3 sur la carte 
    > Programme blink 
### 2. Configuration de l'ADC (Analog-to-Digital Converter)
#### 2.1. ADC : 
- [x] ADC : ADC1
- [x] CLK : Async clk / 1
- [x] Résolution de l'ADC :  12 bits
- [x] Canaux d'entrée : IN5 & IN6
- [x] Mode : Scan Conversion Mode
- [x] DMA : DMA Continuous Request
- [x] Overrun behavior : Overrun data overwritten 
- [x] Regular Conversion Enable
- [x] Number of Conversion : 2 : 1 par channel
- [x] External Trigger : TIM1 Trigger out event > on rising edge
- [x] 2 ranks : 1/ channel > Sampling time > 6.5 cycles
#### 2.2 : Timer : 
- [x] Timer 1
- [x] Configuration de la fréquence d’échantillonnage.
  - [x] Frequence : 44 kHz : ~22µs > 45.45 kHz : 
    > f_input = 80MHz

    > $`  T_{\text{output}} = \frac{1}{f_{\text{output}}} \quad \Rightarrow \quad f_{\text{output}} = \frac{1}{22 \times 10^{-6}} \approx 45.45 \, \text{kHz} `$
    
    > `ARR : AutoReload Register` pour **45.45 kHz**:
    
    > $` ARR = \frac{80 \times 10^6}{45.45 \times 10^3} - 1 `$
    
    > $` ARR = 1759 `$
    > ![alt text](image-2.png)
- [x] NVIC setting > TIM1 Update interrupt.

#### 2.3. DMA :

  <a href="url"><img src="image-3.png" align="center" height="50%" width="50%" ></a>
  

#### 2.4. Test pour vérifier la conversion analogique-numérique.
  > peut-être avec potentiomètre. 

  >Test Valid : 

  > Sortie PB3 Toggle a chaque conversion : 22.8 kHz * 2 = 45.6 kHz 
  
  <a href="url"><img src="image-6.png" align="center" height="50%" width="51%" ></a>

  ![alt text](image-4.png)

  <a href="url"><img src="image-5.png" align="center" height="50%" width="51.5%" ></a>
  


### 3. Traitement des données
- [ ] Implémentation des filtres et amplificateurs (au d'autres bloc) pour  conditionnement des signaux et éliminer le bruit des données ADC .
- [ ] Conversion des données brutes en un format interprétable (par exemple, en dB, en V....etc).
- [ ] Prétraitement des données si nécessaire (par exemple, normalisation ou compression).
- [ ] Implémentation d’un système de buffer circulaire(Aussi en DMA) pour le traitement en flux.

### 4. Communication avec la Raspberry Pi
- [ ] Choix du protocole de communication (UART, SPI, I2C).
  - UART
    -  [ ] Configuration du baud rate, bits de données, parité, stop bits.
    -  [ ] Implémentation de la gestion des erreurs de transmission
  - SPI/I2C (pas trop sûr(?)) : 
    - [ ] Configuration du rôle (maître ou esclave).
    - [ ] Gestion des délais et des erreurs.
- [ ] Test des transferts simples pour valider la communication.

### 5. Interface utilisateur et retour d’état
- [ ] Gestion des LEDs ou autre système pour indiquer les états du système (alimentation, conversion, communication).
- [ ] Des boutons et Potentiomètres pour configurer ou changer des paramètres dynamiques (gain, fréquence d'échantillonnage).
    >  circuit de conditionnement du signal (?).
- [ ]  Intégration d'un retour d’information (par exemple, affichage sur un écran ou des signaux sonores).
  
### 6. Sécurité et gestion des erreurs
- [ ] Détection des erreurs de communication avec la Raspberry Pi (timeout, données invalides, autre problème de communication).
- [ ] Gestion des erreurs ADC (par exemple, saturation du signal).
    > Peut intégrée a notre circuit de conditionnement de signal.  
- [ ]  POSSIBILITÉ : watchdog pour redémarrer le système en cas de blocage.

###  7. Optimisation et validation finale

- [ ] ........ UNDER CONSTRUCTION .........
![UNDER_CONSTRUCTION](image.png)

## Tests à réaliser pour validation
Test unitaire de chaque module :
- [ ] ADC.
- [ ] Communication.
- [ ] Traitement des données.

Test système :
- [ ] Simulation d’un signal analogique (avec GBF(?)) pour vérifier la chaîne complète (entrée -> traitement -> sortie).

Test en conditions réelles :
- [ ] Utiliser une source audio/microphone pour valider les performances.