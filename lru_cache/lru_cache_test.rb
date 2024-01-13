require 'rspec'
require 'benchmark'
require_relative "lru_cache.rb"

describe LRUCache do
  it 'README example' do
    lru_cache = LRUCache.new 2
    lru_cache.put(1, 1)
    lru_cache.put(2, 2)
    expect(lru_cache.get(1)).to eq 1
    lru_cache.put(3, 3)
    expect(lru_cache.get(2)).to eq -1
    lru_cache.put(4, 4)
    expect(lru_cache.get(1)).to eq -1
    expect(lru_cache.get(3)).to eq 3
    expect(lru_cache.get(4)).to eq 4
  end

  it 'fetches values when they are different than the key' do
    lru_cache = LRUCache.new 2
    expect(lru_cache.get(2)).to eq -1
    lru_cache.put(2, 6)
    expect(lru_cache.get(1)).to eq -1
    lru_cache.put(1, 5)
    lru_cache.put(1, 2)
    expect(lru_cache.get(1)).to eq 2
    expect(lru_cache.get(2)).to eq 6
  end

  it 'updates cache order on put' do
    lru_cache = LRUCache.new 2
    lru_cache.put(1, 1)
    lru_cache.put(2, 2)
    lru_cache.put(1, 11)
    lru_cache.put(3, 3)
    expect(lru_cache.get(1)).to eq 11
    expect(lru_cache.get(2)).to eq -1
    expect(lru_cache.get(3)).to eq 3
  end

  it 'print the performance' do
    lru_cache = LRUCache.new 2048
    puts '', 'Performance report:'
    Benchmark.bm do |x|
      x.report('put') { 50_000.times { lru_cache.put(rand(2048), rand(2048)) } }
      x.report('get') { 50_000.times { lru_cache.get(rand(2048)) } }
    end
  end
end
