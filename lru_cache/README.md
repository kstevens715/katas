Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

Implement the LRUCache class:
* LRUCache(capacity) Initialize the LRU cache with positive size capacity.
* get(key) Return the value of the key if the key exists, otherwise return -1.
* put(key, value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
 

Example:

```
lru_cache = LRUCache.new(2);
lru_cache.put(1, 1); // cache is {1=1}
lru_cache.put(2, 2); // cache is {1=1, 2=2}
lru_cache.get(1);    // return 1
lru_cache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
lru_cache.get(2);    // return -1 (not found)
lru_cache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
lru_cache.get(1);    // return -1 (not found)
lru_cache.get(3);    // return 3
lru_cache.get(4);    // return 4
```

## Running the specs

Ruby:
```
bundle install
rspec lru_cache_test.rb
```

JavaScript
```
npm install
npm test
```
