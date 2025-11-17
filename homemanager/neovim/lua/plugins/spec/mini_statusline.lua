return {
	'nvim-mini/mini.statusline',
	version = '*',
	enabled = false,
	config = function()
		require('plugins.config.mini_statusline')
	end
}
