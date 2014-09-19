#ifndef __SIMPLE_HASH_TABLE_H__
#define __SIMPLE_HASH_TABLE_H__

#include <vector>
#include <map>
#include <functional>
#include <cstddef>

using std::size_t;
using std::map;
using std::vector;
using std::hash;

/**
 * A simple hash table supporting basic operations, for interviewing question purposes.
 * (!!) Does not handle resizes as of yet. (Resize would require considering the table load factor and performing 
 * a rehash of its entire contents). (Resize is usually performed when the hash table load factor, that is, 
 * "number_of_items / "number_of_buckets" is beyond a predefined threshold)
 *
 * Underlying data structure is a vector (array) and using closed addressing, and using
 * std::map for chainings (this in turn uses red-black trees and as such ensures logarithmic insertion/find complexity)
 *
 */
template<class Key, class Value>
class SimpleHashTable 
{
public:
    /// Ctor - initialize hash map
    SimpleHashTable(size_t size);

    /// Table[key] = value
    void insert(const Key& key, const Value& val);
    
    /// get the value corresponding to the given key. throws out_of_range if element does not exist.
    Value get(const Key& key) const;

    /// Removes the key-value corresponding to the given key. throws out_of_range if element does not exist.
    void remove(const Key& key);

    /// Prints buckets and their data
    void printTable() const;

private:
    size_t m_capacity;
    vector<map<Key, Value> > m_records;
    hash<Key> m_hashFunction;
    
    /// Returns the hashed index of a given key. Returned index is within the table size limits.
    int getHashedIndex(const Key& key) const;
};

#include "SimpleHashTable.inl"

#endif //__SIMPLE_HASH_TABLE_H__