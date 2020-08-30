class WelcomeController < ApplicationController
  def homepage
  end
  def show
    redirect_to root_path
  end
end
