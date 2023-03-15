-- if lvim.colorscheme == "darkplus" then
--   lvim.builtin.treesitter.rainbow = {
--     enable = true,
--     extended_mode = false,
--     colors = {
--       "DodgerBlue",
--       "Orchid",
--       "Gold",
--     },
--     disable = { "html" },
--   }
-- end

lvim.builtin.treesitter.ensure_installed = { "javascript" }
lvim.builtin.treesitter.autotag.enable = true -- This line enables automatic closing of HTML/XML tags in insert mode when the opening angle bracket < is typed.
lvim.builtin.treesitter.auto_install = false  -- This line disables automatic installation of Treesitter parsers for languages that are not already installed. If you open a file in a language for which a parser is not installed, you will be prompted to manually install it.

-- lvim.builtin.treesitter.ignore_install = { "markdown" }

lvim.builtin.treesitter.textobjects = {
  select = {
    enable = true,
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["at"] = "@class.outer",
      ["it"] = "@class.inner",
      ["ac"] = "@call.outer",
      ["ic"] = "@call.inner",
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["ai"] = "@conditional.outer",
      ["ii"] = "@conditional.inner",
      ["a/"] = "@comment.outer",
      ["i/"] = "@comment.inner",
      ["ab"] = "@block.outer",
      ["ib"] = "@block.inner",
      ["as"] = "@statement.outer",
      ["is"] = "@scopename.inner",
      ["aA"] = "@attribute.outer",
      ["iA"] = "@attribute.inner",
      ["aF"] = "@frame.outer",
      ["iF"] = "@frame.inner",
    },
  },
}
