var expect = require('chai').expect;
var LRUCache = require('./lru_cache');

describe('LRUCache', function() {
  it('README example', function() {
    lru_cache = new LRUCache(2);
    lru_cache.put(1, 1)
    lru_cache.put(2, 2)
    expect(lru_cache.get(1)).to.equal(1)
    lru_cache.put(3, 3)
    expect(lru_cache.get(2)).to.equal(-1)
    lru_cache.put(4, 4)
    expect(lru_cache.get(1)).to.equal(-1)
    expect(lru_cache.get(3)).to.equal(3)
    expect(lru_cache.get(4)).to.equal(4)
  });

  it('fetches values when they are different than the key', function() {
    lru_cache = new LRUCache(2);
    expect(lru_cache.get(2)).to.equal(-1)
    lru_cache.put(2, 6)
    expect(lru_cache.get(1)).to.equal(-1)
    lru_cache.put(1, 5)
    lru_cache.put(1, 2)
    expect(lru_cache.get(1)).to.equal(2)
    expect(lru_cache.get(2)).to.equal(6)
  });

  it('updates cache order on put', function() {
    lru_cache = new LRUCache(2);
    lru_cache.put(1, 1)
    lru_cache.put(2, 2)
    lru_cache.put(1, 11)
    lru_cache.put(3, 3)
    expect(lru_cache.get(1)).to.equal(11)
    expect(lru_cache.get(2)).to.equal(-1)
    expect(lru_cache.get(3)).to.equal(3)
  });
});
