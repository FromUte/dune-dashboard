window.FIXTURES = {} if window.FIXTURES is undefined

FIXTURES.project = (id = 1)->
  project:
    id: id
    about: "“Beacons” is a mobile application that will change the way emergencies are reported and how they are responded to. With this app the user will be able to report an emergency and post their location on a map for surrounding users and public safety officials to see, all in real time. The user will also be able to put different annotations on each post, or “beacon,” such as setting urgency level and the type of emergency.\n\nBy creating a mobile application that allows instant access to the type of emergency and where the situation is occurring the community can potentially become a much safer place. On initiation the user will be faced with two options. A half of the screen will be dedicated to a “red alert” or “high urgency” situation. From there if the user is capable they will be given the option to describe the situation they are in. For example if medical or fire fighting assistance is needed, if they witnessed or are the victim of a crime, etc. This will be comparable to calling 911.\n\nThe second half of the screen will be dedicated to other emergencies that don’t necessarily require immediate attention. The user will click this second half and then be posed with more options concerning the “beacon” they wish to post. There will be a number of options here, whether it is automotive assistance, if you are lost on campus, if you feel like there is a threat to your safety, if you wish to warn fellow users to a threatening situation, report a public disturbance, even if you simply need to borrow someone’s phone charger.\n\nI plan on providing this as a public service to anyone who wants to put it to use, with an emphasis on college campuses."
    about_html: "<p>“Beacons” is a mobile application that will change the way emergencies are reported and how they are responded to. With this app the user will be able to report an emergency and post their location on a map for surrounding users and public safety officials to see, all in real time. The user will also be able to put different annotations on each post, or “beacon,” such as setting urgency level and the type of emergency.</p>\n\n<p>By creating a mobile application that allows instant access to the type of emergency and where the situation is occurring the community can potentially become a much safer place. On initiation the user will be faced with two options. A half of the screen will be dedicated to a “red alert” or “high urgency” situation. From there if the user is capable they will be given the option to describe the situation they are in. For example if medical or fire fighting assistance is needed, if they witnessed or are the victim of a crime, etc. This will be comparable to calling 911.</p>\n\n<p>The second half of the screen will be dedicated to other emergencies that don’t necessarily require immediate attention. The user will click this second half and then be posed with more options concerning the “beacon” they wish to post. There will be a number of options here, whether it is automotive assistance, if you are lost on campus, if you feel like there is a threat to your safety, if you wish to warn fellow users to a threatening situation, report a public disturbance, even if you simply need to borrow someone’s phone charger.</p>\n\n<p>I plan on providing this as a public service to anyone who wants to put it to use, with an emphasis on college campuses.</p>\n"
    address_city: "Kansas City"
    address_neighborhood: ""
    address_state: "MO"
    address_zip_code: null
    budget: ""
    budget_html: ""
    campaign_type: "flexible"
    category_id: 3
    created_at: "2012-10-25T18:43:30+00:00"
    expires_at: null
    featured: false
    goal: "5000.0"
    hash_tag: "beacons"
    headline: "“Beacons” is a mobile application that will change the way emergencies are reported and how they are responded to."
    hero_image:
      hero_image:
        url: null
        blur:
          url: null

    home_page: null
    more_links: null
    name: "Beacons: Public Safety Mobile Application"
    online_date: null
    online_days: 0
    organization_type: null
    permalink: "beacons"
    pledged: "0.0"
    recommended: false
    short_url: "http://www.dune-investissement/beacons"
    site: ""
    state: "draft"
    street_address: null
    terms: ""
    terms_html: ""
    uploaded_image:
      uploaded_image:
        url: "/uploads/dune/api/project/uploaded_image/27/Beacons.jpg"
        project_thumb:
          url: "/uploads/dune/api/project/uploaded_image/27/project_thumb_Beacons.jpg"

        project_thumb_small:
          url: "/uploads/dune/api/project/uploaded_image/27/project_thumb_small_Beacons.jpg"

        project_thumb_large:
          url: "/uploads/dune/api/project/uploaded_image/27/project_thumb_large_Beacons.jpg"

        project_thumb_facebook:
          url: "/uploads/dune/api/project/uploaded_image/27/project_thumb_facebook_Beacons.jpg"

    video_embed_url: "http://player.vimeo.com/video/30922066"
    video_thumbnail:
      video_thumbnail:
        url: "/uploads/dune/api/project/video_thumbnail/27/open-uri20130911-76045-186aa7p"
        project_thumb:
          url: "/uploads/dune/api/project/video_thumbnail/27/project_thumb_open-uri20130911-76045-186aa7p"

        project_thumb_small:
          url: "/uploads/dune/api/project/video_thumbnail/27/project_thumb_small_open-uri20130911-76045-186aa7p"

        project_thumb_large:
          url: "/uploads/dune/api/project/video_thumbnail/27/project_thumb_large_open-uri20130911-76045-186aa7p"

        project_thumb_facebook:
          url: "/uploads/dune/api/project/video_thumbnail/27/project_thumb_facebook_open-uri20130911-76045-186aa7p"

    video_url: "http://vimeo.com/30922066"
    channel_id: null
    rights:
      can_approve: true
      can_launch: true
      can_reject: true
      can_push_to_draft: true
      can_push_to_trash: true

    url: "http://localhost:3000/api/projects/27"
    html_url: "http://localhost:3000/projects/beacons"
    user:
      id: 335
      bio: "Husband. Kansas Citian. Fan of cities."
      created_at: "2013-09-11T03:00:39+00:00"
      email: "admin@dune-investissement.com"
      facebook_url: ""
      linkedin_url: "http://www.linkedin.com/pub/sean-connolly/29/7b3/3b7"
      other_url: ""
      profile_type: "personal"
      twitter_url: "http://twitter.com/snconnolly"
      name: "Sean Connolly"
      image_url: "/uploads/user/uploaded_image/335/thumb_avatar_Avatar.jpeg"
      total_contributed: "155.0"
      admin: true
      url: "http://localhost:3000/api/users/335"
      html_url: "http://localhost:3000/neighbors/335-sean-connolly"

FIXTURES.projects = (page = 3)->
  projects: [FIXTURES.project(1).project, FIXTURES.project(2).project]
  meta:
    page: page
    total: 2
    total_pages: 10

