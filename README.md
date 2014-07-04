# Neighborly::Dashboard

[![Build Status](https://travis-ci.org/neighborly/neighborly-dashboard.svg?branch=master)](https://travis-ci.org/neighborly/neighborly-dashboard)

## What

This is the implementation of [Neighborly](https://github.com/neighborly/neighborly)'s Dashboard. It is built using [Ember.js](http://emberjs.com) on top of a Rails Engine.

## How

Include this gem as dependency of your project, adding the following line in your `Gemfile`.

```ruby
# Gemfile
gem 'neighborly-dashboard'
```

Neighborly::Dashboard is a Rails Engine, integrating with your (Neighborly) Rails application with very little of effort. To turn the engine on, mount it in an appropriate route:

```ruby
# config/routes.rb
mount Neighborly::Dashboard::Engine => '/dashboard/', as: :neighborly_dashboard
```

## Contributing

1. Fork it ( https://github.com/neighborly/neighborly-dashboard/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

### Running specs

We prize for our test suite and coverage, so it would be great if you could run the specs to ensure that your patch is not breaking the existing codebase.

```
$ bundle install
```

To run the specs just run:

```
$ bundle exec spec
```

or you can start a server to run the specs:

```
$ bundle exec spec:serve
```

### I18n

We use [ember-i18n](https://github.com/jamesarosen/ember-i18n) for internationalization in the Ember application, but we write the translations in a [YAML](http://en.wikipedia.org/wiki/YAML) file. To export the translations from YAML to Javascript we have a rake task to do that.

```
$ bundle exec rake i18n:export
```

## License

Licensed under the [MIT license](LICENSE.txt).