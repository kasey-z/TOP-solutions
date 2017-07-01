# Searching Binary Trees

This is a solution from [the Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms).

- class `Node`: has a `:key` that it stores and also links(`:left` and `:right`) to its children (if they exist).
when 'building the binary tree', if there is any repeated elements, it won't affect the tree structure, but only `:count` += 1.

- class `BinaryTree`: have a `:root` to store the root node. It has methods as below:

- method `build_tree` : which takes an array of data and turns it into a binary tree full of `Node` objects appropriately placed.

- method `breadth_first_search`: takes a target value and returns the node at which it is located using the breadth first search technique. (use an array acting as a queue to keep track of all the child nodes that you have yet to search and to add new ones to the list ) The result is a hash contains all the nodes (key => count) listed when searching for the data.

- method `depth_first_search`: takes a target value and returns the node at which the target value is located using the depth first search technique.(Use an array acting as a stack) The result is a hash contains all the nodes (key => count) listed when searching for the data.

- method `dfs_rec`: which runs a depth first search as before but this time, (using recursion instead of array as stack). The result is the same as method `depth_first_search`.
