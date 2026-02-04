#!/bin/bash

# ANSI color codes
readonly BOLD='\033[1m'
readonly DIM='\033[2m'
readonly RESET='\033[0m'

readonly CYAN='\033[36m'
readonly GREEN='\033[32m'
readonly YELLOW='\033[33m'
readonly BLUE='\033[34m'
readonly MAGENTA='\033[35m'
readonly RED='\033[31m'
readonly WHITE='\033[37m'
readonly GRAY='\033[90m'

# Header with box
echo -e "${CYAN}${BOLD}"
cat <<'EOF'
╔════════════════════════════════════════════════════════════════════════╗
║                    AI-Pixi Environment Manager                         ║
╚════════════════════════════════════════════════════════════════════════╝
EOF

echo -e "${RESET}${BOLD}Available installation tasks:${RESET}"
echo ""

# NPM-based tools
echo -e "${YELLOW}${BOLD}📦 NPM-based AI CLI Tools:${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-amp${RESET}          ${DIM}# Amp by Sourcegraph${RESET}"
echo -e "  ${BLUE}pixi run install-auggie${RESET}       ${DIM}# Auggie by Augment Code${RESET}"
echo -e "  ${BLUE}pixi run install-codex${RESET}        ${DIM}# Codex by OpenAI${RESET}"
echo -e "  ${BLUE}pixi run install-forgecode${RESET}    ${DIM}# Forgecode${RESET}"
echo -e "  ${BLUE}pixi run install-gemini${RESET}       ${DIM}# Gemini CLI by Google${RESET}"
echo -e "  ${BLUE}pixi run install-grok${RESET}         ${DIM}# Grok CLI${RESET}"
echo -e "  ${BLUE}pixi run install-opencode${RESET}     ${DIM}# OpenCode CLI${RESET}"
echo -e "  ${BLUE}pixi run install-qodo${RESET}         ${DIM}# Qodo CLI${RESET}"
echo -e "  ${BLUE}pixi run install-qoder${RESET}        ${DIM}# Qoder by Qwen${RESET}"
echo -e "  ${BLUE}pixi run install-pi${RESET}           ${DIM}# Pi Coding Agent by Mario Zechner${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-all-npm${RESET}      ${DIM}# Install ALL npm-based tools at once${RESET}"
echo ""

# Python/uv-based tools
echo -e "${YELLOW}${BOLD}🐍 Python/uv-based AI CLI Tools:${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-kimi${RESET}         ${DIM}# Kimi by MoonshotAI${RESET}"
echo -e "  ${BLUE}pixi run install-openhands${RESET}    ${DIM}# OpenHands${RESET}"
echo -e "  ${BLUE}pixi run install-modal${RESET}        ${DIM}# Modal serverless platform${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-all-uv${RESET}       ${DIM}# Install ALL uv-based tools at once${RESET}"
echo ""

# Custom installer tools
echo -e "${YELLOW}${BOLD}🔧 Custom Installer AI CLI Tools:${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-droid${RESET}        ${DIM}# Droid by Factory AI${RESET}"
echo -e "  ${BLUE}pixi run install-goose${RESET}        ${DIM}# Goose by Block${RESET}"
echo -e "  ${BLUE}pixi run install-kiro${RESET}         ${DIM}# Kiro CLI by AWS${RESET}"
echo -e "  ${BLUE}pixi run install-plandex${RESET}      ${DIM}# Plandex${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-all-custom${RESET}   ${DIM}# Install ALL custom installer tools${RESET}"
echo ""

# CLI Enhancers
echo -e "${YELLOW}${BOLD}✨ CLI Enhancers:${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-claude-flow${RESET}  ${DIM}# Claude Flow by ruvnet${RESET}"
echo -e "  ${BLUE}pixi run install-spec-kit${RESET}     ${DIM}# Spec Kit by GitHub${RESET}"
echo ""

