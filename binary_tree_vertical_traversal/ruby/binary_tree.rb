class BinaryTree

  class Results
    attr_reader :results

    def initialize
      @results = {}
    end

    def add(x:, y:, value:)
      results[x] ||= {}
      results[x][y] ||= []
      results[x][y] << value
    end

    def to_a
      results.sort.map do |_, value|
        value.values.flatten.sort
      end
    end
  end

  def initialize(root_node)
    @root_node = root_node
    @results = Results.new
  end

  def vertical_traversal
    traverse root_node

    results.to_a
  end

  private

  attr_reader :results, :root_node

  def traverse(node, x: 0, y: 0)
    return unless node

    results.add x:, y:, value: node.value

    traverse node.left, x: x - 1, y: y + 1
    traverse node.right, x: x + 1, y: y + 1
  end
end
