# frozen_string_literal: true

class MessageResponder
  attr_reader :message, :bot, :user

  def initialize(options)
    @bot     = options[:bot]
    @message = options[:message]
    @user    = User.find_or_create_by(telegram_id: message.from.id)
  end

  def respond
    on(%r{^/start}) do
      puts "here"
      answer_with_greeting_message
    end

    on(%r{^/stop}) do
      answer_with_farewell_message
    end
  end

  private

  def on(regex, &block)
    regex =~ message.text

    return unless $LAST_MATCH_INFO

    case block.arity
    when 0
      yield
    when 1
      yield ::Regexp.last_match(1)
    when 2
      yield ::Regexp.last_match(1), ::Regexp.last_match(2)
    end
  end

  def answer_with_greeting_message
    answer_with_message 'Hello'
  end

  def answer_with_farewell_message
    answer_with_message 'Bye'
  end

  def answer_with_message(text)
    MessageSender.new(bot: bot, chat: message.chat, text: text).send
  end
end
