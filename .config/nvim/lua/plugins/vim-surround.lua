-- Surround Text Objects Plugin
-- Easily add, change, and delete surrounding characters/tags
-- Features:
--   - Add surroundings: ys + motion + char (e.g., ysiw" surrounds word with quotes)
--   - Change surroundings: cs + old + new (e.g., cs"' changes " to ')
--   - Delete surroundings: ds + char (e.g., ds" removes quotes)
--   - Works with brackets, quotes, HTML tags, and custom characters
-- Examples:
--   ysiw) - Surround word with parentheses
--   cs]} - Change surrounding [ to }
--   dst - Delete surrounding HTML tag
return {
  "tpope/vim-surround",
}
