@echo off
REM ========================================
REM GitHub Actions Matrix Build - Deployment Script
REM ========================================

echo.
echo ========================================
echo STEP 1: Initialize Git Repository
echo ========================================
git init
echo.

echo ========================================
echo STEP 2: Add All Files
echo ========================================
git add .
echo.

echo ========================================
echo STEP 3: Create Initial Commit
echo ========================================
git commit -m "Initial commit: Matrix build workflow with artifacts"
echo.

echo ========================================
echo STEP 4: Set Main Branch
echo ========================================
git branch -M main
echo.

echo ========================================
echo STEP 5: Add Remote Repository
echo ========================================
echo.
echo IMPORTANT: Replace the URL below with your actual GitHub repository URL
echo Format: https://github.com/23f2003700/tds-matrix-build.git
echo.
echo Please create the repository on GitHub first, then run:
echo git remote add origin https://github.com/23f2003700/tds-matrix-build.git
echo git push -u origin main
echo.

echo ========================================
echo MANUAL STEPS REQUIRED:
echo ========================================
echo 1. Go to https://github.com/23f2003700
echo 2. Click "+" then "New repository"
echo 3. Name: tds-matrix-build
echo 4. Make it PUBLIC
echo 5. Do NOT initialize with README
echo 6. Click "Create repository"
echo 7. Copy the repository URL
echo 8. Run the commands shown above
echo.

pause
