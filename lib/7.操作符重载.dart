void main(){

  var p1 = Point();
  p1.x = 10;
  var p2 = Point();
  p2.x = 15;

  var p3 = p1 + p2;
  print(p3.x);

}

class Point{
  int x = 0;
  int y = 0;

  //运算符重载， 定义+ 操作的行为
  Point operator +(Point point){
    var p1 = Point();
    //x就是p1  point就是p2
    p1.x = x+ point.x;
    return p1;
  }
}