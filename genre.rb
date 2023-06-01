class Genre
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_s
    @name
  end

  def to_json(*_args)
    {
      name: @name
    }.to_json(*_args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    genre = new(data['name'])

    items_json = data['items']
    if items_json && items_json.is_a?(Array)
        items_json.each do |item_json|
            item = Item.from_json(item_json)
            genre.add_item(item) if item
        end
    end
    genre
  end
end
