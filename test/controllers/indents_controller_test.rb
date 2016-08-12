require 'test_helper'

class IndentsControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get indents_Index_url
    assert_response :success
  end

end
