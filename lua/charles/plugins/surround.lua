return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}

-- 
-- 1 ys iw " add " 
-- 2 ds " to delete "
-- 3 ys t " to the specific character
