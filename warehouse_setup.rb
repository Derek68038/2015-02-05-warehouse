# Get results as hash
DB.results_as_hash = true

DB.execute("CREATE TABLE IF NOT EXISTS locations (id INTEGER PRIMARY 
          KEY, city TEXT)")

DB.execute("CREATE TABLE IF NOT EXISTS products (id INTEGER PRIMARY KEY,
          serial_number INTEGER, description TEXT, quantity INTEGER, cost
          INTEGER, location_id INTEGER, category_id INTEGER)")

DB.execute("CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY
          KEY, name TEXT)")