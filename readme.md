#项目简介：本项目主要演示jquery新加的几个特性
1. deferred对象和$.when函数
	deferred对象其实就是$.ajax执行后的对象，这个对象上可以加上若干个回调函数   
	when函数里面可以指定好几个deferred对象（为了方便，有时会直接把ajax请求整个函数体作为参数）
	when函数后可调用一个done函数，用于当所有when里面的deferred对象全部执行完毕后触发整个这个函数
2. serializeArray();函数
		 序列化后，得到的对象是一个数组，且有多少个键值对，就有几个数组元素  
		 数组元素里面装的是对象，表单的name值用对象的name属性存储，value用对象的value属性存储  
3. 经典的（过时的async : false）  
	async : false可以使异步请求按照代码从上往下执行，有顺序的执行，但是，请求过程中整个浏览器会假死  
	这不是一个好设计
注：项目启动后进入
`http://127.0.0.1:8080/SolveAjaxAsy/serializeFrom.jsp`
可以测试serializeArray();函数
进入
`http://127.0.0.1:8080/SolveAjaxAsy/index.jsp`
可以测试ajax的那三个新特性
另：用maven的tomcat插件运行是失败的。