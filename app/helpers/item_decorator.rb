class ItemDecorator
  attr_reader :id,
              :name,
              :description,
              :image_url

  def initialize(item)
    @id = item['id']
    @name = item['name']
    @description = item['description']
    @image_url = item['image_url']
  end

end
