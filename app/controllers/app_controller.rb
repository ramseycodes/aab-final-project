class AppController < ApplicationController

  require 'link_thumbnailer'

  before_action :user_is_authenticated
  helper_method :categories, :get_preview
  layout 'application'
  def index

  end

  def library
    @items = Item.all
  end

  private

  def user_is_authenticated
    if !current_user
      redirect_to :root
    end
  end

  def categories
    [
      "page",
      "image"
    ]
  end

  def get_preview(url)
    LinkThumbnailer.generate(url).as_json
  end
end
