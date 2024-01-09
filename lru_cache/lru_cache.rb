class LRUCache
  def initialize(capacity)
    @capacity_range = (capacity..)
    @cache = {}
    @recent = []
    @lru = []
  end

  def get(key)
    value = cache.fetch(key) { return -1 }
    record_ru key
    value
  end

  def put(key, value)
    record_ru key
    cache[key] = value
    evict_lru
  end

  private

  attr_accessor :recent
  attr_reader :cache, :capacity_range, :lru

  def record_ru(key)
    recent.unshift(key).uniq!
    lru.push(*recent.slice!(capacity_range))
  end

  def evict_lru
    lru.reject! do |key|
      cache.delete key
      true
    end
  end
end
