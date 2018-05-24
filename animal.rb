##
# File: animal.rb
# Author: Richard Kneale
# Date created: 24th May 2018
# Date modified: 24th May 2018
# Description: Represents an animal

# A class representing an animal
class Animal

  # A register of animals on the farm
  @@farm = []
  
  # Allows the user to set or get the species, name, or noise of an animal
  attr_accessor :name, :noise
  attr_reader :species
  
  def species=(species)
    @species = species.downcase
  end
  
  # Defines the positions of attributes in an array of species
  module SpeciesArrayPositions
    SPECIES = 0
    QUANTITY = 1
  end
  
  # Creates an animal
  def initialize(species="cow", name="Daisy", cry="moo!")
     
     # Set the attributes
     @species = species.downcase
     @name = name
     @cry = cry
     
     # Append a nw animal to the register
     @@farm << self
     
     # Introduce the animal
     puts "A new #{@species} named \"#{@name}\" has joined the farm!\n\"#{@cry.capitalize}\", it cries!\n\n"
     
  end
  
  # Check whether an animal of a species already exists on the farm
  def self.species_check(species_array, species)

    # The number of intances of the species being checked
    species_count = 1
    
    # Get the length of the array of unique species
    species_array_length = species_array.length
    
    # If the array is not empty
    if species_array_length > 0
    
      # For each species in the array
      for counter in 0..(species_array_length-1)
        
        # If an animal of the species is already on the farm
        if species_array[counter][SpeciesArrayPositions::SPECIES] == species
        
          # Increment the counter
          species_array[counter][SpeciesArrayPositions::QUANTITY] = species_array[counter][SpeciesArrayPositions::QUANTITY] + 1
          
          # Get the number of animals of the species
          species_count = species_array[counter][SpeciesArrayPositions::QUANTITY]
          
          # Leave the for loop
          break
        end
      
      end
    
    end
    
    # If an animal of the species was not already on the farm
    if species_count == 1
      
      # Append the species to the array of existing species
      species_array << [species, 1]
      
    end
    
    return species_count
  end
  
  # Prints the register for the farm
  def self.print_farm
    
    # An array containing the names and quantity of species
    species_array = []
    
    # Prints the species of animals on the farm and provides a count of duplicates
    puts "The farm has #{@@farm.length} animals:"
    @@farm.each do |p|
      species = p.species
      species_count = species_check(species_array, species)
      
      if species_count == 1
        puts p.species.capitalize
      else
        puts p.species.capitalize + " (#{species_count})"
      end
    end
  
  end

end
