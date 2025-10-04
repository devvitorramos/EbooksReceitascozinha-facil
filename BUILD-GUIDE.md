# 🚀 Guia de Build - Desktop & Web Export

## 📋 Pré-requisitos

### 1. Instalar Rust
```bash
# Linux/macOS
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# Windows (PowerShell)
# Baixe e execute: https://win.rustup.rs/
```

### 2. Dependências do Sistema

#### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev
```

#### macOS
```bash
xcode-select --install
```

#### Windows
- Visual Studio Build Tools ou Visual Studio Community
- WebView2 (já incluído no Windows 10/11)

### 3. Instalar Dependências
```bash
npm install
```

## 🎯 Scripts de Build

### Build Web Estático
```bash
npm run build:web
```
Gera versão web em `/release/receitas-faceis-web/`

### Build Desktop
```bash
npm run build:desktop
```
Gera executáveis em `/release/`

### Build Completo (Web + Desktop)
```bash
npm run build:all
```
Gera ambas as versões

### Comandos Específicos por Plataforma
```bash
# Windows (.exe, .msi)
npm run build:win

# macOS (.dmg, .app)
npm run build:mac

# Linux (.deb, .AppImage)
npm run build:linux
```

## 📦 Estrutura de Saída

```
/release/
├── receitas-faceis-web/          # Versão web estática
│   ├── index.html                # Página principal
│   ├── assets/                   # CSS, JS, imagens
│   ├── README.md                 # Instruções de uso
│   └── .htaccess                 # Configuração Apache
├── receitas-faceis_1.0.0_x64.msi # Windows MSI
├── receitas-faceis_1.0.0_x64.exe # Windows NSIS
├── receitas-faceis_1.0.0_amd64.deb # Linux DEB
├── receitas-faceis_1.0.0_amd64.AppImage # Linux AppImage
└── Receitas Fáceis para Mães.dmg # macOS DMG
```

## 🌐 Versão Web - Como Usar

### Servidor Local
```bash
# Opção 1 - Python
cd release/receitas-faceis-web
python -m http.server 8000

# Opção 2 - Node.js
npm install -g serve
serve -s release/receitas-faceis-web -l 8000

# Opção 3 - Live Server (VS Code)
# Abra a pasta no VS Code e use a extensão Live Server
```

### Deploy em Servidor
1. Faça upload de todos os arquivos da pasta `receitas-faceis-web`
2. Configure redirects para SPA (arquivo .htaccess incluído)
3. Pronto para usar!

## 🖥️ Versão Desktop - Recursos

✅ **Multiplataforma**: Windows, macOS, Linux  
✅ **Executável nativo**: ~15MB (vs ~150MB Electron)  
✅ **Auto-updater**: Configurado para atualizações  
✅ **Ícone personalizado**: Ícone bonito e profissional  
✅ **Janela responsiva**: 1200x800, redimensionável  
✅ **Segurança**: Sandboxing ativo  
✅ **Performance**: WebView nativo do sistema  

## 🔧 Personalização

### Alterar Nome do App
Edite `src-tauri/tauri.conf.json`:
```json
{
  "productName": "Seu Novo Nome",
  "identifier": "com.seudominio.app"
}
```

### Alterar Ícones
Substitua os arquivos em `src-tauri/icons/`

### Configurar Auto-updater
1. Configure endpoints no `tauri.conf.json`
2. Gere chaves de assinatura
3. Configure servidor de update

## 🛠️ Desenvolvimento

### Modo Desenvolvimento Desktop
```bash
npm run tauri:dev
```

### Debug
- **DevTools**: Abrem automaticamente em modo desenvolvimento
- **Console**: Logs aparecem no terminal
- **Hot Reload**: Atualizações automáticas durante desenvolvimento

## 🚨 Solução de Problemas

### Erro de Build
```bash
# Limpar cache
rm -rf target/ dist/ node_modules/
npm install
```

### Erro de Rust
```bash
# Atualizar Rust
rustup update
```

### Erro de Dependências Linux
```bash
# Reinstalar dependências
sudo apt update && sudo apt upgrade
# Reinstalar dependências listadas acima
```

## 📖 Documentação Adicional

- [Tauri Docs](https://tauri.app/)
- [Vite Build Guide](https://vitejs.dev/guide/build.html)
- [React Router SPA](https://reactrouter.com/web/guides/quick-start)

## 🎉 Pronto!

Seu projeto Lovable agora pode ser distribuído como:
- **App Desktop** para Windows/Mac/Linux
- **Site Web** estático para qualquer servidor

Escolha a forma de distribuição que melhor se adequa ao seu público! 🚀