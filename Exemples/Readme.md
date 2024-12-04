# Blink
L'Exemple Blink nous permettra de voir comment appliquer un fonction simple sur STM32 en utilisant IDECube.  
# Voici les étapes :
Crée un nouveau projet et selectionner la carte: 

![image](Images\image.png)

![image](Images\image-1.png)

![image](Images\image-2.png)


Une fenêtre va apparaître : dans cette fenêtre, il y a plusieurs menus et on peut voir le
microcontrôleur avec les différentes GPIO, certaines qui sont initialisées et d'autres non.
Pour paramétrer la carte selon nos besoins, on va mettre toutes les GPIOs dans l'état non
initialisé. Pour cela, on fait (1) Pinout, (2) ClearPinouts.
![alt text](Images\image-3.png)

Maintenant, on va configurer l'horloge. Pour faire cela, dans le menu Pinout & Configuration
> Categories > RCC > High-Speed Clock (HSE)

![alt text](Images\image-4.png)


[NO HSE on NUCLEO 32](https://community.st.com/t5/stm32-mcus-boards-and-hardware/what-is-value-od-hse-on-nucleo-l432kc/td-p/149882)
> There is no HSE crystal mounted on Nucleo-32, and also there's no OSC_OUT pin on the 'L432KC, so you cannot use a crystal for HSE with that chip.

> It still has OSC_IN, so you can use an external oscillator and HSE in Bypass mode. On the Nucleo-32, you would need to connect SB17 which connects the MCO output from the on-board STLink chip ('F103) to PA0 of the target i.e. 'L432KC, and the STLink's MCO output is 8MHz.

JW


Le contrôleur de reset et d’horloge (RCC) permet aussi de gérer les différentes sources de
reset :
 System reset (remise à zéro des registres via NRST pin)
 Power reset,
 Backup domain reset.
 Il est nécessaire d’autoriser les interruptions au niveau du contrôleur d’interruption
NVIC comme indiqué sur la figure suivante, accessible via la fenêtre configuration:
![alt text](Images\image-7.png)

Dans la fenêtre Configuration > RCC > Parameter Setting, on peut ajuster la tension d'alimentation
du microcontrôleur (1,71 < Vdd < 3,6 V). 
![alt text](Images\image-8.png)

Dans le sous onglet NVIC Settings, toujours dans le menu RCC, on peut remarquer que les
interruptions globales ont été prises en compte

![alt text](Images\image-9.png)


On souhaite aussi pouvoir contrôler la LED. Celle-ci est connectée au Port B d’E/S (GPIOB) et
à la broche 3 (PB3). On peut chercher PA5 en utilisant option recherche puis la définir en
tant que GPIO_Output comme suit: 
![alt text](Images\image-10.png)

Génération du code et du projet 
Ctrl + S pour sauvegarder et Generer le code : 
![alt text](Images\image-11.png)
