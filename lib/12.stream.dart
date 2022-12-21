//stream 也是用来处理异步
//和future类似 future表示稍后获得的一个数据，所有异步的操作的返回值都用future来表示。但是future智能表示一次异步获得的数据，而stream表示多次异步获得的数据，比如每次读取一部分数据和一次性读取整个文件内容相比，Stream的好处是处理过程中内存占用较小。
//readAsString 是一次性读取整个文件内容，获取完整内容处理起来比较方便，但是文件太大会导致内存占用过大的问题import 'dart:html';



import 'dart:async';
import 'dart:io';

void main(){
  Stream <List<int>> stream = new File(r"C:\Users\Administrator\Desktop\邮件模板.txt")
      .openRead();//openRead得到的就是stream   返回值类型是int类型的list  因为dart里面没有byte类型 dart中的int是类 和java中的int不一样
  StreamSubscription<List<int>> listen = stream.listen((event) { //会执行多次   单订阅 多次订阅会报错 除非转成广播模式  用了广播模式就不能用listen了
    print(event);
  });
  listen.cancel(); //取消订阅
  listen.onDone(() {
    print("读完整个文件");
  });
  listen.onData((data) {
    print("替换listen");
  });

  //文件的转存
  var file = new File(r"C:\Users\Administrator\Desktop\邮件模板2.txt");
  var write = file.openWrite();
  write.addStream(stream);

  //广播模式  多个broadcastStream.listen都会接收到和listen一样的内容
  // var broadcastStream = stream.asBroadcastStream(); //这里是由单订阅转化而来的广播
  // broadcastStream.listen((event) { });
  // broadcastStream.listen((event) { });
  // broadcastStream.listen((event) { });
  // broadcastStream.listen((event) { });

  //直接创建广播
  var streamController = StreamController.broadcast();
  //发送一个广播   。先添加数据 再做监听 结果是不能被监听到    但是由单订阅转化而来的广播是可以监听到的
  streamController.add("直接创建广播}");
  //监听
  streamController.stream.listen((event) {print(event);});


}