require 'rspec'
require_relative "comment_stripper.rb"

describe CommentStripper do
  it 'README example' do
    input = "apples, pears # and bananas\ngrapes\nbananas !apples"
    markers = ["#", "!"]

    result = CommentStripper.strip(input, markers)

    expect(result).to eq("apples, pears\ngrapes\nbananas")
  end

  it 'strips different markers' do
    input = "a #b\nc\nd $e f g"
    markers = ["#", "$"]

    result = CommentStripper.strip(input, markers)

    expect(result).to eq("a\nc\nd")
  end

  it 'strips comment if there is no leading space' do
    input = "apples, pears# and bananas\ngrapes\nbananas!apples"
    markers = ["#", "!"]

    result = CommentStripper.strip(input, markers)

    expect(result).to eq("apples, pears\ngrapes\nbananas")
  end

end
