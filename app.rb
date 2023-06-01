require_relative 'book'
require_relative 'item'
require_relative 'label'
require_relative 'books_ui'
require_relative 'game/game_ui'
require_relative 'music_album'
require_relative 'genre'
require 'json'



class App
  attr_accessor :books, :labels, :game

  def initialize
    @books = BooksUI.new
    @game = GameUI.new
    @genres = []
    @music_albums = []
  end

  def save_data
    @books.save_books
    @books.save_labels
    save_json_data('./data/genres.json', @genres)
    save_json_data('./data/music_albums.json', @music_albums)
  end

  def load_data
    @books.load_books
    @books.load_labels
    @genres = load_json_data('./data/genres.json', Genre)
    @music_albums = load_json_data('./data/music_albums.json', MusicAlbum)
  end

  def list_music_albums
    @music_albums.each do |album|
      puts "ID: #{album.id}"
      puts "Genre: #{album.genre}"
      puts "Author: #{album.author}"
      puts "Label: #{album.label}"
      puts "Publish Date: #{album.publish_date}"
      puts "On Spotify: #{album.on_spotify}"
      puts '-----------------------------------'
    end
  end

  def list_genres
    puts 'Genre: '
    @genres.each do |genre|
      puts "'#{genre.name}'"
    end
  end

  def add_music_album
    puts 'Enter Genre:'
    genre_name = gets.chomp
    puts 'Enter Author:'
    author = gets.chomp
    puts 'Enter Label:'
    label = gets.chomp
    puts 'Enter Publish Date (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Is it on Spotify? (true/false):'
    on_spotify = gets.chomp.downcase == 'true'

    genre = find_genre(genre_name)
    if genre.nil?
      genre = Genre.new(genre_name)
      @genres << genre
    end

    music_album = MusicAlbum.new(genre, author, label, publish_date, on_spotify)
    @music_albums << music_album
    music_album.genre = genre
    puts 'Music album added successfully!'
  end

  private

  def load_json_data(file_name, class_type)
    if File.exist?(file_name)
      json_data = File.read(file_name)
      items = JSON.parse(json_data).map { |item_json| class_type.from_json(JSON.generate(item_json)) }
      items.compact
    else
      []
    end
  end

  def save_json_data(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end

  def find_genre(name)
    @genres.find { |genre| genre.name == name }
  end
end
