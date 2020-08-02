    常用属性:
    List myList = ['data1','data2','data3'];
    print(myList.isEmpty); //是否为空
    print(myList.isNotEmpty); //是否不为空
    myList.reversed; //反转数组

    常用方法:
    myList.add('data4');//增加数据;
    myList.addAll(List);//通常用来合并数组;

    myList.indexOf('xxx');//用来查找数据,找不到返回-1;找到返回对应的下标;

    myList.remove('data1');//删除指定的值;
    myList.removeAt(index);//删除对应下标的值

    myList.fillRange(0,1);//修改数据, 输入起始位置;

    myList.insert(0,'data0');//向数组中插入数据
    myList.insertAll(0,List);//插入数组

    myList.join(',');// 把数组转换为字符串,以逗号形式分割

    字符串转数组:
    var str = 'data-data1-data2';
    str.split('-');
