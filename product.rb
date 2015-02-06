class Product
  attr_reader :id
  attr_accessor :serial_number, :quantity, :description, :cost, :location_id,
  :category_id
  
  def initialize(options)
    @serial_number    = options["serial_number"]
    @description      = options["description"]
    @quantity         = options["quantity"]
    @cost             = options["cost"]
    @location_id      = options["location_id"]
    @category_id      = options["category_id"]
  end

  # Take all the attributes for this object and make sure
  # those are the values in the object's corresponding row
  # in the "products" table.
  def save #updates the locations table to changes we made to the object in ruby
    attributes = []
    
    # Example  [:@name, :@age, :@hometown]
    instance_variables.each do |i|
      # Example  :@name
      attributes << i.to_s.delete("@") # "name"
    end

    query_components_array = []

    attributes.each do |a|
      value = self.send(a)
  
      if value.is_a?(Integer)
        query_components_array << "#{a} = #{value}"
      else
        query_components_array << "#{a} = '#{value}'"
      end
    end

    query_string = query_components_array.join(", ")
    # name = 'Sumeet', age = 75, hometown = 'San Diego'
    
    DB.execute("UPDATE products SET #{query_string} WHERE id = #{id}")
  end
    
  # Public: .all
  # Get all the products.
  #
  # Returns: Array - Rows from 'products' with all information.
  def self.all
    DB.execute("SELECT * FROM products")
  end
  
  def insert
    #           INSERT INTO products (description) VALUES ('Fargo');
    DB.execute("INSERT INTO products (serial_number, description, quantity,
               cost, location_id, category_id) VALUES (
               #{@serial_number}, '#{@description}', #{@quantity}, #{@cost},
               #{@location_id}, #{@category_id})")
    @id = DB.last_insert_row_id
  end
  
  # Public .where_name_is
  # Gets a list of students with a given name.
  #
  # Parameters:
  # x - String: The name to search for.
  #
  # Returns:
  # Array of student objects with the given name.
  def self.fetch_products_from_location(location_id)
    results = DB.execute("SELECT * FROM products WHERE location_id = 
                              '#{@location_id}'")
    
    results_as_objects = []
    
    results.each do |r|
      results_as_objects << self.new(r) #any results returned as new objects   
    end
    
    results_as_objects
  end
  
  # Public .where_name_is
  # Gets a list of students with a given name.
  #
  # Parameters:
  # x - String: The name to search for.
  #
  # Returns:
  # Array of student objects with the given name.
  def self.fetch_products_from_category(category_id)
    results = DB.execute("SELECT * FROM products WHERE category_id = 
                              '#{@category_id}'")
    
    results_as_objects = []
    
    results.each do |r|
      results_as_objects << self.new(r) #any results returned as new objects   
    end
    
    results_as_objects
  end
  
  def delete_product
    
end
end
