# Get results as hash
DB.results_as_hash = true

DB.execute("CREATE TABLE IF NOT EXISTS locations (location_id INTEGER PRIMARY 
          KEY, city TEXT)")

DB.execute("CREATE TABLE IF NOT EXISTS products (id INTEGER PRIMARY KEY,
          serial_number INTEGER, quantity INTEGER, description TEXT, cost
          INTEGER, location_id INTEGER, category_id INTEGER)")

DB.execute("CREATE TABLE IF NOT EXISTS categories (category_id INTEGER PRIMARY
          KEY, name TEXT)")