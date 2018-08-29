require 'test_helper'

class NcUnidadeControllerTest < ActionController::TestCase
  test "should get atualizar" do
    get :atualizar
    assert_response :success
  end

end
