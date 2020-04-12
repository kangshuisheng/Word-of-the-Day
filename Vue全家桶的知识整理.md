# Vuex #

# _state_ 以及他的辅助函数 _mapState_

>**state是数据在Vuex中的存储状态,它就像在应用中任何地方都可以访问到的庞大对象,他就是单一数据源;**

***看下面这个栗子***

``` js
	import Vuex from "Vuex";
	export default new Vuex.Store({
		state:{
			messageCount:10
		}
	})
```
- 我们可以使用 **this.$store.state.messageCount**,访问应用中state中的 messageCount属性,不过这样有些麻烦;
``` js
	created(){
		console.log(this.$store.state.messageCount)//这样就能访问到messageCount了
	}
```

- 用**computed**计算属性来完成这个操作,会更优雅些,代码如下 	
``` js
	template 里面写上{{messageCount这个计算属性就好了}}
    computed:{
   		messgaeCount(){
   			return this.$store.state.messageCount
   		}
   }
```
> 以上两种方法用于,引用store 属性不多的时候;
**当大量引用store的属性时,我们就需要使用到 mapState 辅助函数了**

***mapState辅助函数***

>**它返回一个被用作计算属性的函数对象**
>通常情况下只需要提供一个**跟store中属性一致的字符串数组就好**
``` js
	<template>
		<div>
			{{messageCount}}
		</div>
	</template>
	import {mapState} from "vuex"
	export default {
  		created(){
  		},
  		computed:mapState(['messageCount']),
  	}
```
上面mapState的调用其实是下面的缩写;
```js
	computed:{
		messageCount:(state) => state.messageCount
	}
```
> mapState 函数一一个对象作为参数,并将其中的各个键值映射到一个计算属性,
> 如果键值给的是一个函数,则该函数会以 store 为第一个参数被调用,从而使你能从state上获取一个属性作为计算属性;

**如果你想在computed中写入自己定义的计算属性,但是也想引用mapState函数,可以写成如下形式**

``` js
	computed:{
		myComputedProperty(){
			return "my"
		},
		...mapState({ //利用展开运算符
			messageCount:(state) => state.messageCount
		})
	}
```

**总结以上三种写法**
- 如果需要对计算属性进行一些处理的话,最好使用函数形式,使用完整函数写法,还可以使用this访问当前组件实例属性来完成一些特殊的处理;
- 其余两种看自己的喜好进行使用就行;

++++

# Getter以及辅助函数 mapGetter

**getter 也可以通过_this.$store.getter_进行访问;**


>**通过getter的第二个参数,可以实现,不动getter之间的相互访问**
```js
	getters:{
		personA:(state) => state.filter(item => item.name === "kang"),
		personB:(state,getters) => {
			getters.getA.map(item => {
				return item.age
			})
		}
	}
```
mapGetter的使用方法跟mapState差不多 ,***只不过它不支持函数式写法***



# Mutaition 及其辅助函数 mapMutation

>**mutation是Vuex中修改状态的唯一入口
>mutation 必须是一个同步函数,它对state的修改是同步的;**

**使用mutation的话再组件中 调用 _this.$store.commit("store中定义的mutation名称"))_来触发mutation**
```js
	//store中
	store:{
		name:'kang'
	}
	mutation:{
		changeName(state,newValue){
			state.name = newValue
		}
	}
	
	// 组件中使用, 当然这不是只有这一种形式;
	created(){
		this.$store.commit("changeName","shui")
	}
```

# Action 异步修改 state

要使用action的话
1.首先再store中定义个action,
2.在组件中使用 this.$store.dispath("action")  *dispath()完成后会返回一个promise*
3.store中的异步任务结束后, action 再触发 mutation从而完成state的修改

> **action 可以实现异步修改任务,但并不是直接进行修改,它是当异步任务完成之后调用 mutation中的方法来实现异步修改数据的**

**来看一个例子**

```js
// store中
const actions = {
  async getMessage(context) {
    console.log("action的上下文环境", context);
    let timer = this.state.timer;
    clearTimeout(timer);
    timer = setTimeout(() => {}, 1000);
    let data = await timer;
    if (data) {
      context.commit("addMessage", data);
    }
  }
};
//组件中
methods:{
	asyncAction(){
        this.$store.dispatch("action")
    }
}
```

