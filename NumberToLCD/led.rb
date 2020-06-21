class Led
  def print(number)
    number.to_s.chars.inject(["","",""]) do |memo, i|
      memo.zip(numbers[i.to_i]).map { |memo_row, new_row| memo_row + new_row }
    end.join("\n") + "\n"
  end

  private

  def numbers
    {
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
