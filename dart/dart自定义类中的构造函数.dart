class Person {
  String name = '张三';
  int age = 23;
  //构造函数, 默认的构造函数的名称和类名称是一样的;
  //当你希望某个某个方法在App启动时就被调用,可以放在构造函数中;
    // Person(){
    //   print("构造函数的内容,这个方法实例化的时候触发");
    // }

  //默认构造函数的简写;
    // Person(this.name,this.age);// 把传入的参数直接赋值给属性;
    // getInfo(){
    //   print("${this.name} && ${this.age}");
    // }

  //命名构造函数
    Person.now(){
      print("我是命名构造函数");
      
    }

}

void main() {
  // Person p1 = new Person('里斯',13);
  // p1.getInfo();
}