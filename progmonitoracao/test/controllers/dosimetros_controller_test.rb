require 'test_helper'

class DosimetrosControllerTest < ActionController::TestCase
  setup do
    @dosimetro = dosimetros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dosimetros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dosimetro" do
    assert_difference('Dosimetro.count') do
      post :create, dosimetro: { nome: @dosimetro.nome }
    end

    assert_redirected_to dosimetro_path(assigns(:dosimetro))
  end

  test "should show dosimetro" do
    get :show, id: @dosimetro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dosimetro
    assert_response :success
  end

  test "should update dosimetro" do
    patch :update, id: @dosimetro, dosimetro: { nome: @dosimetro.nome }
    assert_redirected_to dosimetro_path(assigns(:dosimetro))
  end

  test "should destroy dosimetro" do
    assert_difference('Dosimetro.count', -1) do
      delete :destroy, id: @dosimetro
    end

    assert_redirected_to dosimetros_path
  end
end
