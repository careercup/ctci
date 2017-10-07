#ifndef __SIMPLE_HASH_TABLE_INL__
#define __SIMPLE_HASH_TABLE_INL__

#include "SimpleHashTable.h"
#include <stdexcept>
#include <utility>
#include <iostream>

using std::make_pair;
using std::cout;
using std::endl;

template<class Key, class Value>
SimpleHashTable<Key, Value>::SimpleHashTable(size_t size)
: m_capacity(size), m_records(size)
{
    // vector is sized to the given size upon construction.
}

template<class Key, class Value>
void SimpleHashTable<Key, Value>::insert(const Key& key, const Value& val) 
{
    // vector[hash(key)] is the red-black tree of the index hash(key). insert the value to that tree.
    m_records[getHashedIndex(key)][key] = val;
}

template<class Key, class Value>
Value SimpleHashTable<Key, Value>::get(const Key& key) const 
{
    int hashedKey = getHashedIndex(key);
    map<Key, Value>::const_iterator it = m_records[hashedKey].find(key);

    if (it == m_records[hashedKey].end()) 
    {
        throw std::out_of_range("Item is not in map");
    } 

    return it->second;
}

template<class Key, class Value>
void SimpleHashTable<Key, Value>::remove(const Key& key) 
{
    int hashedKey = getHashedIndex(key);
    map<Key, Value>::iterator it = m_records[hashedKey].find(key);

    if(it == m_records[hashedKey].end()) 
    {
        throw std::out_of_range("Item is not in map");
    }
    
    m_records[hashedKey].erase(it);
}

template<class Key, class Value>
void SimpleHashTable<Key, Value>::printTable() const 
{  
    int curBucketIndex = 0;

    for (vector<map<Key, Value> >::const_iterator rec_iterator=m_records.begin(); rec_iterator != m_records.end(); ++rec_iterator, ++curBucketIndex)
    {
        cout << "Bucket " << curBucketIndex << ":" << endl;

        for (map<Key, Value>::const_iterator map_iterator = rec_iterator->begin(); map_iterator != rec_iterator->end(); ++map_iterator) 
        {
            cout << "Key:" << map_iterator->first << " , Value:" << map_iterator->second << endl;
        }
    }
}

template<class Key, class Value>
int SimpleHashTable<Key, Value>::getHashedIndex(const Key& key) const 
{
    // Note that this can be optimized if we keep the table size to a constant power of 2.
    // for example, if the table size is 8 (indices 0 to 7, so up to 111 in binary) - and our hashed key is x, 
    // perform x&(size-1) --> x&111 , instead of x%size
    return m_hashFunction(key) % m_capacity;
}

#endif //__SIMPLE_HASH_TABLE_INL__

