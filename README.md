# OAKSOME - Benjamin Chenebault

Site web portfolio de Benjamin Chenebault, compositeur de musique à l'image.

## 📁 Structure du projet

```
oaksome-website2/
├── index.html          # Page principale
├── css/
│   └── style.css       # Styles principaux
├── js/
│   └── main.js         # Scripts JavaScript
├── assets/
│   └── img/            # Images
├── archives/           # Anciennes versions
├── Makefile            # Commandes de développement
└── README.md           # Ce fichier
```

## 🚀 Démarrage rapide

### Via Makefile (recommandé)

```bash
make serve      # Démarrer le serveur de développement
make open       # Ouvrir le site dans le navigateur
make test       # Lancer le serveur et ouvrir la page de test vidéo
```

### Via npm

```bash
npm run serve   # Démarrer le serveur de développement
```

### Via Python

```bash
python3 -m http.server 8080
```

## 📋 Commandes Makefile disponibles

| Commande | Description |
|----------|-------------|
| `make serve` | Démarrer le serveur de développement (port 8080) |
| `make open` | Ouvrir le site dans le navigateur par défaut |
| `make test` | Ouvrir la page de test des vidéos |
| `make stop` | Arrêter tous les serveurs sur le port 8080 |
| `make clean` | Nettoyer les fichiers temporaires |
| `make dist` | Optimiser les assets pour la production |
| `make help` | Afficher l'aide |

## 🎬 Portfolio

Le site contient 20 vidéos réparties en 3 catégories :

- **Musique à l'image** (13 vidéos) - Compositions originales pour l'image
- **EP Piano** (5 vidéos) - Impressions pianistiques
- **Electro I** (2 vidéos) - Créations electro world

## 🛠️ Technologies

- HTML5
- CSS3 (avec variables CSS)
- JavaScript (vanilla)
- [YouTube Embed](https://www.youtube-nocookie.com) (version privacy-friendly)

## 📝 Configuration

### Ajuster le port du serveur

Modifiez le `PORT` dans le Makefile :

```makefile
PORT ?= 8080
```

### Modifier les vidéos YouTube

Les vidéos sont définies dans `index.html` dans la section `portfolio-grid`.

## 🌐 Déploiement

Le site est constitué de fichiers statiques et peut être déployé sur :

- **GitHub Pages** : Activer dans les paramètres du dépôt
- **Netlify** : Glisser-déposer le dossier
- **Vercel** : Importer le projet
- **Serveur web classique** : Apache, Nginx, etc.

## 📧 Contact

- **Site web** : [En développement]
- **Instagram** : [@oaksomemusic](https://www.instagram.com/oaksomemusic)
- **Spotify** : [Oaksome](https://open.spotify.com/intl-fr/artist/1ErH1vS2Yfau9sWXFfW6po)
- **SoundCloud** : [Oaksome](https://soundcloud.com/oaksome/)

## 📄 Licence

© 2025 Benjamin Chenebault. Tous droits réservés. SACEM: 644389.
