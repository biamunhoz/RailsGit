class SenhaResetsController < ApplicationController

  def create
    user = Usuario.find_by_email(params[:email])

    if user
      send_senha_reset(user)
      redirect_to root_url, notice: "Verifique seu e-mail"
    else
      redirect_to root_url, notice:  "Laboratório não encontrado"
    end

  end


  def edit
    @user = Usuario.find_by_senha_reset_token!(params[:id])
    if @user.senha_reset_sent_at < 2.hours.ago
      redirect_to new_senha_reset_path, notice: "Tempo de alteração de senha expirado"
    end
  end

  def update
    @user = Usuario.find_by_senha_reset_token!(params[:id])
    if @user.senha_reset_sent_at < 2.hours.ago
      redirect_to new_senha_reset_path, notice: "Tempo de alteração de senha expirado"
    else
      if @user.update_attributes(usuario_params)
        redirect_to root_url, notice: "Senha foi alterada"
      else
        render :edit
      end
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nome, :email, :password, :admin, :password_confirmation, :aut_token, :senha_reset_token, :senha_reset_sent_at)
  end

  def send_senha_reset(user)
    user.senha_reset_token = Digest::SHA2.hexdigest("abc123-321cba#{Time.zone.now+1.day}")
    user.senha_reset_sent_at = Time.zone.now
    user.save
    Mensagem.senha_reset(user).deliver_now
  end

end
