class Item
  attr_accessor :item_id, :resolved_id, :given_url, :given_title, :favorite, :status, :time_added, :time_updated, :time_read, :time_favorited, :sort_id, :resolved_title, :resolved_url, :excerpt, :is_article, :is_index, :has_video, :has_image, :word_count
  def initialize h
    h.each { |key, value| send("#{key}=", value) }
  end

  def self.all_new arr
    arr.map do |id,h|
      new h
    end
  end
end
