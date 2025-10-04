# Script para instalar o Git Bash no Windows

Write-Host "🚀 Iniciando a instalação do Git Bash..."

# URL do instalador do Git para Windows
$gitInstallerUrl = "https://github.com/git-for-windows/git/releases/latest/download/Git-2.42.0-64-bit.exe"
$installerPath = "$env:TEMP\GitInstaller.exe"

# Baixar o instalador
Write-Host "📥 Baixando o instalador do Git Bash..."
Invoke-WebRequest -Uri $gitInstallerUrl -OutFile $installerPath

# Executar o instalador
Write-Host "⚙️ Executando o instalador..."
Start-Process -FilePath $installerPath -ArgumentList "/VERYSILENT" -NoNewWindow -Wait

# Remover o instalador
Write-Host "🧹 Limpando arquivos temporários..."
Remove-Item $installerPath

Write-Host "✅ Git Bash instalado com sucesso!"
Write-Host "Para verificar, execute: git --version"