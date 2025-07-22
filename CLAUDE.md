# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository managed with [chezmoi](https://www.chezmoi.io), a cross-platform dotfiles manager. The repository manages personal system configurations for macOS development environments.

## File Naming Conventions

Chezmoi uses special prefixes to determine target file placement:
- `dot_` prefix → files starting with `.` in target (e.g., `dot_zshrc` → `~/.zshrc`)
- `exact_` prefix → directory copied exactly as-is
- `.tmpl` suffix → template files processed with Go templating

## Common Commands

### Chezmoi Management
```bash
# Apply all changes to system
chezmoi apply

# Apply and view differences
chezmoi apply --dry-run --verbose

# Add new dotfile to management
chezmoi add ~/.newconfig

# Edit configuration file
chezmoi edit ~/.zshrc

# Update external dependencies (Neovim plugins)
chezmoi update

# Re-run templates (useful after changing .chezmoi.toml.tmpl)
chezmoi execute-template
```

### Development Workflow
```bash
# Apply all changes and run automation scripts
# Note: This automatically handles Homebrew, NPM packages, and tool setup
chezmoi apply

# Force refresh of external dependencies (Neovim plugins)
# Note: .chezmoiexternal.yaml uses 24h refresh, use -R to force
chezmoi apply -R

# Run pre-commit hooks manually
pre-commit run --all-files
```

## Architecture

### Core Configuration System
- **`.chezmoi.toml.tmpl`**: Main configuration with user prompts for personal info, Git settings, and environment detection
- **`.chezmoiexternal.yaml`**: Manages external Git repositories (primarily Neovim plugins)
- **`.chezmoiignore`**: Controls which files chezmoi manages

### Template Variables
Templates use these key variables from `.chezmoi.toml.tmpl`:
- `{{ .name }}` - Name
- `{{ .where }}` - Environment type ("home" or "work")
- `{{ .git.email }}` / `{{ .git.signingKey }}` - Git configuration
- `{{ .github.user }}` / `{{ .github.org }}` - GitHub configuration
- `{{ .homebrew.prefix }}` - Auto-detected Homebrew path (ARM64 vs Intel)

### External Dependencies
Neovim plugins are managed via `.chezmoiexternal.yaml` rather than traditional plugin managers. When modifying plugin configurations:
1. Check if the plugin exists in `.chezmoiexternal.yaml`
2. Plugin files are in `dot_config/nvim/pack/external/start/`
3. Configuration is in `dot_config/nvim/after/plugin/`

### Application Structure
- **Shell Configuration**: `dot_zshrc.tmpl` with modular includes from `exact_dot_zshrc.d/`
- **Neovim**: Comprehensive setup with language-specific configurations in `after/ftplugin/`
- **Development Tools**: Language support for Go, Python, JavaScript/TypeScript, Lua, Terraform, Ansible
- **Homebrew**: 100+ packages managed via `dot_Brewfile.tmpl`
- **Global NPM Packages**: Tracked in `package.json` for Dependabot updates, installed via `.chezmoiscripts/run_after_1_npm.sh`

### Automation Scripts (`.chezmoiscripts/`)
Scripts run automatically during `chezmoi apply` in numbered order:
- **`run_after_0_brew.sh`**: Homebrew bundle install/cleanup with analytics disabled
- **`run_after_1_*.sh`**: Tool-specific setup (npm globals, Neovim setup, bat cache, GitHub CLI extensions, kubectl plugins, etc.)
- **`run_after_2_macos.sh`**: macOS-specific configuration (Rectangle app settings, removes quarantine from Homebrew casks)

### Environment Detection
The system detects:
- **Platform**: macOS with ARM64/Intel support
- **Homebrew Location**: Automatic detection of `/opt/homebrew` vs `/usr/local`
- **Work vs Home**: Different configurations based on environment variable

## Key Files to Understand

- **`install.sh`**: Bootstrap script for new macOS systems
- **`dot_Brewfile.tmpl`**: All Homebrew package dependencies
- **`dot_config/nvim/init.lua`**: Neovim entry point
- **`dot_config/exact_ghostty/config.tmpl`**: Terminal emulator configuration
- **`exact_dot_zshrc.d/`**: Modular shell configuration components

## Development Notes

- Changes to template files require `chezmoi apply` to take effect
- External Neovim plugins update automatically via `chezmoi update`
- Git hooks and pre-commit are configured for quality control
- The repository supports both personal and work environment configurations

## Target Platform

Designed for macOS development environments with support for both Apple Silicon (ARM64) and Intel processors.