@echo off
echo 🚀 Configurando Tauri para executável desktop...

REM Verificar se Rust está instalado
where rustc >nul 2>&1
if %errorlevel% neq 0 (
    echo 📦 Instalando Rust...
    curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    call %USERPROFILE%\.cargo\env.bat
    echo ✅ Rust instalado com sucesso!
) else (
    echo ✅ Rust já está instalado
)

REM Instalar dependências do Tauri
echo 📦 Instalando dependências do Tauri...
npm install

echo.
echo 🎉 Configuração concluída!
echo.
echo 📋 Próximos passos:
echo 1. Adicione os scripts ao package.json (consulte tauri-setup.md)
echo 2. Execute: npm run tauri:dev (desenvolvimento)
echo 3. Execute: npm run build:win/mac/linux (produção)
echo.
echo 📖 Consulte README-tauri.md para mais informações

pause