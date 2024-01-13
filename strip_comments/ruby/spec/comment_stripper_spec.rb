require 'rspec'
require './comment_stripper'

describe CommentStripper do
  it 'README example' do
    input = "apples, pears # and bananas\ngrapes\nbananas !apples"
    markers = ["#", "!"]

    result = CommentStripper.new.strip(input, markers)

    expect(result).to eq("apples, pears\ngrapes\nbananas")
  end

  it 'strips different markers' do
    input = "a #b\nc\nd $e f g"
    markers = ["#", "$"]

    result = CommentStripper.new.strip(input, markers)

    expect(result).to eq("a\nc\nd")
  end

  it 'strips comment if there is no leading space' do
    input = "apples, pears# and bananas\ngrapes\nbananas!apples"
    markers = ["#", "!"]

    result = CommentStripper.new.strip(input, markers)

    expect(result).to eq("apples, pears\ngrapes\nbananas")
  end

end
