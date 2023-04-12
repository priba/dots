vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }")

local M = {}
M.load_options = function()
  local default_options = {
    termguicolors = true,
    mouse = "a",
    -- Proper search
    incsearch = true,
    hlsearch = true,                        -- highlight all matches on previous search pattern
    showmatch = true,
    ignorecase = true,                      -- ignore case in search patterns
    smartcase = true,                        -- smart case
    gdefault = true,
    -- Show problematic characters.
    list = true,                -- Show problematic characters.
    splitkeep = "topline", -- Stabilize the cursor position when creating/deleting horizontal splits
    backup = false,            -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 1,             -- space in the neovim command line for displaying messages
    colorcolumn = "99999",     -- fixes indentline for now
    completeopt = {
     	"menu",
     	"menuone",
      "noselect",
    -- 	"noinsert",
    },
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    foldlevel = 99,
    fillchars=fold:\ ,
    foldmethod = "expr",                     -- folding set to "expr" for treesitter based folding
    foldexpr = "nvim_treesitter#foldexpr()", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
    foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)),
    guioptions = "atI",
    guifont = "monospace:h17/",               -- the font used in graphical neovim applications
    hidden = true,                           -- required to keep multiple buffers and open multiple buffers
    pumheight = 10,                          -- pop up menu height
    showmode = true,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 1,                         -- only show tabs if there's more than one
    smartindent = true,                      -- make indenting smarter again
    -- Sane splits
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    title = true,                            -- set the title of window to the value of the titlestring
    titlestring = "%<%F%=%l/%L - nvim",      -- what the title of the window will be set to
    -- Permanent undo
    undodir = os.getenv("HOME") .. "/.vimdid", -- set an undo directory
    undofile = true,                         -- enable persistent undo
    updatetime = 250,                        -- faster completion
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
    -- Use wide tabs
    shiftwidth = 0
    softtabstop = -1
    expandtab = true
    tabstop = 4,                             -- insert 2 spaces for a tab
    -- Decent wildmenu
    wildmenu = true
    wildmode = "list:longest"
    wildignore = ".hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite"
    cursorline = true,                       -- highlight the current line
    number = true,                           -- set numbered lines
    relativenumber = true,                   -- set relative numbered lines
    numberwidth = 4,                         -- set number column width to 2 {default 4}
    signcolumn = "yes",                      -- always show the sign column otherwise it would shift the text each time
    wrap = true,                             -- display lines as one long line
    virtualedit = "onemore",                 --  allows block selections to operate across lines regardless of the underlying text
    spell = false,
    spelllang = "en",
    scrolloff = 8, -- is one of my fav
    sidescrolloff = 8,
    inccommand = "nosplit",
    lazyredraw = true,
  }

  ---  SETTINGS  ---

  vim.opt.shortmess:append("c")

  for k, v in pairs(default_options) do
    vim.opt[k] = v
  end
end

M.load_options()

return M
