require 'test_helper'

class RegistrounicoControllerTest < ActionController::TestCase
  test "should get verparametros" do
    get :verparametros
    assert_response :success
  end

  test "should get importarregistro" do
    get :importarregistro
    assert_response :success
  end

end
