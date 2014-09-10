package chapter1

import org.junit.runner.RunWith
import org.specs2.mutable.Specification
import org.specs2.runner.JUnitRunner

/**
 * Chapter 1:
 */
@RunWith(classOf[JUnitRunner])
class Chapter1Test extends Specification {

  import Chapter1._
  /* 
  *Question1_1 
  */
  "Question1_1" should {
    "a string has all unique characters" in {

      isUniqueCharacters("asdfajkl") === false 
      isUniqueCharacters("asdf") === true
    }
  }
  /*==============================================================*/

  /* 
  *Question1_3 
  */
  "Question1_3" should {
    "Are two strings premutations each other" in {

      isPermutation("as", "sa") === true 
      isPermutation("as", "sd") === false 

    }
  }
  /*==============================================================*/

  /* 
  *Question1_5 
  */
  "Question1_5" should {
    "Compress String in basic format" in {

      compressString("aaaaasss")=== "a5s3" 
      compressString("abcd")=== "abcd" 
    }
  }
  /*==============================================================*/

  /* 
  *Question1_7 
  */
  "Question1_7" should {
    "set Matrix zeros" in {

      val aMatrix = Array.ofDim[Int](4, 4)
      aMatrix(1)(2) = 0
      aMatrix(0)(2) = 0
      aMatrix(3)(3) = 0
      setMatrixZeros(aMatrix)
      aMatrix(0)(3) === 0
    }
  }
  /*==============================================================*/

  /* 
  *Question1_8 
  */
  "Question1_8" should {
    "is two strs rotation each other" in {

      isRotation("abc", "bca") == true
      isRotation("abcd", "bca") == false 
    }
  }
  /*==============================================================*/



}
