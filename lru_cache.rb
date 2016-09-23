class LRUCache
    def initialize(size)
      @cache = []
      @size = size
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      pop if  count == size
      @cache << el



    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache 
    end

    private
    # helper methods go here!

    def pop
      @cache.shift
    end

  end
