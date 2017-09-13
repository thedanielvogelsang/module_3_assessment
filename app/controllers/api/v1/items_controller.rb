class Api::V1::ItemsController < ApplicationController
  def index
    hash_items = Item.all
    items = hash_items.map{|item| ItemDecorator.new(item)}
    render json: items
  end

  def show
    hash_item = Item.find(params[:id])
    item = ItemDecorator.new(hash_item)
    render json: item
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: {error: "You successfully deleted an item!"}, status: :no_content
  end

  def create
    item = Item.new(create_params)
    if item.save
      item = ItemDecorator.new(item)
      payload = {success: "Successfully created!", item: item}
      render json: payload, status: 201
    else
      render json: {error: "Unsuccessful item creation"}, status: 400
    end
  end

  private

      def create_params
        params.permit(:name, :description, :image_url)
      end

end
