# VUE学习笔记
# 一:VUE是什么?
VUE是一个前端框架,用于构造用户界面的一个渐进式框架,它被设计为自底向上设计，而且是响应式的

可以把网页分隔成几个可复用的组件，每一个组件，都有属于自己的js,html,css代码

从这个陈述句,有几个概念

1. 什么是渐进式

2. 什么是自底向上的设计

3. 什么是响应式

   
> 渐进式，就是可以方便的为自己的项目植入所需要的vue代码，而不是全家桶一样，只用到10%的代码，却引入了其他80%的代码
>
> 响应式，就是当数据变更时，会自动变更网页上所有的数据，但是响应式是有条件的，至少你不能将你要修改的对象传入此函数`Object.freeze()`,否则，这个对象的任何属性都无法更改，自然也就无所谓响应式了
>
> 自底向上设计，也就是在开发vue这个框架中，使用的语言也在不断的修正，以便更适用于vue的开发

接下来是我概括的几个vue的特点

1. 可将页面上的元素和script里面的对象关联起来，达到更改对象即可更改页面元素的目的
2. 尽量不用操作dom相关的东西，而且着重于逻辑层面相关的东西



# 二：第一个小程序

每一个Vue应用都是从Vue函数创建一个新的Vue实例来进行的

在创建Vue实例时，你可以传入一些选项参数，以自定义你的Vue实例.以下代码实现一个一个简单的Vue实例应用

简单的在浏览器上显示一个字符串，用vue实现，代码基本是这样的

```
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>vue示例页面</title>
    <!--引入vue框架-->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        {{message}}
    </div>
    <script type="application/javascript">
       var app =  new Vue({
       		//表示和页面的id=app的那个元素关联起来
            el:'#app',
            //data里面的，都是app这个对象里面的属性
            data:{
                message:'hello,vue'
            }
        })
    </script>
</body>
</html>
```

好像这样并没有什么有趣的，不用vue照样能实现，而且代码更少

那么，为了避免有狗拿耗子的多此一举

接下来打开浏览器控制台，输入`app.message = '你好，菜鸟'`

可以看到页面上目的元素也随之改变了。

这就是vue的特性之一：**将页面上的元素和js里面的对象属性关联起来**

这里所讲的元素不仅仅只是包含标签内的文本，标签内的元素也是可以和js属性绑在一起的

比如，这次我把元素里面的title绑定在对象的title属性里面

```
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>vue示例页面</title>
    <!--引入vue框架-->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
    <div id="app" v-bind:title="title">
        <span>{{message}}</span>
    </div>
    <script type="application/javascript">
       var app =  new Vue({
            el:'#app',
            data:{
                message:'hello,vue',
                title:'欢迎你，vue'
            }
        })
    </script>
</body>
</html>
```

> 说一下`v-bind:title="title"`的代码
>
> `v-bind` 被称为vue的指令，它以`v-`开头，以表示它是vue提供的特殊特性
>
> 功能是将该标签的title属性，和对象app里面的title属性绑定起来
>
> 为什么是对象app呢？其实在对象app所绑定的标签及标签的下方，都是属于对象app的上下文
>
> 在上下文内使用vue的指令，默认选取的对象就是app

还有介绍一下`{{message}}`这个表达式，这个表达式的名字叫做`“Mustache”语法 `


# 三：VUE实例

通过上面的VUE应用，你应该知道了要创建一个VUE应用，应该要先干什么

没错，就是创建一个VUE实例

一个简单的VUE实例创建的代码如下

```
var app =  new Vue({
            el:'#app',
            data:{
                message:'hello,vue',
                title:'欢迎你，vue'
            }
        })
```

其中，`el`需要接受一个选择器，以选择dom上面的元素，`data`是我们往VUE实例加入的一些自定义属性

> 除了传这两个参数，还可以将函数作为参数传进去，这样做，可以在VUE实例的各个生命周期，
>
> 绑定一些我们自定义的触发函数，下面`3.3章:VUE示例的生命周期`，将讲到这一点

通过更改VUE实例里面的自定义属性，可以方便的更改dom元素

不过VUE里面除了我们自定义的属性外，本身它也有一些很有用的属性和方法，可以为我们所用。

## 3.1 VUE实例自带的属性

VUE自带的属性名，通常都是以`$`开头，如`$data`，当你创建一个VUE实例，就可以查看它里面自带的属性了

以下介绍几个有用的属性

