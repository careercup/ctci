library Rectangle;

import 'word_group.dart';
import '../../utils/trie.dart';

/* A class that represents a rectangular array of letters */
class Rectangle {

  // Rectangle data.
  int height = 0;
  int length = 0;
  List<List<String>> matrix;

  Rectangle(this.length);

  /*
   * Construct a rectangular array of letters of the specified
   * length and height, and backed by the specified matrix of
   * letters. (It is assumed that the length and height specified as
   * arguments are consistent with the array argument's diamentions.
   */
  Rectangle.fromLetters(int length, int height, List<List<String>> letters) {
    this.height = letters.length;
    this.length = letters[0].length;
    matrix = letters;
  }

  /*
   * Return the letter present at the specified location in the array.
   */
  String getLetter(int i, int j) {
    return matrix[i][j];
  }

  String getColumn(int i) {
    List<String> column = new List<String>(height);
    for (int j = 0; j < height; j++) {
      column[j] = getLetter(j, i);
    }

    return column.join();
  }

  bool isComplete(int l, int h, WordGroup groupList) {
    // Check if we have formed a complete rectangle.
    if (height == h) {
      // Check if each column is a word in the dictionary
      for (int i = 0; i < l; i++) {
        String col = getColumn(i);
        if (!groupList.containsWord(col)) {
          return false; // Invalid rectangle.
        }
      }

      return true; // Valid Rectangle!
    }

    return false;
  }

  bool isPartialOK(int l, Trie trie) {
    if (height == 0) {
      return true;
    }

    for (int i = 0; i < l; i++) {
      String col = getColumn(i);
      if (!trie.contains(col)) {
        return false; // Invalid rectangle.
      }
    }

    return true;
  }

  /*
   * If the langth of the argument s is consistent with that of this
   * Rectangle object, then return a Rectangle whose matrix is constructed
   * by appending s to the underlying matrix. Otherwise, return null.
   * The underlying matrix of this Rectangle object is /not/ modified.
   */
  Rectangle append(String s) {
    if (s.length == length) {
      List<List<String>> temp = new List<List<String>>(height + 1);
      for (int i = 0; i < temp.length; i++) {
        temp[i] = new List<String>.fixedLength(length);
      }

      for (int i = 0; i < height; i++) {
        for (int j = 0; j < length; j++) {
          temp[i][j] = matrix[i][j];
        }
      }

      temp[height] = s.substring(0, length).split("");

      return new Rectangle.fromLetters(length, height + 1, temp);
    }
    return null;
  }

  String toString() {
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < height; i++) {
      for (int j = 0; j < length; j++) {
        sb.write(matrix[i][j]);
      }

      sb.write("\n");
    }

    return sb.toString();
  }
}

