window.FIXTURES = {} if window.FIXTURES is undefined

FIXTURES.press_asset = (id = 1)->
  press_asset:
    id: id
    title: "Foo Bar"
    url: 'http://bar.foo'
    image_url: 'http://bar.foo/image.jpg'

FIXTURES.press_assets = (page = 3)->
  press_assets: [FIXTURES.press_asset(1).press_asset, FIXTURES.press_asset(2).press_asset]
  meta:
    page: page
    total: 2
    total_pages: 10
