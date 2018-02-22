<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		类型转换失败的错误信息处理
		1. 如何覆盖默认的错误消息？
			1). 在对应的Action类所在的包中新建ActionClassName.properties 文件，ActionClassName即为包含输入字段的Action的类名（同时properties文件指定iso-8859-1编码格式编辑）
			2). 在属性文件中添加如下键值对：invalid.fieldvalue.filedName=XXX
		2. 如果是simple主题，还会自动显示错误消息？
			1). 不会自动显示
			2). 可以利用ognl表达式来显示错误信息:通过debug标签，可以直到若是转换出错，则在值栈的Action(需要实现ValidationAware接口)对象中有一个fieldErrors属性，该属性的类型为
				Map<String, List<String>> 类型，键：字段属性名，值：错误消息组成的List，所以可以使用el或者ognl的方式来显示错误消息：${fieldErrors.age[0] }
			3). 还可以使用s：fielderrors 标签来显示错误信息，可以通过filedName属性显示指定字段的错误信息
			4). 如是simple主题，并且使用s：fielderrors标签来显示错误消息，则该消息实际是在ul，li，span中，如何去除它们呢？
				在template.simple 下面的fielderror.ftl中，定义了simple主题下，s：fielderros标签显示的格式，所以修改该配置文件即可：在src下新建一个template.simple包，把原生
				的fielderror.ftl中的内容复制到新建的fielderror.ftl中，然后剔除ul，li,span部分即可
		3. 自定义类型转换器
			1. 因为struts2不能自动完成字符串到引用类型的转换
			2. 如何自定义类型转化器：
				1. 开发类型转换器的类：扩展StrutsTypeConverter类
				2. 配置类型转换器：
					1. 基于字段的配置：
						> 在字段所在的Model（可能是action，也可能是javaBean）的包下，新建一个ModelClassName-conversion.properties文件
						> 在该文件中输入键值对：fieldName=类型转换器的全类名(birth=cn.zc.cris.converter.DateConverter)
						> 第一次使用创建，后面每次调用对应的方法即可,类型转换器是单实例的
					2. 基于类型的配置：
						> 在src目录下，新建xwork-conversion.properties
						> 键入：待转换的类型=类型转换器的全类名(java.util.Date=cn.zc.cris.converter.DateConverter)
						> 在当前struts2应用被加载时创建实例，不是单实例
				3. 因为两种配置类型转换器的方式加载类型转换器的时机不同，导致类型转换器中的需要新增一个getFormat()方法，才可以解决第二种无法通过加载应用初始化参数的方式指定DatePattern格式
	 -->
	<s:form action="testConversion" >
		<s:textfield name="age" label="Age"></s:textfield>
		<br>
		${fieldErrors.age[0] }
		-^^- <s:fielderror fieldName="age"></s:fielderror>
		<s:textfield name="birth" label="Birth"></s:textfield>
		<s:submit></s:submit>
	</s:form>

</body>
</html>