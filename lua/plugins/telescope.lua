return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
            "nvim-lua/plenary.nvim",
            "jonarrien/telescope-cmdline.nvim",
        },
        opts = {
            extensions = {
                cmdline = {
                    -- Adjust telescope picker size and layout
                    picker = {
                        layout_config = {
                            width  = 60,
                            height = 15,
                        }
                    },
                    -- Adjust your mappings 
                    mappings = {
                        complete      = '<Tab>',
                        run_selection = '<CR>',
                        run_input     = '<CR>',
                    },
                },
            },
        },
		config = function(_, opts)
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

            require("telescope").setup(opts)
            require("telescope").load_extension("cmdline")
            vim.keymap.set("n", ":", "<cmd>Telescope cmdline<cr>")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					-- ui-select makes uis look more telescopey for consistency
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
