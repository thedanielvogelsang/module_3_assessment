class StoreSerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :city, :distance, :phone

  def phone
    "1+" + object.phone
  end

end
