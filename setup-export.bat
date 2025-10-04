@echo off
echo 🚀 Configurando Export Desktop + Web para projeto Lovable...

REM Verificar se Node.js está instalado
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js não encontrado. Instale Node.js primeiro.
    pause
    exit /b 1
)

echo [SUCCESS] Node.js encontrado

REM Verificar se Rust está instalado
where rustc >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARNING] Rust não encontrado. Instalando...
    curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    call %USERPROFILE%\.cargo\env.bat
    echo [SUCCESS] Rust instalado!
) else (
    echo [SUCCESS] Rust encontrado
)

REM Instalar dependências do npm
echo [INFO] Instalando dependências npm...
npm install
echo [SUCCESS] Dependências npm instaladas!

REM Criar estrutura de diretórios
if not exist "release" mkdir release
if not exist "src-tauri\icons" mkdir src-tauri\icons
if not exist "src-tauri\gen" mkdir src-tauri\gen

echo [SUCCESS] Estrutura de diretórios criada!

echo.
echo 🎉 Configuração concluída com sucesso!
echo.
echo 📋 Próximos passos:
echo 1. Adicione os scripts do arquivo 'tauri-scripts.json' ao seu package.json
echo 2. Para desenvolvimento: npm run tauri:dev
echo 3. Para build web: npm run build:web
echo 4. Para build desktop: npm run build:desktop
echo 5. Para build completo: npm run build:all
echo.
echo 📖 Consulte BUILD-GUIDE.md para documentação completa
echo.
echo 🔧 Scripts disponíveis:
echo    • npm run build:web     - Build web estático
echo    • npm run build:desktop - Build executáveis desktop
echo    • npm run build:all     - Build completo (web + desktop)
echo    • npm run build:win     - Build apenas Windows
echo    • npm run build:mac     - Build apenas macOS
echo    • npm run build:linux   - Build apenas Linux

pause