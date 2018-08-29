module SessionHelper

  #cria uma sessão
  def log_in(user)
    session[:usuario_id] = user.id
    session[:admin] = user.admin
    session[:email] = user.email
    session[:cpf] = user.cpf
  end

  #destroi a sessão criada na def anterior
  def log_out
    session.destroy
    @current_user = nil
  end

  #busca um usuário cuja sessão não seja nula (ou seja, tem uma sessão marcada pelo laboratorio.id)
  def current_user
    @current_user ||= Usuario.find_by(id: session[:usuario_id])
  end

  # esta verifica se o usuario está logado, verificando se a função anterior está gerando um valor nulo, se estiver, é por que não está logado)
  def logged_in?
    !current_user.nil?
  end

end
