# Exodus Venue Automated Deployment Script
Write-Host "🚀 Starting Deployment Process..." -ForegroundColor Cyan

# 1. Force a clean build to kill any code ghosts
Write-Host "📦 Step 1: Cleaning and Building Flutter Web..." -ForegroundColor Yellow
flutter clean
flutter pub get
flutter build web --base-href "/exodus_venue/"

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Build Failed! Fix errors before deploying." -ForegroundColor Red
    exit
}

# 2. Wipe the old deployment files in root
Write-Host "🧹 Step 2: Clearing old artifacts from root..." -ForegroundColor Yellow
Remove-Item -Recurse -Force assets, canvaskit, icons, index.html, main.dart.js, flutter.js, manifest.json, version.json, flutter_bootstrap.js, flutter_service_worker.js -ErrorAction SilentlyContinue

# 3. Copy fresh files from build/web to root
Write-Host "🚚 Step 3: Syncing fresh build..." -ForegroundColor Yellow
Copy-Item -Path "build/web/*" -Destination "." -Recurse -Force

# 4. Git Upload
Write-Host "📤 Step 4: Pushing to GitHub..." -ForegroundColor Yellow
git add .
$version = Select-String -Path "lib/main.dart" -Pattern "Version \d+\.\d+\.\d+\+\d+" | Select-Object -First 1
$msg = "Auto-Release: " + ($version -replace ".*Version ","").Trim()
git commit -m "$msg"
git push origin main

Write-Host "✅ SUCCESS!" -ForegroundColor Green
Write-Host "The code is now on GitHub. Wait 2 minutes for the site to update."
Write-Host "Remember to use an InPrivate tab or clear cache on your phone to see it!"
