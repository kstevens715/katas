# Description

Complete the solution so that it strips all text that follows any of a set of comment markers passed in. Any whitespace at the end of the line should also be stripped out.

## Example:

Given an input string of:

```
apples, pears # and bananas
grapes
bananas !apples
```

The output expected would be:
```
apples, pears
grapes
bananas
```

Example spec:
```
result = CommentStripper.strip("apples, pears # and bananas\ngrapes\nbananas !apples", ["#", "!"])
expect(result).to eq("apples, pears\ngrapes\nbananas")
```

### Running ruby build
```
cd ruby
bundle install
rspec
```

### Running javascript build

```
npm install
npm test
```
