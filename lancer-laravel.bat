@echo off
setlocal

REM === Modifier ce chemin selon ton projet ===
set PROJECT_PATH=D:\Nouveau dossier (2)\Nouveau dossier\cours laravel\projet\FARDC_Retirement_App

echo ➡️ Dossier projet : %PROJECT_PATH%
cd /d %PROJECT_PATH%

REM 1. Vider les caches Laravel
echo 🧹 Nettoyage des caches...
php artisan optimize:clear

REM 2. Installer les dépendances Node.js si absentes
if not exist "node_modules" (
    echo 📦 Installation des dépendances npm...
    npm install
) else (
    echo ✅ Dépendances Node déjà installées.
)

REM 3. Lancer Vite dans une nouvelle fenêtre
echo 🚀 Démarrage de Vite (npm run dev)...
start cmd /k "cd /d %PROJECT_PATH% && npm run dev"

REM 4. Lancer Laravel dans une nouvelle fenêtre
echo 🖥️ Démarrage du serveur Laravel...
start cmd /k "cd /d %PROJECT_PATH% && php artisan serve"

REM 5. Attendre 2 secondes (laisser le serveur démarrer)
timeout /t 2 >nul

REM 6. Ouvrir le navigateur sur Filament admin
echo 🌐 Ouverture du navigateur sur /admin...
start http://127.0.0.1:8000/admin

echo ✅ Tout est lancé ! Bon dev 😎

endlocal
