require 'test_helper'

class NcPessoaInternaControllerTest < ActionController::TestCase
  test "should get atualizar" do
    get :atualizar
    assert_response :success
  end

end
