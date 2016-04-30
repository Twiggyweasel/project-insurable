class PagesController < ApplicationController
  before_filter :disable_side_nav, only: [:home]

  def home
    
  end
  
  def dashboard
    @homes = Home.all
  end
end
