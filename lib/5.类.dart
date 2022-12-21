
//文件、类库 命名命名规范 小写单词+_风格  例如 main_demo
// main.dart
//类 类型 命名大写开头字母 例如 MainDemo
import 'package:dart_demo/4.%E5%BC%82%E5%B8%B8.dart';

class Point{}
//其他标识符和常量 小写开头字母 两个单词链接出用大写 例如 mainDemo
int mainTag =0;

void main(){
  var pack = new PackageImport(1,2,3);// 引入别的文件中的类需要导包
  var pack2 = new PackageImport.Y(2);//调用命名构造方法
  pack.x;
  pack.y;
  pack2.x;
  pack2.y;
  // pack._z; 私有属性 下划线开头命名属性 就变成了私有属性
  // new _PrivetePackageImport(); // _开头的类是私有类

  //使用new来创建常量构造方法的对象就和普通的对象没有区别
  // var p1 =  new ImmutablePoint(1, 1);
  //使用const来创建多个对象  传递参数一样 表示这个对象是一个编译期常量对象 （前提是常量构造对象）
  //使用场景 ：复用 减少内存占用
  var p1 = const ImmutablePoint(1, 1);
  var p2 = const ImmutablePoint(1, 1);
  print(p1 == p2);
  print(p1.hashCode == p2.hashCode);
  var p3 = const ImmutablePoint(1, 1);
  var p4 = const ImmutablePoint(1, 2);
  print(p3 == p4);
  print(p3.hashCode == p4.hashCode);

  Manager.get();
  print("${Single.getInstance().hashCode} ${Single.getInstance().hashCode}" );
}

//重定向构造方法
class View{

  View(int context,int attr);
  View.Context(int context):this(context,0) ; //重定向构造方法  不过重定向构造方法没有方法体

  //java中
  // View(int context){
  //   View(context,0);
  // }
  // View(int context,int attr){
  //
  // }
}

class ImmutablePoint{
  final int x;
  final int y;

  //定义一个const修饰的构造 变量需要用final修饰
  const ImmutablePoint(this.x, this.y);//Can't define a const constructor for a class with non-final fields.
}

//工厂构造方法
class Manager{
  factory Manager.get(){
    return new Manager();
  }
  // static 和工厂构造方法 没有什么太大区别    区别在于工厂构造方法最终一定要返回Manager或者其子类
  // static Manager get2(){
  //   return new Manager();
  // }
  Manager();

}

//单例
class Single{
  Single._newInstance(){
    _instance = this;
  }
  //单例
  static Single? _instance ;
  factory Single.getInstance(){
    return _instance??Single._newInstance();
  }
}