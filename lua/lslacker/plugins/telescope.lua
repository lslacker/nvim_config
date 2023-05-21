local setup, telescope = pcall(require, "telescope")

if not setup then
  return
end

local action_setup, actions = pcall(require, "telescope.actions")

if not action_setup then
  return
end
telescope.load_extension("fzf")
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      }
    }
  }
})


