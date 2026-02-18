# AI-Pixi: Comprehensive AI Development Environment

This pixi environment provides **complete parity** with the [ai-menu](https://github.com/smpnet74/ai-menu/) project, offering all the same AI tools and capabilities but in a single, maintainable `pixi.toml` configuration file. The source of truth for all tools and tasks is always `pixi.toml`.

## Philosophy

Instead of rebuilding and redeploying a Go-based interactive installer every time the AI tool landscape changes, this approach lets you:

- 📝 Maintain one comprehensive `pixi.toml` with all tools documented
- 📦 Get CLI utilities (ripgrep, jq, yq, bat, fd, eza, gh, helm, lazygit, pandoc, typst, jc, delta, dasel) automatically via `pixi install`
- ⚡ Run simple pixi tasks to install AI tools on demand
- 🔒 Keep everything in an isolated, reproducible pixi environment
- 🚀 Install tools individually or in batches as requirements evolve

## Quick Start

```bash
# Navigate to the ai-pixi directory
cd ai-pixi

# 1. Install all dependencies (Node.js, Python, uv, + all CLI tools via conda-forge)
pixi install

# 2. Set up permanent shell PATH (do this once)
pixi run setup-shell-hook

# 3. (Optional) Install starship prompt + config — skips if already configured
pixi run install-starship

# 4. Activate (or restart your shell)
source ~/.zshrc

# View all available commands
pixi run help

# Install specific AI tools
pixi run install-amp         # Install Amp by Sourcegraph
pixi run install-kimi        # Install Kimi by MoonshotAI
pixi run install-claude-flow # Install Claude Flow enhancer

# Now use the tools from any directory!
amp --help
kimi --help

# Or install everything at once
pixi run install-all

# Alternative: Activate the pixi shell temporarily
pixi shell
```

## Project Structure

- `pixi.toml` — All dependencies, install tasks, and tool definitions
- `pixi.lock` — Resolved Pixi lockfile
- `.pixi-scripts/help.sh` — Formatted help output
- `.pixi-scripts/ensure-shell-hook.sh` — Injects pixi shell-hook into `~/.bashrc` / `~/.zshrc`
- `.pixi-scripts/install-starship.sh` — Installs starship prompt + config (idempotent)
- `.pixi-scripts/starship.toml` — Starship prompt configuration
- `.pixi-scripts/install-homebrew.sh` — Homebrew installer (required by OpenClaw)

## What's Included

This environment provides access to **18+ AI CLI tools**, **5 VS Code extensions**, **14 special system tools** (managed by conda-forge), and **2 CLI enhancers**.

### Core Runtimes (via Pixi)

| Runtime | Version |
|---------|---------|
| Node.js | `24.*` |
| Python | `3.12.*` |
| uv | `>=0.9.28,<0.10` |

### AI CLI Tools

#### NPM-based Tools (12 tools)
| Tool | Command | Installation |
|------|---------|--------------|
| Amp | `amp` | `pixi run install-amp` |
| Auggie | `auggie` | `pixi run install-auggie` |
| Codex | `codex` | `pixi run install-codex` |
| Forgecode | `forge` | `pixi run install-forgecode` |
| Gemini CLI | `gemini` | `pixi run install-gemini` |
| Grok CLI | `grok` | `pixi run install-grok` |
| OpenCode | `opencode` | `pixi run install-opencode` |
| Qodo | `qodo` | `pixi run install-qodo` |
| Qoder | `qodercli` | `pixi run install-qoder` |
| Pi Coding Agent | `pi` | `pixi run install-pi` |
| OpenClaw (orchestrator) | `openclaw` | `pixi run install-openclaw` |
| MCPorter (agent utility) | `mcporter` | `pixi run install-mcporter` |

**Batch install:** `pixi run install-all-npm`

#### Python/uv-based Tools (4 tools)
| Tool | Command | Installation |
|------|---------|--------------|
| Kimi | `kimi` | `pixi run install-kimi` |
| OpenHands | `openhands` | `pixi run install-openhands` |
| Modal | `modal` | `pixi run install-modal` |
| Spec Kit | `spec-kit` | `pixi run install-spec-kit` |

**Batch install:** `pixi run install-all-uv`

#### Custom Installer Tools (4 tools)
These tools use their own installation scripts (curl/bash):

| Tool | Command | Installation |
|------|---------|--------------|
| Droid | `droid` | `pixi run install-droid` |
| Goose | `goose` | `pixi run install-goose` |
| Kiro | `kiro-cli` | `pixi run install-kiro` |
| Plandex | `plandex` | `pixi run install-plandex` |

**Batch install:** `pixi run install-all-custom`

### CLI Enhancers

| Tool | Command | Installation |
|------|---------|--------------|
| Claude Flow | `claude-flow` | `pixi run install-claude-flow` |
| Spec Kit | `spec-kit` | `pixi run install-spec-kit` |

### VS Code Extensions

Install these if you use VS Code (requires `code` CLI in PATH):

| Extension ID | Name | Installation |
|--------------|------|--------------|
| `augment.vscode-augment` | Augment Code | `pixi run install-vscode-augment` |
| `kilocode.kilo-code` | Kilo Code | `pixi run install-vscode-kilo` |
| `rooveterinaryinc.roo-cline` | Roo Code | `pixi run install-vscode-roo` |
| `saoudrizwan.claude-dev` | Cline | `pixi run install-vscode-cline` |
| `zencoderai.zencoder` | Zencoder | `pixi run install-vscode-zencoder` |

**Batch install:** `pixi run install-all-vscode`

### Special System Tools

These are managed by **conda-forge** and installed automatically when you run `pixi install`. They become available on your PATH after running `pixi run setup-shell-hook`.

| Tool | Command | Verify |
|------|---------|--------|
| ripgrep | `rg` | `pixi run install-ripgrep` |
| jq | `jq` | `pixi run install-jq` |
| yq (go-yq) | `yq` | `pixi run install-yq` |
| bat | `bat` | `pixi run install-bat` |
| fd | `fd` | `pixi run install-fd` |
| eza | `eza` | `pixi run install-eza` |
| GitHub CLI | `gh` | `pixi run install-gh` |
| Helm | `helm` | `pixi run install-helm` |
| lazygit | `lazygit` | `pixi run install-lazygit` |
| Pandoc | `pandoc` | `pixi run install-pandoc` |
| Typst | `typst` | `pixi run install-pandoc` |
| jc | `jc` | `pixi run install-jc` |
| delta | `delta` | `pixi run install-delta` |
| dasel | `dasel` | `pixi run install-dasel` |

**Verify all:** `pixi run install-all-special`

**Note:** No manual installation needed — these are resolved by pixi and available automatically after shell hook setup.

## Installation Patterns

### Pattern 1: First-Time Setup (Recommended)
```bash
pixi install                    # Install all deps + CLI tools
pixi run setup-shell-hook       # Add pixi env to ~/.bashrc and ~/.zshrc (once)
source ~/.zshrc                 # Activate

# Install AI tools on demand
pixi run install-amp            # Install Amp
pixi run install-kimi           # Install Kimi
amp --version                   # Use from anywhere!
```

### Pattern 2: Install by Category
```bash
# Install all npm-based tools
pixi run install-all-npm

# Install all Python tools
pixi run install-all-uv

# Install all custom installer tools
pixi run install-all-custom
```

### Pattern 3: Install Everything
```bash
# Install all AI CLI tools (npm + uv + custom + enhancers)
# Note: does NOT install VS Code extensions or special system tools (those come via pixi install)
pixi run install-all
```

## Environment Management

### Method 1: Shell Hook (Recommended)

The `setup-shell-hook` command adds a `pixi shell-hook` eval line to your `~/.bashrc` and `~/.zshrc`. This makes all pixi-managed tools permanently available in every new shell session without needing `pixi shell` or manual aliases.

```bash
# Run once after pixi install
pixi run setup-shell-hook

# Activate in current session
source ~/.zshrc

# All tools now available from anywhere
rg --version
jq --version
amp --version
```

The hook is **idempotent** — safe to run multiple times, it will not add duplicate entries.

### Method 2: Activating the Pixi Shell

```bash
# Enter a pixi shell (like conda activate)
pixi shell

# Now all tools are in your PATH
amp --version
kimi --version

# Exit with:
exit
```

### Method 3: Running Without Activation

```bash
# Run tools without activating the environment
pixi run amp --version
pixi run kimi --version
pixi run npm list -g --depth=0
```

### Checking What's Installed

```bash
# List npm packages
pixi run list-installed

# List uv tools
pixi run list-uv-tools
```

## Comparison with ai-menu

| Aspect | ai-menu | ai-pixi |
|--------|---------|---------|
| **Installation** | Build Go binary, run interactive TUI | Edit pixi.toml, run pixi commands |
| **Updates** | Rebuild and redeploy when tools change | Edit pixi.toml tasks, no rebuild needed |
| **Tool Selection** | Interactive menu | Command-line tasks |
| **Shell Integration** | ✅ Aliases auto-added to ~/.zshrc | ✅ Shell hook via `pixi run setup-shell-hook` |
| **Global Access** | ✅ Use tools from anywhere | ✅ Use tools from anywhere (after shell hook) |
| **System Tools** | Installed via apt | Managed by conda-forge (no sudo needed) |
| **Flexibility** | Fixed menu options | Easy to add/modify tools |
| **Learning Curve** | GUI-driven, user-friendly | CLI-driven, more control |
| **Maintenance** | Go code + rebuild cycle | Single pixi.toml file |
| **Dependencies** | Go 1.21+, compilation | Pixi only |

## Advanced Usage

### Adding New Tools

To add a new AI CLI tool:

1. **If it's npm-based:**
   ```toml
   [tasks]
   install-newtool = { cmd = "npm install -g package-name && echo 'newtool installed'", description = "Install NewTool" }
   ```

2. **If it's Python-based:**
   ```toml
   [tasks]
   install-newtool = { cmd = "uv tool install package-name && echo 'newtool installed'", description = "Install NewTool" }
   ```

3. **If it uses a custom installer:**
   ```toml
   [tasks]
   install-newtool = { cmd = "curl -fsSL https://example.com/install.sh | bash", description = "Install NewTool" }
   ```

## Notes and Caveats

- **OpenClaw requires Homebrew.** Run `pixi run install-homebrew` before installing OpenClaw.
- Custom installer tools (droid, goose, kiro, plandex) use `curl | bash` scripts and may install to `~/.local/bin` — review before running in production.
- Custom installers may install outside the Pixi environment; the shell hook also prepends `~/.local/bin` and `~/.pixi/bin` to PATH so these tools are found.
- Special system tools (rg, jq, yq, etc.) are in the pixi environment — they are available after `setup-shell-hook` + shell reload, or inside `pixi shell`.

## Troubleshooting

### "Command not found" after installation

**Solution:** Ensure the shell hook is set up and the shell has been reloaded:
```bash
pixi run setup-shell-hook
source ~/.zshrc
```

If that doesn't work, try entering the pixi shell directly:
```bash
pixi shell
```

### npm packages not found

**Solution:** Ensure you're in pixi shell or use `pixi run`:
```bash
pixi shell
npm list -g --depth=0
```

### Custom installers fail

**Solution:** Custom installers (droid, goose, kiro, plandex) may require specific system dependencies. Check individual tool documentation.

### VS Code extension installation fails

**Solution:** Ensure VS Code CLI is available:
```bash
which code
# If not found, install VS Code and add to PATH
```

## Platform Support

- **Linux (x64)**: ✅ Full support
- **Linux (ARM64)**: ✅ Full support
- **macOS (Intel)**: ✅ Full support
- **macOS (Apple Silicon)**: ⚠️ Not yet configured (`osx-arm64` not declared)
- **Windows**: ⚠️ WSL2 recommended

## Contributing

To add new AI tools to this configuration:

1. Test the installation command
2. Add task to `[tasks]` section in `pixi.toml`
3. Document in the reference guide section at the bottom of `pixi.toml`
4. Update this README
5. Submit PR or update your local copy

## License

This configuration inherits the license from the ai-menu project where applicable. Individual tools have their own licenses.

## Credits

- Original concept and tool curation: [ai-menu](https://github.com/smpnet74/ai-menu/) by Scott Peterson
- Pixi adaptation: Scott Peterson

## Support

- For tool-specific issues: Check individual tool documentation
- For pixi issues: https://pixi.sh/
- For ai-menu questions: https://github.com/smpnet74/ai-menu/

---

**Pro Tip:** Star this repository and check back regularly as new AI tools emerge. Simply add new tasks to `pixi.toml` as the ecosystem evolves!
