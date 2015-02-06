class Product
  attr_reader :id
  attr_accessor :serial_number, :quantity, :description, :cost
  
  def initialize(options)
    @serial_number    = options["serial_number"]
    @quantity         = options["quantity"]
    @description      = options["description"]
    @cost             = options["cost"]
    @location_num     = options["location_num"]
    @category_num     = options["category_num"]
  end
  
  # Public: .all
  # Get all the categories.
  #
  # Returns: Array - Rows from 'categories' with all information.
  def self.all
    DB.execute("SELECT * FROM categories")
  end
  
  def insert
    #           INSERT INTO products (description) VALUES ('Fargo');
    DB.execute("INSERT INTO categories (serial_number, quantity,
               description, cost, location_num, category_num) VALUES (
               #{@serial_number}, #{@quantity}, '#{@description}', #{@cost},
               #{@location_num}, #{@category_num})")
    @product_id = DB.last_insert_row_id
  end
  
end