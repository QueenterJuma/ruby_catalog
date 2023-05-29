require_relative 'app'

def list_options
  puts "Please select an option:"
  puts "1. List all books"
  puts "2. List all music albums"
  puts "3. List all games"
  puts "4. List all genres"
  puts "5. List all authors"
  puts "6. List all labels"
  puts "7. Add a book"
  puts "8. Add a music album"
  puts "9. Add a game"
  puts "0 - Exit"
end

def option(app)
  option = gets.chomp.to_i
  case option
  when 1
    app.list_books
  when 2
    app.list_music_albums
  when 3
    app.list_games
  when 4
    app.list_genres
  when 5
    app.list_authors
  when 6
    app.list_labels
  when 7
    app.add_book
  when 8
    app.add_music_album
  when 9
    app.add_game
  when 0
    app.save_data
    exit
  else
    puts 'Invalid option, please type correct number!'
  end
end

def main
  app = App.new
  app.load_data

  loop do
    puts list_options
    puts 'Welcome to our App..'
    print 'Please select an option:'
    option = gets.chomp.to_i
    option(app)
  end
end