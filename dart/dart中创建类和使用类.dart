class Person {
  String name = '张三';
  int age = 23;

  void getInfo(){
    print("this.name ${this.name} this.age ${this.age}");
  }
  
}

void main() {
  //实例化类;
  Person p1 = new Person();
  p1.getInfo();
}