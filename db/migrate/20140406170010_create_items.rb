class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :item_id
      t.string :resolved_id
      t.string :given_url
      t.string :given_title
      t.string :favorite
      t.string :status
      t.string :time_added
      t.string :time_updated
      t.string :time_read
      t.string :time_favorited
      t.integer :sort_id
      t.string :resolved_title
      t.string :resolved_url
      t.string :excerpt
      t.string :is_article
      t.string :is_index
      t.string :has_video
      t.string :has_image
      t.string :word_count

      t.timestamps
    end
  end
end
