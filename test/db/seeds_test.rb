# test/seeds_test.rb

require 'test_helper'
require 'webmock/minitest'

class SeedsTest < ActionDispatch::IntegrationTest
  test 'seeds.rb should create articles from Slashdot RSS feed' do
    stub_request(:get, 'https://rss.slashdot.org/Slashdot/slashdotMain')
      .to_return(status: 200, body: File.read('test/fixtures/slashdot_feed.xml'))

    load Rails.root.join('db', 'seeds.rb')

    assert_equal 15, Article.count
    assert Article.all.all? { |article| article.title.present? }

    # Testing idempotency
    load Rails.root.join('db', 'seeds.rb')

    assert_equal 15, Article.count
  end
end