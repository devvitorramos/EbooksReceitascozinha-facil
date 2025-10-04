# Receitas Fáceis - Desktop App

Este projeto foi configurado para gerar executáveis desktop multiplataforma usando Tauri.

## 🚀 Scripts Disponíveis

### Desenvolvimento
```bash
npm run tauri:dev
```
Inicia o app em modo desenvolvimento com hot-reload.

### Build de Produção

#### Windows (.exe)
```bash
npm run build:win
```

#### macOS (.dmg)
```bash
npm run build:mac
```

#### Linux (.AppImage)
```bash
npm run build:linux
```

#### Build para todas as plataformas
```bash
npm run tauri:build
```

## ⚙️ Configuração

### Pré-requisitos
- **Rust**: Instale o Rust via [rustup.rs](https://rustup.rs/)
- **Node.js**: Versão 16+ recomendada

### Dependências do Sistema

#### Windows
- Visual Studio Build Tools ou Visual Studio Community
- WebView2 (geralmente já instalado no Windows 10/11)

#### macOS
- Xcode Command Line Tools: `xcode-select --install`

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

## 📦 Estrutura dos Executáveis

Os executáveis gerados estarão em:
```
src-tauri/target/release/bundle/
├── deb/           # Linux .deb
├── appimage/      # Linux .AppImage  
├── dmg/           # macOS .dmg
├── msi/           # Windows .msi
└── nsis/          # Windows .exe
```

## 🔧 Customização

### Ícones
Substitua os ícones em `src-tauri/icons/` pelos seus próprios.

### Nome do App
Edite `src-tauri/tauri.conf.json`:
```json
{
  "package": {
    "productName": "Seu App Nome"
  }
}
```

### Auto-updater
O auto-updater está configurado mas requer:
1. Servidor de update endpoint
2. Chave pública para verificação de assinatura

## 🛡️ Segurança

O app está configurado com:
- Sandboxing ativo
- Apenas APIs necessárias habilitadas
- Sem acesso direto ao sistema de arquivos
- CSP configurado

## 📖 Documentação

- [Tauri Documentation](https://tauri.app/)
- [Tauri API](https://tauri.app/v1/api/js/)
- [Configuração](https://tauri.app/v1/api/config/)