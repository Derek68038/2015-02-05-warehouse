class Location
  attr_reader :location_id
  attr_accessor :city
  
  def initialize(options)
    @city = options["city"]
  end
  
  # Public: #products
  # Get the products which are in this location.
  #
  # Returns: Array - Rows from 'products' table for this location.
  def products
    #                 SELECT * FROM products WHERE product_id = 2;
    DB.execute("SELECT * FROM products WHERE product_id = #{@location_id}")
  end

  # Public: .all
  # Get all the locations.
  #
  # Returns: Array - Rows from 'locations' with all information.
  def self.all
    DB.execute("SELECT * FROM locations")
  end
  
  def insert
    #           INSERT INTO locations (city) VALUES ('Omaha');
    DB.execute("INSERT INTO locations (city) VALUES ('#{@city}')")
    @location_id = DB.last_insert_row_id
  end
  
end