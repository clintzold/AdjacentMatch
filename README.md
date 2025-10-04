ADJACENT MATCH

I wrote this algorithm to explore the idea of having a boolean method
that could take an array of objects and tell me if a consecutive
number of adjacent matches exists.

In the example found in this small file, I am looking at ten
objects that exist 'beside' each other in a collection. If
there are four objects adjacent to each other that contain
the same value, it returns true.

The reason I wrote this -and that it searches for 'four'- is 
because I was thinking of a way to solve the problem of determining
a winning-game in ConnectFour.

HOW IT WORKS

    - #adjacent_matches? accepts two arguments. The first being an
      array of adjacent objects, the second defines how many cons-
      ecutive matches are needed to trigger a True response

    - passed array acts as a queue, with each object shifted and 
      added to a collector array 'matches'

    - collector receives objects until number of matches if found OR
      until a new object has a value that does not match

    - when a new object value is discovered, collector is reset to
      receive objects with new value

    - continues until passed array is emptied or collector reaches
      specified length to trigger a True response
