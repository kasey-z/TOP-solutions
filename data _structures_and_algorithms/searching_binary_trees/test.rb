require '.\searching_binary_trees'

tree = BinaryTree.new
tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

p tree.breadth_first_search(9)
p tree.depth_first_search(9)
p tree.dfs_rec(9)
