# 🖥️ Configuração Desktop - Tauri

## Scripts para adicionar ao package.json

Para usar o Tauri, adicione estes scripts ao seu `package.json`:

```json
{
  "scripts": {
    "tauri": "tauri",
    "tauri:dev": "tauri dev",
    "tauri:build": "tauri build",
    "build:win": "tauri build --target x86_64-pc-windows-msvc",
    "build:mac": "tauri build --target x86_64-apple-darwin", 
    "build:linux": "tauri build --target x86_64-unknown-linux-gnu"
  }
}
```

## 🚀 Como usar

### 1. Instalar Rust
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

### 2. Executar em desenvolvimento
```bash
npm run tauri:dev
```

### 3. Gerar executáveis
```bash
# Windows
npm run build:win

# macOS  
npm run build:mac

# Linux
npm run build:linux

# Todas as plataformas
npm run tauri:build
```

## 📱 Características do App Desktop

✅ **Multiplataforma**: Windows, Mac, Linux  
✅ **Executável nativo**: Performance otimizada  
✅ **Auto-updater**: Atualizações automáticas  
✅ **Ícones personalizados**: Ícone bonito gerado  
✅ **Janela responsiva**: 1200x800 redimensionável  
✅ **Segurança**: Sandboxing e APIs limitadas  
✅ **Pequeno tamanho**: ~15MB (vs ~150MB Electron)

## 🛠️ Configuração Avançada

O arquivo `src-tauri/tauri.conf.json` controla:
- Nome do produto
- Ícones
- Permissões de segurança  
- Configurações da janela
- Auto-updater
- Bundle settings

## 📦 Localização dos Executáveis

Após o build, encontre os executáveis em:
```
src-tauri/target/release/bundle/
```

## 🔐 Produção

Para produção, configure:
1. **Code signing** (Windows/Mac)
2. **Auto-updater endpoints** 
3. **Ícones personalizados**
4. **Metadados do bundle**