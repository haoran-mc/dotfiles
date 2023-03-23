local status, temp = pcall(require, "template")

if not status then
    vim.notify("template no found!")
    return
end

temp.temp_dir = "~/.config/nvim/template"
temp.author = "Haoran Liu"
temp.email = "haoran.mc@outlook.com"
