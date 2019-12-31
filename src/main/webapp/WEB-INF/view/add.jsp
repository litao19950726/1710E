<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<html>
<head>
  <script type="text/javascript" src="<%=path%>/jquery/jquery-1.8.2.js"></script>
  <link rel="stylesheet" href="<%=path%>/css/css.css" type="text/css"></link>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="add.do" method="post">
		<table>
			<tr>
				<td>商品名称</td>
				<td>
					<input type="text" name="gname">
				</td>
			</tr>
			<tr>
				<td>英文名称</td>
				<td>
					<input type="text" name="ename">
				</td>
			</tr>
			<tr>
				<td>商品品牌</td>
				<td>
					<select name="bid" id="bid">
						
					</select>
				</td>
			</tr>
				<tr>
				<td>商品种类</td>
				<td>
					<select name="kid" id="kid">
						
					</select>
				</td>
			</tr>
			<tr>
				<td>尺寸</td>
				<td>
					<input type="text" name="size">
				</td>
			</tr>
			<tr>
				<td>单价(元)</td>
				<td>
					<input type="text" name="price">
				</td>
			</tr>
			<tr>
				<td>数量</td>
				<td>
					<input type="text" name="num">
				</td>
			</tr>
			<tr>
				<td>标签</td>
				<td>
					<input type="text" name="bq">
				</td>
			</tr>
			<tr>
				<td>商品图片上传</td>
				<td>
					<input type="file" name="f">
				</td>
			</tr>
			<tr>
				<td colspan="10">
					<input type="button" value="添加" onclick="add()">
				</td>
			</tr>
		</table>
	
	</form>
	<script type="text/javascript">
		$(function(){
			$.post(
				"selectBrand",
				function(msg){
					for ( var i in msg) {
						$("#bid").append("<option value='"+msg[i].bid+"'>"+msg[i].bname+"</option>");
					}
				},
				"json"
			)
				$.post(
				"selectKind",
				function(msg){
					for ( var i in msg) {
						$("#kid").append("<option value='"+msg[i].kid+"'>"+msg[i].kname+"</option>");
					}
				},
				"json"
			)
		})
		
		function add(){
			
			$.post(
					"add.do",
					$("form").serialize(),
					function(msg){
						if(msg>0){
							alert("新增成功");
							location = "list.do";
						}else{
							alert("保存失败");
							location = "add";
						}
					
			}		
			)
				
			
		}
		
	</script>
</body>
</html>