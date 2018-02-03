<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8" />
<title>select2 js 示例程序</title>
<script type='text/javascript'  src='${pageContext.request.contextPath}/select2/jquery-1.11.1.min.js'></script>
<script src="${pageContext.request.contextPath}/select2/select2.min.js"></script>
<link href="${pageContext.request.contextPath}/select2/select2.min.css" rel="stylesheet" />
</head>
<body>
<div>
	操作步骤：点击下拉框，在下拉框里面的输入框输入数据。
	可以实时查询，并将查询的结果放在下拉框里面，可以供用户选择
</div>
	<select id="selectExample"  style="width: 333px">
		<option></option>
	</select>
</body>
<script type="text/javascript">
var incrementId = 1;
$('#selectExample').select2({
	 ajax: {
		 	dataType: 'json',
		 	method:"post",
		    url: '/frontEndRoad/DataServlct',
		  	 //指定ajax发送的参数，不指定的话会用默认配置
		    data: function (params) {
		      var query = {
		    		 key: params.term,
		      }
		      // 这样写的话搜索的URL就类似于?keyWord= xxxx
		      return query;
		    },
		  //处理ajax返回的结果
		    processResults: function (data, params) {
		    	idcoventNumber(data);
			      return {
			        results: data,
			      };
			},
			cache: true
	 },
	 width:'style',
	 debug:true,
	//state应该就是Response的每一个数组的元素，返回元素的属性，这个属性将显示在下拉框里面
	templateResult: showOptionText,
	//默认情况下，templateResult返回的值仅仅只是字符串，然后会通过escapeMarkup向调用者返回
	//有必要的话，你可以在这个函数对数据进行进一步的处理
	escapeMarkup: function (markup) { return markup; },
	//重要的属性，只有当下拉框的输出框输入至少一个字符才会发ajax请求
	minimumInputLength: 1,
	//只可选择一个元素
	maximumSelectionLength:2,
	placeholder: 'Search for a repository',
	allowClear: true,
	templateSelection: selectTextToSelect,
});
//取文本数据显示在下拉框列表内
function showOptionText (repo) {
 if (repo.loading) {
   return repo.text;
 }
return "<div id='county-"+repo.id+"'>"+repo.name+"</div>"
} 
//为品牌列表补充id属性，使select2能选中品牌
function idcoventNumber(data){
for(var i=0;i<data.length;i++){
	incrementId++;
	data[i].id = incrementId;
}
}
//当选择元素时，将元素的何种属性显示在选项框里面
function selectTextToSelect(repo){
if(repo.text){
	return "请选择";
}
return "<div id='county-"+repo.id+"'>"+repo.name+"</div>";
}
</script>
</html>
