### React 的 生命周期

>react的生命周期准确的来说,分为三个阶段!
>**1.挂载期:  一个组件实例初次被创建的过程,**
**2. 更新期:组件在创建后再次渲染的过程,**
**3. 卸载期: 组件在使用完后被销毁的过程**

---

### 组建的挂载
>组件在首次创建后,进行第一次渲染称为挂载期,挂载后依次执行下面这些方法 

1. constructor() 构造函数,初始化状态值,
2. 设置状态机,
3. componentWillMount() 首次渲染前执行
4. render, 渲染组件,
5. componentDidMount() render后执行的操作

### 组件的更新
>组件的更新,指的是组件初次渲染完成后,进行了组件状态的改变,在实际项目中组件更新是常有的操作, 更新过程包括以下几种方法:

1. componentWillReceiveProps  当父组件更新自子组建的state时,会调用该方法;
2. shouldComponentUpdate  是否在组件的 state 或者 props 改变后,重新渲染组件
3. componentWillUpdate  在组件接收新的props或者state时,在重新渲染前调用该方法
4. componentDidUpdate   在组件重新渲染后调用该方法


### 组件的卸载
1. componentWillUnMount   离开当前组件时组件销毁;


---

# setState 
__setState 是异步的__
> __setState() 可以理解为一个 重新渲染的请求, 而不是一个立即执行的命令, 为了更好的性能,React 可能会推迟执行, 然后进行批量处理. React不帮正setState操作后拿到最新的值__
__如果想setState后拿到最新的值 可以使用async/await 等setState完成后在打印
```js
  // 初次渲染完成后
  async componentDidMount(){
    await this.setState((state)=>{
      count:state.count + 1
    })
    console.log(this.state.count)
  }
```