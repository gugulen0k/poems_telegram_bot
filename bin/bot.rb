#!/usr/bin/env ruby
# frozen_string_literal: true

require './config/application'

Config.logger.debug 'Starting telegram bot'

bot = Telegram::Bot::Client.new(Config.token)

Signal.trap('INT') do
  bot.stop
end

bot.listen do |message|
  options = {
    bot:     bot,
    message: message
  }

  Config.logger.debug "@#{message.from.username}: #{message.text}"
  MessageResponder.new(options).respond
end
