# ⚡ Quick Start - Export Desktop + Web

## 🚀 Configuração Rápida (1 comando)

### Linux/macOS:
```bash
chmod +x setup-export.sh && ./setup-export.sh
```

### Windows:
```cmd
setup-export.bat
```

## 📝 Scripts para package.json

Adicione estes scripts ao seu `package.json`:

```json
{
  "scripts": {
    "tauri": "tauri",
    "tauri:dev": "tauri dev",
    "tauri:build": "tauri build",
    "build:web": "node scripts/build-web.js",
    "build:desktop": "node scripts/build-desktop.js",
    "build:all": "node scripts/build-all.js",
    "build:win": "tauri build --target x86_64-pc-windows-msvc",
    "build:mac": "tauri build --target x86_64-apple-darwin",
    "build:linux": "tauri build --target x86_64-unknown-linux-gnu"
  }
}
```

## 🎯 Uso Imediato

### Desenvolvimento
```bash
npm run tauri:dev
```

### Build Web Estático
```bash
npm run build:web
```
➡️ Resultado: `/release/receitas-faceis-web/`

### Build Desktop
```bash
npm run build:desktop
```
➡️ Resultado: `/release/*.exe, *.dmg, *.AppImage`

### Build Completo
```bash
npm run build:all
```
➡️ Resultado: Ambas as versões

## ✅ Checklist Rápido

- [ ] Node.js instalado
- [ ] Rust instalado (`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`)
- [ ] Dependências do sistema (Linux: `sudo apt install libwebkit2gtk-4.0-dev build-essential`)
- [ ] Scripts adicionados ao package.json
- [ ] `npm install` executado

## 📦 O que você ganha:

🖥️ **Desktop Apps:**
- Windows: `.exe` e `.msi`
- macOS: `.dmg` e `.app`
- Linux: `.deb` e `.AppImage`

🌐 **Web Estático:**
- Pasta completa pronta para upload
- Funciona offline
- Compatível com qualquer servidor

## 🆘 Problemas?

1. **Erro de Rust**: `rustup update`
2. **Erro de build**: `rm -rf target/ dist/ node_modules/ && npm install`
3. **Linux sem dependências**: Veja BUILD-GUIDE.md

## 📖 Documentação Completa

- `BUILD-GUIDE.md` - Guia detalhado
- `tauri-scripts.json` - Scripts para copiar
- `/release/receitas-faceis-web/README.md` - Instruções web

**Pronto em 5 minutos! 🚀**