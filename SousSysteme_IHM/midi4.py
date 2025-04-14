import numpy as np
import sounddevice as sd
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from scipy.signal import butter, filtfilt

# Paramètres audio
FREQUENCE_ECHANTILLONNAGE = 44100  # en Hz
TAILLE_TRAME = 1024  # Échantillons par trame
TAILLE_TAMPON = 4 * TAILLE_TRAME  # Taille du tampon audio

# Initialisation des générateurs de signal
echantillon_courant = 0


def generer_midi_bruite(frequence, quantite_bruit=0.2):
    """Génère un segment de signal MIDI bruité"""
    global echantillon_courant
    t = np.linspace(echantillon_courant/FREQUENCE_ECHANTILLONNAGE,
                   (echantillon_courant + TAILLE_TRAME)/FREQUENCE_ECHANTILLONNAGE,
                   TAILLE_TRAME, False)
    echantillon_courant += TAILLE_TRAME
    signal_propre = np.sin(2 * np.pi * frequence * t) * 320
    bruit = np.random.normal(0, quantite_bruit * 320, TAILLE_TRAME)
    return signal_propre + bruit


def generer_onde_carree_parasitee(frequence, probabilite_parasite=0.01):
    """Génère un segment d'onde carrée avec parasites aléatoires"""
    global echantillon_courant
    t = np.linspace(echantillon_courant/FREQUENCE_ECHANTILLONNAGE,
                   (echantillon_courant + TAILLE_TRAME)/FREQUENCE_ECHANTILLONNAGE,
                   TAILLE_TRAME, False)
    echantillon_courant += TAILLE_TRAME
    onde_carree = np.sign(np.sin(2 * np.pi * frequence * t)) * 320

    # Ajout de parasites aléatoires
    echantillons_parasite = int(FREQUENCE_ECHANTILLONNAGE * 0.002)  # Parasites de 2ms
    for i in range(TAILLE_TRAME - echantillons_parasite):
        if np.random.random() < probabilite_parasite:
            onde_carree[i:i + echantillons_parasite] = 320 if np.random.random() > 0.5 else -320
    return onde_carree


def generer_pseudo_onde_carree():
    """Génère un segment d'onde pseudo-carrée"""
    global echantillon_courant
    t = np.linspace(echantillon_courant/FREQUENCE_ECHANTILLONNAGE,
                   (echantillon_courant + TAILLE_TRAME)/FREQUENCE_ECHANTILLONNAGE,
                   TAILLE_TRAME, False)
    echantillon_courant += TAILLE_TRAME
    return np.clip((np.sin(2 * np.pi * 110 * t) * 3) ** 3 * 120, -320, 320)


# Configuration du flux audio
flux_audio = sd.OutputStream(
    samplerate=FREQUENCE_ECHANTILLONNAGE,
    channels=1,
    blocksize=TAILLE_TRAME,
    dtype=np.float32
)
flux_audio.start()


# Fonctions de filtrage
def filtre_butterworth(donnees, frequence_coupure, fech, ordre=4, type_filtre='low'):
    """Applique un filtre Butterworth (passe-bas, passe-haut, etc.)"""
    b, a = butter(ordre, frequence_coupure / (fech / 2), btype=type_filtre)
    return filtfilt(b, a, donnees)


def filtre_passe_bande(donnees, frequence_basse, frequence_haute, fech, ordre=4):
    """Applique un filtre passe-bande"""
    b, a = butter(ordre, [frequence_basse / (fech / 2), frequence_haute / (fech / 2)], btype='band')
    return filtfilt(b, a, donnees)


def filtre_coupe_bande(donnees, frequence_basse, frequence_haute, fech, ordre=4):
    """Applique un filtre coupe-bande"""
    b, a = butter(ordre, [frequence_basse / (fech / 2), frequence_haute / (fech / 2)], btype='bandstop')
    return filtfilt(b, a, donnees)


# Création de la figure et des sous-graphiques
figure = plt.figure(figsize=(12, 10))
grille = figure.add_gridspec(5, 1)
axe_midi1 = figure.add_subplot(grille[0, 0])  # MIDI 1
axe_midi2 = figure.add_subplot(grille[1, 0])  # MIDI 2
axe_num1 = figure.add_subplot(grille[2, 0])   # Numérique 1
axe_num2 = figure.add_subplot(grille[3, 0])   # Numérique 2
axe_combine = figure.add_subplot(grille[4, 0])  # Signal combiné

