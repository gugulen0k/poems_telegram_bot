# frozen_string_literal: true

class AppConfigurator
  def initialize
    setup_database
  end

  def token
    @token ||= ENV['TELEGRAM_BOT_TOKEN']
  end

  def logger
    @logger ||= ActiveRecord::Base.logger = Logger.new($stdout, Logger::DEBUG)
  end

  private

  def setup_database
    DatabaseConnector.establish_connection
  end
end
