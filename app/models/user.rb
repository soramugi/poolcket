class User < ActiveRecord::Base
  devise :omniauthable

  def items
    client.retrieve(sort: 'newest')['list']
  end

  private
  def client
    Pocket.client(consumer_key: Rails.configuration.consumer_key, access_token: token)
  end
end
