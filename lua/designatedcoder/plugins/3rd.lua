return {
  "3rd/image.nvim",
  opts = {
    backend = "kitty", -- também aceita 'ueberzug', 'wezterm', etc.
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
      },
    },
  }
}

