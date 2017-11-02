class AddFieldsToPodcast < ActiveRecord::Migration[5.1]
  def change
    add_column :podcasts, :description, :text
    add_column :podcasts, :duration, :string
  end
end
