require 'test_helper'

class NcIdentificadorControllerTest < ActionController::TestCase
  test "should get atualizar" do
    get :atualizar
    assert_response :success
  end

end