1. `$data `你构建VUE实例时，往data传入的参数

   比如说：

   ```
   var data = { a: 1 }
   var vm = new Vue({
     el: '#example',
     data: data
   })
   ```

   这样你查看`vm.$data`里面的值时，就可以发现它竟然和里面预先定义的data一毛一样

2. `$el `  代表的是VUE对象所绑定的dom对象

   给个例子

   ```
   代码和上面的一样
   ```

   这里的`data.$el`和`document.getElementById('example')`  是一样的

## 3.2 VUE实例自带的方法

跟上面自带的属性一样，VUE实例自带的方法名也是以`$`开头的，以下介绍VUE自带的方法

1. vm.$watch(‘属性名’,function(newValue,oldValue){.....})

   调用此方法，可以为VUE实例属性的修改增加一个监听方法

   参数1：是监听属性的属性名

   参数2：需要自己实现的监听方法，在属性修改后，会自动调用此方法，属性修改的值，会传入newValue

   属性前修改的值，会传入oldValue



## 3.3 VUE实例的生命周期

VUE实例的生命走起先挖个坑，后期再填。

现在先介绍怎么在VUE的各个生命周期绑定我们自定义的触发函数

直接亮代码

```
new Vue({
    el:'#app',
    data:{
        message:'演示中'
    },
    create:function(){
    	// 这个this就是VUE实例了
         console.log('a is: ' + this.a);
    }
})
```

如上所示，就是在创建VUE实例的时候，将一个函数作为create参数传进去

> VUE官方文档声称说，不可以用箭头函数，因为箭头函数里面的this指代的不再是VUE实例了
>
> 

这个函数就可以在VUE实例创建后，调用了

基本用法就这样，下面介绍其他绑定VUE生命周期的函数参数

1. create  可以在VUE实例创建时，触发此函数
2. 



# 四：Vue指令

## 4.1 指令构成

指令的构成语法是：

`指令名:参数=变量名`  ，比如上文提到的上文提到的`v-bind:title="title"`

可以不带参数和变量名，比如`v-once`

可以不带参数，比如说`v-if="hiddenFlag"`

指令名以`v-`开头，有些指令可以带参数，可以写在`:`后面



有些指令会带有`.`的特殊前缀，这个是**修饰符**来着。

相同的指令，带上不同的修饰符，就会有不同的效果

比如说：`<form v-on:submit.prevent="onSubmit">...</form>`

把表单的提交事件添加一个自定义触发事件，并阻止表单的默认提交事件





参数的前面用`:`来表示后面的部分是一个参数，参数可以是简单的一个单词，也可以是js表达式，后者必须要用`[]`括起来，比如说`[js表达式]`

> 注：这种表达式有一些限制，不能包含空格和引号。
>
> 因为表达式最终还是写在标签的属性上面，标签的属性不能包含这些特殊字符咯



变量名的前面用`=`来表达后面的单词是一个变量名

有些则没有参数，比如说`v-if="hiddenFlag"`

指令的用法是把vue指令，当做标签里面的元素，嵌入进去,再根据不同的指令，编写不同的js代码，就能使之生效



某些指令提供了简写，下面介绍这些指令以及简写后的格式

1. `v-bind:href="url"`  简写后为`:href="url"`
2. `v-on:click="doSomething"`简写后为`@click="doSomething"`

## 4.2 常用的指令

以下是学习过程中，了解的一些vue指令

1. `v-bind:title="title"`  将该标签的title元素，绑定在上下文对象的title属性内

   > 对于v-bind:disabled="xxxx"，如果xxxx的显示值为null,false,undefined
   >
   > 则渲染出来的html甚至没有disabled这个属性

2. `v-if="hiddenFlag"`  将该标签的文本的隐藏与否，绑定在上下文对象里面的hiddenFlag属性中

3. `v-for="todo in todos"` 遍历上下文对象的todos属性，遍历的每一个元素作为子上下文对象todo

   话不多说，直接上代码

   ```
   <html lang="zh-CN">
   <head>
       <meta charset="UTF-8">
       <title>vue示例页面</title>
       <!--引入vue框架-->
       <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
   </head>
   <body>
       <div id="app" >
           <li v-for="todo in todos">
               {{todo.name}}
           </li>
       </div>
       <script type="application/javascript">
          var app =  new Vue({
               el:'#app',
               data:{
                   todos:[
                       {name:'张三'} ,{name:'李四'},{name:'崔佛'}
                   ]
               }
           })
       </script>
   </body>
   </html>
   ```
   效果是遍历app对象属性的todos数组，然后把数组里面对象的name属性作为有序列表，遍历显示出来
   > 比较特殊一点的就是` {{todo.name}}`
   >
   > 不能把todo作为子上下文对象一样，直接省略todo对象，写`{{name}}`
   >
   > 而是必须引用todo对象，嘛，当做一个特殊的写法吧。毕竟人家设计肯定有自己的考虑

   跟第二章所讲述的一样，你可以在集合中，再添加一个元素，然后就可以在页面上看到新的变更

   在浏览器控制台执行`app.todos.push({name:'王五'})`

