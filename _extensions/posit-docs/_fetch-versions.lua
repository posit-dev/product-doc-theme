-- Fetch supported versions at build time and inject into HTML
function Meta(meta)
  if quarto.doc.is_format("html") then
    local product = "connect" -- TODO: make this configurable

    -- Use curl to fetch the supported versions page
    local handle = io.popen('curl -s https://docs.posit.co/supported-versions/' .. product .. '.html')
    local html = handle:read("*a")
    handle:close()

    -- Parse version numbers from the support table
    local versions = {}
    local seen = {}
    for version in html:gmatch('<td style="text%-align: left;">(%d%d%d%d%.%d%d)</td>') do
      -- Only add unique versions
      if not seen[version] then
        seen[version] = true
        table.insert(versions, {
          version = version,
          url = 'https://docs.posit.co/' .. product .. '/' .. version .. '/'
        })
      end
    end

    -- Create JSON array
    local json_versions = '['
    for i, v in ipairs(versions) do
      if i > 1 then json_versions = json_versions .. ',' end
      json_versions = json_versions .. '{"version":"' .. v.version .. '","url":"' .. v.url .. '"}'
    end
    json_versions = json_versions .. ']'

    -- Inject as raw HTML in header-includes
    if not meta['header-includes'] then
      meta['header-includes'] = pandoc.List()
    end

    meta['header-includes']:insert(
      pandoc.RawBlock('html', '<script>window.POSIT_VERSIONS = ' .. json_versions .. ';</script>')
    )
  end

  return meta
end
