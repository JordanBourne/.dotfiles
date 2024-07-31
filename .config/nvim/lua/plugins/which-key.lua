return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		require("which-key").setup()
		require("which-key").add({
			{ "<leader>d", group = "[D]ebugger" },
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>h", group = "[H]arpoon" },
			{ "<leader>t", group = "[T]test" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>w", group = "[W]orkspace" },
		})
		require("which-key.health").check()
	end,
}
