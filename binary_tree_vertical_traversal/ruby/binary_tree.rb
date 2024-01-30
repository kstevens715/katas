class BinaryTree

  def initialize(root_node)
    @root_node = root_node
    @results = {}
  end

  def vertical_traversal
    traverse root_node

    output_results
  end

  private

  attr_reader :results, :root_node

  def output_results
    results.sort.map do |_, value|
      value.values.flatten.sort
    end
  end

  def traverse(node, x: 0, y: 0)
    return unless node

    results[x] ||= {}
    results[x][y] ||= []
    results[x][y] << node.value

    traverse node.left, x: x - 1, y: y + 1
    traverse node.right, x: x + 1, y: y + 1
  end
end
