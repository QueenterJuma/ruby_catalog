require_relative '../game/author'

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
  end
end
