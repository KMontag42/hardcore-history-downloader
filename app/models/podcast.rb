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

class Podcast < ApplicationRecord
end
