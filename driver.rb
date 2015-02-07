require 'pry'

# Empower my program with SQLite.
require "sqlite3"

# Load/create our database for this program.
DATABASE = SQLite3::Database.new("warehouse_mgr.db")

require_relative "location.rb"
require_relative "category.rb"
require_relative "product.rb"
require_relative "warehouse_setup.rb"


binding.pry