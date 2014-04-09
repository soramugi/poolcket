require 'open-uri'
class Item < ActiveRecord::Base
  belongs_to :user

  def archive
    user.client.modify [
      {
        action: 'archive',
        item_id: item_id,
      }
    ]
    destroy
  end

  def favorite
    user.client.modify [
      {
        action:  'favorite',
        item_id: item_id,
      }
    ]
  end

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
      "<script type='text/javascript'>#{html}</script>" +
        "<noscript>#{link}</noscript>"
    end
  end

  def link
    "<a href='http://www.nicovideo.jp/watch/#{nico_id}'>#{given_title}</a>"
  end

  def detail_html
    "<iframe width='312' height='176' src='http://ext.nicovideo.jp/thumb/#{nico_id}' scrolling='no' style='border:solid 1px #CCC;' frameborder='0'>#{link}</iframe>"
  end

  def mylist_url
    "http://www.nicovideo.jp/mylist_add/video/#{nico_id}"
  end

  def next
    _item = Item.where("id > #{id} and user_id = #{user_id}").limit(1).first
    _item.nil? ?  Item.where(user_id: user_id).limit(1).first : _item
  end

  def self.all_create user_id,arr
    arr.map { |i,h| _item = create(h.merge(user_id: user_id)); _item.id.nil? ? nil : _item }.compact
  end

  before_create do |c|
    c.nicovideo?
  end
end
