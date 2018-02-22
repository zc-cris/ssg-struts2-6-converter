<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var i = 2;
	
		$("#add").click(function(){
			//1. 用户最多只能添加3个上传按钮组件
			if(i<5){
			$(this).parent().parent().before("<tr class='managerName'><td>managerName"
					+ i +"：</td><td><input type='text' name='managers["
					+ (i-1) +"].name' /></td></tr><tr class='managerBirth'><td>managerBirth"
					+ i +":</td><td><input type='text' name='managers["
					+ (i-1) +"].birth' /><input type='button' value='删除' id='delete"+i+"' class='btr'/></td></tr>")
				i++;
			}else{
				alert("最多只能同时上传4个manager的信息");
			}
			//2. 为每一个上传组件的删除按钮添加一个移除当前上传组件的事件
			$("#delete"+(i-1)).click(function(){
				var tr = $(this).parent().parent();
				tr.prev("tr").remove();
				tr.remove();
				//2.1 每一次删除上传组件的时候都应该为剩余的上传组件排序
				$(".managerName").each(function(index){
					var n = index+1;
					//为组件的名称排序
					$(this).find("td:first").text("managerName"+(n));
					//为组件的属性排序
					$(this).find("td:last input").attr("name","managers["+(n-1)+"].name");
				})
				//index就是当前遍历元素的索引，从0开始
				$(".managerBirth").each(function(index){
					var n = index+1;
					$(this).find("td:first").text("managerBirth"+(n));
					$(this).find("td:last input").attr("name","managers["+(n-1)+"].birth");
				})
				//为button的id重新排序
				$(".btr").each(function(index){
					var n = index+1;
					$(this).attr("id","btr"+(n));
				})
				//2.2 根据table下的tr标签数量来重新给i赋值，这样子不管删除哪一个上传组件后 ，再想添加上传组件，其序号都是合理的
				var childrenlength = $("table tr").length;
				switch(childrenlength){
				case 3:
					i = 2;
					break;
				case 5:
					i = 3;
					break;
				case 7:
					i = 4;
					break;
				}
			})
			
		});
		
		
	})
</script>
</head>
<body>
	<form action="testCollection.action" method="post">
		<table>
			<tr class='managerName'>
				<td>managerName1：</td>
				<td><input type="text" name="managers[0].name"/></td>
			</tr>
			<tr class='managerBirth'>
				<td>managerBirth1:</td>
				<td><input type="text" name="managers[0].birth" /></td>
			</tr>
			<tr id="tr">
				<td><input type="submit" value="提交"></td>
				<td><input type="button" id="add" value="新增一条manager信息"></td>
			</tr>
		</table>
	</form>
</body>
</html>