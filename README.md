Absolutely — here's a complete, clean **`README.md`** file you can drop into your `recent_picker` folder or into a GitHub repo if you decide to publish it later.

---

# 📂 recent\_picker.nvim

A **lightweight Neovim plugin** that tracks recently opened files across sessions and displays the **last 5** in a **Telescope picker** when triggered — optionally on startup.

Useful for jumping straight back into what you were working on last time.

---

## ✨ Features

* 📜 Tracks recently opened files using an autocmd.
* 🔍 Opens a Telescope-powered picker showing the 5 most recent files.
* 🧠 Persistent history across sessions (stored in `recent_files.txt`).
* ⚡ Keybinding or auto-popup on startup.
* 🪶 No external dependencies beyond `telescope.nvim`.

---

## 📦 Requirements

* Neovim 0.7+
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
* [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

---

## 🛠️ Installation

Since this is a local plugin (not from GitHub), you don’t need Packer to install it.

You **don’t** need to `use` it in Packer like this ❌:

```lua
use '~/config/nvim/lua/recent_picker' -- ❌ don't do this
```

Instead, just place the plugin code in your config:

```
~/.config/nvim/lua/recent_picker/init.lua
```

And then call it from your config.

---

## 🔧 Setup

In your Neovim config (e.g. `~/.config/nvim/lua/tm/init.lua` or similar), add:

```lua
require("recent_picker").setup()
```

This sets up the file tracking via autocommand.

---

## 🎯 Usage

You can call the picker manually from Lua or map a key:

### Manual:

```vim
:lua require("recent_picker").open_picker()
```

### Keybinding:

Add this to your remaps file (`lua/tm/remap/init.lua` or wherever you manage keymaps):

```lua
vim.keymap.set("n", "<leader>r", function()
  require("recent_picker").open_picker()
end, { desc = "Recent files picker" })
```

Now you can press `<leader>r` to open the list.

---

## ⚙️ Optional: Auto-Launch on Startup

To show the picker every time you open Neovim, add this to your `setup()` function (or after `require("recent_picker").setup()`):

```lua
vim.defer_fn(function()
  require("recent_picker").open_picker()
end, 100)
```

Or modify the `setup()` function inside `recent_picker/init.lua` to include that line.

---

## 🗃️ How it works

* Stores recent file paths in:
  `~/.local/share/nvim/recent_files.txt`
* Max history size: **50**
* Picker shows: **last 5** valid entries
* Skips non-readable files and duplicates

---

## 💡 Tips

* History updates on each file opened (`BufReadPost`)
* Customize how many files are shown by modifying this line in `open_picker()`:

```lua
for i = 1, math.min(5, #files) do
```

* You can also integrate this with Harpoon or bookmarks if desired.

---

## 🧪 Example Tree Setup

Assuming this Neovim config structure:

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── tm/
│   │   ├── init.lua
│   │   ├── packer.lua
│   │   ├── remap/init.lua
│   └── recent_picker/
│       └── init.lua
```

Just make sure `require("recent_picker")` is called somewhere in your startup.

---

## 🔄 To Reload

After setup, restart Neovim or reload your config:

```vim
:luafile %
```

---

## ✅ Future Ideas

* Sort by last opened timestamp
* Show file preview in picker
* Delete entries from history
* Combine with `vim.ui.select` for minimal UI fallback

---

## 📄 License

MIT — do whatever you want with it.

---

Let me know if you want a version that includes screenshots or turns this into a GitHub-ready plugin template.

# nvim_recent_file_picker
