##
# File: animal_user.rb
# Author: Richard Kneale
# Date created: 24th May 2018
# Date modified: 24th May 2018
# Description: Use to add animals to a farm

# Import the animal class once
require_relative "animal"

# Create animal 1
animal1 = Animal.new

# Create animal 2
animal2 = Animal.new("pig", "Piggly", "oink!")

# Create animal 3 and change its name
animal3 = Animal.new
animal3.name = "Paul";

# Create animal 3 and change its name
animal4 = Animal.new

# Create animal 3 and change its name
animal5 = Animal.new
animal5.species = "PIG";

# Print the register for the farm
Animal.print_farm
