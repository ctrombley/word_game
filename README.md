## The problem

Given a dictionary and a M x N board where every cell has one character, find all possible words that are 3 letters or larger and that can be formed by a sequence of adjacent characters. Starting from a single cell, we can move to any of up to 8 adjacent characters (even diagonally), but a word should not reuse a letter from the same cell twice.

To solve this problem, you'll need to implement `Solver#solve` in `lib/solver.rb'. 

### Example
Given the following board:

![board](https://github.com/ctrombley/word_game/raw/master/board.png)

The words GEEKS and QUIZ can be found by traversing the cells in the board.  Other words such as SEEK are also possible, but are not highlighted in the diagram above. Your program should be able to find these words in the board and output them in a list before the program completes.

### Notes
Two dependencies have been provided to instances of the `Solver` class, an instance of `Board` and an instance of `Dictionary`.  You will need a couple of methods provided by these dependencies to implement your solution:

* `Board#value(m_value, n_value)` will return the letter stored at the given MxN coordinates in the board.
* `Dictionary#word?(word)` will return a boolean value indicating if the passed word is a valid English word.

### Bonus
Once the main problem has been solved, we can also consider the performance of the solution.  One area for consideration is the provided implementation for dictionary lookup - it is not very fast.  When calling `Dictionary#word?`, a [linear search](https://www.studytonight.com/data-structures/linear-search-algorithm) is performed on an array.  Implement a more efficient method for performing dictionary lookups, and benchmark your results.

## Running the code
```ruby
ruby boggle.rb --width 3 --height 3
```

Running the above code will generate a randomized board of specified width and height and then run the solution on that board.  The words found will be output to the command line.  Once the solver implementation is completed, this output should be a complete list of all the words found in the given board.

## Hints
[Depth first search](https://medium.com/basecs/deep-dive-through-a-graph-dfs-traversal-8177df5d0f13) is an effective tool for solving the problem.  Once implemented, it can perform an exhaustive search of all of the possible combinations of letters.  It requires recursion, which is [not as scary as it sounds](https://medium.freecodecamp.org/recursion-is-not-hard-858a48830d83)!

When making our dictionary lookup more performant, there are a few approaches that can be taken.   Implementing a more eficient search method such as [binary search](https://www.studytonight.com/data-structures/binary-search-algorithm) would be a good first stab at the problem.  For even better performance, reimplementing the internal representation of the dictionary with a more performant data structure is also a good option. [Tries](https://medium.com/basecs/trying-to-understand-tries-3ec6bede0014) are a data structure that can help in this situation.
