class PagesController < ApplicationController
  def home
  end

  def search
    add = Location.arel_table
    @locations = Location.where(add[:adresse].matches("%#{ params[:q]}"))
    
  end
end
