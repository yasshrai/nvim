# 🚀 Neovim Development Environment Setup

This guide lists all external tools required for a full LSP-based development setup in Neovim. It covers C/C++, Python, Go, Rust, JavaScript ecosystem, Lua, Shell scripts, and search tools.

---

## 📦 Core Requirements

Install the basic system requirements for a functional Neovim setup:

```bash
# Arch Linux
sudo pacman -S neovim git base-devel curl wget unzip
```

*Note: The Plugin Manager (lazy.nvim) is auto-installed via config — no manual step needed.*

---

## 💻 Language Setups

### 🔵 C / C++
Requires `clangd` for LSP. Optional but recommended: `cmake`, `cppcheck`.

```bash
# Install LSP and formatter
sudo pacman -S clang
# Optional: IntelliSense improvements and build tools
sudo pacman -S cmake make
# Linter
sudo pacman -S cppcheck
```

**Project Setup (IMPORTANT):** Generate compile commands in your project root:
```bash
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .
```

**Verification:**
```bash
clangd --version
```

### 🐍 Python
Requires `pyright` (LSP), `black` (Formatter), `ruff` (Linter). We recommend using `pipx`.

```bash
# Install pipx
sudo pacman -S python-pipx
pipx ensurepath

# Install tools
pipx install pyright black ruff
```

**Project Setup:** Always use a virtual environment!
```bash
python -m venv venv
source venv/bin/activate
```

**Verification:**
```bash
pyright --version
```

### 🐹 Go
Requires `gopls` (LSP) and `golint`. Go comes with `gofmt` built-in.

```bash
sudo pacman -S go
go install golang.org/x/tools/gopls@latest
go install golang.org/x/lint/golint@latest
```

Add to PATH if needed:
```bash
export PATH=$PATH:$(go env GOPATH)/bin
```

**Verification:**
```bash
gopls version
```

### 🦀 Rust
Requires `rust-analyzer`. Rust comes with `rustfmt` built-in.

```bash
curl https://sh.rustup.rs -sSf | sh
source ~/.bashrc
```

**Verification:**
```bash
rust-analyzer --version
```

### ⚛️ JavaScript / TypeScript / React / Next.js
Requires Node.js ecosystem tools.

```bash
# Install Node.js
sudo pacman -S nodejs npm

# Install LSP, Formatter, Linter
npm install -g typescript typescript-language-server
npm install -g prettier
npm install -g vscode-langservers-extracted

# Optional: Tailwind CSS Support
npm install -g @tailwindcss/language-server
```

**Create a Next.js Project:**
```bash
npx create-next-app@latest my-app
cd my-app
```

**Verification:**
```bash
typescript-language-server --version
prettier --version
```

### 🌙 Lua
Requires `lua-language-server`.

```bash
sudo pacman -S lua-language-server
```

### 🐚 Shell Scripts (.sh)
Requires `bash-language-server` (LSP), `shellcheck` (Linter), and `shfmt` (Formatter).

```bash
sudo pacman -S bash-language-server shellcheck shfmt
```

**Verification:**
```bash
bash-language-server --version
shellcheck --version
shfmt --version
```

---

## 🔍 Telescope Dependencies

Telescope requires `ripgrep` for fast project text search and `fd` for fast file finding.

```bash
sudo pacman -S ripgrep fd
```

**Verification:**
```bash
rg --version
fd --version
```

---

## 🧠 General Notes & Health Checks

* Avoid using `pip install` globally (breaks system on Arch).
* Prefer `pipx` or language-specific installers.
* Always verify binaries are in PATH.
* Prettier is only for JS/TS/React/HTML/CSS; works best inside Node projects with `package.json`.

**Neovim Health Check:**
Inside Neovim, run:
```vim
:checkhealth lsp
```
