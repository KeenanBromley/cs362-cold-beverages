require_relative '../lib/item'

describe 'An item of food or a beverage' do
  it 'has a name and volume' do
    item = Item.new('Test Item', 10)
    expect(item.name).to eq('Test Item')
    expect(item.volume).to eq(10)
  end

end
