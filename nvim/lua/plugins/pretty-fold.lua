local status_ok, pretty_fold = pcall(require, 'pretty-fold')
if not status_ok then
  vim.notify("¿¿¿¿ pretty-fold")
  return
end

pretty_fold.setup {
   keep_indentation = false,
   -- fill_char = '¿',
   sections = {
      left = {
         '+', function() return string.rep('-', vim.v.foldlevel) end,
         ' ', 'number_of_folded_lines', ':', 'content',
      }
   }
}



