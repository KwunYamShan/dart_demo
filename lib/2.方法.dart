void main(){

  //方法都是对象，可以赋值给Function变量
  Function f = fun1;
  f();

  //Error: NoSuchMethodError: Closure call with mismatched arguments: function 'main.<anonymous closure>'
  // Receiver: Closure: (int, int) => int
  // fun2((int i ,int b){//这样就会报错 因为找不到两个int形参 带返回值的方法
  //   return i+b;
  // });

  fun3((i, j) => i+j);
  
}
void fun1(){

}
void fun2(Function f){//缺点没有办法表示要传递的这个方法的参数和返回值
  f(1);
}

typedef int F(int i ,int j);//定义一个类型F F其实就是一个方法，接受两个int参数 返回void    //另外形参类型可以不写 不写表示可以接受任意类型
void fun3(F f){
  print("打印f方法的返回值：${f(1,2)}");
}
/**
 * java使用场景
 */
class OnClickListener{
  void onClick(){}
}
class Button{
  void setOnClickListener(OnClickListener listener){

  }
}

/**
 * dart使用场景
 *
 */
typedef void OnCLick();
class ButtonDart{
  void setOnCLickListener(OnCLick click){
    click();
  }
}