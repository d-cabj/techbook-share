class TopController < ApplicationController
  def index
    @items = Item.all
    @categories = Category.all
    @searchCategories = Category.all.map {|t| [t.name, t.id]}
  end
end
