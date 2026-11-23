# ytzero Development Container

Configuration du devcontainer pour développer ytzero avec VS Code. Tout s'exécute dans un container isolé.

## Démarrage rapide

### 1. Avec VS Code Dev Containers

1. Installez l'extension "Dev Containers" (ms-vscode-remote.remote-containers)
2. Ouvrez le projet dans VS Code
3. Cliquez sur l'icône "Open in Remote Container" en bas à gauche
4. Ou pressez `Ctrl+Shift+P` → "Dev Containers: Reopen in Container"

Le container se construit automatiquement et `post-create.sh` s'exécute pour configurer l'environnement.

### 2. Avec Docker Compose (alternative)

```bash
docker-compose -f .devcontainer/docker-compose.yml up -d
docker-compose -f .devcontainer/docker-compose.yml exec app bash
```

## Contenu du container

- **Node.js Runtime**: Bun (gestionnaire de paquets et runtime)
- **Deno**: Pour les scripts backend si nécessaire
- **yt-dlp**: Outil de téléchargement vidéo
- **FFmpeg**: Traitement vidéo
- **Python 3**: Dépendances système
- **Git**: Contrôle de version avec hooks

## Ports exposés

- **3001**: Serveur d'application (backend)
- **5173**: Serveur de développement UI (frontend - Vite)

## Répertoires de données

Tous les répertoires de données sont montés dans le container:
- `data/db/` - Base de données SQLite
- `data/imgcache/` - Cache images
- `data/downloads/` - Téléchargements
- `data/logs/` - Logs applicatifs
- `data/bin/` - Binaires (yt-dlp, etc.)

## Commandes utiles

```bash
# Démarrer les deux serveurs (app + UI)
bun run dev

# Démarrer seulement le serveur app
bun run dev:app

# Démarrer seulement le dev server UI
bun run dev:ui

# Construire pour production
bun run build

# Lancer les tests
bun run test

# Vérifier les types TypeScript
bun run typecheck

# Installer les hooks Git
bun run hooks:install
```

## Configuration VS Code

Le devcontainer installe automatiquement les extensions:
- TypeScript (ms-vscode.vscode-typescript-next)
- Deno (denoland.vscode-deno)
- Volar (Vue.volar)
- Prettier (esbenp.prettier-vscode)
- ESLint (dbaeumer.vscode-eslint)
- GitLens (eamodio.gitlens)

Et configure Prettier comme formateur par défaut avec auto-format.

## Notes

- Les volumes `node_modules` et `.bun` sont séparés du workspace pour éviter les conflits OS
- Le code source est monté en lecture-écriture pour l'édition directe
- Toutes les variables d'environnement sont préconfigurées
