fx_version("cerulean")
game("gta5")

author("Pulse")
version("1.2")
lua54("yes")

escrow("yes")
ui_page("web/index.html")

files({
  "web/index.html",
  "web/assets/*",
  "web/logo.png",
})

client_scripts({
  "client/cl_*.lua",
})

dependency("/assetpacks")

dependency '/assetpacks'