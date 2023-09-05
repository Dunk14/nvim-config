local present, html = pcall(require, "html")

if not present then
  return
end

html.setup {
  debug = true,
}
