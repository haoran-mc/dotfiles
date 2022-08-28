local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("not find dashboard")
  return
end

db.custom_footer = {
  "",
  "",
  " As the last ship sailed towards the distant horizon",
  " I sat there watching on a rock                     ",
  " My mind slowly drifting away                       ",
  " Forming into my Dreamtale                          ",
}

db.custom_center = {
  {
    icon = "  ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Projects                            ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "Edit keybindings                    ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    icon = "  ",
    desc = "Edit Projects                       ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
  {
    icon = "  ",
    desc = "Edit .bashrc                        ",
    action = "edit ~/.bashrc",
  },
  {
    icon = "  ",
    desc = "Edit init.lua                       ",
    action = "edit ~/.config/nvim/init.lua",
  },
  {
    icon = "  ",
    desc = "Find file                           ",
    action = "Telescope find_files",
  },
  {
    icon = "  ",
    desc = "Find text                           ",
    action = "Telescopecope live_grep",
  },
  {
    icon = "  ",
    desc = "Change colorscheme                  ",
    action = "ChangeColorScheme",
  },
}

db.custom_header = {
  [[]],
  [[          ▀████▀▄▄              ▄█ ]],
  [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
  [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
  [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
  [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
  [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
  [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
  [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
  [[   █   █  █      ▄▄           ▄▀   ]],
}

db.custom_header = {
  [[]],
  [[ ████████╗ █████╗ ███╗   ██╗ ██████╗ ███████╗██████╗ ██╗███╗   ██╗███████╗███████╗██╗  ██╗██╗██████╗ ]],
  [[ ╚══██╔══╝██╔══██╗████╗  ██║██╔════╝ ██╔════╝██╔══██╗██║████╗  ██║██╔════╝██╔════╝██║  ██║██║██╔══██╗]],
  [[    ██║   ███████║██╔██╗ ██║██║  ███╗█████╗  ██████╔╝██║██╔██╗ ██║█████╗  ███████╗███████║██║██████╔╝]],
  [[    ██║   ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██╔══██╗██║██║╚██╗██║██╔══╝  ╚════██║██╔══██║██║██╔═══╝ ]],
  [[    ██║   ██║  ██║██║ ╚████║╚██████╔╝███████╗██║  ██║██║██║ ╚████║███████╗███████║██║  ██║██║██║     ]],
  [[    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝     ]],
  [[                                                                                                     ]],
  [[                                        [ version : 1.0.0 ]                                          ]],
  [[                                                                                                     ]],
  [[                                                                                                     ]],
  [[                                                                                                     ]],
}

db.custom_header = {
  [[]],
  [[]],
  [[]],
  [[]],
  [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
  [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
  [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
  [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
  [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
  [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  [[                                                   ]],
  [[                [ version : 1.0.0 ]                ]],
  [[                                                   ]],
  [[                                                   ]],
  [[                                                   ]],
  [[                                                   ]],
}
