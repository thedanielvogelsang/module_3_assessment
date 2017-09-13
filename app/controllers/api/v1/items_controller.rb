class Api::V1::ItemsController < ActionController::Base
  protect_from_forgery with: :null_session

  def index
    render json: LocalService.all_items
  end

  def show
    render json: LocalService.item_by_id(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: {error: "You successfully deleted an item!"}, status: :no_content
  end

  def create
    render json: LocalService.create_item(create_params), status: 201
  end

  private
  
    def create_params
      params.permit(:name, :description, :image_url)
    end
end
