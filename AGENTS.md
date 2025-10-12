# Repository Guidelines
This chezmoi-managed dotfiles repository captures macOS, terminal, and CLI configuration for Nick's machines. Contributions should respect the templating and deployment model.

## Project Structure & Module Organization
- `dot_config/` holds application configs; subfolders mirror the target path (e.g., `nvim`, `gh`, `ghostty`).
- `dot_zshrc.tmpl`, `dot_prettierrc.tmpl`, and other `*.tmpl` files are Go templates rendered by chezmoi; keep template directives intact.
- `Library/` and `Terminal/` mirror macOS home directories for UI preferences; touch only what you can verify locally.
- `private_*/` and `exact_*` entries map to sensitive or literal files; avoid committing secrets and follow chezmoi naming rules.

## Build, Test, and Development Commands
- `chezmoi diff` previews the rendered home directory; run before sending a change.
- `chezmoi apply --dry-run` validates templating without touching the filesystem.
- `chezmoi apply` performs the actual sync; use only after reviewing the diff.
- `pre-commit run --all-files` executes format and safety checks (YAML, TOML, secrets).
- `npm exec prettier --check "**/*.md"` keeps Markdown consistent; install deps with `npm install` if needed.

## Coding Style & Naming Conventions
- `.editorconfig` enforces LF endings, final newlines, and tabs for Makefiles/Alloy; follow existing indentation in each file.
- Prefer declarative tweaks, minimal comments, and keep chezmoi template logic readable.
- Use Prettier (with the TOML plugin) for TOML/YAML; respect existing key ordering.

## Testing Guidelines
- There is no unit test suite; rely on `chezmoi` dry runs plus manual validation in Neovim, Ghostty, etc.
- Name new checks or scripts descriptively (e.g., `dot_config/<tool>/<feature>.lua`) and document unusual behavior inline.
- Ensure `pre-commit` passes locally and confirm `chezmoi doctor` reports no issues on your platform.

## Commit & Pull Request Guidelines
- Follow the existing imperative style (`Update ...`, `Add ...`); summarize scope in one line.
- Break large refactors into focused commits when possible; group related dotfiles within one message.
- PRs should describe the target machine(s), include relevant diffs or screenshots (terminal schemes, UI tweaks), and link tracking issues when available.
