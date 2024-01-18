var expect = require('chai').expect;
var StripComment = require('../strip_comment');

describe('StripComment', function() {
  it('README example', function() {
    strip_comment = new StripComment;
    expect(strip_comment.strip()).to.equal(null);
  });
});
