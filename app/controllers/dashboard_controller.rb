class DashboardController < ApplicationController
  def faq
  end

  def index
    @novedades = Novedad.find(:all, :conditions => 'muestra = true', :order => "id DESC")
  end

end
