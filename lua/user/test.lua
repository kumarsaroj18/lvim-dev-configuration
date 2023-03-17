local dap = require "dap"
dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { "~/.local/share/nvim/dapinstall/jsnode/vscode-node-debug2/out/src/nodeDebug.js" },
}

-- require("jester").setup {
--   cmd = "./node_modules/.bin/jest '$result' -- -t $file", -- run command
--   identifiers = { "test", "it" }, -- used to identify tests
--   prepend = { "describe" }, -- prepend describe blocks
--   expressions = { "call_expression" }, -- tree-sitter object used to scan for tests/describe blocks
--   path_to_jest_run = "jest", -- used to run tests
--   path_to_jest_debug = "./node_modules/.bin/jest", -- used for debugging
--   terminal_cmd = ":vsplit | terminal", -- used to spawn a terminal for running tests, for debugging refer to nvim-dap's config
--   dap = {
--     -- debug adapter configuration
--     type = "node2",
--     request = "launch",
--     cwd = vim.fn.getcwd(),
--     runtimeArgs = { "--inspect-brk", "$path_to_jest", "--no-coverage", "-t", "$result", "--", "$file" },
--     args = { "--no-cache" },
--     sourceMaps = true,
--     protocol = "inspector",
--     skipFiles = { "<node_internals>/**/*.js" },
--     console = "integratedTerminal",
--     port = 9229,
--     disableOptimisticBPs = true,
--   },
-- }

require("nvim-test").setup {
  run = true, -- run tests (using for debug)
  commands_create = true, -- create commands (TestFile, TestLast, ...)
  filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
  silent = false, -- less notifications
  term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
  termOpts = {
    direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
    width = 96, -- terminal's width (for vertical|float)
    height = 24, -- terminal's height (for horizontal|float)
    go_back = false, -- return focus to original window after executing
    stopinsert = "auto", -- exit from insert mode (true|false|"auto")
    keep_one = true, -- keep only one terminal for testing
  },
  runners = {
    -- setup tests runners
    cs = "nvim-test.runners.dotnet",
    go = "nvim-test.runners.go-test",
    haskell = "nvim-test.runners.hspec",
    javascriptreact = "nvim-test.runners.jest",
    javascript = "nvim-test.runners.jest",
    lua = "nvim-test.runners.busted",
    python = "nvim-test.runners.pytest",
    ruby = "nvim-test.runners.rspec",
    rust = "nvim-test.runners.cargo-test",
    typescript = "nvim-test.runners.jest",
    typescriptreact = "nvim-test.runners.jest",
  },
}

package.path = package.path .. ";~/.local/share/lunarvim/site/pack/packer/start/nvim-test/lua/nvim-test/runners/jest.lua"
local jest_runner = require('nvim-test.runners.jest')
jest_runner.setup {
  command = "~/node_modules/.bin/jest", -- a command to run the test runner
  args = { "--collectCoverage=false" }, -- default arguments
  env = { CUSTOM_VAR = "value" }, -- custom environment variables

  file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$", -- determine whether a file is a testfile
  find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" }, -- find testfile for a file

  filename_modifier = nil, -- modify filename before tests run (:h filename-modifiers)
  working_directory = nil, -- set working directory (cwd by default)
}