# Orchestrators
echo -e "${YELLOW}${BOLD}🎼 Orchestrators:${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-openclaw${RESET}     ${DIM}# OpenClaw orchestrator${RESET}"
echo ""

# AI Agent Utilities
echo -e "${YELLOW}${BOLD}🤖 AI Agent Utilities:${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-mcporter${RESET}     ${DIM}# MCPorter - MCP TypeScript runtime/CLI${RESET}"
echo ""

# Required by OpenClaw
echo -e "${YELLOW}${BOLD}🔌 Required by OpenClaw:${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-homebrew${RESET}     ${DIM}# Homebrew package manager${RESET}"
echo ""

# Special System Tools
echo -e "${YELLOW}${BOLD}🛠️  Special System Tools (installed globally):${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-ripgrep${RESET}      ${DIM}# Fast search tool (rg)${RESET}"
echo -e "  ${BLUE}pixi run install-jq${RESET}           ${DIM}# JSON processor${RESET}"
echo -e "  ${BLUE}pixi run install-yq${RESET}           ${DIM}# YAML processor${RESET}"
echo -e "  ${BLUE}pixi run install-bat${RESET}          ${DIM}# Better cat with syntax highlighting${RESET}"
echo -e "  ${BLUE}pixi run install-fd${RESET}           ${DIM}# Better find alternative${RESET}"
echo -e "  ${BLUE}pixi run install-eza${RESET}          ${DIM}# Modern ls replacement${RESET}"
echo -e "  ${BLUE}pixi run install-gh${RESET}           ${DIM}# GitHub CLI${RESET}"
echo -e "  ${BLUE}pixi run install-helm${RESET}         ${DIM}# Kubernetes package manager${RESET}"
echo -e "  ${BLUE}pixi run install-lazygit${RESET}      ${DIM}# Git TUI${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-all-special${RESET}  ${DIM}# Install ALL special tools${RESET}"
echo ""

# Install Everything
echo -e "${YELLOW}${BOLD}🎯 Install Everything:${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-all${RESET}          ${DIM}# Install ALL AI tools (npm + uv + custom)${RESET}"
echo ""

# VS Code Extensions
echo -e "${YELLOW}${BOLD}💻 VS Code Extensions (requires VS Code CLI):${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-vscode-augment${RESET}    ${DIM}# Augment Code${RESET}"
echo -e "  ${BLUE}pixi run install-vscode-kilo${RESET}       ${DIM}# Kilo Code${RESET}"
echo -e "  ${BLUE}pixi run install-vscode-roo${RESET}        ${DIM}# Roo Code (Cline fork)${RESET}"
echo -e "  ${BLUE}pixi run install-vscode-cline${RESET}      ${DIM}# Cline (Claude Dev)${RESET}"
echo -e "  ${BLUE}pixi run install-vscode-zencoder${RESET}   ${DIM}# Zencoder${RESET}"
echo ""
echo -e "  ${BLUE}pixi run install-all-vscode${RESET}        ${DIM}# Install ALL VS Code extensions${RESET}"
echo ""

# Management
echo -e "${YELLOW}${BOLD}🧹 Management:${RESET}"
echo ""
echo -e "  ${BLUE}pixi run list-installed${RESET}       ${DIM}# List all installed npm packages${RESET}"
echo -e "  ${BLUE}pixi run list-uv-tools${RESET}        ${DIM}# List all installed uv tools${RESET}"
echo ""

# Tips
echo -e "${YELLOW}${BOLD}💡 Tips:${RESET}"
echo ""
echo -e "  ${DIM}- Aliases are automatically added to ~/.zshrc when you install tools${RESET}"
echo -e "  ${DIM}- After installing, run: source ~/.zshrc (or restart shell)${RESET}"
echo -e "  ${DIM}- Then use tools from anywhere: amp, kimi, etc.${RESET}"
echo -e "  ${DIM}- All tools run in isolated pixi environment${RESET}"
echo -e "  ${DIM}- Alternative: Use \"pixi shell\" to activate environment${RESET}"
echo ""
