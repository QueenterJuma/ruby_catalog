require './item'
class Game < Item
  attr_accessor :id, :name, :multiplayer, :last_played_at, :publish_date

  def initialize(name, last_played_at, publish_date, multiplayer)
    super(nil, nil, nil, nil, publish_date)
    @id = id || Random.rand(1..1000)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && @last_played_at < 2.years.ago
  end
end
