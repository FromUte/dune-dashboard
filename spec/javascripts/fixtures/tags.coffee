window.FIXTURES = {} if window.FIXTURES is undefined

FIXTURES.tag = (id = 1)->
  tag:
    id: id
    name: "cycling"
    total_projects: 0
    visible: true

FIXTURES.tags = (page = 3)->
  tags: [FIXTURES.tag(1).tag, FIXTURES.tag(2).tag]
  meta:
    page: page
    total: 2
    total_pages: 10
