# frozen_string_literal: true

require 'rss'
require 'open-uri'

# this job will download fresh podcasts from the hardcore history rss feed
class DownloadFromRssJob < ApplicationJob
  queue_as :default

  HHH_RSS_ADDRESS = 'http://feeds.feedburner.com/dancarlin/history'.freeze

  after_perform do |_job|
    self.class.set(wait: 24.hours).perform_later
  end

  def file_path
    if Rails.env == 'production'
      "/app/assets/downloads/"
    else
      "#{Rails.root}/app/assets/downloads/"
    end
  end

  def perform
    # Do something later
    open(HHH_RSS_ADDRESS) do |rss|
      feed = RSS::Parser.parse(rss)

      feed.items.each do |item|
        podcast = Podcast.create_with(
          description: item.description,
          date: item.pubDate,
          duration: item.itunes_duration.content
        ).find_or_create_by(title: item.title)

        next if File.exist?(file_path + "#{podcast.id}.mp3")

        File.open(file_path + "#{podcast.id}.mp3", 'wb') do |new_file|
          open(item.enclosure.url, 'rb') do |read_file|
            new_file.write(read_file.read)
          end
        end
      end
    end
  end
end
