#include <algorithm>
#include <iostream>
#include <stack>
#include <tuple>
#include <vector>

using namespace std;

struct Person {
	int height, weight;
};

bool operator<(const Person& lhs, const Person& rhs) {
	return std::tie(lhs.height, lhs.weight) < std::tie(rhs.height, rhs.weight);
}

// Time complexity: O(n + n * log(n)) = O(n * log(n))
// Space complexity: O(1)
template<typename T>
unsigned int CalculateTower(std::vector<T>& persons) {
	make_heap(persons.begin(), persons.end());
	auto rit = persons.end();

	unsigned int result = 0;
	Person current{std::numeric_limits<int>::max(), std::numeric_limits<int>::max()};

	while (rit >= persons.begin()) {
		if (persons.front() < current) {
			current = persons.front();
			result++;
		}

		pop_heap(persons.begin(), rit);
		rit = prev(rit);
	}

	return result;
}

// Time complexity: O(n^2)
// Space complexity: O(n)
template<typename T, typename Comparator = std::less<T>>
unsigned int LongestIncreasingSubsequence(const std::vector<T>& values, Comparator comp = Comparator()) {
	vector<unsigned int> l(values.size(), 1);
	unsigned int best = 0;
	for (int i = 1; i < values.size(); i++) {
		unsigned int max = 0;
		for (int j = i - 1; j >= 0; j--) {
			if (comp(values[j], values[i])) {
				max = std::max(max, l[j]);
			}
		}
		l[i] = ++max;
		best = std::max(best, max);
	}

	return best;
}

int main() {
	vector<Person> persons{{12, 13}, {11, 15}, {9, 20}, {20, 20}, {40, 21}, {8, 42}};

	// We calculate the maximum height of a tower of persons by relying on a max-heap,
	// popping persons of the heap onto the tower if the current max element in the heap
	// is strictly smaller than the current top-most person in the tower. If it is not strictly
	// smaller, we just drop the person as they are "as good as"/"incomparable to" the person
	// already standing on top of the tower. Please note that this works because we are not maximizing
	// the total height of the tower, but only the number of people being involved in it.
	{
		vector<Person> cpersons = persons;
		cout << "With heap: " << CalculateTower(cpersons) << "\n";
	}
	// We are not altering the original sequence as in the original problem statement for
	// the longest increasing subsequence problem. For the example setup presented here,
	// the longest strictly increasing subsequence is 3.
	{
		cout << "Without sorting: " << LongestIncreasingSubsequence(persons) << "\n";
	}
	// We are mutating the original sequence of values here, requiring O(n log(n)) to do so.
	// Alternatively, we could just rely on a heap to achieve the same functionality.
	{
		vector<Person> cpersons(persons);
		sort(cpersons.begin(), cpersons.end(), [](const Person& lhs, const Person& rhs) {
			return lhs.height < rhs.height;
		});
		cout << "With sorting by height: " << LongestIncreasingSubsequence(cpersons) << "\n";
	}
	return 0;
}
