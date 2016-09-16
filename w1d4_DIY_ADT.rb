class Stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def add(el)
      # adds an element to the stack
      @stack.push(el)
    end

    def remove
      # removes one element from the stack
      @stack.pop(el)
    end

    def show
      # return a copy of the stack
      @stack
    end
  end

#Now let's write a Queue class.
#We will need the following instance methods: enqueue(el), dequeue, and show.
#
# Test your code to ensure it follows the principle of FIFO.

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    @map <<[key, value]
  end

  def lookup(key)
    @map.each do |pair|
      return pair[1] if pair[0]== key
    end
    nil
  end

  def remove(key)
    value = @map.lookup(key)
    @map.delete([key, value])
  end

  def show
    @map
  end
end
