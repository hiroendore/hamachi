require "test_helper"

class SentencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sentences_index_url
    assert_response :success
  end
end
