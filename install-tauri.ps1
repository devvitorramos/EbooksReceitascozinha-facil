# PowerShell Script para configurar o Tauri no Windows

Write-Host "🚀 Configurando Tauri para executável desktop..."

# Verificar e instalar o Rust
if (-Not (Get-Command rustc -ErrorAction SilentlyContinue)) {
    Write-Host "📦 Instalando Rust..."
    Invoke-WebRequest -Uri "https://win.rustup.rs/" -OutFile "rustup-init.exe"
    Start-Process -FilePath "rustup-init.exe" -ArgumentList "-y" -NoNewWindow -Wait
    Remove-Item "rustup-init.exe"
    $env:Path += ";$HOME\.cargo\bin"
    Write-Host "✅ Rust instalado com sucesso!"
}
else {
    Write-Host "✅ Rust já está instalado"
}

# Instalar dependências do Tauri
Write-Host "📦 Instalando dependências do Tauri..."
npm install

Write-Host ""
Write-Host "🎉 Configuração concluída!"
Write-Host ""
Write-Host "📋 Próximos passos:"
Write-Host "1. Adicione os scripts ao package.json (consulte tauri-setup.md)"
Write-Host "2. Execute: npm run tauri:dev (desenvolvimento)"
Write-Host "3. Execute: npm run build:win/mac/linux (produção)"
Write-Host ""
Write-Host "📖 Consulte README-tauri.md para mais informações"