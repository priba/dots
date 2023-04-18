local parsers = require("nvim-treesitter.parsers")
local enabled_list = { "clojure", "fennel", "commonlisp", "query", "scheme" }

return {
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
        },
        event = { "BufReadPre", "BufNewFile" },
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("nvim-treesitter.configs").setup {
                context_commentstring = {
                    enable = true,
                },
                ensure_installed = {
                    "c", "lua", "vim",
                    "help", "rust", "python",
                    "bash", "cmake", "cpp",
                    "dockerfile", "dot", "diff",
                    "git_rebase", "gitattributes", "gitcommit",
                    "gitignore", "toml", "yaml", "json"
                },
                rainbow = {
                    enable = true,
                    -- Enable only for lisp like languages
                    disable = vim.tbl_filter(function(p)
                        local disable = true
                        for _, lang in pairs({ "clojure", "fennel", "commonlisp", "query", "scheme" }) do
                            if p == lang then
                                disable = false
                            end
                        end
                        return disable
                    end, require("nvim-treesitter.parsers").available_parsers()),
                },
                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                textobjects = {
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<C-l>"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<C-h>"] = "@parameter.inner",
                        },
                    },
                    select = {
                        enable = true,
                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["of"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["oc"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]F"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                },
            }
        end
    },
    -- Treesitter Context
    {
        "nvim-treesitter/nvim-treesitter-context",
        after = "nvim-treesitter",
        config = function()
            require("nvim-treesitter-context").setup {
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                patterns = {
                        -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        "class",
                        "function",
                        "method",
                        "for",
                        "while",
                        "if",
                        "switch",
                        "case",
                    },
                    -- Patterns for specific filetypes
                    -- If a pattern is missing, *open a PR* so everyone can benefit.
                    tex = {
                        "chapter",
                        "section",
                        "subsection",
                        "subsubsection",
                    },
                    rust = {
                        "impl_item",
                        "struct",
                        "enum",
                    },
                    scala = {
                        "object_definition",
                    },
                    vhdl = {
                        "process_statement",
                        "architecture_body",
                        "entity_declaration",
                    },
                    markdown = {
                        "section",
                    },
                    elixir = {
                        "anonymous_function",
                        "arguments",
                        "block",
                        "do_block",
                        "list",
                        "map",
                        "tuple",
                        "quoted_content",
                    },
                    json = {
                        "pair",
                    },
                    yaml = {
                        "block_mapping_pair",
                    },
                },
                exact_patterns = {
                    -- Example for a specific filetype with Lua patterns
                    -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
                    -- exactly match "impl_item" only)
                    -- rust = true,
                },

                -- [!] The options below are exposed but shouldn't require your attention,
                --     you can safely ignore them.

                zindex = 20, -- The Z-index of the context window
                mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
            }
        end
    },
}
