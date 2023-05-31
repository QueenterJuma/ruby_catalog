require_relative 'book'
require_relative 'app'
require_relative 'item'
require_relative 'label'
require_relative 'books_ui'


class App
attr_accessor :books, :labels

    def initialize
@books = Books_UI.new
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
