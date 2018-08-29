class HomeController < ApplicationController
  before_filter 'autenticado?'

  def index
  end

end
