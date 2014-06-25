Konacha.configure do |config|
  # The directory where Konacha will look for tests.
  config.spec_dir     = "../../spec/javascripts"
  # You have to name your spec files example_spec or example_test by default.
  config.spec_matcher = /_spec\.|_test\./
  config.stylesheets  = %w(neighborly-dashboard-application)

  require 'capybara/poltergeist'
  config.driver = :poltergeist
end if defined?(Konacha)
