describe('xmlformat', function()
  it('can format', function()
    local ft = require('guard.filetype')
    ft('xml'):fmt('xmlformat')
    require('guard').setup()

    local formatted = require('test.formatter.helper').test_with('xml', {
      [[     <?xml version="1.0"?>]],
      [[<foo>]],
      [[<bar key="value">]],
      [[]],
      [[]],
      [[<baz><nested></nested></baz>     ]],
      [[          </bar>]],
      [[          </foo>]],
    })
    assert.are.same({
      [[<?xml version="1.0"?>]],
      [[<foo>]],
      [[ <bar key="value">]],
      [[  <baz>]],
      [[   <nested></nested>]],
      [[  </baz>]],
      [[ </bar>]],
      [[</foo>]],
    }, formatted)
  end)
end)
