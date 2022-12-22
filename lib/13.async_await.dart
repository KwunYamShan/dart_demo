//使用async和await的代码是异步的，但是看起来很像同步代码。当我们需要获得A的结果，再执行B时，你需要then()->then() 但是利用async与await能够非常好的解决回调地狱的问题

import 'dart:io';

//用async 声明了  返回值就不能用String了 需要用Future包起来    //这里只能返回Future或者void return看似是String实际是隐式调用
Future<String> readFile() async { //async使方法变成异步操作
  String content = await new File(r"C:\Users\Administrator\Desktop\邮件模板.txt").readAsString(); //await把本身是异步的操作变成同步操作   会阻塞后续代码 顺序执行
  String content2 = await new File(r"C:\Users\Administrator\Desktop\邮件模板.txt").readAsString(); //把本身是异步的操作变成同步操作
  String content3 = await new File(r"C:\Users\Administrator\Desktop\邮件模板.txt").readAsString(); //把本身是异步的操作变成同步操作
  return content;
}

void main() {
  // new File(r"C:\Users\Administrator\Desktop\邮件模板.txt") //有序读取文件 回调地狱
  //     .readAsString()
  //     .then((value) =>
  //         new File(r"C:\Users\Administrator\Desktop\邮件模板.txt").readAsString())
  //     .then((value) =>
  //         new File(r"C:\Users\Administrator\Desktop\邮件模板.txt").readAsString());


}
