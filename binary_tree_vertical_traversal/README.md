Given the root of a binary tree, calculate the vertical order traversal of the binary tree.

For each node at position (row, col), its left and right children will be at positions (row + 1, col - 1) and (row + 1, col + 1) respectively. The root of the tree is at (0, 0).

The vertical order traversal of a binary tree is a list of top-to-bottom orderings for each column index starting from the leftmost column and ending on the rightmost column. There may be multiple nodes in the same row and same column. In such a case, sort these nodes by their values.

Return the vertical order traversal of the binary tree.

 
Given TreeNode class:

```
class TreeNode

  attr_accessor :value, :left, :right

  def initialize(value: 0, left: nil, right: nil)
    @value = value
    @left = left
    @right = right
  end

end

```

Example 1:

![](images/example1.jpeg)

```
Input:

root_node = TreeNode.new(value: 3,
  left: TreeNode.new(value: 9),
  right: TreeNode.new(value: 20,
    left: TreeNode.new(value: 15),
    right: TreeNode.new(value: 7)
  )
)

Output: [[9],[3,15],[20],[7]]

Explanation:
Column -1: Only node 9 is in this column.
Column 0: Nodes 3 and 15 are in this column in that order from top to bottom.
Column 1: Only node 20 is in this column.
Column 2: Only node 7 is in this column.
```

Example 2:

![](images/example2.jpeg)

```
Input:

root_node = TreeNode.new(value: 1,
  left: TreeNode.new(value: 2,
    left: TreeNode.new(value: 4),
    right: TreeNode.new(value: 5)
  ),
  right: TreeNode.new(value: 3,
    left: TreeNode.new(value: 6),
    right: TreeNode.new(value: 7)
  )
)

Output: [[4],[2],[1,5,6],[3],[7]]
Explanation:
Column -2: Only node 4 is in this column.
Column -1: Only node 2 is in this column.
Column 0: Nodes 1, 5, and 6 are in this column.
          1 is at the top, so it comes first.
          5 and 6 are at the same position (2, 0), so we order them by their value, 5 before 6.
Column 1: Only node 3 is in this column.
Column 2: Only node 7 is in this column.
```

Example 3:

![](images/example3.jpeg)

```
Input:

root_node = TreeNode.new(value: 1,
  left: TreeNode.new(value: 2,
    left: TreeNode.new(value: 4),
    right: TreeNode.new(value: 6)
  ),
  right: TreeNode.new(value: 3,
    left: TreeNode.new(value: 5),
    right: TreeNode.new(value: 7)
  )
)

Output:

[[4],[2],[1,5,6],[3],[7]]

Explanation:
This case is the exact same as example 2, but with nodes 5 and 6 swapped.
Note that the solution remains the same since 5 and 6 are in the same location and should be ordered by their values.
```
