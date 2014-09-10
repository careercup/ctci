package chapter2

object Chapter2{

  case class Node(val d: Int, var next: Node = null)

  def createNodeList(arr: Array[Int]) = if(arr.length > 0){
    var head = Node(arr(0), null)
    val ret = head;
    for(i<-1 until arr.length){
      head.next = Node(arr(i))
      head = head.next
    }
    ret
  }
  else null
  
  def printNodeList(src: Node) = {
    var head = src;
    while(head != null){
      print(head.d + "  "); 
      head = head.next
    }
    println("!")
  }

  def nodeToArray(src: Node) = {


  }

  def removeDupliEles(src: Node) = {
    var head = src;
    while(head!=null){
      var newHead = head;
      while(newHead!= null && newHead.next != null){
        if(newHead.next.d == head.d) newHead.next = newHead.next.next;
        newHead = newHead.next;
      }
      head = head.next;
    }
    src;
  }

  def nthToLast(src: Node, k: Int) = {
    var count =0;
    var curr = src;
    var ret = src;
    while(count<k) {curr = curr.next; count +=1 ;}
    while(curr != null){
      ret = ret.next;
      curr = curr.next
    }
    ret.d;
  }
  
  /*
  def deleteMidNode(src: Node): Node = {
    if(src == null || src.next == null) null;
    val aVal = src.next.d;
    src.next = src.next.next;
    src.d = aVal;
    src
  }
  */

}
