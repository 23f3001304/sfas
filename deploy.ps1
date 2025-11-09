# ========================================
# GitHub Actions Matrix Build - Deployment Script (PowerShell)
# ========================================

Write-Host "`n========================================"
Write-Host "STEP 1: Initialize Git Repository"
Write-Host "========================================`n"
git init

Write-Host "`n========================================"
Write-Host "STEP 2: Add All Files"
Write-Host "========================================`n"
git add .

Write-Host "`n========================================"
Write-Host "STEP 3: Create Initial Commit"
Write-Host "========================================`n"
git commit -m "Initial commit: Matrix build workflow with artifacts"

Write-Host "`n========================================"
Write-Host "STEP 4: Set Main Branch"
Write-Host "========================================`n"
git branch -M main

Write-Host "`n========================================"
Write-Host "STEP 5: Add Remote & Push"
Write-Host "========================================`n"
Write-Host "IMPORTANT: First create the repository on GitHub" -ForegroundColor Yellow
Write-Host ""
Write-Host "Manual steps:" -ForegroundColor Cyan
Write-Host "1. Go to https://github.com/23f2003700"
Write-Host "2. Click '+' then 'New repository'"
Write-Host "3. Repository name: tds-matrix-build"
Write-Host "4. Make it PUBLIC"
Write-Host "5. Do NOT initialize with README"
Write-Host "6. Click 'Create repository'"
Write-Host ""

$response = Read-Host "Have you created the repository on GitHub? (y/n)"

if ($response -eq 'y' -or $response -eq 'Y') {
    Write-Host "`nEnter your GitHub username (default: 23f2003700):"
    $username = Read-Host "Username"
    if ([string]::IsNullOrWhiteSpace($username)) {
        $username = "23f2003700"
    }
    
    Write-Host "`nEnter repository name (default: tds-matrix-build):"
    $repoName = Read-Host "Repository"
    if ([string]::IsNullOrWhiteSpace($repoName)) {
        $repoName = "tds-matrix-build"
    }
    
    $repoUrl = "https://github.com/$username/$repoName.git"
    
    Write-Host "`nAdding remote origin: $repoUrl" -ForegroundColor Green
    git remote add origin $repoUrl
    
    Write-Host "`nPushing to GitHub..." -ForegroundColor Green
    git push -u origin main
    
    Write-Host "`n========================================"
    Write-Host "SUCCESS! Repository deployed!" -ForegroundColor Green
    Write-Host "========================================`n"
    Write-Host "Next steps:"
    Write-Host "1. Visit: https://github.com/$username/$repoName"
    Write-Host "2. Click 'Actions' tab"
    Write-Host "3. Wait for workflow to complete"
    Write-Host "4. Verify 3 artifacts created"
    Write-Host "5. Submit URL: https://github.com/$username/$repoName`n"
} else {
    Write-Host "`nPlease create the repository first, then run this script again." -ForegroundColor Yellow
    Write-Host "Or manually run these commands after creating the repo:"
    Write-Host ""
    Write-Host "git remote add origin https://github.com/23f2003700/tds-matrix-build.git" -ForegroundColor Cyan
    Write-Host "git push -u origin main" -ForegroundColor Cyan
    Write-Host ""
}

Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
