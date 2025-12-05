return {
  "olimorris/codecompanion.nvim",
  -- config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function ()
      local autocompanion = require("codecompanion")
      autocompanion.setup({
        adapters = {
          opts = {
            allow_insecure = true,
            proxy="socks5://localhost:8080",
          },
          gemini = function ()
              return require("codecompanion.adapters").extend("gemini", {
                  env = {
                    api_key = "AIzaSyAdWgXZeTs-uRc0YycwScKQ2xG1cPOh5nY"
                  },
                  schema = {
                    model = {
                      default="models/gemini-2.0-flash"
                    }
                  }
              })
          end,
        },
        display = {
          action_palette = {
            border = "rounded",
            width = 85,
            height = 10,
            prompt = "Prompt",
            provider = "default",
            opts = {
              show_default_actions = true,
              show_default_prompt_library = true
            }
          },
          diff = {
            enabled = true,
            close_chat_at = 240,
            layout = "vertical",
            opts = {"internal", "filler", "closeoff", "algo"},
            provider="default"
          }
        },
        strategies = {
          chat = {
            adapter = "gemini"
          },
          inline = {
            adapter = "gemini"
          },
          cmd = {
            adapter = "gemini"
          }
        },
      })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>aa", "<cmd> CodeCompanionAction<cr>", { noremap = true, silent = true, desc = "Code companion action" })
    keymap.set("n", "<leader>ac", "<cmd> CodeCompanionChat<cr>", { noremap = true, silent = true, desc = "Code companion chat add" })
  end

}
