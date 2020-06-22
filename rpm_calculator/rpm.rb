class Rpm
  attr_accessor :original

  def self.convert(string)
    new(string).convert
  end

  def initialize(string)
    self.original = string.split(" ")
  end

  def convert(rpm=original, in_params=nil, last_solution=nil)
    func_index = rpm.index do |i|
      ["+", "-", "*", "/"].include? i
    end
    func = rpm.delete_at func_index
    b = rpm.delete_at func_index - 1
    a = rpm.delete_at func_index - 2
    solution = solve a.to_i, b.to_i, func

    return [a, func, b, " = ", solution].join if rpm.length == 0 && in_params == nil

    if rpm.length > 1
      parenthese = if in_params
        if a == last_solution
          ['(', in_params, func, b, ')'].join
        elsif b == last_solution
          ['(', a, func, in_params, ')'].join
        else
          raise 'this should not happen'
        end
      else
        ['(', a, func, b, ')'].join
      end
      convert(rpm.insert(func_index - 2, solution), parenthese, solution)
    elsif in_params
      equ = if a == last_solution
        [in_params, func, b].join
      elsif b == last_solution
        [a, func, in_params].join
      else
        raise 'this should not happen'
      end
      [equ, " = ", solution].flatten.join
    end
  end

  private

  def solve(a, b, func)
    a.send(func, b)
  end
end
