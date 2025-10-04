@echo off
echo 🚀 Setup Completo - Export Multiplataforma Lovable
echo ==================================================================
echo.

REM Verificar Node.js
echo [ETAPA] Verificando Node.js...
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js não encontrado. Instale Node.js primeiro.
    pause
    exit /b 1
)
echo [SUCCESS] Node.js encontrado

REM Verificar/Instalar Rust
echo [ETAPA] Verificando/Instalando Rust...
where rustc >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARNING] Rust não encontrado. Instalando...
    curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    call %USERPROFILE%\.cargo\env.bat
    echo [SUCCESS] Rust instalado
) else (
    echo [SUCCESS] Rust encontrado
)

REM Instalar dependências npm
echo [ETAPA] Instalando dependências npm...
npm install
echo [SUCCESS] Dependências npm instaladas!

REM Criar estrutura de diretórios
echo [ETAPA] Criando estrutura de diretórios...
if not exist "release\desktop\windows" mkdir release\desktop\windows
if not exist "release\desktop\macos" mkdir release\desktop\macos
if not exist "release\desktop\linux" mkdir release\desktop\linux
if not exist "release\web" mkdir release\web
if not exist "src-tauri\icons" mkdir src-tauri\icons
if not exist "src-tauri\gen" mkdir src-tauri\gen
echo [SUCCESS] Estrutura de diretórios criada!

REM Verificar scripts no package.json
echo [ETAPA] Verificando configuração do package.json...
findstr "build:desktop:win" package.json >nul
if %errorlevel% equ 0 (
    echo [SUCCESS] Scripts já configurados no package.json
) else (
    echo [WARNING] Scripts NÃO encontrados no package.json
    echo [INFO] Copie os scripts de SCRIPTS-PACKAGE.json para seu package.json
)

echo.
echo 🎉 Setup completo finalizado!
echo ==================================================================
echo.
echo 📋 Próximos passos:
echo.
echo 1. Configure os scripts:
echo    Copie os scripts de SCRIPTS-PACKAGE.json para seu package.json
echo.
echo 2. Desenvolvimento:
echo    npm run tauri:dev
echo.
echo 3. Builds individuais:
echo    npm run build:web                 ^# Web estático
echo    npm run build:desktop:win         ^# Windows
echo    npm run build:desktop:mac         ^# macOS
echo    npm run build:desktop:linux       ^# Linux
echo.
echo 4. Build completo:
echo    npm run build:all                 ^# Todas as versões
echo.
echo 📖 Documentação:
echo    • GUIA-COMPLETO.md - Documentação completa
echo    • SCRIPTS-PACKAGE.json - Scripts para copiar
echo    • /release/ - Builds finais serão gerados aqui
echo.
echo 🔧 Comandos úteis:
echo    • rustc --version          ^# Verificar Rust
echo    • tauri --version          ^# Verificar Tauri CLI
echo    • npm run tauri info       ^# Info do sistema
echo.
echo ✅ Pronto para desenvolver e exportar!

pause