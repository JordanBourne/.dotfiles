# 🚀 Neovim Mastery: The "Second Level" Cheatsheet

This README serves as a curated list of advanced commands and hotkeys tailored to your current configuration. Since you already know basic Vim motions, these target efficient navigation, code intelligence, and plugin-specific power moves.

---

## 🛠 1. Navigation & Diagnostics (LSP Level)
These are your bread and butter for moving through actual code errors and logic.

| Keymap | Action | Why it's useful |
| :--- | :--- | :--- |
| `]d` / `[d` | Next / Prev Diagnostic | Jump directly to the next error or warning. |
| `]D` / `[D` | Next / Prev **Error** | Skips warnings and only lands on red compiler errors. |
| `gd` | Goto Definition | Jump to the source of a function/variable. |
| `gr` | Goto References | See everywhere a symbol is used (via Telescope). |
| `K` | Hover Doc | Show documentation for the symbol under the cursor. |
| `<leader>ca` | Code Action | The "Lighthouse" fix. Use it to auto-import or fix lint errors. |
| `<leader>rn` | Rename | Refactor a variable name project-wide safely. |
| `<leader>e` | Open Float | Read the full error message if it's cut off. |

---

## 🔍 2. Project & Buffer Discovery (The Discovery Level)
You use **Telescope** for finding things you don't know the location of.

| Keymap | Action | Why it's useful |
| :--- | :--- | :--- |
| `<leader>sf` | [S]earch [F]iles | The fastest way to open any file in the project. |
| `<leader>sg` | [S]earch [G]rep | Search for text strings inside all files. |
| `<leader>sj` | [S]earch [J]umplist | Look back at everywhere you've been recently and jump back. |
| `<leader>sr` | [S]earch [R]esume | Re-open the last Telescope search you were just looking at. |
| `<leader>sc` | [S]earch [C]urrent | Fuzzy search inside just the open file. |

---

## ⚡ 3. Advanced Editing & "Vim Magic"
These exploit Vim's internal logic to edit faster than modern IDEs.

### Text Objects (The "Verb + Adjective + Noun" pattern)
Stop using `b` and `w` to move and delete. Use **Text Objects**:
- `ci"` → **C**hange **I**nside **"** (Deletes everything inside quotes and puts you in insert mode).
- `da(` → **D**elete **A**ll **(** (Deletes the parentheses AND the content inside).
- `yip` → **Y**ank **I**nside **P**aragraph (Copies the whole block of code without moving the cursor).
- `cit` → **C**hange **I**nside **T**ag (Perfect for HTML/React).

### The "Centered" Navigation (Your Custom Config)
- `C-d` / `C-u` → Half page down/up, but your config keeps the cursor **centered** (via `zz`).
- `n` / `N` → Next/Prev search result, also stays **centered**.

### Moving Lines (Visual Mode)
1. Highlight a block of code with `V`.
2. Use **`J`** to move the block down or **`K`** to move the block up. (It auto-indents too!)

---

## 🗂 4. Project Organization (Harpoon & Oil)
You have specialized tools for "frequent" files and file management.

### Harpoon (The "Hooks")
Think of this as a "Persistent Tab Bar" for your 5 most important files.
- `<leader>hH` → Mark/Add current file to Harpoon.
- `<leader>hh` → Toggle the Harpoon UI menu.
- `<leader>1` through `<leader>5` → Instant jump to your marked files.

### Oil (The File System as a Buffer)
- `-` → Open Oil (Edit your file system like it's a text file).
- To rename a file: Just Change the text and save (`:w`).
- To move a file: Delete it from one line and paste it into another directory.

---

## ⭐ 5. Surrounding (The "Wrapper" Level)
Since you just installed `nvim-surround`, these are your new superpowers for wrapping text.

| Keymap | Action | Syntax Example |
| :--- | :--- | :--- |
| `ys{motion}{char}` | **Y**ou **S**urround | `ysiw"` → Surrounds **I**nner **W**ord with **"** |
| `ds{char}` | **D**elete **S**urround | `ds"` → Removes surrounding **"** |
| `cs{old}{new}` | **C**hange **S**urround | `cs"(` → Changes surrounding **"** to **()** |
| `S{char}` | **S**urround (Visual) | Select text, then `S"` wraps selection in **"** |

---

## 📜 6. The "Invisible" History
- `C-o` → Jump **O**ut (Backwards in your jump history).
- `C-i` → Jump **I**n (Forwards in your jump history).
- `g;` → Jump to the last place you actually **edited** text.
- `gv` → Reselect the last visual selection.

---

**Pro-Tip:** If you forget a keymap, press `<leader>?` to open **Which-Key**, which will show you every possible command starting with your leader key.
