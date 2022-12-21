//future 未来的意思
// future就会被放在普通任务队列中执行
//除了future.microtask
import 'dart:io';
import 'dart:math';

void main() {
  Future future = Future.delayed(Duration(
      seconds:
          3)); //delayed实际是一个工厂构造方法 返回Future对象factory Future.delayed(Duration duration, [FutureOr<T> computation()?]) {
  //future的执行结果通过then获取
  future.then((value) => //准确的说这个then会 >=3秒执行 因为有可能会有微任务插队 或者sleep方法
      print(value));

  //dart +r进行转义
  new File(r"C:\Users\Administrator\Desktop\邮件模板1.txt")
      .readAsString()
      .then((value) => print(value))
      .catchError((e, s) {
    print(e);
  }); //readAsString 返回值返回feature 表示不会阻塞后续代码  then返回文件的结果  catchError用于捕获异常

  new File(r"C:\Users\Administrator\Desktop\邮件模板.txt")
      .readAsString()
      .then((value) {
        print(value);
        return 10;
      })
      .then((int value) => print(value)); //then的返回值如何获得 ？ 再then

  // whenComplete 执行完后会给回调 但是拿不到结果
  //timeout 超过了我们指定的时间 则会抛出回调

  //then可以有序任务执行 一个任务执行完了之后，下一个任务根据上一个任务的结果执行不同的操作
  //如果需要一组任务都执行完成之后 统一执行相同的处理
  Future.wait([Future.delayed(Duration(seconds: 3)),Future.delayed(Duration(seconds: 10))]).then((value) => print(1));

  Future.forEach([1,2,3,4], (element) => print(element));//依次接收到集合的1234
}
