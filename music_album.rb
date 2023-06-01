
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :id, :author, :label, :publish_date, :genre

  def initialize(genre, author, label, publish_date, on_spotify)
    super(publish_date)
    @id = id
    @genre = genre
    @author = author
    @label = label
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super || @on_spotify
  end

  def to_json(*_args)
    {
      id: @id,
      genre: @genre,
      author: @author,
      label: @label,
      publish_date: @publish_date,
      on_spotify: @on_spotify
    }.to_json(*_args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    new(
      data['genre'],
      data['author'],
      data['label'],
      DateTime.strptime(data['publish_date'], '%Y-%m-%d'),
      data['on_spotify']
    )
  end
end
