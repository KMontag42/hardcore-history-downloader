class CreatePodcasts < ActiveRecord::Migration[5.1]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :mp3
      t.datetime :date

      t.timestamps
    end
  end
end
