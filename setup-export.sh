#!/bin/bash

echo "🚀 Configurando Export Desktop + Web para projeto Lovable..."

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para imprimir com cor
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Verificar se Node.js está instalado
if ! command -v node &> /dev/null; then
    print_error "Node.js não encontrado. Instale Node.js primeiro."
    exit 1
fi

print_success "Node.js encontrado: $(node --version)"

# Verificar se Rust está instalado
if ! command -v rustc &> /dev/null; then
    print_warning "Rust não encontrado. Instalando..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
    print_success "Rust instalado!"
else
    print_success "Rust encontrado: $(rustc --version)"
fi

# Instalar dependências do sistema no Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    print_status "Instalando dependências do Linux..."
    
    if command -v apt &> /dev/null; then
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
        print_success "Dependências do Linux instaladas!"
    else
        print_warning "Sistema não é baseado em Debian/Ubuntu. Instale as dependências manualmente."
    fi
fi

# Instalar dependências do npm
print_status "Instalando dependências npm..."
npm install
print_success "Dependências npm instaladas!"

# Tornar scripts executáveis
chmod +x scripts/*.js

# Criar estrutura de diretórios
mkdir -p release
mkdir -p src-tauri/icons
mkdir -p src-tauri/gen

print_success "Estrutura de diretórios criada!"

echo ""
echo "🎉 Configuração concluída com sucesso!"
echo ""
echo "📋 Próximos passos:"
echo "1. Adicione os scripts do arquivo 'tauri-scripts.json' ao seu package.json"
echo "2. Para desenvolvimento: npm run tauri:dev"
echo "3. Para build web: npm run build:web"
echo "4. Para build desktop: npm run build:desktop"  
echo "5. Para build completo: npm run build:all"
echo ""
echo "📖 Consulte BUILD-GUIDE.md para documentação completa"
echo ""
echo "🔧 Scripts disponíveis:"
echo "   • npm run build:web     - Build web estático"
echo "   • npm run build:desktop - Build executáveis desktop"
echo "   • npm run build:all     - Build completo (web + desktop)"
echo "   • npm run build:win     - Build apenas Windows"
echo "   • npm run build:mac     - Build apenas macOS"
echo "   • npm run build:linux   - Build apenas Linux"