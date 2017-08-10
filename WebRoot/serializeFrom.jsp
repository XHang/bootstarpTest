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
		<form action="">
			userName <input type="text" name="userName" value="Bill" /><br />
			password  <input type="text" name="password" value="Gates" /><br />
		</form>
		<button>序列化表单值 </button>
		<script type="text/javascript">
		$(document).ready(function(){
		  $("button").click(function(){
		  		var  data=$("form").serializeArray();
		  		var str = JSON.stringify(data);
		  		alert("表单序列化后转成的对象为："+str);
		  });
		});
		</script>
	</body>
</html>
