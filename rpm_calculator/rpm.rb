class Rpm
  attr_accessor :original

  def self.convert(string)
    new(string).convert
  end

  def initialize(string)
    self.original = string.split(" ")
  end

  def convert(rpm=original, in_parens=nil, last_solution=nil)
    func_index = first_operator_index(rpm)
    func = rpm.delete_at func_index
    b = rpm.delete_at func_index - 1
    a = rpm.delete_at func_index - 2
    solution = solve a.to_i, b.to_i, func

    return exit_recursion(a, b, func, in_parens, last_solution, solution) if rpm.length == 0

    parenthese = "(#{replace_a_or_b_with_last_parens(a, b, func, in_parens, last_solution)})"
    convert(rpm.insert(func_index - 2, solution), parenthese, solution)
  end

  private

  def exit_recursion(a, b, func, in_parens, last_solution, solution)
    left_hand_side_of_eq = replace_a_or_b_with_last_parens(a, b, func, in_parens, last_solution)
    [left_hand_side_of_eq, " = ", solution].join
  end

  def first_operator_index(rpm)
    rpm.index do |i|
      ["+", "-", "*", "/"].include? i
    end
  end

  def replace_a_or_b_with_last_parens(a, b, func, in_parens, last_solution)
    if last_solution == nil
      [a, func, b].join
    elsif a == last_solution
      [in_parens, func, b].join
    elsif b == last_solution
      [a, func, in_parens].join
    end
  end

  def solve(a, b, func)
    a.send(func, b)
  end
end
