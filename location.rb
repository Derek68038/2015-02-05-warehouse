class Location
  attr_reader :id
  attr_accessor :city
  
  def initialize(options)
    @city = options["city"]
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