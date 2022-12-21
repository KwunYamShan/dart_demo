//优化版本的java重载方法
// void fun (int i , int j ){
//
// }
// void fun (int i){
//   fun(i, 0);
// }

void fun (int i , int j){

}
//形参用[]括起来 叫可选位置参数   如果想给j传值 就必须给i传值了 位置！！！
void fun2 ([int i = 0, int j = 1]){
  print(i);
  print(j);
}

//形参用{}括起来 叫可选命名参数   可以设置默认值也可以不设置
// void fun3 ({int? i , int? j}){
//   print(i);
//   print(j);
// }
void fun3 ({int i = 0, int j = 1}){
  print(i);
  print(j);
}

void main(){
  fun2(2);
  //如果想给j传值 就必须给i传值了
  fun2(2,3);

  // fun3(1);//报错
  fun3(j: 3);//可选命名参数必须以键值对的形式传参
  fun3(i: 2,j: 3);//可选命名参数必须以键值对的形式传参
  fun3(j: 3,i: 2);//可选命名参数必须以键值对的形式传参
}