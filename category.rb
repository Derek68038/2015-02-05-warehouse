# Class: Category
#
# Creates new category objects/records for categories table in warehouse_mgr 
# database.
# 
# Attributes:
# @id     - Integer: the primary key identifier for the category name.
# @name   - String: the category name.
#
# Public Methods:
# ???
#
# Private Methods:
# insert

class Category
  
  attr_reader :id
  attr_accessor :name
  
  # Private (triggered by .new): .initialize
  # Gathers arguments (field values) in an options Hash; automatically inserts 
  # them into the categories table via private method .insert.
  #
  # Parameters:
  # options - {name: String}
  #
  # Returns: 
  # ???
  # 
  # State Changed:
  # ???
  
  def initialize(options)
    @name = options["name"]
  end
  
  # Public: .all
  # Get all the records in the categories table.
  #
  # Parameters:
  # None
  #
  # Returns: 
  # Array: Records from the categories table displaying all fields.
  #
  # State Changes:
  # None
  
  def self.all
    DATABASE.execute("SELECT * FROM categories")
  end
  
  #private
  
  # Private: #insert
  # Syntax to enter the Ruby object's arguments as a records' field values via 
  # sqlite3
  #
  # Parameters:
  # None
  #
  # Returns: 
  # Integer - @id, "id" field value, generated by table upon creation and 
  # pulled from the record.
  # 
  # State Changes:
  # ???
  
  def insert
    DATABASE.execute("INSERT INTO categories (name) VALUES ('#{@name}')")
    @id = DATABASE.last_insert_row_id
  end
  
end