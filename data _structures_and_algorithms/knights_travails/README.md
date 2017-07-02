# Knight's Travails

This is a solution for [the Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms)

- This project uses a data structure `graphs` that's similar (but not identical) to a binary tree.  

- A knight in chess can move to any square on the standard 8x8 chess board from any other square on the board, given enough turns. Its basic move is two steps forward and one step to the side. It can face any direction.

## `knight_moves.rb`

- class `Vertex` : has `:key` to store the coordinate, and `:neighbors` to store all the possible coordinate in one move.

- class `Graphs` : has `:vertices` to store the vertices in a hash. To find a vertex is by @vertices[key].

- Using `breadth_first_search` to find the shorted path. The result is all the listed vertex.

- Using iteration to find all the parent vertex from the result from the BFS.

## `game.rb`

- The scrip to run the functions.   
