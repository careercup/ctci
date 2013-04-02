
void crossOff(List<bool> flags, int prime) {
  /**
   * Cross off remaining multiples of prime. We can start with
   * (prime * prime), because if we have a k * prime, where k < prime,
   * this value would have already been crossed off in a prior iteration.
   */
  for (int i = prime * prime; i < flags.length; i += prime) {
    flags[i] = false;
  }
}

int getNextPrime(List<bool> flags, int prime) {
  int next = prime + 1;
  while (next < flags.length && !flags[next]) {
    next++;
  }
  return next;
}

void init(List<bool> flags) {
  flags[0] = false;
  flags[1] = false;
  for (int i = 2; i < flags.length; i++) {
    flags[i] = true;
  }
}

List<int> prune(List<bool> flags, int count) {
  List<int> primes = new List<int>(count);
  int index = 0;
  for (int i = 0; i < flags.length; i++) {
    if (flags[i]) {
      primes[index] = i;
      index++;
    }
  }
  return primes;
}

List<int> sieveOfEratosthenes(int max) {
  List<bool> flags = new List<bool>(max + 1);
  int count = 0;

  init(flags);
  int prime = 2;

  while (prime <= max) {
    count++;
    crossOff(flags, prime);
    prime = getNextPrime(flags, prime);
    if (prime >= flags.length) {
      break;
    }
  }

  return prune(flags, count);
}

void main() {
  List<int> primes = sieveOfEratosthenes(100);
  for (int i = 0; i < primes.length; i++) {
    print(primes[i]);
  }
}