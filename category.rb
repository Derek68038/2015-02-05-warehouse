class Category
  attr_reader :id
  attr_accessor :name
  
  def initialize(options)
    @name = options["name"]
  end
  
  # Public: .all
  # Get all the categories.
  #
  # Returns: Array - Rows from 'categories' with all information.
  def self.all
    DB.execute("SELECT * FROM categories")
  end
  
  def insert
    #           INSERT INTO categories (name) VALUES ('Movie');
    DB.execute("INSERT INTO categories (name) VALUES ('#{@name}')")
    @category_id = DB.last_insert_row_id
  end
  
end