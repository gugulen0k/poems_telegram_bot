# frozen_string_literal: true

class MessageSender
  attr_reader :bot, :text, :chat, :answers

  def initialize(options)
    @bot     = options[:bot]
    @text    = options[:text]
    @chat    = options[:chat]
    @answers = options[:answers]
  end

  def send
    if reply_markup
      bot.api.send_message(chat_id: chat.id, text: text,
                           reply_markup: reply_markup)
    else
      bot.api.send_message(chat_id: chat.id, text: text)
    end

    Config.logger.debug "sending '#{text}' to #{chat.username}"
  end

  private

  def reply_markup
    return unless answers

    ReplyMarkupFormatter.new(answers).markup
  end
end
