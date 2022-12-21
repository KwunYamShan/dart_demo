abstract class Parent {
  String? name;

  void printName(); //抽象方法， 不需要方法前声明abstract  其他和java没什么区别
  void printAge() {} //普通方法  方法体
}

class Child extends Parent {
  // 不可多继承
  @override //  重写方法用override
  void printName() {}
}

class Cat extends Animal {
  @override
  void walk() {
    super.walk();
  }
}

class Animal {
  void walk() {}

  void run() {}
}

void main() {
  Test test = Test();
  test(); //语法糖 当类中有call方法 可以这样调用   如果没有call方法则会报错
  test.call();
  C().c(); //C类自身的c方法是第一优先级
  C().a(); //C类没有a方法 则从with最右边从后往前找方法 则找到了B类的a方法
}

class Test {
  void call() {}
}

//被mixin（混入）的类不能有构造函数
class A {
  void a() {
    print("A a");
  }

  void b() {
    print("A b");
  }
}

class B {
  void a() {
    print("B a");
  }

  void b() {
    print("B b");
  }
}

class C with A, B {
  //弥补dart没有多继承的问题   使用with后C就可以使用A和B的所有方法   如果ab中都有同样名字的方法， 调用时是从后往前找 调用c的a方法 既找到了B类的a方法  如果c自己就有a方法 则会调用c自己的方法
  void c() {}
// void a(int i ){ //报错 因为a方法已经被混入了 ，dart不支持重载  所以会报错
//
// }
  void a(){
    super.a();
  }
}
class C1 =Object with A,B; //如果C1不需要定义方法  C1就看作是一个A和b的集合的话 可以这样简写
