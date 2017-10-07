package chapter2

import org.junit.runner.RunWith
import org.specs2.mutable.Specification
import org.specs2.runner.JUnitRunner

/**
 * Chapter 2:
 */
@RunWith(classOf[JUnitRunner])
class Chapter2Test extends Specification {

  import Chapter2._
  val aNodeList = Array(1,2,3,4,2,3);
  val NodeList2 = Array(1,2,3,4)
  /* 
  *Question2_1 
  */
  "Question2_1" should {
    "remove all duplicate characters" in {
      val head = createNodeList(aNodeList)
      removeDupliEles(head) === createNodeList(NodeList2)
    }
  }

  /*==============================================================*/
  /* 
  *Question2_2 
  */
  "Question2_2" should {
    "find kth to last element of a singly linked list" in {
      val head = createNodeList(aNodeList)
      nthToLast(head, 3) === 4
    }
  }
}
