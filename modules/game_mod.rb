require_relative 'game_storage'
module GameModule
  include SaveData
  include LoadData
  def create_game
    puts 'Please enter the name of the game:'
    game_name = gets.chomp
    puts 'Please enter the last played date of the game:'
    game_last_played_at = gets.chomp
    puts 'Please enter the publish date for the game:'
    game_publish_date = gets.chomp
    puts 'Is it a multiplayer game? [y/n]'
    game_multiplayer = gets.chomp.downcase == 'y'
    @game_list.push Game.new(game_name, game_last_played_at, game_publish_date, game_multiplayer)
    save_game(@game_list)
    puts 'Please enter the author\'s first name and the last name of the game (e.g. “Stephen King”)'
    first_name = gets.chomp
    last_name = gets.chomp
    @author_list.push Author.new(first_name, last_name)
    save_author(@author_list)
    puts "\nNew game created successfully!\n"
  end

  def game_list
    if @game_list.empty?
      puts "\nThere are no games in the list. Please add a new game.\n"
    else
      puts "\nGame List:\n"
      @game_list.each do |game|
        puts "Name: #{game.name}, Last Played At: #{game.last_played_at}, Publish Date: #{game.publish_date}, Multiplayer: #{game.multiplayer}\n"
      end
    end
    puts
  end

  def author_list
    if @author_list.empty?
      puts "\nThere are no authors in the list\n"
    else
      puts "\nAuthor List:\n"
      @author_list.each do |author|
        puts "Author name: #{author.first_name} #{author.last_name}\n"
      end
    end
    puts
  end
end
