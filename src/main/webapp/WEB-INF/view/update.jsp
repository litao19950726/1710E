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
	<form action="update.do" method="post">
		<input type="hidden" name="gid" value="${g.gid }">
		<table>
			<tr>
				<td>商品名称</td>
				<td>
					<input type="text" name="gname" value="${g.gname }">
				</td>
			</tr>
			<tr>
				<td>英文名称</td>
				<td>
					<input type="text" name="ename" value="${g.ename }">
				</td>
			</tr>
			<tr>
				<td>商品品牌</td>
				<td>
					<select name="bid" id="bid" >
						
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
					<input type="text" name="size" value="${g.size }">
				</td>
			</tr>
			<tr>
				<td>单价(元)</td>
				<td>
					<input type="text" name="price" value="${g.price }">
				</td>
			</tr>
			<tr>
				<td>数量</td>
				<td>
					<input type="text" name="num" value="${g.num }">
				</td>
			</tr>
			<tr>
				<td>标签</td>
				<td>
					<input type="text" name="bq" value="${g.bq }">
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
					<input type="button" value="修改" onclick="update()">
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
					$("[name='bid'][value='"+msg.bid+"']").attr("checked",true);
					
					
				},
				"json"
			)
				$.post(
				"selectKind",
				function(msg){
					for ( var i in msg) {
						$("#kid").append("<option value='"+msg[i].kid+"'>"+msg[i].kname+"</option>");
					}
					$("[name='kid'][value='"+msg.kid+"']").attr("checked",true);
				},
				"json"
			)
		})
		
		function update(){
			
			$.post(
					"update.do",
					$("form").serialize(),
					function(msg){
						if(msg>0){
							alert("修改成功");
							location = "list.do";
						}else{
							alert("修改失败");
							location = "update";
						}
					
			}		
			)
				
			
		}
		
	</script>
</body>
</html>