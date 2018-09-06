class PagesController < ApplicationController

  def index
    render 'home'
  end

  def game
    render 'game'
  end

  def blog
    render 'blog'
  end

end
