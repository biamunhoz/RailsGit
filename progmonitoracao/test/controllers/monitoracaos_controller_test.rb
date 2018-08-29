require 'test_helper'

class MonitoracaosControllerTest < ActionController::TestCase
  setup do
    @monitoracao = monitoracaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monitoracaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monitoracao" do
    assert_difference('Monitoracao.count') do
      post :create, monitoracao: { aplicacaoradiacao: @monitoracao.aplicacaoradiacao, areaaplicacao: @monitoracao.areaaplicacao, coddept: @monitoracao.coddept, codfuncao: @monitoracao.codfuncao, cpf: @monitoracao.cpf, datanasc: @monitoracao.datanasc, departamento: @monitoracao.departamento, descricaouso: @monitoracao.descricaouso, docente: @monitoracao.docente, email: @monitoracao.email, emaildocente: @monitoracao.emaildocente, funcao: @monitoracao.funcao, inicioano: @monitoracao.inicioano, iniciomes: @monitoracao.iniciomes, local: @monitoracao.local, nome: @monitoracao.nome, nomeinstituicao: @monitoracao.nomeinstituicao, sexo: @monitoracao.sexo, siglalab: @monitoracao.siglalab, tipomonitor: @monitoracao.tipomonitor, tiporadiacao: @monitoracao.tiporadiacao }
    end

    assert_redirected_to monitoracao_path(assigns(:monitoracao))
  end

  test "should show monitoracao" do
    get :show, id: @monitoracao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monitoracao
    assert_response :success
  end

  test "should update monitoracao" do
    patch :update, id: @monitoracao, monitoracao: { aplicacaoradiacao: @monitoracao.aplicacaoradiacao, areaaplicacao: @monitoracao.areaaplicacao, coddept: @monitoracao.coddept, codfuncao: @monitoracao.codfuncao, cpf: @monitoracao.cpf, datanasc: @monitoracao.datanasc, departamento: @monitoracao.departamento, descricaouso: @monitoracao.descricaouso, docente: @monitoracao.docente, email: @monitoracao.email, emaildocente: @monitoracao.emaildocente, funcao: @monitoracao.funcao, inicioano: @monitoracao.inicioano, iniciomes: @monitoracao.iniciomes, local: @monitoracao.local, nome: @monitoracao.nome, nomeinstituicao: @monitoracao.nomeinstituicao, sexo: @monitoracao.sexo, siglalab: @monitoracao.siglalab, tipomonitor: @monitoracao.tipomonitor, tiporadiacao: @monitoracao.tiporadiacao }
    assert_redirected_to monitoracao_path(assigns(:monitoracao))
  end

  test "should destroy monitoracao" do
    assert_difference('Monitoracao.count', -1) do
      delete :destroy, id: @monitoracao
    end

    assert_redirected_to monitoracaos_path
  end
end
