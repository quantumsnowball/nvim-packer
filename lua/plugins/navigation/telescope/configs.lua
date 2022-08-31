local M = {}

M.defaults = {
    layout_strategy = 'vertical',
    layout_config = {
        vertical = {
            width = 0.85,
            preview_height = 0.65,
            preview_cutoff = 20
        }
    },
    mappings = {
        n = {
            o = 'toggle_all',
            p = require('telescope.actions.layout').toggle_preview,
            J = require('telescope.actions').cycle_history_next,
            K = require('telescope.actions').cycle_history_prev,
        },
        i = {
            ["<C-j>"] = require('telescope.actions').cycle_history_next,
            ["<C-k>"] = require('telescope.actions').cycle_history_prev,
            ["<Down>"] = require('telescope.actions').cycle_history_next,
            ["<Up>"] = require('telescope.actions').cycle_history_prev,
        },
    },
    sorting_strategy = 'ascending',
    scroll_strategy = 'limit',
    initial_mode = 'normal',
    border = true,
    dynamic_preview_title = true,
    prompt_prefix = '🔍 ',
    cache_picker = { num_pickers = 50 }
}

M.pickers = {
    find_files = { initial_mode = 'insert', },
    live_grep = { initial_mode = 'insert' },
    jumplist = { show_line = false },
    help_tags = { initial_mode = 'insert' },
    buffers = {
        layout_config = { width = 0.7, preview_height = 0.5, },
        mappings = { n = { x = "delete_buffer" } },
        sort_mru = true
    },
    current_buffer_fuzzy_find = { initial_mode = 'insert' },
    registers = { initial_mode = 'insert' },
    builtin = { layout_config = { preview_height = 0.4 } },
    vim_options = { initial_mode = 'insert' },
    colorscheme = { layout_config = { width = 0.2, height = 0.7 } },
    spell_suggest = { layout_config = { width = 0.2, height = 0.7 } },
    command_history = { layout_config = { width = 0.6 } },
    highlights = { layout_config = { width = 0.7 } },
    lsp_definitions = {
        jump_type = 'never',
        fname_width = 60,
        trim_text = true,
        layout_config = { preview_height = 0.73 }
    }
}

return M
