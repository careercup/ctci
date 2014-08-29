package chapter1

object Chapter1{

  def isUniqueCharacters(str: String)={
    var checker: Int = 0
    var ret = true
    for(i<-str; if( i-'a'<26 && i-'a'>=0 ) ){
      if( (checker & ( 1<<(i-'a') )) > 0 )
        ret = false
      checker = checker | ( 1<<(i-'a') )
    }
    ret
  }

  def isPermutation(str1: String, str2: String)={
    str1.toCharArray().sorted.sameElements(str2.toCharArray().sorted);
  }

  def compressString(str: String) = {
    var retStr = "";
    if(str.length > 0) {
      var i = 1
      var count = 1
      var last = str(0)
      while(i<=str.length){
        if( i<str.length && str(i) == last) count += 1
        else{
          retStr += last + count.toString
          if(i<str.length)last = str(i)
          count =1
        }
        i += 1
      }
    }
    if(retStr.length<str.length) retStr
    else str
  }

  def setMatrixZeros(matrix:  Array[Array[Int]]) = {
    
    var firstRowZero = false
    var firstColZero = false
    for(i <-0 until matrix.length; if(matrix(i)(0) == 0)) firstColZero = true 
    for(i <-0 until matrix(0).length; if(matrix(0)(i) == 0)) firstRowZero = true 

    for(i<- 0 until matrix.length; j<-0 until matrix(0).length; if (matrix(i)(j) == 0) ){
      matrix(i)(0)= 0
      matrix(0)(j)= 0
    }

    for(i <-0 until matrix.length; if(matrix(i)(0) == 0)){
      for(j<-1 until matrix(0).length) matrix(i)(j) = 0
    } 
    for(i <-0 until matrix(0).length; if(matrix(0)(i) == 0)){
      for(j<-1 until matrix.length) matrix(j)(i) = 0
    } 

    if(firstRowZero)
      for(j<-0 until matrix(0).length) matrix(0)(j) = 0

    if(firstColZero)
      for(j<-0 until matrix.length) matrix(j)(0) = 0
  }

}
