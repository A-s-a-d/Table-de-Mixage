# Sous-système : Entrées analogiques et numériques  

Ce sous-système est dédié à la **gestion des signaux d'entrée**, qu’ils soient **analogiques (ex. : micro, instruments)** ou **numériques (ex. : MIDI, USB)**.  
Il assure la **numérisation, le pré-traitement**, et le **transfert des données** vers le cœur logiciel de la Raspberry Pi.  
Ce sous-système est crucial pour garantir une **acquisition précise** et **temps réel** des signaux.

---

## 📄 [Documentation / Dossier Technique](Documentation/)  
Ce dossier contient :
- Les **spécifications fonctionnelles et techniques** de ce sous-système
- Les **schémas blocs**
- Les **justifications des choix de composants**
- Le **compte rendu de tests** et mesures

C’est la référence principale pour comprendre la logique et l’architecture de ce module.

---

## 🔧 [Électronique](Electronique/)  
Ce répertoire regroupe :
- Les **schémas électroniques** (fichiers Altium, PDF, etc.)
  - voir video pour comment convertir fichier Altium en Kicad : https://www.youtube.com/watch?v=ORND7ThJx7o
- Les **typons** et routages PCB (Gerber)
- Les **simulations** (LTSpice)
Il documente toute la partie matérielle et les circuits analogiques/numériques nécessaires à l’interface avec la Raspberry Pi.

---

## 💻 [WorkSpace Linux / Programmes Linux](Linux_WorkSpace/)  
Ce dossier contient :
- Les **programmes de traitement des entrées** développés sous Linux
- Les **scripts d’acquisition**
- La configuration de l’environnement Linux pour le sous-système (drivers, services, dépendances, etc.)
- 
C’est ici que se fait le lien entre le matériel d’acquisition et le **traitement logiciel**.

---

