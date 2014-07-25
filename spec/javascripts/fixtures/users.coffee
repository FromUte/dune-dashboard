window.FIXTURES = {} if window.FIXTURES is undefined

FIXTURES.user = (id = 1)->
  user:
    id: id
    bio: null
    created_at: "2014-07-04T12:42:41+00:00"
    email: "foo@bar.name"
    facebook_url: null
    linkedin_url: null
    other_url: null
    profile_type: "personal"
    twitter_url: null
    name: "Foo Bar"
    image_url: "http://neighbor.ly/uploads/user/uploaded_image/18/thumb_avatar_image.jpg"
    total_contributed: "70.0"
    admin: false
    url: "http://neighbor.ly/api/contributions/18"
    html_url: "http://neighbor.ly/neighbors/18-mrs-abigayle-gaylord"

FIXTURES.users = (page = 3)->
  users: [FIXTURES.user(1).user, FIXTURES.user(2).user]
  meta:
    page: page
    total: 2
    total_pages: 10
