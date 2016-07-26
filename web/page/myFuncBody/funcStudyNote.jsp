<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h3 style="color: fuchsia">${objName }</h3>
<a onclick="addNote()" style="cursor: pointer;"><font color="green">添加笔记</font></a>
&emsp;<a href="${base }/func/studynote/show" style="text-decoration: none"><font color="green">返回主页</font></a>
<fieldset style="width: 80%">
<legend>StudyNote</legend>
<c:if test="${empty fsnList}">
没有找到相关纪录哦，快<a onclick="addNote()" style="cursor: pointer;"><font color="green">添加笔记</font></a>吧
</c:if>
<c:forEach items="${fsnList}" var="fsn">
<a href="javascript:showType('${fsn.name }')" style="text-decoration: none">${fsn.name }</a>
<a href="${base }/func/studynote/showDetail?name=${objName }&type=${fsn.type }" 
style="text-decoration: none">${fsn.type }</a>&emsp;
</c:forEach>
</fieldset><br/>
<c:if test="${fsn!=null}">
<div id="updateNoteDiv">
<form action="${base}/func/studynote/update" method="post">
<input type="hidden" name="id" value=${fsn.id }>
笔记大类: <input name="name" readonly="readonly" value=${fsn.name }> (笔记所属的类别。如:JAVA)<br/><br/>
笔记小类: <input name="type" value=${fsn.type }> (笔记所属的小类。如:JAVA-SSH框架)<br/><br/>
笔记内容: <textarea rows="20" cols="110" name="detail">${fsn.detail }</textarea><br/><br/>
<span style="padding-left: 80%">
<input type="submit" class="register" value="修改">&emsp;&emsp;
<input type="reset" class="register" value="重置">
</span>
</form>
</div>
</c:if>
<div id="addNoteDiv" style="display: none;">
<form action="${base}/func/studynote/add" method="post">
笔记大类: <input name="name" value=${objName }> (笔记所属的类别。如:JAVA)<br/><br/>
笔记小类: <input name="type"/> (笔记所属的小类。如:JAVA-SSH框架)<br/><br/>
笔记内容: <textarea rows="20" cols="110" name="detail"></textarea><br/><br/>
<span style="padding-left: 80%">
<input type="submit" class="register" value="提交">&emsp;&emsp;
<input type="reset" class="register" value="重置">
</span>
</form>
</div>
<script>
function addNote()
{
	document.getElementById("addNoteDiv").style.display="";
	document.getElementById("updateNoteDiv").style.display="none";
}
function showType(value)
{
	window.location.href="${base}/func/studynote/showType?name="+value;
}
</script>
</body>
</html>