class Point {
  // 每一个实例属性 变量都会有一个隐式的get 非final的话还有set  和kotlin一样  不支持重载
  int? x;

  //定义为私有的 就可以自己定义getset了
  int ?_y;

  int get y => _y??0;

  void set y(int value) { //void 可以省略
    _y = value;
  }
}

void main(){
  var point = Point();
  print(point.x);//隐式调用get
  point.x = 10;//隐式调用set

  print(point.y);//
  point.y = 10;//
}