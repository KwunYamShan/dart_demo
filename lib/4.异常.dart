//java中的异常处理
import 'package:dart_demo/5.%E7%B1%BB.dart';

void javaTest() {
  throw new Exception("11");
}

//dart中的异常处理
void dartTest() {
  throw new FormatException("11");
}

void dartTestIntException() {
  throw 11111; //直接抛出int
}

String dartTestExceptionReturn(int i) {
  if (i == 1) {
    throw "1";
  } else {
    throw dartTest;
  }
  return "dart throw 了也可以return";
}

void main() {
  print(Single.getInstance().hashCode == Single.getInstance().hashCode);
  // try{
  //   javaTest();
  // }catch(Exception e){ //显示的标明异常类型
  //   e.toString()
  // }

  // try {
  //   dartTest();
  // } catch (e, s) {
  //   //不显示的标明类型    e是抛出的异常对象 s是调用栈 异常堆栈信息
  //   print("${e.runtimeType} , ${e.toString()}");
  //   print(s.toString());
  // }

  // try { //根据不同的类型 进行不同的处理  on Type catch
  //   dartTestIntException();
  // }on Exception catch (e, s) {
  //   print("Exception");
  // }on String catch(e){
  //   print("String");
  // }on int catch(e){
  //   print("int");
  // }

  try {
    print(dartTestExceptionReturn(21));
  } on String catch (e) {
    print(e);
  } on Function catch (e) {
    print(e);
  } finally {
    //.....
  }
}



class PackageImport {
  //生成构造a/t+ins
  int? x ;
  int? y ;
  int? _z ; // _开头 私有属性

  PackageImport(this.x, this.y, this._z); //1.构造没有方法体   2.不允许方法重载，  3.不能使用{}[]包裹 如果想用  可选位置参数 可选命名参数 就不能用this

  PackageImport.Y(this.y);// 加个方法名 代替完成方法重载的功能  这种叫命名构造方法
  PackageImport.X(this.x);// 加个方法名 代替完成方法重载的功能  这种叫命名构造方法

//疑问点 ：为什么有可选参数 还要命名构造方法这么麻烦    使用构造方法和命名构造方法 调用时逻辑更清晰
//   PackageImport({int x = 0,int y = 1}){
//
//   }

//命名构造方法 + 参数初始化列表    命名构造方法后 方法体前(也可以不写方法体) 用：跟上属性等于xx这种就叫参数初始化列表
  PackageImport.fromMap(Map map): x=map['x'],y=map["y"];
}

class _PrivetePackageImport {
  //_开头 私有类
  int x = 0;
  int y = 1;
  int _z = 2; // _开头 私有属性
}
