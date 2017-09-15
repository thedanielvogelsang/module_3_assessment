require 'rails_helper'

describe 'items api endpoints' do
  before(:each) do
    @items = create_list(:item, 4)
  end
  it 'returns a list of items' do
    # When I send a GET request to `/api/v1/items`
    get '/api/v1/items'
    expect(response).to be_success
    # I receive a 200 JSON response containing all items
    items = JSON.parse(response.body)
    byebug
    expect(items.count).to eq(4)
    # And each item has an id, name, description, and image_url but not the created_at or updated_at
    item = items.first
    expect(item['id']).to be_truthy
    expect(item['name']).to be_truthy
    expect(item['description']).to be_truthy
    expect(item['image_url']).to be_truthy
    # expect(item['created_at']).to be_nil
    # expect(item['updated_at']).to be_nil
    expect(item).not_to have_key 'created_at'
    expect(item).not_to have_key 'updated_at'
  end
  it 'returns a specific item given id' do
    # When I send a GET request to `/api/v1/items/1`
    item = @items.first
    id = item.id
    expect(id).to eq(1)
    name = item.name
    description = item.description
    image = item.image_url
    get '/api/v1/items/1'
    expect(response).to be_success
    item = JSON.parse(response.body)
    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    expect(item['id']).to eq(id)
    expect(item['name']).to eq(name)
    expect(item['description']).to eq(description)
    expect(item['image_url']).to eq(image)
  end
  it do
    # When I send a DELETE request to `/api/v1/items/1`
    expect(Item.count).to eq(4)
    delete '/api/v1/items/1'
    # I receive a 204 JSON response if the record is successfully deleted
    expect(response).to be_success
    expect(Item.count).to eq(3)
  end
  it do
    expect(Item.count).to eq(4)
    post '/api/v1/items?name=Daniel&description=TuringSchoolStudent&image_url=imagetext'
    # When I send a POST request to `/api/v1/items` with a name, description, and image_url
    expect(response).to be_success
    expect(Item.count).to eq(5)
    # I receive a 201 JSON  response if the record is successfully created
    # And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    item = JSON.parse(response.body)['item']
    expect(item['id']).to be_truthy
    expect(item['name']).to be_truthy
    expect(item['description']).to be_truthy
    expect(item['image_url']).to be_truthy
    expect(item['created_at']).to be_nil
    expect(item['updated_at']).to be_nil
  end
end
