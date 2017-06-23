require 'test_helper'

class App::AnalyzerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get app_analyzer_index_url
    assert_response :success
  end

end
