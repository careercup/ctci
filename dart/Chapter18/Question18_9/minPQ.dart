library MinPQ;

class MinPQ<Key extends Comparable> {

  List<Key> _pq; // Store items at indices 1 to N
  int _N; // number of items on priority queue

  List<Key> toList() => _pq;

  Function comparator;

  MinPQ([int size=0, this.comparator]) {
    _pq = new List(size+1);
    _N = 0;
  }

  /**
  Create a priority queue with the given items.
  Takes time proportional to the number of items using sink-based heap construction.
  */
  MinPQ.from(List<Key> keys,  [this.comparator]) {
    _N = keys.length;
    _pq = new List(_N+1);

    for (var i = 0; i<_N; i++) {
      _pq[i+1] = keys[i];
    }

    for (var k = (_N ~/2); k >= 1; k--) {
      _sink(k);
    }

    assert(_isMinHeap());
  }

  /** Is the priority queue empty? */
  bool isEmpty() {
    return _N == 0;
  }

  /** Return the number of items on the priority queue */
  int size() {
    return _N;
  }

  /** Return the largest key on the priority queue.
  Throw an exception if the priority queue is empty. */
  Key min() {
    if (isEmpty()) {
      throw "Priority queue underflow";
    }

    return _pq[1];
  }

  /* Helper function to double the size of the heap array */
  _resize(int capacity) {
    assert(capacity > _N);
    List<Key> tmp = new List(capacity);
    for (var i = 1; i<= _N; i++) {
      tmp[i] = _pq[i];
    }
    _pq = tmp;
  }

  /** Add a new key to the priority queue. */
  insert(Key x) {
    // double size of array if necessary
    if (_N == _pq.length - 1) {
      _resize(2 * _pq.length);
    }

    // add x, and percolate it up to maintain heap invarient
    _pq[++_N] = x;
    _swim(_N);
    assert(_isMinHeap());
  }

  Key poll() => delMin();

  Key delMin() {
    if (isEmpty()) {
      throw "Priority queue underflow";
    }

    _exch(1, _N);
    Key min = _pq[_N--];
    _sink(1);
    _pq[_N+1] = null;
    if ((_N > 0) && (_N == (_pq.length - 1) ~/ 4)) _resize(_pq.length  ~/ 2);
    assert (_isMinHeap());
    return min;
  }

  /*
  Helper functions to restore the heap invariant.
  */
  _swim(int k) {
    while (k > 1 && _greater(k ~/ 2, k)) {
      _exch(k, k ~/ 2);
      k = k ~/2;
    }
  }

  _sink(int k) {
    while (2*k <= _N) {
      int j = 2*k;
      if (j < _N && _greater(j, j+1)) {
        j++;
      }

      if (!_greater(k,j)) {
        break;
      }

      _exch(k,j);
      k = j;
    }
  }

  /*
  Helper functions for compares and swaps
  */
  _greater(int i, int j) {
    if (comparator == null) {
      return _pq[i].compareTo(_pq[j]) > 0;
    } else {
      return comparator(_pq[i], _pq[j]) > 0;
    }
  }

  _exch(int i, int j) {
    Key swap = _pq[i];
    _pq[i] = _pq[j];
    _pq[j] = swap;
  }

  _isMinHeap([int k=1]) {
    if (k > _N) {
      return true;
    }

    int left = 2*k, right = 2*k + 1;
    if (left <= _N && _greater(k, left)) {
      return false;
    }

    if (right <= _N && _greater(k, right)) {
      return false;
    }

    return _isMinHeap(left) && _isMinHeap(right);
  }

}



