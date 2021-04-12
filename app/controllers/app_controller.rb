class AppController < ApplicationController
  before_action :user_is_authenticated
  layout 'application'
  def index

  end

  private

  def user_is_authenticated
    if !current_user
      redirect_to :root
    end
  end
end
