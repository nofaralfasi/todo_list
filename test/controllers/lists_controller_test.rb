require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get lists_path
    assert_response :success
  end
end
