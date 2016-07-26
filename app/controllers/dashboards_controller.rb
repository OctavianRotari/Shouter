class DashboardsController < ApplicationController

  before_action :authenticate_user!

  def show
    @text_shout = TextShout.new
    @shouts = current_user.shouts
  end
end
