class Led
  def initialize(height=1, width=1)
    @height = height
    @width = width
  end

  def print(number)
    number.to_s.chars.inject([""] * total_height) do |memo, i|
      memo.zip(numbers[i.to_i]).map { |memo_row, new_row| memo_row + new_row }
    end.join("\n") + "\n"
  end

  private

  def total_height
    3 + (@height - 1) * 2
  end

  def numbers
    @_numbers ||= raw_numbers.transform_values do |number|
      number = pad_width(number)
      pad_height(number)
    end
  end

  def pad_height(number)
      top_padding = number[1].gsub("_", " ")
      bottom_padding = number[2].gsub("_", " ")

      [ number[0],
        [top_padding] * (@height - 1),
        number[1],
        [bottom_padding] * (@height - 1),
        number[2]
      ].flatten
  end

  def pad_width(number)
    number.map do |row|
      row.gsub(/(.)(.)/, '\1' + '\2' * @width)
    end
  end

  def raw_numbers
    @_raw_numbers ||= {
      1 => [ "   ",
             "  |",
             "  |" ],
      2 => [ " _ ",
             " _|",
             "|_ "],
      3 => [ " _ ",
             " _|",
             " _|"],
      4 => [ "   ",
             "|_|",
             "  |"],
      5 => [ " _ ",
             "|_ ",
             " _|"],
      6 => [ " _ ",
             "|_ ",
             "|_|"],
      7 => [ " _ ",
             "  |",
             "  |"],
      8 => [ " _ ",
             "|_|",
             "|_|"],
      9 => [ " _ ",
             "|_|",
             " _|"],
      0 => [ " _ ",
             "| |",
             "|_|"],
    }
  end
end
