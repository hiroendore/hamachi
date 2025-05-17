require "test_helper"

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    # テスト用の文章を作成
    sentence = Sentence.create!(content: "テスト文章です")
    
    # クイズページにアクセス
    get quizzes_url
    assert_response :success
    
    # レスポンスに文章が含まれていることを確認
    assert_match sentence.content, @response.body
  end

  test "should get different sentence on each request" do
    # テスト用の文章を複数作成
    sentences = [
      Sentence.create!(content: "テスト文章1"),
      Sentence.create!(content: "テスト文章2"),
      Sentence.create!(content: "テスト文章3")
    ]
    
    # 最初のリクエスト
    get quizzes_url
    first_response = @response.body
    
    # 2回目のリクエスト
    get quizzes_url
    second_response = @response.body
    
    # 2つのレスポンスが異なることを確認（ランダム性の確認）
    assert_not_equal first_response, second_response
  end
end
