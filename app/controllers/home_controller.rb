class HomeController < ApplicationController
  def index
    @image_tags     = ActsAsTaggableOn::Tag.all
  end

  def about
  end

  def contact
  end

  def help
  end
end
