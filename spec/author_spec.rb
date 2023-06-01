require './game/author'

describe Author do
  context '#add_item' do
    it 'returns correct First name' do
      author = Author.new('Queen', 'Juma')
      expect(author.first_name).to eq('Queen')
    end
    it 'returns correct Last name' do
      author = Author.new('Queen', 'Juma')
      expect(author.last_name).to eq('Juma')
    end
    it 'Test for add item method' do
      author = Author.new('Queen', 'Juma')
      item = double('Item')
      allow(item).to receive(:publish_date) { '2021-08-10' }
      allow(item).to receive(:author=)
      author.add_item(item)
      expect(author.items[0].publish_date).to eq('2021-08-10')
    end
  end
end
