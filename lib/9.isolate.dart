// flutter使用的是单线程语言 但是如果涉及到网络请求，肯定会导致掉帧
//原理: java中内存是共享的  但是dart中是内存隔离的 isolate ->像进程一样的线程

import 'dart:io';
import 'dart:isolate';

int? i ;
void main() {//可以看作是主isolate
  i = 10;
  //如何创建一个类似于子线程的isolate
  // Isolate.spawn((message) {}, "message");
  Isolate.spawn(entryPoint, "message hello");//可以看作是子isolate
  print("看看会不会阻塞线程");

  //如何子主isolate通信
  var receivePort = new ReceivePort();//创建一个消息接收器
  Isolate.spawn(entryPoint2, receivePort.sendPort);//将消息接收器当中的发送器 发给子isolate
  //从消息接收器中读取消息  消息就是由SendPort消息发送器发送过来的
  receivePort.listen((message) {
    print("子isolate 消息发送器发来的消息： $message");
    if(message is SendPort){
      //双向通信
    }else{

    }
  });

}

void entryPoint(String message) {
  print("证明内存隔离：${i}");
  sleep(Duration(seconds: 5));
  print(message);
}

//如何子主isolate通信
void entryPoint2(SendPort sendPort){
  //完成单项通信
  sendPort.send("1");

  //完成双向通信
  var receivePort = new ReceivePort();

  receivePort.listen((message) {
    sendPort.send(receivePort.sendPort);
  });

  //发送完消息要close掉
  // receivePort.close();

}