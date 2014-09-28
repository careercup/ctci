object Chapter4 {

  trait Tree[+T]{
    def maxDepth : Int
    def minDepth : Int
    def getValue : Option[T]
  }

  case class Node[T](value:T, left:Tree[T], right:Tree[T]) extends Tree[T]{
    def maxDepth : Int = {
      1 + Math.max(left.maxDepth, right.maxDepth)
    }

    def minDepth : Int = {
      1 + Math.min(left.minDepth, right.minDepth)
    }

    def getValue = Some(value)
  }
  case object End extends Tree[Nothing]{
    def maxDepth = 0
    def minDepth = 0
    def getValue = None
  }

  def fold[A, B](tree:Tree[A], e:B)(f:(A, B, B) => B) : B = {
    tree match {
      case Node(v, l, r) =>
        f(v, fold(l, e)(f), fold(r, e)(f))
      case End =>
        e
    }
  }

  //in-order traversal
  def fold2[A, B](tree:Tree[A], e:B)(f:(A, B) => B) : B = {
    tree match {
      case Node(v, l, r) =>
        fold2(r, f(v, fold2(l, e)(f)))(f)
      case End =>
        e
    }
  }

  class DirectGraph[V,E]{
    case class Node(value:V){
      var adj : List[Edge] = List()
      def neighbors : List[Node] = {
        adj.map(targetNode(_, this).get)
      }
    }
    case class Edge(n1:V, n2:V, value:E)

    var nodes : Map[V, Node] = Map()
    var edges : List[Edge] = List()

    def addNode(value:V) = {
      nodes = nodes + (value -> Node(value))
    }

    def targetNode(e:Edge, n:Node) : Option[Node] =
      if(n.value == e.n1)
        Some(Node(e.n2))
      else
        None

    def addEdge(n1:V, n2:V, value:E) = {
      val edge = Edge(n1, n2, value)
      val node = nodes(edge.n1)
      node.adj = edge :: node.adj

      edges = edge :: edges
    }
  }

  // 4.1
  def isTreeBalanced[T](t:Tree[T]) : Boolean = {
    t.maxDepth - t.minDepth <= 1
  }

  // 4.2
  def isPath[V,E](graph:DirectGraph[V,E], n1:V, n2:V) : Boolean = {
    var traces     : List[V] = List[V](n1)
    var visitNodes : Map[V, Boolean] = Map[V, Boolean]()

    while(!traces.isEmpty && traces.head != n2){
      val node = graph.nodes(traces.head)
      traces = traces.tail
      visitNodes = Map(node.value -> true) ++ visitNodes
      node.neighbors.foreach{ n =>
        if(!visitNodes.isDefinedAt(n.value))
          traces = n.value :: traces
      }
    }

    if(traces.isEmpty)
      false
    else
      true
  }

  // 4.3
  def createMinimalBST[T <% Ordered[T]](sortedArray:Array[T]) : Tree[T] = {
    def createMinimalBSTRec(array:Array[T], start:Int, end:Int) : Tree[T] = {
      if(start > end)
        End
      else {
        val middle = (start + end)  / 2
        val value = array(middle)
        val left  = createMinimalBSTRec(array, start, middle-1)
        val right = createMinimalBSTRec(array, middle+1, end)
        Node(value, left, right)
      }
    }
    createMinimalBSTRec(sortedArray, 0, sortedArray.length -1)
  }

  // 4.4
  def createLevelLinkedList[T](tree:Tree[T]): List[List[T]] = {
    fold[T, List[List[T]]](tree, List[List[T]]()) { (acc, l, r) =>
      List(acc) :: l.zipAll(r, Nil, Nil).map { z => z._1 ++ z._2}
    }
  }

  // 4.5
  def checkBST(tree:Tree[Int]) : Boolean = {
    fold2(tree, (Int.MinValue, true)) { (v, prevResult) =>
      if(prevResult._2) {
        val prev = prevResult._1
        if(prev < v)
          (v, true)
        else
          (prev, false)
      }
      else
        (prevResult._1, false)
    }._2
  }

  // 4.6
  def inorderSucc[T](tree:Tree[T], node:T): Option[T] ={
    fold2(tree, (None, None) : (Option[T], Option[T])){ (v, prevNode) =>
      if(prevNode._1.isDefined && prevNode._1.get == node){
        (Some(v), Some(v))
      } else {
        (Some(v), prevNode._2)
      }
    }._2
  }

  // 4.7
  case class Result[T](value:Option[T], isCommonAncestor:Boolean)

  def commonAncestor[T](tree:Tree[T], p:T, q:T) : Result[T] = {
    tree match {
      case Node(v, left, right) =>
        if (v == p && v == q)
          Result(Some(v), true)
        else {
          val lResult = commonAncestor(left , p, q)
          if(lResult.isCommonAncestor){
            lResult
          } else {
            val rResult = commonAncestor(right, p, q)
            if(rResult.isCommonAncestor){
              rResult
            } else {
              (lResult.value, rResult.value) match {
                case (Some(_), Some(_)) =>
                  Result(Some(v), true)
                case (Some(_), None) | (None, Some(_)) =>
                  if(v == p || v == q)
                    Result(Some(v),true)
                  else
                    lResult
                case (None, None) =>
                  if( v == p || v == q)
                    Result(Some(v), false)
                  else
                    Result(None, false)
              }
            }
          }
        }
      case End =>
        Result(None, false)
    }
  }

  // 4.8
  def containsTree = {
    
  }

  // 4.9
  def findSum = {

  }
}
