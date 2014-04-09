class User < ActiveRecord::Base
  devise :omniauthable
  has_many :items

  def create_item
    Item.all_create(id, client.retrieve(sort: 'newest')['list'])
  end

  def client
    Pocket.client(consumer_key: Rails.configuration.consumer_key, access_token: token)
  end
end
