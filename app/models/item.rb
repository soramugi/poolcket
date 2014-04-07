require 'open-uri'
class Item < ActiveRecord::Base
  belongs_to :user

  def nicovideo?
    given_url.include?('nicovideo.jp/watch/')
  end

  def nico_id
    given_url.match(/(sm[0-9]+)|(nm[0-9]+)/).captures.compact.first
  end

  def external_player
    if nicovideo?
      html = open(
        "http://ext.nicovideo.jp/thumb_watch/#{nico_id}",
        'Referer' => 'http://www.nicovideo.jp/',
      ).read.sub!(
        %r{'thumbWatch': '1'},
        "'fv_new_window': '1'\n,'fv_autoplay': '1'\n,'thumbWatch': '1'",
        ).sub!(%r{.0.0.}, '.1.0.')
      "<script type='text/javascript'>#{html}</script><noscript><a href='http://www.nicovideo.jp/watch/#{nico_id}'>#{given_title}</a></noscript>"
    end
  end

  def self.all_create user_id,arr
    arr.map { |i,h| create h.merge({user_id: user_id}) }
  end

  before_create do |c|
    c.nicovideo?
  end
end
