require_relative 'book'
require_relative 'item'
require_relative 'label'
require_relative 'books_ui'
require_relative 'game/game_ui'



class App
  attr_accessor :books, :labels, :game

  def initialize
    @books = Books_UI.new
    @game = GameUI.new
  end

  def save_data
    @books.save_books
    @books.save_labels
  end

  def load_data
    @books.load_books
    @books.load_labels
  end
end
