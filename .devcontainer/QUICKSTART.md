# Démarrage rapide du devcontainer

## Pour VS Code

1. **Installer l'extension Dev Containers**
   - Ouvrez VS Code
   - Allez à Extensions (Ctrl+Shift+X)
   - Cherchez "Dev Containers" par Microsoft
   - Installez-la

2. **Ouvrir le projet dans le container**
   - Ouvrez ce dossier dans VS Code
   - Cliquez sur l'icône verte en bas à gauche (Remote indicator)
   - Ou pressez `Ctrl+Shift+P` et tapez "Dev Containers: Reopen in Container"
   - Attendez que le container se construise et se configure (1-2 minutes)

3. **Utiliser les commandes**
   ```bash
   bun run dev      # Démarre app + UI
   bun run dev:app  # Backend uniquement
   bun run dev:ui   # Frontend uniquement
   ```

## Pour Docker Compose (sans VS Code)

```bash
# Démarrer le container
docker compose -f .devcontainer/docker-compose.yml up -d

# Accéder au container
docker compose -f .devcontainer/docker-compose.yml exec app bash

# Lancer les commandes
bun run dev
```

## Ports disponibles

- **http://localhost:3001** - Application (backend)
- **http://localhost:5173** - Vite dev server (UI frontend)

## Dépannage

**Le container ne démarre pas?**
- Vérifiez que Docker Desktop est en cours d'exécution
- Essayez de supprimer le container: `docker system prune`

**Les outils ne fonctionnent pas?**
- Vérifiez la connexion Internet (Deno/yt-dlp se téléchargent à la première utilisation)
- Les logs de build affichent les avertissements si des dépendances manquent

**Port déjà utilisé?**
- Modifiez les ports dans `docker-compose.yml` ou `.devcontainer/devcontainer.json`
