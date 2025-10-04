#I wrote this program to explore the idea of a method that could compare
#neighbouring objects and their values to find a consecutive number of matches.

#In this case - four ajdacent objects that return matching values

#No matter the size of the array, if a block of four objects is found,
#the method returns True.

#I utilized a queue that grows unless a non-matching object is discovered,
#at which point the queue is emptied of the previous collection and the new
#object is added. 

#Each new value restarts the process of looking for its own kind.

#Creating this search algorithm was part of an idea I had for solving
#the problem of ConnectFour for The Odin Project, which is why objects
#are stored in a hash, instead of an array to begin with.

#All classes and methods besides #four_kind? are simply there to support
#the implementation of #four_kind?. I'm sure there are many other use
#cases.

class Objects
  attr_accessor :value, :id
  
  def initialize(id)
    @value = nil
    @id = id
  end
end

class Collection
  attr_accessor :objects

  def initialize
    @objects = create_objects
  end

  def create_objects
    hash = {}
    id = 1
    10.times do
      hash[id] = Objects.new(id)
      id += 1
    end
    return hash
  end

  def make_array
    array = []
    @objects.each do |key, value|
      array << value
    end
    return array
  end

  #Adjacent match search algorithm
  def adjacent_matches?(array, num_of_matches)
    matches = [array.shift] #Add first object to compare
    while !array.empty?
      curr = array.shift  #Get next object to compare
      last = matches.last #Always the most recently added object

      #If next object has matching value, add to matches.
      #Remove all matches when non-matching value is found and 
      #repeat search with new value
      if last.value == curr.value
        matches << curr
      else 
        matches = [curr]
      end
      return true if match_array.length == num_of_matches 
    end
    #No consecutive matches of length 'num_of_matches' found
    return false
  end
end

group = Collection.new
objects_array = group.make_array
group.adjacent_matches?(objects_array, 4)
