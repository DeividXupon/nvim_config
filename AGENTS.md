# Agent Guidelines for Neovim Configuration

## Build/Lint/Test Commands
- Format: Lua `stylua`; JS/TS `prettierd`; PHP `pint` or `php_cs_fixer`; Blade `blade_formatter`.
- Lint: JS/TS `eslint_d`; Python `flake8`; JSON `jsonlint`; PHP `phpstan`.
- Tests: PHP via `neotest` with `neotest-pest`.
- Run all: `:lua require("neotest").run.run()`.
- Run single file: `:lua require("neotest").run.run(vim.fn.expand("%"))`.
- Cursor/Copilot rules: none found in repo.

## Code Style Guidelines
- Indentation: 4 spaces; keep line length reasonable.
- Imports: place `require()` at top; localize modules for reuse.
- Naming: snake_case variables/functions; PascalCase modules.
- Strings: prefer double quotes; stay consistent.
- Tables: align entries; trailing commas when style fits.
- Error handling: wrap risky calls in `pcall`/`xpcall`; log failures.
- Plugin configs: return table; use `config` function for setup.
- Keymaps: use `vim.keymap.set()` with descriptive `desc`.
- Options: use `vim.opt` for globals, `vim.wo` for window scopes.
- Comments: minimal; English preferred, Portuguese acceptable.
- Types: respect Neovim API types; avoid single-letter names.
