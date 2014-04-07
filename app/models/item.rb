class Item < ActiveRecord::Base
  belongs_to :user

  def self.all_create user_id,arr
    arr.map do |i,h|
      create h.merge({user_id: user_id})
    end
  end

  before_create do |c|
    c.given_url.include?('nicovideo.jp/watch/')
  end
end
