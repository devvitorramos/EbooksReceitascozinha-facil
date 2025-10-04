#!/bin/bash

echo "🚀 Configurando Tauri para executável desktop..."

# Instalar Rust se não estiver instalado
if ! command -v rustc &> /dev/null; then
    echo "📦 Instalando Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
    echo "✅ Rust instalado com sucesso!"
else
    echo "✅ Rust já está instalado"
fi

# Instalar dependências do sistema no Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "🐧 Instalando dependências do Linux..."
    sudo apt update
    sudo apt install -y \
        libwebkit2gtk-4.0-dev \
        build-essential \
        curl \
        wget \
        libssl-dev \
        libgtk-3-dev \
        libayatana-appindicator3-dev \
        librsvg2-dev
    echo "✅ Dependências do Linux instaladas!"
fi

# Instalar dependências do Tauri
echo "📦 Instalando dependências do Tauri..."
npm install

echo ""
echo "🎉 Configuração concluída!"
echo ""
echo "📋 Próximos passos:"
echo "1. Adicione os scripts ao package.json (consulte tauri-setup.md)"
echo "2. Execute: npm run tauri:dev (desenvolvimento)"
echo "3. Execute: npm run build:win/mac/linux (produção)"
echo ""
echo "📖 Consulte README-tauri.md para mais informações"