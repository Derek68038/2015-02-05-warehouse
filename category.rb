class Category
  attr_reader :category_id
  attr_accessor :name
  
  def initialize(options)
    @name = options["name"]
  end
  
  # Public: #products
  # Get the products which are in this category.
  #
  # Returns: Array - Rows from 'products' table for this category.
  def products
    #                 SELECT * FROM products WHERE category_id = 2;
    DB.execute("SELECT * FROM products WHERE product_id = #{@category_id}")
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