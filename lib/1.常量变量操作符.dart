void main() {
  variableDemo();
  constantDemo();
  builtInType();
  operatorSymbol();
}

/**
 * 变量用法
 */
void variableDemo() {
  //变量
  int i; // 区别：不赋值默认为null，把int当成是对象了（abstract class int extends num）  但在java中是属于8大基本类型所以有默认值
  String s;
  Object obj = "Wuhao"; //表示任意类型

  var v = "hello"; //声明的变量赋值时就决定了它是什么类型
  // v= 100; //不能赋值 类型推断  dart是强类型语言
  var j; //但是这样可以，因为var是一个关键字不是一个类型，现在j是Object类型
  j = 100;
  j = "wowowo";

  dynamic d = "dynamic"; //动态， 不是在编译时确定值的类型，而是在运行时才决定d是什么类型
  d = 1;

  Object a = 0; //和java没什么区别 编译时就确定了
  var b = 0;
  dynamic c = 0; //可能是在字节码中做了什么操作 在运行中才确定类型
}

/**
 * 常量用法
 */
void constantDemo() {
  //声明常量
  final int f1 = 1; //final == java   运行时常量
  const int c1 = 1; // 编译期常量 性能更好一些
  // const int c2 = f1;// no  不能将运行时确定的值赋值给编译期就需要确定的值
  const int c3 = c1; // yes
  // 相同点
  // 1、final、const必须初始化
  // 2、 final、const只能赋值一次
  // 不同点
  // 1、 final可修饰实例变量、const不可以修饰实例变量
  // 2、访问类中const修饰的变量需要static修饰
  // 3、const修饰的List集合任意索引不可修改，final修饰的可以修改
  // 4、const 用来修饰变量 只能被赋值一次，在编译时赋值
  // final 用来修饰变量 只能被赋值一次，在运行时赋值
  // 5、final 只可用来修饰变量， const 关键字即可修饰变量也可用来修饰 常量构造函数
  //
  // 当const修饰类的构造函数时，它要求该类的所有成员都必须是final的。
}

/**
 * 内置类型
 */
void builtInType() {
  //内置类型
  // 数字(number)
  // 字符串(string)
  // 布尔值(boolean)
  // 列表(list)
  // 集合(set)
  // 映射(map)
  // 符文(rune)
  // 符号(Symbol)

  double d1 = 3.14;
  int i1 = 1; //代替java中的long和short使用

  String str = "hello";
  String str2 = str + "world"; // java写法的拼接 创建多个对象
  String str3 = "$str world"; //可以使用类似kotlin的写法
  String str4 = "${str}sworld";
  String str5 = "\"java转义\""; //java转义
  String str6 = '"dart转义"'; //dart转义
  String str7 = "'dart转义'"; //dart转义
  String str8 = "\\n"; //java转义
  String str9 = r"\n"; //dart转义 r前缀 raw:原始
  print("$str8 $str9");
  String str10 = """wnc
  wwewe
  wewe
  wewe"""; //dart多行字符串的声明 三引号 和kotlin一样

  bool b1 = true; //布尔类型

  List<String> list = [];
  list.add("value1");
  list.add("value2");
  print("length:${list.length} , ${list[0]}");
  List<int> list2 = [1, 2, 3, 4, 5];
  //遍历数组 敲 list.for或者list.iter 可配置模板
  for (var value in list) {
    print(value);
  }
  // fori 敲list.itar
  for (var i = 0; i < list.length; ++i) {
    var o = list[i];
    print(o);
  }
  //list +const
  List<int> list3 = const [
    1,
    2,
    3
  ]; //Cannot add to an unmodifiable list  const修饰的时[1,2,3]这个对象，表示这个对象不可变，不能变再add
  // list3.add(1);// const [1,2,3]; //错误 Cannot add to an unmodifiable list
  list3 = [2, 3, 4]; //可以修改引用
  const List<int> list4 = [1, 2, 3]; //const修饰的变量， 也就是引用 那么变量就不能再重新引用其他对象了
  // list4 = list3; //错误
  // list4.add(1);  //错误

  //映射集合 map
  Map<int, int> map = {1: 1, 2: 2, 3: 3};
  map[3] = 100; //添加元素
  map.forEach((key, value) {
    print("$key $value");
  });
  Map<int, int> map2 = const {1: 1, 2: 2, 3: 3};
  // map2[3] = 100;//错误 const不可修改
  const Map<int, int> map3 = {1: 1, 2: 2, 3: 3};
  // map3[3] = 100;//错误 const不可修改 不可以添加 不可以重新赋值

  //Runes特殊字符表示类
  var clapping = '\u{1f44f}';

  ///5个16进制 需要使用{}
  print(clapping); //👏
//获得 16位代码单元
  print(clapping.codeUnits); //[55357, 56399]
//获得unicode代码
  print(clapping.runes.toList()); //[128079]
//fromCharCode 根据字符码创建字符串
  print(String.fromCharCode(128079));
  print(String.fromCharCodes(clapping.runes));
  print(String.fromCharCodes([55357, 56399]));
  print(String.fromCharCode(0x1f44f));
  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(String.fromCharCodes(input));

  //Symbols 标识符  操作符标识符，可以看作C中的宏。表示编译时的一个常量
  var i = #A; //常量
  switch (i) {
    case #A:
      print("A");
      break;
    case #B:
      print("B");
      break;
  }
}

/**
 * 操作符
 */
void operatorSymbol() {
  num j = 1;
  int i = j as int; //类型转换 不支持java的（int）强转写法

  Object i1 = 1;
  i1 is int; //类型判断 判断属不属于某个类型 不支持java的instanceof的写法
  i1 is! int; //类型判断 判断属不属于某个类型 不支持java的 !( 1 instanceof int)的写法

  //赋值操作符
  var k;
  if (null == k) {
    k = "123";
  }
  ; //java中这么写
  k ??= "345"; //dart中这么写 ??=安全赋值操作符   如果k有值这句话就没用如果没值就赋值345

  bool b = true;
  var c = b ? "a" : "c"; //三目运算

  var v = k ?? "456"; //k有值则后面没用， k无值则赋值为456

  //级联操作符   等于java的链式调用 但是不同的是 java再构建者里面要在方法里返回本身 dart不用return this就可以使用
  new JavaBuilder().a().b().build();
  new DartBuilder()..a()..b(); //级联操作符 方法也可以连续调用 不需要返回本身

  //安全操作符
  String? str = null;//可空
  str?.length;//和kotlin一样

}

class JavaBuilder {
  //java
  JavaBuilder a() {
    return this;
  }

  JavaBuilder b() {
    return this;
  }

  void build() {}
}

class DartBuilder {
  //java
  void a() {}

  void b() {}

  void build() {}
}
