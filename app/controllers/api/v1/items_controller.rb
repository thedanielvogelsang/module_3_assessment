class Api::V1::ItemsController < ActionController::Base
  protect_from_forgery with: :null_session

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: {error: "You successfully deleted an item!"}, status: :no_content
  end

  def create
    item = Item.create(create_params)
    if item.save
      render json: Item.create(create_params), status: 201
    elsif
      render json: {error: "unsuccessful creation. try again!"}, status: :no_content
    end
  end

  private

    def create_params
      params.permit(:name, :description, :image_url)
    end
end
