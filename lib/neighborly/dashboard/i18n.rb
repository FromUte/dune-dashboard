# This file was based on https://github.com/andrzejsliwa/ember-i18n-rails

require 'FileUtils' unless defined?(FileUtils)

module Neighborly::Dashboard
  module I18n
    extend self

    def config_file
      Neighborly::Dashboard::Engine.root.join('config/ember-i18n.yml')
    end

    def export_dir
      Neighborly::Dashboard::Engine.root.join('app/assets/javascripts/i18n')
    end

    def vendor_dir
      Neighborly::Dashboard::Engine.root.join('vendor/assets/javascripts/')
    end

    # Export translations to JavaScript, considering settings
    # from configuration file
    def export!
      puts "Exporting translations:\n"
      if config[:split]
        translations.keys.each do |locale|
          if translations[:en].nil?
            puts 'Missing english translation'
            exit
          end
          puts "\nLocale: #{locale}"
          fallback_english_hash = flat_hash(translations[:en])
          translations_hash = flat_hash(translations[locale])
          if locale != :en
            translations_hash.each do |key, value|
              english_fallback = fallback_english_hash[key]
              if value == nil || value == ""
                puts "  #{key} missing!"
                puts "     taking english default: '#{english_fallback}'"
                translations_hash[key] = english_fallback
              end
            end
          end
          save(translations_hash, File.join(export_dir, "translations_#{locale}.js"))
        end
      else
        save(flat_hash(translations), File.join(export_dir, 'translations.js'))
      end
    end

    def flat_hash(data, prefix = '', result = {})
      data.each do |key, value|
        current_prefix = prefix.present? ? "#{prefix}.#{key}" : key

        if !value.is_a?(Hash)
          result[current_prefix] = value.respond_to?(:stringify_keys) ? value.stringify_keys : value
        else
          flat_hash(value, current_prefix, result)
        end
      end

      result.stringify_keys
    end

    # Load configuration file for partial exporting and
    # custom output directory
    def config
      if config?
        (YAML.load_file(config_file) || {}).with_indifferent_access
      else
        {}
      end
    end

    # Check if configuration file exist
    def config?
      File.file? config_file
    end

    # Retrieve an updated JavaScript library from Github.
    def update!
      puts 'Downloading file...'
      FileUtils.mkdir_p(vendor_dir)
      require 'open-uri'
      i18n_contents = open('https://raw.github.com/jamesarosen/ember-i18n/master/lib/i18n.js').read
      File.open(File.join(vendor_dir, 'ember-i18n-source.js'), 'w+') {|f| f << i18n_contents}

      cldr_contents = open('https://raw.githubusercontent.com/jamesarosen/ember-i18n/master/vendor/cldr-1.0.0.js').read
      File.open(File.join(vendor_dir, 'cldr-1.0.0.js'), 'w+') {|f| f << cldr_contents}
      puts 'DONE!'
    end

    # Convert translations to JSON string and save file.
    def save(translations, file)
      file = ::Rails.root.join(file)
      FileUtils.mkdir_p File.dirname(file)

      variable_to_assign = config.fetch(:variable, 'Ember.I18n.translations')

      File.open(file, 'w+') do |f|
        f << variable_to_assign
        f << ' = '
        f << JSON.pretty_generate(translations).html_safe
        f << ';'
      end
    end

    # Initialize and return translations
    def translations
      ::I18n.load_path = default_locales_path
      ::I18n.backend.instance_eval do
        init_translations unless initialized?
        translations
      end
    end

    def default_locales_path
      Dir[Neighborly::Dashboard::Engine.root.join('config', 'locales', '*.yml').to_s]
    end
  end
end
