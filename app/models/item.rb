class Item < ActiveRecord::Base
  belongs_to :user

  def nicovideo?
    given_url.include?('nicovideo.jp/watch/')
  end

  def nico_id
    given_url.match(/(sm[0-9]+)|(nm[0-9]+)/).captures.compact.first
  end

  def external_player
    "<script type='text/javascript' src='http://ext.nicovideo.jp/thumb_watch/#{nico_id}'></script><noscript><a href='http://www.nicovideo.jp/watch/#{nico_id}'>#{given_title}</a></noscript>" if nicovideo?
  end

  def self.all_create user_id,arr
    arr.map { |i,h| create h.merge({user_id: user_id}) }
  end

  before_create do |c|
    c.nicovideo?
  end
end
