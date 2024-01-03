# frozen_string_literal: true

class Poem < ActiveRecord::Base
  validates :title,  presence: true
  validates :writer, presence: true
  validates :body,   presence: true
end
