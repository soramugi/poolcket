require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "nicovideo?" do
    item = Item.new
    item.given_url = 'http://www.nicovideo.jp/watch/sm9'
    assert item.nicovideo?
    item.given_url = 'http://google.com'
    assert !item.nicovideo?
    item.given_url = 'http://nicovideo.jp'
    assert !item.nicovideo?
  end
  test "nico_id" do
    item = Item.new
    item.given_url = 'http://www.nicovideo.jp/watch/sm9'
    assert_equal 'sm9', item.nico_id
  end

  test "external_player" do
    item = Item.new
    item.given_url = 'http://www.nicovideo.jp/watch/sm9'
    item.given_title = 'どーまんせーまん'
    assert item.external_player
  end

  test "next" do
    item = items(:one)
    assert_not_equal item, item.next
  end

  test "self.all_create" do
    user = users(:two)
    _items = user.items
    not_create_arr = [
      [
        'testtest_id',
        {
          'item_id'        => 'testtest',
          'resolved_id'    => 'testtest',
          'given_url'      => 'testtest',
          'given_title'    => 'testtest',
          'favorite'       => 'testtest',
          'status'         => 'testtest',
          'time_added'     => 'testtest',
          'time_updated'   => 'testtest',
          'time_read'      => 'testtest',
          'time_favorited' => 'testtest',
          'sort_id'        => 1,
          'resolved_title' => 'testtest',
          'resolved_url'   => 'testtest',
          'excerpt'        => 'testtest',
          'is_article'     => 'testtest',
          'is_index'       => 'testtest',
          'has_video'      => 'testtest',
          'has_image'      => 'testtest',
          'word_count'     => 'testtest',
        }
      ],
    ]
    assert_equal [], Item.all_create(user.id, not_create_arr)
    arr = [
      [
        'testtest_id',
        {
          'item_id'        => 'testtest',
          'resolved_id'    => 'testtest',
          'given_url'      => 'http://www.nicovideo.jp/watch/sm9',
          'given_title'    => 'testtest',
          'favorite'       => 'testtest',
          'status'         => 'testtest',
          'time_added'     => 'testtest',
          'time_updated'   => 'testtest',
          'time_read'      => 'testtest',
          'time_favorited' => 'testtest',
          'sort_id'        => 1,
          'resolved_title' => 'testtest',
          'resolved_url'   => 'testtest',
          'excerpt'        => 'testtest',
          'is_article'     => 'testtest',
          'is_index'       => 'testtest',
          'has_video'      => 'testtest',
          'has_image'      => 'testtest',
          'word_count'     => 'testtest',
        }
      ],
      [
        'testtest_id_2',
        {
          'item_id'        => 'testtest_2',
          'resolved_id'    => 'testtest_2',
          'given_url'      => 'http://www.nicovideo.jp/watch/sm1619524',
          'given_title'    => 'testtest_2',
          'favorite'       => 'testtest_2',
          'status'         => 'testtest_2',
          'time_added'     => 'testtest_2',
          'time_updated'   => 'testtest_2',
          'time_read'      => 'testtest_2',
          'time_favorited' => 'testtest_2',
          'sort_id'        => 1,
          'resolved_title' => 'testtest_2',
          'resolved_url'   => 'testtest_2',
          'excerpt'        => 'testtest_2',
          'is_article'     => 'testtest_2',
          'is_index'       => 'testtest_2',
          'has_video'      => 'testtest_2',
          'has_image'      => 'testtest_2',
          'word_count'     => 'testtest_2',
        }
      ],
    ]
    assert items = Item.all_create(user.id, arr)
    assert_equal user.items, items
  end
end
