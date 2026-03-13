# Makefile pour OAKSOME - Site web portfolio
# Usage: make [target]

# Configuration
PORT ?= 8080
HOST ?= localhost
BROWSER ?= xdg-open

# Détection du support des couleurs
ifdef NO_COLOR
    COLOR_RESET :=
    COLOR_BOLD :=
    COLOR_GREEN :=
    COLOR_BLUE :=
    COLOR_YELLOW :=
else
    COLOR_RESET := $(shell tput sgr0 2>/dev/null || echo "")
    COLOR_BOLD := $(shell tput bold 2>/dev/null || echo "")
    COLOR_GREEN := $(shell tput setaf 2 2>/dev/null || echo "")
    COLOR_BLUE := $(shell tput setaf 4 2>/dev/null || echo "")
    COLOR_YELLOW := $(shell tput setaf 3 2>/dev/null || echo "")
endif

.PHONY: help serve open test stop clean dist install

# Message d'aide par défaut
.DEFAULT_GOAL := help

## help: Affiche cette aide
help:
	@printf "$(COLOR_BOLD)OAKSOME - Commandes disponibles$(COLOR_RESET)\n"
	@printf "\n"
	@printf "$(COLOR_GREEN)Démarrage:$(COLOR_RESET)\n"
	@printf "  make serve    - Démarrer le serveur de développement (port $(PORT))\n"
	@printf "  make open     - Ouvrir le site dans le navigateur\n"
	@printf "  make test     - Ouvrir la page de test des vidéos\n"
	@printf "  make stop     - Arrêter le serveur sur le port $(PORT)\n"
	@printf "\n"
	@printf "$(COLOR_GREEN)Maintenance:$(COLOR_RESET)\n"
	@printf "  make clean    - Nettoyer les fichiers temporaires\n"
	@printf "  make dist     - Optimiser pour la production\n"
	@printf "  make install  - Installer les dépendances\n"
	@printf "\n"
	@printf "$(COLOR_GREEN)Info:$(COLOR_RESET)\n"
	@printf "  make info     - Afficher les informations du projet\n"
	@printf "\n"

## serve: Démarrer le serveur de développement
serve:
	@printf "$(COLOR_BLUE)🚀 Démarrage du serveur sur http://$(HOST):$(PORT)$(COLOR_RESET)\n"
	@printf "$(COLOR_YELLOW)Appuyez sur Ctrl+C pour arrêter$(COLOR_RESET)\n"
	@printf "\n"
	@npx -y serve@latest . -l $(PORT) --no-clipboard 2>/dev/null || \
	 python3 -m http.server $(PORT) --bind $(HOST)

## open: Ouvrir le site dans le navigateur
open:
	@printf "$(COLOR_BLUE)🌐 Ouverture du site dans le navigateur...$(COLOR_RESET)\n"
	@sleep 1 && $(BROWSER) http://$(HOST):$(PORT) 2>/dev/null &

## test: Ouvrir la page de test des vidéos
test:
	@printf "$(COLOR_BLUE)🧪 Ouverture de la page de test...$(COLOR_RESET)\n"
	@sleep 1 && $(BROWSER) http://$(HOST):$(PORT)/test-video.html 2>/dev/null &

## dev: Démarrer le serveur et ouvrir le navigateur
dev: serve open

## stop: Arrêter le serveur sur le port configuré
stop:
	@printf "$(COLOR_YELLOW)🛑 Arrêt du serveur sur le port $(PORT)...$(COLOR_RESET)\n"
	@lsof -ti:$(PORT) 2>/dev/null | xargs kill -9 2>/dev/null || printf "Aucun serveur trouvé sur le port $(PORT)\n"

## clean: Nettoyer les fichiers temporaires
clean:
	@printf "$(COLOR_YELLOW)🧹 Nettoyage des fichiers temporaires...$(COLOR_RESET)\n"
	@rm -rf .cache/ dist/ build/
	@printf "$(COLOR_GREEN)✓ Nettoyage terminé$(COLOR_RESET)\n"

## dist: Créer une version optimisée pour la production
dist:
	@printf "$(COLOR_BLUE)📦 Création de la version de production...$(COLOR_RESET)\n"
	@mkdir -p dist
	@cp -r css js assets index.html LICENSE dist/
	@printf "$(COLOR_GREEN)✓ Version de production créée dans dist/$(COLOR_RESET)\n"

## install: Installer les dépendances
install:
	@printf "$(COLOR_BLUE)📦 Installation des dépendances...$(COLOR_RESET)\n"
	@npm install

## info: Afficher les informations du projet
info:
	@printf "$(COLOR_BOLD)OAKSOME - Site web portfolio$(COLOR_RESET)\n"
	@printf "\n"
	@printf "$(COLOR_GREEN)Auteur:$(COLOR_RESET) Benjamin Chenebault\n"
	@printf "$(COLOR_GREEN)Description:$(COLOR_RESET) Compositeur de musique à l'image\n"
	@printf "$(COLOR_GREEN)Port par défaut:$(COLOR_RESET) $(PORT)\n"
	@printf "\n"
	@printf "$(COLOR_GREEN)Fichiers principaux:$(COLOR_RESET)\n"
	@printf "  - index.html    Page principale\n"
	@printf "  - css/style.css Styles\n"
	@printf "  - js/main.js    Scripts\n"
	@printf "\n"
	@printf "$(COLOR_GREEN)Liens utiles:$(COLOR_RESET)\n"
	@printf "  - Instagram: @oaksomemusic\n"
	@printf "  - Spotify: Oaksome\n"
	@printf "  - SoundCloud: oaksome\n"

## ports: Lister les processus sur le port
ports:
	@printf "$(COLOR_BLUE)Processus sur le port $(PORT):$(COLOR_RESET)\n"
	@lsof -i :$(PORT) || printf "Aucun processus trouvé\n"

## kill-all: Tuer tous les serveurs de développement
kill-all:
	@printf "$(COLOR_YELLOW)🛑 Arrêt de tous les serveurs de développement...$(COLOR_RESET)\n"
	@lsof -ti:8080,3000,4000,5000,8000,9000 2>/dev/null | xargs kill -9 2>/dev/null || true
	@printf "$(COLOR_GREEN)✓ Tous les serveurs ont été arrêtés$(COLOR_RESET)\n"
