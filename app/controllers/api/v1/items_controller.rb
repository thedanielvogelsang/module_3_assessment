class Api::V1::ItemsController < ApplicationController
  def index
    hash_items = Item.all
    items = hash_items.map{|item| ItemDecorator.new(item)}
    render json: items
  end
end