# Initialisation des courbes
x = np.arange(0, TAILLE_TRAME)
courbe_midi1, = axe_midi1.plot(x, np.zeros(TAILLE_TRAME), label="MIDI bruité 1 (440Hz)", color='green')
courbe_midi2, = axe_midi2.plot(x, np.zeros(TAILLE_TRAME), label="MIDI bruité 2 (523.25Hz)", color='red')
courbe_num1, = axe_num1.plot(x, np.zeros(TAILLE_TRAME), label="Numérique 1 (Carré parasité 220Hz)", color='violet')
courbe_num2, = axe_num2.plot(x, np.zeros(TAILLE_TRAME), label="Numérique 2 (Pseudo-carré 110Hz)", color='orange')
courbe_combine, = axe_combine.plot(x, np.zeros(TAILLE_TRAME), label="Signal combiné", color='black')

# Configuration des graphiques
for axe in [axe_midi1, axe_midi2, axe_num1, axe_num2, axe_combine]:
    axe.set_xlim(0, TAILLE_TRAME)
    axe.set_ylim(-320, 320)
    axe.set_xlabel("Numéro d'échantillon")
    axe.set_ylabel("Amplitude")
    axe.legend(loc="upper right")

axe_combine.set_title("Signal combiné (Moyenne de tous les signaux filtrés)")

# Sélection du filtre
filtre_selectionne = '1'  # Par défaut: signal original


def mettre_a_jour(image):
    """Fonction de mise à jour de l'animation"""
    # Génération des nouveaux segments de signal
    segment_midi1 = generer_midi_bruite(440, 0.15)
    segment_midi2 = generer_midi_bruite(523.25, 0.2)
    segment_num1 = generer_onde_carree_parasitee(220)
    segment_num2 = generer_pseudo_onde_carree()

    # Application du filtre sélectionné
    def appliquer_filtre(signal):
        if filtre_selectionne == '1':
            return signal, "Original"
        elif filtre_selectionne == '2':
            return filtre_butterworth(signal, frequence_coupure=1000, fech=FREQUENCE_ECHANTILLONNAGE, type_filtre='low'), "Passe-bas"
        elif filtre_selectionne == '3':
            return filtre_butterworth(signal, frequence_coupure=500, fech=FREQUENCE_ECHANTILLONNAGE, type_filtre='high'), "Passe-haut"
        elif filtre_selectionne == '4':
            return filtre_passe_bande(signal, frequence_basse=500, frequence_haute=1500, fech=FREQUENCE_ECHANTILLONNAGE), "Passe-bande"
        elif filtre_selectionne == '5':
            return filtre_coupe_bande(signal, frequence_basse=500, frequence_haute=1500, fech=FREQUENCE_ECHANTILLONNAGE), "Coupe-bande"
        elif filtre_selectionne == '6':
            return -signal, "Inversé"
        elif filtre_selectionne == '7':
            return np.roll(signal, 100), "Retardé"

    midi1_filtre, libelle_filtre = appliquer_filtre(segment_midi1)
    midi2_filtre, _ = appliquer_filtre(segment_midi2)
    num1_filtre, _ = appliquer_filtre(segment_num1)
    num2_filtre, _ = appliquer_filtre(segment_num2)

    # Combinaison des signaux et lecture audio
    signal_combine = (midi1_filtre + midi2_filtre + num1_filtre + num2_filtre) / 4

    # Normalisation et lecture audio
    normalise = np.clip(signal_combine / 320, -1.0, 1.0).astype(np.float32)
    flux_audio.write(normalise)

    # Mise à jour des graphiques
    courbe_midi1.set_ydata(midi1_filtre)
    courbe_midi2.set_ydata(midi2_filtre)
    courbe_num1.set_ydata(num1_filtre)
    courbe_num2.set_ydata(num2_filtre)
    courbe_combine.set_ydata(signal_combine)

    # Mise à jour des titres
    axe_midi1.set_title(f"MIDI 1 (440Hz) - {libelle_filtre}")
    axe_midi2.set_title(f"MIDI 2 (523.25Hz) - {libelle_filtre}")
    axe_num1.set_title(f"Numérique 1 (220Hz) - {libelle_filtre}")
    axe_num2.set_title(f"Numérique 2 (110Hz) - {libelle_filtre}")

    return courbe_midi1, courbe_midi2, courbe_num1, courbe_num2, courbe_combine


def gestion_touche(event):
    """Gère les touches pressées pour changer de filtre"""
    global filtre_selectionne
    if event.key in '1234567':
        filtre_selectionne = event.key


figure.canvas.mpl_connect('key_press_event', gestion_touche)

# Animation
anim = animation.FuncAnimation(
    figure, mettre_a_jour,
    blit=False,
    interval=50,
    cache_frame_data=False
)

try:
    plt.tight_layout()
    plt.show()
finally:
    flux_audio.stop()
    flux_audio.close()
    print("Flux audio correctement fermé")