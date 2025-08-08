Great — your `README.md` is solid! You just need to **update the installation instructions** to reflect that the plugin is now a proper GitHub-hosted project, installable with Packer or other plugin managers.

Here's a cleaned-up, improved version of your README with:

* ✅ Correct Packer installation instructions
* ✅ Updated title and cleanup
* ✅ Removal of outdated "local plugin" references
* ✅ Ready to publish on GitHub as `recent_picker.nvim`

---

````markdown
# 📂 recent_picker.nvim

A **lightweight Neovim plugin** that tracks recently opened files across sessions and displays the **last 5** in a **Telescope picker** when triggered — optionally on startup.

Useful for jumping straight back into what you were working on last time.

---

## ✨ Features

- 📜 Tracks recently opened files using an autocommand.
- 🔍 Opens a Telescope-powered picker showing the 5 most recent files.
- 🧠 Persistent history across sessions (stored in `recent_files.txt`).
- ⚡ Keybinding or auto-popup on startup.
- 🪶 No external dependencies beyond `telescope.nvim`.

---

## 📦 Requirements

- Neovim 0.7+
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

---

## 🛠️ Installation

Use [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
  'your-username/recent_picker.nvim',
  requires = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require("recent_picker").setup()
  end
}
````

> 🔁 Replace `'your-username'` with your actual GitHub username.

You can also use other plugin managers like `lazy.nvim` or `vim-plug` with the correct GitHub path.

---

## 🔧 Setup

After installation, the plugin will automatically start tracking files.

If you want to call it manually, just require it:

```lua
require("recent_picker").setup()
```

---

## 🎯 Usage

### Manual Picker Call

```vim
:lua require("recent_picker").open_picker()
```

### Keybinding

Add this to your remaps file (e.g. `lua/tm/remap/init.lua`):

```lua
vim.keymap.set("n", "<leader>r", function()
  require("recent_picker").open_picker()
end, { desc = "Recent files picker" })
```

Now pressing `<leader>r` opens the list of recent files.

---

## ⚙️ Optional: Auto-Launch on Startup

To open the picker every time Neovim launches:

```lua
vim.defer_fn(function()
  require("recent_picker").open_picker()
end, 100)
```

Or modify your plugin’s `setup()` to include that line.

---

## 🗃️ How It Works

* Stores recent file paths in:
  `~/.local/share/nvim/recent_files.txt`
* History size: **50 files max**
* Picker shows: **last 5 readable files**
* Skips unreadable or duplicate entries

---

## 💡 Tips

* History updates on every file open (`BufReadPost`)
* To customize the number of files shown:

```lua
for i = 1, math.min(5, #files) do
```

* Can be combined with Harpoon or bookmarks.

---

## 🧪 Example Config Tree

Assuming a config like this:

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── tm/
│   │   ├── init.lua
│   │   ├── packer.lua
│   │   └── remap/init.lua
```

Just install the plugin via Packer and call `require("recent_picker").setup()` during setup.

---

## 🔄 Reload

Restart Neovim or run:

```vim
:luafile %
```

To reload your config.

---

## ✅ Future Ideas

* Sort by last opened timestamp
* Show file preview in picker
* Remove items from history
* Fallback UI with `vim.ui.select`

---

## 📄 License

MIT — do whatever you want with it.

---

## 📡 GitHub

Feel free to open issues, suggest improvements, or submit PRs:
[https://github.com/your-username/recent\_picker.nvim](https://github.com/your-username/recent_picker.nvim)

> Be sure to replace placeholder GitHub URLs with your actual ones!

```

---

### ✅ Final To-Do:

1. Replace `your-username` with your actual GitHub username in the code snippets and GitHub URL.
2. Add this to your repo as `README.md`.
3. (Optional but recommended): Add a `LICENSE` file (MIT is perfect for plugins).

---

Would you like me to generate a `LICENSE` file for you now?
```

