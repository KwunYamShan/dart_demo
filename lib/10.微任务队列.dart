//1.经过main 启动app
//2.loop循环执行任务
//3.微任务队列优先处理 所有微任务处理完了才会处理普通任务
//4.普通任务队列处理
//5.结束

import 'dart:io';
import 'dart:isolate';

void main() {
  var receivePort = new ReceivePort();
  receivePort.listen((message) {
    print(message);
    Future.microtask(() { //验证微任务会不会插队   会
      print("微任务执行3");
    });

  });
  //创建微任务队列的任务
  // Future.microtask(() => print("微任务执行")); 简单写法
  Future.microtask(() {
    print("微任务执行1");
    sleep(Duration(seconds: 5)); //如果第一个微任务里面做了耗时操作 那么后续任务都不会被执行 这就是单线程的原因
  });
  receivePort.sendPort.send("发送消息给消息接收器1"); //这里证明1点 微任务优先级是比普通任务优先级高的
  Future.microtask(() {
    print("微任务执行2");
  });
  receivePort.sendPort.send("发送消息给消息接收器2");

  sleep(Duration(seconds:3)); //为什么加入了sleep sleep会先执行  以为 sleep是一个方法不会加载到任务队列中 当代码一行一行加载完了之后才会执行任务队列 
}
