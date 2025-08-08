

# 📂 recent_picker.nvim

A **lightweight Neovim plugin** that tracks recently opened files across sessions and displays the **last 5** in a **Telescope picker**.

Great for jumping straight back into what you were working on.

---

## ✨ Features

- 📜 Tracks recently opened files automatically.
- 🔍 Shows the 5 most recent files in a Telescope picker.
- 🧠 Persistent history across sessions.
- ⚡ Trigger manually, with a keybinding, or automatically on startup.
- 🪶 Minimal dependencies (`telescope.nvim` + `plenary.nvim`).

---

## 📦 Requirements

- Neovim **0.7+**
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

---

## 🛠️ Installation

Using **[packer.nvim](https://github.com/wbthomason/packer.nvim)**:

```lua
use {
  'TorrezMN/recent_picker.nvim',
  requires = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require("recent_picker").setup()
  end
}
````

Other plugin managers (like `lazy.nvim`) are also supported — just make sure to run `require("recent_picker").setup()` after loading.

---

## 🔧 Setup

After installing, the plugin will automatically start tracking recently opened files.

If you need to set it up manually (optional):

```lua
require("recent_picker").setup()
```

---

Great idea — it's very helpful to **explicitly mention which files users should edit** in their Neovim config. Below is the **updated Usage section** of your `README.md`, now with comments on **which files to update** in a typical Neovim config.

You can replace the current **Usage** section in your README with the following:

---

## 🎯 Usage

### ▶️ Manual Command

From Neovim’s command line:

```vim
:lua require("recent_picker").open_picker()
```

---

### 🎹 Keybinding Example

To bind the picker to `<leader>r`, add the following in your **keymap file**, typically:

> `~/.config/nvim/lua/-your file-/remap/init.lua` (or wherever you define your keymaps)

```lua
vim.keymap.set("n", "<leader>r", function()
  require("recent_picker").open_picker()
end, { desc = "Open recent files picker" })
```

---

### ⚙️ Plugin Setup

Make sure `recent_picker` is initialized. Add this to your plugin config or main init module:

> `~/.config/nvim/lua/-your file-/init.lua` or `~/.config/nvim/init.lua`

```lua
require("recent_picker").setup()
```

---

### 🚀 Auto-Launch on Startup (Optional)

To automatically show the picker on startup, add this anywhere after setup (same file as above):

```lua
vim.defer_fn(function()
  require("recent_picker").open_picker()
end, 100)
```



---

## ⚙️ Optional: Auto-Open on Startup

To show the recent file picker automatically when Neovim starts:

```lua
vim.defer_fn(function()
  require("recent_picker").open_picker()
end, 100)
```

---

## 📁 How It Works

* Saves file history to:
  `~/.local/share/nvim/recent_files.txt`
* Maintains the **last 50** opened files
* Filters out duplicates and unreadable files
* Only shows the **5 most recent** by default

---

## 🧠 Tips

* You can change how many files are shown by modifying this line:

```lua
for i = 1, math.min(5, #files) do
```

* This plugin pairs well with `harpoon.nvim` or project session tools.

---

## 🧪 Example Neovim Config Layout

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── -your file-/
│   │   ├── init.lua
│   │   ├── packer.lua
│   │   └── remap/init.lua
```

Just ensure your plugin manager installs `recent_picker.nvim` and calls `setup()`.

---

## 🔄 Reload or Update

After making changes to your config or the plugin:

```vim
:PackerSync
:luafile %
```

---

## ✅ Future Ideas

* ⏳ Sort files by last access time
* 🖼️ File preview inside picker
* 🧹 Option to clear/remove items from history
* 🪄 Use `vim.ui.select` as fallback for non-Telescope users

---

## 📄 License

MIT License — feel free to use, modify, or contribute.

---

## 🌍 GitHub

[https://github.com/your-username/recent\_picker.nvim](https://github.com/your-username/recent_picker.nvim)

---