4. `v-on:click="reverseMessage"`  为该标签添加点击事件，触发函数是上下文对象的reverseMessage函数

   关键在于，怎么为上下文对象添加函数，虽然我们说了这么多的上下文对象，但是上下文对象并不是我们创建的，是vue内部构建的，我们要如何才能为上下文对象添加函数呢？

   给代码啦

   ```
   var app5 = new Vue({
     el: '#app-5',
     data: {
       message: 'Hello Vue.js!'
     },
     methods: {
       reverseMessage: function () {
         this.message = this.message.split('').reverse().join('')
       }
     }
   })
   ```

   > app5这个对象，准确的说，是vue的对象，但是里面还增加了我们自己添加的一些属性和方法
   >
   > 所以才可以在浏览器控制台上执行app5.xxxx='xxxx'这样的命令
   >
   > 顺便一提，上面的js语句效果是
   >
   > 将app5对象里面的message属性的值反向

5. `v-model="message"` 一般用于输入框，将输入框里面的值，赋给上下文对象的message属性。

   如果message有绑定在其他地方的话，就可以实现表单输入和应用状态之间的双向绑定

6. `v-once` 使用了这个指令的标签，将不会有响应式的效果，也就是说，当上下文的对象属性发生变更时，这个标签的显示将不会有任何变化。

   > ps:标签下面的子标签不受影响

7. `v-html='xxxx'`  可以将该标签嵌套的文本，替换为上下文对象的xxxx属性

   貌似跟直接在嵌套文本写`{{xxxx}}`的效果是一样的？

   不，其实还是有区别的，`{{xxxx}}`只能以纯文本显示数据

   `v-html='xxxx'`  可以显示html代码

# 五： VUE的组件

VUE的组件作用是创建可复用性的代码

> 对于初章的组件介绍仍然有点乱

# 六：模板表达式

所谓模板表达式，就是上面我们提到的类似于`{{message}}`这样的表达式

他可以渲染上下文对象某个属性，更新到页面中。

这个表达式不仅可以写属性名，一些比较简单的js表达式也是支持的，并且可以解析。

比如说，我可以这样写

`{{ number + 1 }}`

`{{ ok ? 'YES' : 'NO' }}`

`{{ message.split('').reverse().join('') }}`

显示的值会替换为表达式里面的值

但是，如果表达式写的是其他乱七八糟的玩意，就别妄想它会把你解析了

比如说

`{{ var a = 1 }}`

`{{ if (ok) { return message } }}`

写着两句代码的哥们，估计连要显示什么数据都还不清楚吧

使用js表达式作为模板表达式有几点需要注意

1. 表达式里面只能访问类似于`Math` 和`Date`  这些预先定义好的全局变量

   不应该访问自定义的全局变量

2. 建议js表单式不应该写的太复杂，只用来做一些简单的计算就行

   如果要表达式要进行复杂的计算，可以使用计算属性

   模板表达式支持用计算属性，来通过函数的计算，得到表达式的值

   使用示例

   ```
   <head>
       <meta charset="UTF-8">
       <title>vue示例页面</title>
       <!--引入vue框架-->
       <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
   </head>
   <body>
       <div id="app" >
           <span>消息将反向输出！{{eversedMessage}}</span>
   
       </div>
       <script type="application/javascript">
          var app =  new Vue({
               el:'#app',
               data:{
                   message:'hello,vue',
               },
              computed:{
                  eversedMessage:function(){
                      return this.message.split("").reverse().join("");
                  }
              }
           })
       </script>
   </body>
   </html>
   ```

   使用的步骤是先在VUE实例上添加一个计算属性的函数上，然后在模板表达式上使用这个函数名即可

   替代的方式，还可以在模板表达式调用js方法，来拿到表达式的值。

   > js方法需要先写在VUE实例的methods属性中

   所以就结果来看，使用计算属性和调用js方法得到的结果是一样的。

   但是使用计算属性，它会将结果缓存起来，你多次调用计算属性，并不会重复执行方法。（所以才叫属性嘛）

   调用js方法就不好说了，你要拿到表达式的值，就得执行方法，在某些情况下是没必要的

   




