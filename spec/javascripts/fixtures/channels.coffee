window.FIXTURES = {} if window.FIXTURES is undefined

FIXTURES.channel = (id = 1)->
  channel:
    id: id
    name: "Test"
    description: "Lorem Ipsum"
    permalink: "3-test-page"
    created_at: "2014-07-15T06:35:03.389-05:00"
    updated_at: "2014-07-15T06:35:03.389-05:00"
    image:
      image:
        url: null
        thumb:
          url: null

        large:
          url: null

        x_large:
          url: null

    video_embed_url: null
    video_url: null
    how_it_works: null
    how_it_works_html: null
    terms_url: "http://test.host/terms"
    state: "draft"
    user_id: 3432
    accepts_projects: true
    submit_your_project_text: null
    submit_your_project_text_html: null
    start_content: null
    start_hero_image:
      start_hero_image:
        url: null
        blur:
          url: null

    success_content: null,
    url: "http:/neighbor.ly/api/channels/1"
    html_url: "http://3-test-page.neighbor.ly/"

FIXTURES.channels = (page = 3)->
  channels: [FIXTURES.channel(1).channel, FIXTURES.channel(2).channel]
  meta:
    page: page
    total: 2
    total_pages: 10

