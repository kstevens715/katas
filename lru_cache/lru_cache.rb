class LRUCache
  def initialize(capacity)
    @capacity_range = (capacity..)
    @cache = {}
    @recent = []
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
  attr_reader :cache, :capacity_range

  def record_ru(key)
    recent.unshift(key).uniq!
    recent.slice! capacity_range
  end

  def evict_lru
    cache.delete_if do |key|
      !recent.include? key
    end
  end
end
