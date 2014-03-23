using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace ctci.Library
{
    public class Set<T> : ICollection<T>, ISerializable, IDeserializationCallback
    {
        private readonly Dictionary<T, object> _dictionary;

        public Set()
        {
            _dictionary = new Dictionary<T, object>();
        }

        public Set(IEnumerable<T> items) :
            this()
        {
            if (items == null)
            {
                return;
            }

            foreach (T item in items)
            {
                Add(item);
            }
        }

        public Set<T> NullSet { get { return new Set<T>(); } }

        public Set<T> Union(Set<T> set)
        {
            Set<T> unionSet = new Set<T>(this);

            if (null == set)
            {
                return unionSet;
            }

            foreach (T item in set)
            {
                if (unionSet.Contains(item))
                {
                    continue;
                }

                unionSet.Add(item);
            }

            return unionSet;
        }

        public Set<T> Subtract(Set<T> set)
        {
            Set<T> subtractSet = new Set<T>(this);

            if (null == set)
            {
                return subtractSet;
            }

            foreach (T item in set)
            {
                if (!subtractSet.Contains(item))
                {
                    continue;
                }

                subtractSet._dictionary.Remove(item);
            }

            return subtractSet;
        }

        public bool IsSubsetOf(Set<T> set)
        {
            Set<T> setToCompare = set ?? NullSet;

            foreach (T item in this)
            {
                if (!setToCompare.Contains(item))
                {
                    return false;
                }
            }

            return true;
        }

        public Set<T> Intersection(Set<T> set)
        {
            Set<T> intersectionSet = NullSet;

            if (null == set)
            {
                return intersectionSet;
            }

            foreach (T item in this)
            {
                if (!set.Contains(item))
                {
                    continue;
                }

                intersectionSet.Add(item);
            }

            foreach (T item in set)
            {
                if (!Contains(item) || intersectionSet.Contains(item))
                {
                    continue;
                }

                intersectionSet.Add(item);
            }

            return intersectionSet;
        }

        public bool IsProperSubsetOf(Set<T> set)
        {
            Set<T> setToCompare = set ?? NullSet;

            // A is a proper subset of a if the b is a subset of a and a != b
            return (IsSubsetOf(setToCompare) && !setToCompare.IsSubsetOf(this));
        }

        public bool IsSupersetOf(Set<T> set)
        {
            Set<T> setToCompare = set ?? NullSet;

            foreach (T item in setToCompare)
            {
                if (!Contains(item))
                {
                    return false;
                }
            }

            return true;
        }

        public bool IsProperSupersetOf(Set<T> set)
        {
            Set<T> setToCompare = set ?? NullSet;

            // B is a proper superset of a if b is a superset of a and a != b
            return (IsSupersetOf(setToCompare) && !setToCompare.IsSupersetOf(this));
        }

        public List<T> ToList()
        {
            return new List<T>(this);
        }

        #region ICollection

        public void Add(T item)
        {
            if (null == item)
            {
                throw new ArgumentNullException("item");
            }

            _dictionary[item] = null;
        }

        public void Clear()
        {
            _dictionary.Clear();
        }

        public bool Contains(T item)
        {
            return _dictionary.ContainsKey(item);
        }

        public void CopyTo(T[] array, int arrayIndex)
        {
            if (array == null) throw new ArgumentNullException("array");
            if (arrayIndex < 0 || arrayIndex >= array.Length || arrayIndex >= Count)
            {
                throw new ArgumentOutOfRangeException("arrayIndex");
            }

            _dictionary.Keys.CopyTo(array, arrayIndex);
        }

        public bool Remove(T item)
        {
            return _dictionary.Remove(item);
        }

        public int Count
        {
            get { return _dictionary.Count; }
        }

        public bool IsReadOnly
        {
            get
            {
                return false;
            }
        }

        #endregion

        #region ISerializable

        public void GetObjectData(SerializationInfo info, StreamingContext context)
        {
            if (info == null)
            {
                throw new ArgumentNullException("info");
            }

            _dictionary.GetObjectData(info, context);
        }

        #endregion

        #region IDeserializationCallback

        public void OnDeserialization(object sender)
        {
            _dictionary.OnDeserialization(sender);
        }

        #endregion

        #region IEnumerable

        public IEnumerator<T> GetEnumerator()
        {
            return _dictionary.Keys.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }

        #endregion
    }
}
