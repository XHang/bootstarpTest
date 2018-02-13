# 项目简介：前端的一个测试框架  
## Include
1. bootstrap 的一些样式
2. select2的示例程序
3. 前端的跨域问题

## 跨域问题
问题演示
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

  问题解决

3. ​

   ​

