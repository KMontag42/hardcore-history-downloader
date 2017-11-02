# frozen_string_literal: true

# == Schema Information
#
# Table name: podcasts
#
#  id          :integer          not null, primary key
#  title       :string
#  mp3         :string
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  duration    :string
#

# the podcast model
class Podcast < ApplicationRecord
  def mp3_file
    "#{Rails.root}/app/assets/downloads/#{id}.mp3"
  end
end
