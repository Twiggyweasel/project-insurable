class DashboardController < ApplicationController
  def index
    @homes = Home.all
  end
end
