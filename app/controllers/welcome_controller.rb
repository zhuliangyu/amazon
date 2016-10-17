class WelcomeController < ApplicationController
  def home

  end

  def about

  end

  def contact

  end
  def contact_submit
    @name=params[:name]
  end




end
