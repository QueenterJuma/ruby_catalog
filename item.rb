class Item
  attr_reader :genre, :author, :label
def initialize(publish_date)
    @id = Random.rand(1..1000) 
    @publish_date = publish_date
    @archived = false
end

def can_be_archived?
age_in_years = Time.now.year - @publish_date.year
age_in_years >= 10
end

def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end
  
   def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

end