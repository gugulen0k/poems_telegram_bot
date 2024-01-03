# frozen_string_literal: true

require 'standalone_migrations'
require 'dotenv/load'

StandaloneMigrations::Tasks.load_tasks

namespace :bot do
  desc 'Start telegram bot'
  task :start do
    sh './bin/bot.rb'
  end

  desc 'Start irb with bot\'s configuration'
  task :console do
    sh 'irb -r ./config/application.rb'
  end

  desc 'Alias for starting bot'
  task s: :start

  %i[c irb].each do |alias_name|
    desc 'Alias for staring irb with bot\'s configuration'
    task alias_name => :console
  end
end
