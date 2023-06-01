require 'json'
module SaveData
  def save_game(games)
    save_game_data = games.map do |game|
      {
        'name' => game.name,
        'last_played_at' => game.last_played_at,
        'publish_date' => game.publish_date,
        'multiplayer' => game.multiplayer
      }
    end
    File.write('./data/games.json', JSON.generate(save_game_data))
  end

  def save_author(authors)
    save_author_data = authors.map do |author|
      {
        'first_name' => author.first_name,
        'last_name' => author.last_name
      }
    end
    File.write('./data/authors.json', JSON.generate(save_author_data))
  end
end

module LoadData
  def load_games
    games_data = load_data_from_json_file('./data/games.json')
    games_data.map do |game_data|
      Game.new(game_data['name'], game_data['last_played_at'], game_data['publish_date'], game_data['multiplayer'])
    end
  end

  def load_authors
    authors_data = load_data_from_json_file('./data/authors.json')
    authors_data.map do |author_data|
      Author.new(author_data['first_name'], author_data['last_name'])
    end
  end

  private

  def load_data_from_json_file(file_path)
    if File.exist?(file_path)
      json_data = File.read(file_path)
      JSON.parse(json_data)
    else
      []
    end
  end
end
