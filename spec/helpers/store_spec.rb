require 'rails_helper'
RSpec.describe Store, type: :model do
  it 'initializes with a hash' do
    store = Store.new({})
    assert_instance_of Store, store
  end
  it 'creates a store with name' do
    store = Store.new({'name' => "Store Name"})
    assert_equal "Store Name", store.name
  end
  it 'cant create a store with symboled hash' do
    store = Store.new({name: "Store Name"})
    assert_nil store.name
  end
end
