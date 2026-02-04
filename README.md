# AI-Pixi: Comprehensive AI Development Environment

This pixi environment provides **complete parity** with the [ai-menu](https://github.com/smpnet74/ai-menu/) project, offering all the same AI tools and capabilities but in a single, maintainable `pixi.toml` configuration file. The source of truth for all tools and tasks is always `pixi.toml`.

## Philosophy

Instead of rebuilding and redeploying a Go-based interactive installer every time the AI tool landscape changes, this approach lets you:

- 📝 Maintain one comprehensive `pixi.toml` with all tools documented
- 🔧 Uncomment dependencies as needed for system tools (ripgrep, jq, bat, etc.)
- ⚡ Run simple pixi tasks to install AI tools on demand
- 📦 Keep everything in an isolated, reproducible pixi environment
- 🚀 Install tools individually or in batches as requirements evolve

## Quick Start

```bash
# Navigate to the ai-pixi directory
cd ai-pixi

# Initialize the environment (installs Node.js 24.*, Python 3.12.*, uv)
pixi install

# View all available commands
pixi run help

# Install specific AI tools (aliases added automatically!)
pixi run install-amp         # Install Amp by Sourcegraph
pixi run install-kimi        # Install Kimi by MoonshotAI
pixi run install-claude-flow # Install Claude Flow enhancer

# Reload your shell to use the new aliases
source ~/.zshrc

# Now use the tools from any directory!
amp --help
kimi --help

# Or install everything at once
pixi run install-all

# Alternative: Activate the pixi shell
pixi shell
```

## Project Structure

- `pixi.toml` — All dependencies, install tasks, and tool definitions
- `pixi.lock` — Resolved Pixi lockfile
- `.pixi-scripts/` — Helper scripts used by tasks (`help.sh`, `install-homebrew.sh`)

## What's Included

This environment provides access to **18+ AI CLI tools**, **5 VS Code extensions**, **9 special system tools**, and **2 CLI enhancers**.

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

These are installed **globally** (system-wide) using apt or official installers, just like in ai-menu. This ensures you get the latest versions directly from official sources.

| Tool | Command | Installation |
|------|---------|--------------|
| ripgrep | `rg` | `pixi run install-ripgrep` |
| jq | `jq` | `pixi run install-jq` |
| yq | `yq` | `pixi run install-yq` |
| bat | `bat` | `pixi run install-bat` |
| fd | `fd` | `pixi run install-fd` |
| eza | `eza` | `pixi run install-eza` |
| GitHub CLI | `gh` | `pixi run install-gh` |
| Helm | `helm` | `pixi run install-helm` |
| lazygit | `lazygit` | `pixi run install-lazygit` |

**Batch install:** `pixi run install-all-special`

**Note:** These tools are installed system-wide (not in pixi environment) and are immediately available in your PATH without needing aliases.

## Installation Patterns

### Pattern 1: Install as Needed (Recommended)
```bash
# Install only what you need, when you need it
pixi install                    # Get core dependencies
pixi run install-amp            # Add Amp (alias auto-added to ~/.zshrc)
pixi run install-kimi           # Add Kimi (alias auto-added to ~/.zshrc)
source ~/.zshrc                 # Reload shell
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
# Note: does NOT install VS Code extensions or special system tools
pixi run install-all
```

## Environment Management

### Method 1: Auto-Added Aliases (Recommended - Just Like ai-menu!)

**Aliases are automatically added when you install tools!** Just like ai-menu, each tool installation adds its alias to `~/.zshrc`:

```bash
# Install a tool - alias is added automatically
pixi run install-amp

# Reload your shell
source ~/.zshrc

# Use the tool from anywhere!
cd ~/my-project
amp --help
```

**What gets aliased automatically:**
- All npm tools: `amp`, `auggie`, `codex`, `forge`, `gemini`, `grok`, `opencode`, `qodo`, `qodercli`, `pi`, `openclaw`, `mcporter`
- All uv tools: `kimi`, `openhands`, `modal`, `spec-kit`
- Enhancers: `claude-flow`
- Utilities: `npm`, `npx` (added with any npm-based tool)

**Benefits:**
- ✅ Automatic — no extra steps needed
- ✅ Per-tool basis — only aliases for installed tools
- ✅ Use tools from any directory
- ✅ Same workflow as ai-menu
- ✅ Duplicate detection — safe to install multiple times

**Manual alias setup (if needed):**
```bash
# Setup all tool aliases at once (for already-installed tools)
pixi run setup-aliases-npm    # npm-based tools + enhancers
pixi run setup-aliases-uv     # Python/uv tools

# Remove all aliases
pixi run remove-aliases
source ~/.zshrc
```

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
# Run tools without activating the environment or aliases
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
| **Shell Aliases** | ✅ Auto-added to ~/.zshrc | ✅ Auto-added to ~/.zshrc on install |
| **Global Access** | ✅ Use tools from anywhere | ✅ Use tools from anywhere (after alias setup) |
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
   install-newtool = { cmd = "npm install -g package-name", description = "Install NewTool" }
   ```

2. **If it's Python-based:**
   ```toml
   [tasks]
   install-newtool = { cmd = "uv tool install package-name", description = "Install NewTool" }
   ```

3. **If it uses a custom installer:**
   ```toml
   [tasks]
   install-newtool = { cmd = "curl -fsSL https://example.com/install.sh | bash", description = "Install NewTool" }
   ```

### Creating Tool Aliases

If you want aliases in your shell (like ai-menu does), add to your `~/.zshrc` or `~/.bashrc`:

```bash
# AI-Pixi tool aliases
alias amp='pixi run --manifest-path /path/to/ai-pixi/pixi.toml amp'
alias kimi='pixi run --manifest-path /path/to/ai-pixi/pixi.toml kimi'
# ... etc
```

Or use the pixi shell approach for automatic PATH management.

## Notes and Caveats

- Several tasks run `sudo` or `curl | bash`; review `pixi.toml` before running in production environments.
- **OpenClaw requires Homebrew.** Run `pixi run install-homebrew` before installing OpenClaw.
- Some tools install outside the Pixi environment (e.g., custom installers install to `~/.local/bin` or `/usr/local/bin`; special system tools install system-wide via apt).
- Aliases are appended to `~/.zshrc` only. If you use a different shell (e.g., bash), update the tasks in `pixi.toml` or add aliases manually.

## Troubleshooting

### "Command not found" after installation

**Solution:** Some tools require a shell reload:
```bash
source ~/.zshrc
```

If that doesn't work, try exiting and re-entering the pixi shell:
```bash
exit
pixi shell
```

### npm packages not found

**Solution:** Ensure you're in pixi shell or use `pixi run`:
```bash
pixi shell
npm list -g --depth=0
```

### Custom installers fail

**Solution:** Custom installers (droid, goose, kiro, plandex) may install to `~/.local/bin` or require specific system dependencies. Check individual tool documentation.

### VS Code extension installation fails

**Solution:** Ensure VS Code CLI is available:
```bash
which code
# If not found, install VS Code and add to PATH
```

## Platform Support

- **Linux (x64)**: ✅ Full support
- **Linux (ARM64)**: ✅ Full support
- **macOS**: ⚠️ Not configured in pixi.toml (only `linux-64` and `linux-aarch64` platforms declared)
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
