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
	
	<form action="list.do" method="post">
		商品名称:<input type="text" name="gname" value="${goods.gname }">
		<input type="submit" value="查询">
		<a href="toAdd">
			<input type="button" value="添加">
		</a>
		<table>
			<tr>
				<td>
					<input type="button"  value="全选"  onclick="qx()">
					<input type="button" value="批量删除"  onclick="del()" >  
				</td>
				<td>编号</td>
				<td>商品名称</td>
				<td>英文名称</td>
				<td>商品品牌</td>
				<td>商品终类</td>
				<td>尺寸</td>
				<td>单价(元)</td>
				<td>数量</td>
				<td>标签</td>
				<td>图片</td>
				<td></td>
				
			</tr>
			<c:forEach items="${list }" var="ls">
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${ls.gid }" >
					</td>
					<td>${ls.gid }</td>
					<td>${ls.gname }</td>
					<td>${ls.ename}</td>
					<td>${ls.bname }</td>
					<td>${ls.kname }</td>
					<td>${ls.size }</td>
					<td>${ls.price}</td>
					<td>${ls.num }</td>
					<td>${ls.bq }</td>
					<td>
						<img alt="" src="${ls.pic }">
					</td>
					<td>
						<a href="toUpdate.do?gid=${ls.gid }">
							<input type="button" value="商品详情">
						</a>
						
							<input type="button" value="删除" onclick="delOne(${ls.gid})">
						
						
						
						
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="100">
					<button name="pageNum" value="1">首页</button>
					<button name="pageNum" value="${pg.prePage==0?1:pg.prePage }">上一页</button>
					<button name="pageNum" value="${pg.nextPage==0?pg.pages:pg.nextPage }">下一页</button>
					<button name="pageNum" value="${pg.pages }">尾页</button>
				</td>
			</tr>
		</table>
	
	</form>
	<script type="text/javascript">
		function qx(){
			$(":checkbox").attr("checked",true);
		}
		function del(){
			var ids = $("[name='ids']").map(function(){
				return this.value;
			}).get().join();
			
			if(confirm("是否删除选中数据？")){
			$.post(
					"del.do",
					{ids:ids},
					function(msg){
						if(msg){
							location="list.do";
						}
					}
				)
			}
			
		}
		
		function delOne(ids){
			if(confirm("是否删除选中数据？")){
			$.post(
				"del.do",
				{ids:ids},
				function(msg){
					if(msg){
						location="list.do";
					}
				}
			)
			}
		}
	</script>

</body>
</html>