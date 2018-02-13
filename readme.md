# 项目简介：前端的一个测试框架  
## Include
1. bootstrap 的一些样式
2. select2的示例程序
3. 前端的跨域问题

## 跨域问题
### 问题演示

1. 第一步：
  启动本项目，其端口要求是8080，启动完毕后，访问这个地址`http://localhost:8080/frontEndRoad/DataServlct`至少能得到响应  

2. 第二步：
  然后在本项目里面的question文件夹里面，将cross-domain.html直接通过浏览器打开
  此时，若这个世界是正常的，你应该可以看到一个弹出框`error`

  打开你的浏览器控制台，可以清楚  看到一行红字，我念给你听啊

  ` No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'null' is therefore not allowed access.`

  没错，这就是跨域问题，而且，很神奇的是，虽然发生了跨域问题，但是呢，你在浏览器的网络响应中，还是可以看到服务器返回的响应。

  > 是不是不太安全呢?

  只是浏览器say no而已。

  ### 问题解决

  **第一种解决方案 **

  在服务器ajax接口的响应体里，加一个响应头键值对。

  例如`response.addHeader("Access-Control-Allow-Origin", "*");`

  表示浏览器可以接受这个跨域请求。

  当然`*`不太好，这样这个接口可以被任何浏览器跨域访问，存在很大的安全隐患。

  如果你是从`http://foo.example`这个域名下发起跨域请求的，可以将这个url加在

  那个`Access-Control-Allow-Origin`里面，这样的话，只有这个网站的跨域请求才不会被拦截

  **第二种解决方案**：

  自然就是jsonp解决方案了

  jsonp的请求方式，类似于请求服务器上面的js，css资源，像这些资源的请求是不会被跨越的。

  只需要客户端请求服务器资源时传多一个callback参数。

  后端检测到这个参数的话，把原本的json数据再往后面包上一层，返回给前端。

  前端调用就行了。

  ** 内部实现机理是怎么的？**

  嗯，其实把，首先前端先定义一个方法，比如说定义一个方法名，叫method

  后端返回的数据就是一段js代码，这个js代码就是调用method的方法，调用时传的参数就是实际上服务器要返回到前端的参数。

  这样把后端的返回的数据当做一串js脚本，通过script脚本来请求。这样一旦js脚本执行了，自然就调用到了我们事先写好的method方法，也就自然能拿到后端返回的数据了。

  简直机制。

  ​

  ​

