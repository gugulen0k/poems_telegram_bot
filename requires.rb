# frozen_string_literal: true

require 'active_record'
require 'telegram/bot'
require 'dotenv/load'
require 'logger'
require 'yaml'
require 'erb'
require 'pry'

# Application files
require './lib/app_configurator'
require './lib/message_responder'
require './lib/message_sender'
require './lib/reply_markup_formatter'
require './lib/database_connector'

# Models
require './models/user'
require './models/poem'
