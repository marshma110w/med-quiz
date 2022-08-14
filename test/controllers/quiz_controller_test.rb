require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test 'should get try' do
    get quiz_try_url
    assert_response :success
  end
end
