<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="jquery-3.1.1.min.js"></script>
  </head>
  
  <body>
    <div>请进行你想要的操作</div>
    <button  id="asyn">试一下过时的异步？</button>
    <button id="deferred">来一发deferred对象</button>
    <button id="when">when函数尝尝鲜</button>
    <script type="text/javascript">
    $("#asyn").click(function(){
    		$.ajax({url:"/SolveAjaxAsy/AjaxServlct?time=3000",async : false, success:function(data){
    			alert("第1个异步请求，服务器反馈为"+data);
    		}});
    		$.ajax({url:"/SolveAjaxAsy/AjaxServlct?time=400",async : false,success:function(data){
    			alert("第2个异步请求，服务器反馈为"+data);
    		}});
    		$.ajax({url:"/SolveAjaxAsy/AjaxServlct?time=200",async : false,success:function(data){
    			alert("第3个异步请求，服务器反馈为"+data);
    		}});
    		$.ajax({url:"/SolveAjaxAsy/AjaxServlct?time=1",async : false,success:function(data){
    			alert("第4个异步请求，服务器反馈为"+data);
    		}});
    });
    $("#deferred").click(function(){
    	 $.ajax("/SolveAjaxAsy/AjaxServlct?time=400").done(
    			 function(data){
    				 alert("define对象演示：服务器反馈为："+data);
    			 }
    	  ).fail(
    			  function(data){
    				  alert("define对象演示：请求失败"+data);
    				}
    		)
			.done(
					function(data){ 
						alert("使用define对象可以拓展的第二个回调函数："+data);
					}
			); 
    });
    $("#when").click(function (){
    	var ajax1=$.ajax(
    			{
    				url:"/SolveAjaxAsy/AjaxServlct?time=400",success:function(data){
						alert("when对象演示中,我是400斩,代码位置最前的");
					}		
    			}
    	);
		var ajax2=$.ajax(
			{
				url:"/SolveAjaxAsy/AjaxServlct?time=200",success:function(data){
				alert("when对象演示中,我是200斩，代码位置次之的");
				}
			}
		);
		$.when(ajax1,ajax2).done(
			function (data){
				alert("OK,when函数内的ajax全部执行完毕");
			}
			).fail(
				function(){
					alert("残念，when函数有一个ajax请求狗带");
				}
		);
	});
    	//使用异步属性来指定ajax执行的顺序，不太可靠
    	/* 
    		}); */
    	//演示一下最新jqery的deferred对象。
    	/* $.ajax("/SolveAjaxAsy/AjaxServlct?time=400").done(function(data){alert(data);})
    												.fail(function(data){alert(data+"fail");})
    												.done(function(){ alert("第二个回调函数！");} ); */
    	//这个ajax方法返回的是deferred对象，只是调用了这个对象的done方法和fail方法。fail方法只要返回的http状态不是200就启用
    	//然后deferred对象允许添加多个回调函数，比如说以上函数。
    	
    	//再介绍一下$.when函数
    	
    	
  
    </script>
  </body>	
</html>
