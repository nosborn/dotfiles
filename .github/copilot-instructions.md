# Copilot Instructions for nosborn/dotfiles

## Repository Overview

This is a personal dotfiles repository (1.1MB, 177 files) managed with [chezmoi](https://www.chezmoi.io) for macOS. It configures development tools, shell environments (zsh), and applications including Neovim with extensive Lua customization. The repository uses chezmoi's template system to customize configurations based on environment (home vs work).

**Primary Languages/Tools:**

- Shell scripts (24 files): zsh configuration, installation scripts
- Lua (17 files): Neovim configuration and plugins
- Vim script (39 files): Neovim filetype plugins
- YAML: Configuration files
- Templates: Chezmoi .tmpl files for environment-specific configs

**Key Dependencies:**

- Homebrew: Package manager (see dot_Brewfile.tmpl)
- Node.js/npm: For neovim and prettier-plugin-toml packages
- Chezmoi version: 2.46.1 (specified in .chezmoiversion)

## Build and Validation

### Initial Setup

**ALWAYS run `npm install` first** (takes ~2-5 seconds). Required for prettier to work correctly.

### Validation Steps (Run in Order)

1. **Prettier:** `npx prettier --check .` - Checks YAML, JSON, Markdown, TOML formatting (~1-2 sec)
2. **Shellcheck:** `find . -name "*.sh" -type f -exec shellcheck {} +` - Scripts MUST have shebangs
3. **YAML:** `yamllint .pre-commit-config.yaml .chezmoiexternal.yaml` - Validates syntax
4. **Lua (optional):** `luacheck dot_config/nvim --config .luacheckrc` - If available
5. **Stylua (optional):** `stylua --check dot_config/nvim` - Config: .stylua.toml (4 spaces, 120 width)

### Pre-commit Hooks

See .pre-commit-config.yaml: check-executables-have-shebangs (CRITICAL), check-json/yaml/toml/xml, check-merge-conflict, detect-private-key, end-of-file-fixer, trailing-whitespace. Pre-commit may not be installed; use manual validation above.

### Common Validation Errors

1. **SC2148**: Missing shebang - Add `#!/bin/sh` as first line
2. **Prettier format**: Run `npx prettier --write <file>`
3. **Trailing whitespace**: Ensure files end with single newline

## Repository Structure

### Root Directory Files

**Configuration Files:**

- `.chezmoi.toml.tmpl` - Chezmoi configuration with template variables (git, github, homebrew settings)
- `.chezmoiexternal.yaml` - External packages (Neovim plugins as git repos)
- `.chezmoiignore` - Files to exclude from chezmoi management
- `.chezmoiremove` - Files to remove from target system
- `.chezmoiversion` - Required chezmoi version (2.46.1)
- `.pre-commit-config.yaml` - Pre-commit hook configuration
- `.luacheckrc` - Lua linting configuration
- `.luarc.json` - Lua LSP configuration
- `.stylua.toml` - Lua formatting rules
- `dot_editorconfig` - Editor configuration
- `dot_vintrc.yaml` - Vim script linting configuration
- `package.json` - Node.js dependencies
- `install.sh` - Bootstrap script (installs Homebrew and chezmoi, then runs chezmoi init)

**Important Files:**

- `dot_Brewfile.tmpl` - Homebrew package definitions (186 lines, includes conditional packages for home/work)
- `dot_prettierrc.tmpl` - Prettier configuration for formatting
- `dot_zshenv` - Zsh environment variables (45 lines of exports)
- `dot_zshrc.tmpl` - Zsh configuration template

### Key Directories

**`.chezmoiscripts/`** - Post-apply scripts (run by chezmoi): `run_after_0_brew.sh` (Homebrew packages), `run_after_1_neovim.sh` (compiles configs, tree-sitter, helptags), `run_after_1_npm.sh` (npm packages to ~/.local), `run_after_1_*.sh` (tool inits), `run_after_2_macos.sh` (macOS settings)

**`dot_config/nvim/`** - Neovim: `init.lua` (224 lines: options, keymaps, LSP), `exact_after/exact_plugin/` (plugin configs), `exact_after/exact_ftplugin/` (39 filetype vim files), `exact_ftdetect/` (custom detection), `spell/` (spell files)

**`exact_dot_zshrc.d/`** - Modular zsh: Individual .zsh files for tools (ansible, aws-vault, fzf, gpg, terraform)
**`dot_config/exact_git/`** - Git: config.tmpl, exact_hooks/ (git-lfs), ignore, safe.inc
**`dot_local/bin/`** - Custom scripts | **`private_dot_gnupg/`** - GPG config (private)

### Chezmoi Naming

`dot_` → `.filename` | `exact_` → exact dir (removes untracked) | `private_` → 600/700 perms | `.tmpl` → Go template | `executable_` → executable

## Making Changes

### Modifying Configuration Files

1. **Shell**: `#!/bin/sh`, `set -o errexit`, `set -o nounset`, check commands: `command -v tool >/dev/null 2>&1 || exit 0`, exit 0
2. **Lua**: .stylua.toml (4 sp, 120w, single quotes), 'vim' global ok, plugins→`exact_after/exact_plugin/`, filetypes→`exact_after/exact_ftplugin/`
3. **Templates**: Go syntax `{{ .var }}`, vars: `.where`, `.git.*`, `.github.*`, `.homebrew.prefix` (in .chezmoi.toml.tmpl)
4. **Brewfile**: Alphabetical, conditionals: `if '{{ .where }}' == 'home'`, format: `brew 'name'`/`cask 'app', appdir: '~/Applications'`
5. **YAML**: Pass yamllint, 2-space indent, `---` at top

### Testing Changes

- **Shell**: `shellcheck file.sh` or `sh -n file.sh`
- **Lua**: `stylua --check file.lua` or `stylua file.lua`
- **Format**: `npx prettier --check file` or `npx prettier --write file`

### What NOT to Change

Do NOT modify: node_modules/, .git/, build artifacts. Do NOT commit: .chezmoidata.\*, default.profraw (in .gitignore)

## CI/CD and Validation

**No GitHub Actions.** Only Dependabot (.github/dependabot.yml, daily npm updates) and CODEOWNERS. Validation is manual.

## Common Patterns

**Shell**: `#!/bin/sh`, `set -o errexit`, `set -o nounset`, `command -v tool >/dev/null 2>&1 || exit 0`, content, `exit 0`
**Neovim Plugin** (`exact_after/exact_plugin/<name>.lua`): `require('<plugin>').setup({ config })`
**Conditional Brew**: `if '{{ .where }}' == 'home'` `brew 'pkg'` `end`

## Environment Variables

Key vars in dot*zshenv: `HOMEBREW*\_`(Homebrew controls),`XDG\_\_` (base dirs), path mods for tools

## Quick Reference

**Validate all changes before committing:**

```bash
npm install  # ALWAYS FIRST
npx prettier --check .
find . -name "*.sh" -type f -exec shellcheck {} +
yamllint .pre-commit-config.yaml .chezmoiexternal.yaml
```

**Format files:**

```bash
npx prettier --write <file>
stylua <file.lua>  # if available
```

**Repository characteristics:**

- Small repo (1.1MB, 177 files)
- No compilation needed
- No test suite
- macOS-focused (references /opt/homebrew, ~/Library/)
- Managed by chezmoi (don't test chezmoi apply without installation)

**When in doubt:** Follow existing file patterns, validate with the tools above, and ensure shell scripts have proper shebangs and error handling.
