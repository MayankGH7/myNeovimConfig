return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			styles = {
				transparency = false,
			},

			palette = {
				main = {
					base = "#000000"
				}
			}

		})
	end
}
