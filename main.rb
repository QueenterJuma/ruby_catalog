require_relative 'app'

def list_options
  puts 'Please select an option:'
  puts '1. List all books'
  puts '2. List all music albums'
  puts '3. List all games'
  puts '4. List all genres'
  puts '5. List all authors'
  puts '6. List all labels'
  puts '7. Add a book'
  puts '8. Add a music album'
  puts '9. Add a game'
  puts '0 - Exit'
end

def options(app, choice)
  case choice
  when 1
    app.books.list_all_books
  when 2
    app.list_music_albums
  when 3
    app.game.game_list
  when 4
    app.list_genres
  when 5
    app.game.author_list
  when 6
    app.books.list_all_labels
  end
end

def options1(app, choice)
  case choice
  when 7
    app.books.add_book
  when 8
    app.add_music_album
  when 9
    app.game.create_game
  when 0
    app.save_data
    exit
  else
    puts 'Invalid option, please type correct number!'
  end
end

def selection(app, choice)
  options(app, choice)
  options1(app, choice)
end

def main
  app = App.new
  app.load_data
  puts 'Welcome to our App..'
  loop do
    list_options
    print 'Please select an option:'
    choice = gets.chomp.to_i
    selection(app, choice)
  end
end

main
