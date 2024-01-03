# frozen_string_literal: true

class DatabaseConnector
  class << self
    def establish_connection
      ActiveRecord::Base.establish_connection(config)
    end

    private

    def database_config_path
      'config/database.yml'
    end

    def config
      config_path     = File.expand_path(database_config_path)
      yaml_content    = ERB.new(File.read(config_path)).result
      database_config = YAML.safe_load(yaml_content, aliases: true)

      database_config[ENV['RACK_ENV'] || 'development']
    end
  end
end
