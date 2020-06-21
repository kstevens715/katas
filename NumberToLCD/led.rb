class Led
  def print(number)
    number.to_s.chars.inject("\n\n\n") do |memo, i|
      source_1, source_2, source_3 = memo.split("\n", -1)
      new_1, new_2, new_3 = numbers[i.to_i].split("\n")
      [source_1 + new_1, source_2 + new_2, source_3 + new_3].join("\n") << "\n"
    end
  end

  private

  def numbers
    {
      1 => "   \n" \
           "  |\n" \
           "  |\n",
      2 => " _ \n" \
           " _|\n" \
           "|_ \n",
      3 => " _ \n" \
           " _|\n" \
           " _|\n",
      4 => "   \n" \
           "|_|\n" \
           "  |\n",
      5 => " _ \n" \
           "|_ \n" \
           " _|\n",
      6 => " _ \n" \
           "|_ \n" \
           "|_|\n",
      7 => " _ \n" \
           "  |\n" \
           "  |\n",
      8 => " _ \n" \
           "|_|\n" \
           "|_|\n",
      9 => " _ \n" \
           "|_|\n" \
           " _|\n",
      0 => " _ \n" \
           "| |\n" \
           "|_|\n",
    }
  end
end
