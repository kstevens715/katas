class CommentStripper

  def strip(input, markers)
    input.gsub(/\s*(#{markers.map(&Regexp.method(:escape)).join('|')}).*/, '')
  end

end
