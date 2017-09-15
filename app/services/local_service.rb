class LocalService

  def self.all_items
    hash_items = Item.all
    # items = hash_items.map{|item| ItemDecorator.new(item)}
    # items
  end

  def self.item_by_id(id)
    hash_item = Item.find(id)
    # item = ItemDecorator.new(hash_item)
    # item
  end

  def self.create_item(item_hash)
    item = Item.new(item_hash)
    if item.save
      item = ItemDecorator.new(item)
      payload = {success: "Successfully created!", item: item}
      payload
    else
      {error: "Unsuccessful item creation"}
    end
  end
end
