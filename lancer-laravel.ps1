# lancer-laravel.ps1

# Changer le chemin vers ton projet si besoin
$projectPath ="D:\Nouveau dossier (2)\Nouveau dossier\cours laravel\projet\FARDC_Retirement_App"

Write-Host "➡️  Ouverture du projet Laravel à: $projectPath"
Set-Location $projectPath

# 1. Vider les caches Laravel
Write-Host "🧹 Nettoyage des caches Laravel..."
php artisan optimize:clear

# 2. Installer les dépendances Node si 'node_modules' n'existe pas
if (-not (Test-Path "$projectPath\node_modules")) {
    Write-Host "📦 Installation des dépendances Node (npm install)..."
    npm install
} else {
    Write-Host "✅ Dépendances Node déjà installées."
}

# 3. Lancer Vite dans une nouvelle fenêtre
Write-Host "🚀 Lancement de Vite..."
Start-Process powershell -ArgumentList "npm run dev" -WorkingDirectory $projectPath

# 4. Lancer le serveur Laravel dans une autre fenêtre
Write-Host "🖥️  Lancement du serveur Laravel..."
Start-Process powershell -ArgumentList "php artisan serve" -WorkingDirectory $projectPath

Write-Host "✅ Projet Laravel lancé ! Ouvre http://127.0.0.1:8000/admin"
