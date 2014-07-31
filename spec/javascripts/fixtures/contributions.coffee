window.FIXTURES = {} if window.FIXTURES is undefined

FIXTURES.contribution = (id = 1)->
  contribution:
    id: id
    #project_id: 1
    user_id: 1
    #reward_id: 226
    value: "25.0"
    confirmed_at: null
    created_at: "2014-01-14T16:32:36.324-06:00"
    anonymous: false
    key: "e624ea64c2a7fc85e15b70cdf9e83fc9"
    credits: false
    payment_method: null
    payment_token: null
    payment_id: null
    address_street: null
    address_number: null
    address_complement: null
    address_neighborhood: null
    address_zip_code: null
    address_city: null
    address_state: null
    address_phone_number: null
    payment_choice: null
    payment_service_fee: "0.0"
    state: "pending"
    short_note: ""
    payment_service_fee_paid_by_user: false
    matching_id: null
    rights:
      can_pendent: true
      can_wait_confirmation: false
      can_confirm: true
      can_cancel: true
      can_request_refund: false
      can_refund: false
      can_push_to_trash: true

FIXTURES.contributions = (page = 3)->
  contributions: [FIXTURES.contribution(1).contribution, FIXTURES.contribution(2).contribution]
  meta:
    page: page
    total: 2
    total_pages: 10
