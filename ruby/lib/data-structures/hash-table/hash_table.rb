require_relative '../linked-list/singly_linked_list'
Entry = Struct.new(:key, :value)
class HashTable
  HASH_FUNCTION_FACTOR = 10 # this is a simple solution, we should use array_length, resize and rehash.
  def initialize
    @map = []
  end

  def []= key, value
    raise UniqueKeyError.new("key must be unique") if self[key]
    hashed_key = self.hash_func(key)
    entry = Entry.new(key, value)
    @map[hashed_key] = SinglyLinkedList.new(entry) and return unless @map[hashed_key]
    @map[hashed_key].push_top(entry)
  end

  def [] key
    if list = @map[self.hash_func(key)]
      entry = list.detect {|node| node.data.key == key }
      entry.data.value if entry
    end
  end

  def hash_func key
    key.length % HASH_FUNCTION_FACTOR
  end
end

class UniqueKeyError < StandardError;end
