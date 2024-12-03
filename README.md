# Table-de-Mixage

Pour notre Table de Mixage nous avons besoins de convertir les signal analogique dans un signal "traitable"/Numérique par nos programmes. Nous avons plusieurs solutions possible pour cette fonctionnalité : 
- ADC Externe contrôlé par notre Raspberry.
- Un microcontrôleur qui a un ADC donc on utilise ça pour traiter les données et les envoyer a notre Raspberry.

Nous avons décidé de choisir un STM32-Nucleo-L432KC qui était deja disponible.
La liste des fonctionnalités a mettre dans le programme :

### 1. Initialisation du système
- [ ] Initialisations des pins importants (SWDIO, SWCLK ...etc) en mode défaut
- [ ] Clock Configuration (RCC, HSE, PLL, etc.).
- [ ] Mise en place d’un gestionnaire d’interruptions (si nécessaire, NVIC & EXTI....).
- [ ] Initialisation du GPIO pour tous les ports utilisés : 
  - LED3 : 
  - 2 * ADC
  - .... 
- [ ] Test initial pour s’assurer que la carte est correctement alimentée et fonctionnelle 
  - par exemple, faire clignoter LED3 sur la carte 
    > Programme blink 
### 2. Configuration de l'ADC (Analog-to-Digital Converter)
- [ ] Choix de la résolution de l'ADC (8, 10, 12 bits).
- [ ] Sélection des canaux d'entrée 
- [ ] Mise en place d'un mode continu ou discontinu selon le besoin.
- [ ] - [ ] Gestion de Timer pour conversion(?)
- [ ] Configuration de la fréquence d’échantillonnage.
- [ ] Gestion des interruptions ou DMA (Direct Memory Access) (avec buffer circulaire(?)) pour un transfert rapide des données ADC.
- [ ] Test des données pour vérifier la conversion analogique-numérique.
    > peut-être avec potentiomètre(?)


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
