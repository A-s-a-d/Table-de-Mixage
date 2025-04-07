# Activer Uart
Le raspberry pi 4B a 6 uarts en total.On peux les voirs en utilisant la command `dtoverlay -a | grep uart` dans le terminal.
Par defaut les uarts ne sont pas activés. on peux voir les uarts qui sont activées avec la commande `ls /dev/ttyA* && ls /dev/ttyS*`. 
Il ya 2 type d'uart sur raspberry pi. PL011 et miniUART. le PL011 est compatible avec 16550 Uart et les fonctionnalités de mini uart sont reduites. 
Sur le pi 4:

| Nom   | Type      |
| ----- | --------- |
| UART0 | PL011     |
| UART1 | mini UART |
| UART2 | PL011     |
| UART3 | PL011     |
| UART4 | PL011     |
| UART5 | PL011     |

Tous les UARTS sont 3.3V, Utiliser avec 5V peux endommager les pins.

Pour pouvoir utiliser tous les uarts il faut desactiver le uart1 comme uart de console et l'utiliser comme uart normal pour cella :
- On utilise la commande `sudo raspi-config`
- Option Interface
- Port serie ou Serial Port
- Dire non au acess de shell sur port serie
- Dire non pour activer le port serie. On va l'activer manuellement apres.
- Valider

Pour activer les uarts il faut modifier le configuration de boot.txt. Pour cela on utilise un editeur de text, ici on utilise nano. avec la commande `sudo nano /boot/firmware/config.txt` on va acceder le fichier.

Toute en bas de fichier nous avons une section `[all]`.
Dans cette section on peux voir si il ya des uarts qui sont acivées. 
pour activer l'uart 1 il faut mettre `enable_uart=1` dans cette section. Pour les autres uarts on utilise 

```
dtoverlay=uart0
dtoverlay=uart2
dtoverlay=uart3
dtoverlay=uart4
dtoverlay=uart5
```

D'apres : https://www.raspberrypi.com/documentation/computers/configuration.html#networking

Pour utiliser le mini UART, vous devez configurer le Raspberry Pi pour utiliser une fréquence d'horloge fixe du cœur du VPU. En effet, l'horloge du mini UART est liée à l'horloge du cœur du VPU, de sorte que lorsque la fréquence de l'horloge du cœur change, le débit en bauds de l'UART change également. Les paramètres enable_uartet core_freqpeuvent être ajoutés pour config.txt modifier le comportement du mini UART.


`disable-bt` désactive le périphérique Bluetooth et fait du premier PL011 (UART0) l'UART principal. Vous devez également désactiver le service système qui initialise le modem, afin qu'il ne se connecte pas à l'UART, en utilisant `sudo systemctl disable hciuart`.

Il faut aussi donner les bonnes permissions aux ports series. Pour cela en terminal nous pouvons utiliser la commande : `ls -l /dev/ttyA* && ls /dev/ttyS*` pour connaitre les permission actuelle.
Pour changer les permissions nous pouvons utiliser la commande `chmod a+rw /dev/ttyAMA0` ou `ttyAMA0` doit etre remplacé par le port pour lequelle on veut changer les permissions.
