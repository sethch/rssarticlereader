require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { creator: @article.creator, date: @article.date, description: @article.description, link: @article.link, subject: @article.subject, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: { article: { creator: @article.creator, date: @article.date, description: @article.description, link: @article.link, subject: @article.subject, title: @article.title } }
    assert_redirected_to article_url(@article)
  end

  test "should destroy article" do
    assert_difference("Article.count", -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end

  test "should update read status" do
    patch update_read_status_article_path(@article), params: { read_status: true }.to_json, headers: { 'Content-Type' => 'application/json' }

    assert_response :success
    assert_equal({ 'message' => 'Read status updated successfully' }, JSON.parse(response.body))
    assert_equal(true, @article.reload.read_status)
  end
end
