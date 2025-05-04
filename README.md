# Cahier des charges  
[📄 lien vers Cahier des charges global (par le chef de projet)](CDC.pdf)  

Le but du projet est de créer une **table de mixage hybride**.  
Le système est divisé en **quatre sous-systèmes principaux**, chacun ayant un rôle spécifique dans la gestion du son, de l’alimentation et de l’interaction avec l’utilisateur.

---

# Sous-système : Entrées analogiques et numériques  
Ce sous-système gère la **réception des signaux audio et numériques** provenant des instruments.  
Il comprend l’interface physique entre les entrées (microphones, synthétiseurs, entrées MIDI) et le **programme de traitement** fonctionnant sur la Raspberry Pi.  
L’objectif est d’assurer une **conversion propre** des signaux vers un format numérique exploitable.

[📁 lien vers Dossier Sous-système Entrées](SousSysteme_Entrees/)  

![Carte mère avec des modules](CarteMere_avec%20des_modules.jpg)

---

# Sous-système : IHM et effets  
Ce sous-système englobe l’**interface homme-machine (IHM)** ainsi que la gestion des **effets sonores** (réverbération, équalisation, filtres, etc.).  
Il permet à l’utilisateur d’interagir en temps réel avec la table de mixage à l’aide de boutons, d’écrans ou de potentiomètres.

[📁 lien vers Dossier Sous-système IHM et effets](SousSysteme_IHM/)

---

# Sous-système : Amplification et restitution  
Ce sous-système s’occupe de **l’amplification** du signal audio traité et de sa **restitution** via des sorties jack ou haut-parleurs.  
Il est chargé de garantir une **qualité sonore fidèle** et adaptée aux usages finaux (monitoring, diffusion, etc.).

[📁 lien vers Dossier Sous-système Amplification et restitution](SousSysteme_Ampli_Restitution/)

---

# Sous-système : Alimentation et CAO 3D  
Ce sous-système prend en charge la **gestion de l’alimentation électrique** de l’ensemble du système, incluant la protection et la distribution.  
Il comprend également la **modélisation 3D** du boîtier via des outils de CAO, pour intégrer tous les composants de manière ergonomique.

[📁 lien vers Dossier Sous-système Alimentation et CAO 3D](SousSysteme_Alim/)

---

# Planification  
[📄 lien vers Dossier de planification du projet](DossierPlanification.pdf)

## Diagramme de Gantt  
[📊 lien vers Gantt (version 2)](Gantt_V2.pdf)
