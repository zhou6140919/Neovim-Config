local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.custom_footer = {
  "",
  "",
  "https://github.com/zhou6140919",
}

db.custom_center = {
  {
    icon = "  ",
    desc = "Projects                            ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Edit keybindings                    ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    icon = "  ",
    desc = "Edit .bashrc                        ",
    action = "edit ~/.zshrc",
  },
  {
    icon = "  ",
    desc = "Change colorscheme                  ",
    action = "ChangeColorScheme",
  },
  {
    icon = "  ",
    desc = "Edit init.lua                       ",
    action = "edit ~/.config/nvim/init.lua",
  },
  -- {
  --   icon = "  ",
  --   desc = "Find file                           ",
  --   action = "Telescope find_files",
  -- },
  -- {
  --   icon = "  ",
  --   desc = "Find text                           ",
  --   action = "Telescopecope live_grep",
  -- },
}


db.custom_header = {
  [[]],	
  [[     ██╗ ██████╗      ██╗ ██████╗ ]],
  [[     ██║██╔═══██╗     ██║██╔═══██╗]],
  [[     ██║██║   ██║     ██║██║   ██║]],
  [[██   ██║██║   ██║██   ██║██║   ██║]],
  [[╚█████╔╝╚██████╔╝╚█████╔╝╚██████╔╝]],
  [[ ╚════╝  ╚═════╝  ╚════╝  ╚═════╝ ]],
  [[        [ version : 1.0.0 ]       ]],
  [[]],
  [[]],
}
