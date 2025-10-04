#!/bin/bash

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${PURPLE}🚀 Setup Completo - Export Multiplataforma Lovable${NC}"
echo "=================================================================="
echo ""

# Função para imprimir com cor
print_step() {
    echo -e "${BLUE}[ETAPA]${NC} $1"
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

print_info() {
    echo -e "${CYAN}[INFO]${NC} $1"
}

# Verificar Node.js
print_step "Verificando Node.js..."
if ! command -v node &> /dev/null; then
    print_error "Node.js não encontrado. Instale Node.js primeiro."
    exit 1
fi
print_success "Node.js encontrado: $(node --version)"

# Verificar/Instalar Rust
print_step "Verificando/Instalando Rust..."
if ! command -v rustc &> /dev/null; then
    print_warning "Rust não encontrado. Instalando..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
    print_success "Rust instalado: $(rustc --version)"
else
    print_success "Rust encontrado: $(rustc --version)"
fi

# Instalar dependências do sistema no Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    print_step "Instalando dependências do Linux..."
    
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
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y \
            webkit2gtk4.0-devel \
            gcc-c++ \
            curl \
            wget \
            openssl-devel \
            gtk3-devel \
            libappindicator-gtk3-devel \
            librsvg2-devel
        print_success "Dependências do Fedora instaladas!"
    else
        print_warning "Sistema Linux não reconhecido. Instale as dependências manualmente."
        print_info "Consulte GUIA-COMPLETO.md para instruções específicas."
    fi
fi

# Instalar dependências npm/Tauri
print_step "Instalando dependências npm..."
npm install
print_success "Dependências npm instaladas!"

# Tornar scripts executáveis
print_step "Configurando permissões dos scripts..."
chmod +x scripts/*.js
chmod +x setup-completo.sh
print_success "Permissões configuradas!"

# Criar estrutura de diretórios
print_step "Criando estrutura de diretórios..."
mkdir -p release/desktop/windows
mkdir -p release/desktop/macos
mkdir -p release/desktop/linux
mkdir -p release/web
mkdir -p src-tauri/icons
mkdir -p src-tauri/gen
print_success "Estrutura de diretórios criada!"

# Verificar se scripts estão no package.json
print_step "Verificando configuração do package.json..."
if grep -q "build:desktop:win" package.json; then
    print_success "Scripts já configurados no package.json"
else
    print_warning "Scripts NÃO encontrados no package.json"
    print_info "Copie os scripts de SCRIPTS-PACKAGE.json para seu package.json"
fi

echo ""
echo -e "${GREEN}🎉 Setup completo finalizado!${NC}"
echo "=================================================================="
echo ""
echo -e "${PURPLE}📋 Próximos passos:${NC}"
echo ""
echo "1. ${YELLOW}Configure os scripts:${NC}"
echo "   Copie os scripts de SCRIPTS-PACKAGE.json para seu package.json"
echo ""
echo "2. ${YELLOW}Desenvolvimento:${NC}"
echo "   npm run tauri:dev"
echo ""
echo "3. ${YELLOW}Builds individuais:${NC}"
echo "   npm run build:web                 # Web estático"
echo "   npm run build:desktop:win         # Windows"
echo "   npm run build:desktop:mac         # macOS"
echo "   npm run build:desktop:linux       # Linux"
echo ""
echo "4. ${YELLOW}Build completo:${NC}"
echo "   npm run build:all                 # Todas as versões"
echo ""
echo -e "${BLUE}📖 Documentação:${NC}"
echo "   • GUIA-COMPLETO.md - Documentação completa"
echo "   • SCRIPTS-PACKAGE.json - Scripts para copiar"
echo "   • /release/ - Builds finais serão gerados aqui"
echo ""
echo -e "${CYAN}🔧 Comandos úteis:${NC}"
echo "   • rustc --version          # Verificar Rust"
echo "   • tauri --version          # Verificar Tauri CLI"
echo "   • npm run tauri info       # Info do sistema"
echo ""
echo -e "${GREEN}✅ Pronto para desenvolver e exportar!${NC}"