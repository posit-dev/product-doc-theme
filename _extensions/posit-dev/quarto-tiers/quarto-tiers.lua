--[[
# MIT License
#
# Copyright (c) Posit Software, PBC
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
]]

-- Map version_text to badge CSS class
local badge_classes = {
  Basic = 'badge-basic',         -- posit dark teal
  Enhanced = 'badge-enhanced',   -- posit light blue
  Advanced = 'badge-advanced',   -- posit dark blue
  Workbench = 'badge-wb',        -- posit burgundy
  Preview = 'badge-preview',     -- posit darkened orange
  Beta = 'badge-beta',           -- posit dark yellow
  ["Pro Drivers"] = 'badge-drivers',  
}

-- Utility to resolve metadata override
local function resolve_meta_value(meta, version_text, key)
  if meta["quarto-tiers"] then
    if meta["quarto-tiers"][key] then
      return pandoc.utils.stringify(meta["quarto-tiers"][key])
    end
    if meta["quarto-tiers"][version_text] and meta["quarto-tiers"][version_text][key] then
      return pandoc.utils.stringify(meta["quarto-tiers"][version_text][key])
    end
  end
  return ""
end

function render_tier(args, kwargs, meta)
  if not quarto.doc.is_format("html") then return nil end

  quarto.doc.add_html_dependency({
    name = 'quarto-tiers',
    stylesheets = {"quarto-tiers.css"}
  })
  
  -- Handle multi-word tiers
  local all_args = {}
  for i, arg in ipairs(args) do
    table.insert(all_args, pandoc.utils.stringify(arg))
  end
  local version_text = table.concat(all_args, " ")

  -- special case for root icon
  if version_text == "root" then
    return pandoc.RawInline(
      "html",
      '<i class="bi bi-shield-lock" data-bs-toggle="tooltip" data-bs-placement="top" title="Requires root"></i>'
    )
  end

  -- CSS class assignment
  local css_class = badge_classes[version_text] or 'badge-alt'
  -- Handle special case for Pro Drivers
  if version_text == "Pro Drivers" then
    css_class = 'badge-drivers'
  end

  -- Optional inline style
  local style = pandoc.utils.stringify(kwargs['style'])
  local style_text = (style ~= "") and (' style="' .. style .. '"') or ""

  -- Title (explicit > global > version-specific)
  local title = pandoc.utils.stringify(kwargs['title'])
  if title == "" then
    title = resolve_meta_value(meta, version_text, "title")
  end
  local title_text = (title ~= "") and (' title="' .. title .. '"') or ""

  -- URL (explicit > global > version-specific)
  local url = pandoc.utils.stringify(kwargs['url'])
  if url == "" then
    url = resolve_meta_value(meta, version_text, "url")
  end

  -- Final HTML construction
  local tag, link_text, nav_class = "span", "", ""
  if url ~= "" then
    tag = "a"
    link_text = ' href="' .. url .. '"'
    nav_class = " no-external"
  end

  local class_text = ' class="badge ' .. css_class .. nav_class .. '"'

  return pandoc.RawInline(
    'html',
    '<' .. tag .. link_text .. title_text .. class_text .. style_text .. '>' ..
    version_text ..
    '</' .. tag .. '>'
  )
end

return {
  ['tier'] = render_tier,
  ['requirement'] = render_tier,
  ['status'] = render_tier
}