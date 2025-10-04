#adjacent_match
#searching function that finds a specified number of consecutive, matching objects

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
      return true if matches.length == num_of_matches 
    end
    #No consecutive matches of length 'num_of_matches' found
    return false
  end
end

group = Collection.new
objects_array = group.make_array
group.adjacent_matches?(objects_array, 4)
