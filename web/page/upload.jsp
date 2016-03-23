<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Paradise</title><link rel="shortcut icon" href="${base }/Favicon.ico" >
		<link rel="stylesheet" type="text/css"
			href="${base }/rs/css/style.css" />
		<link type="text/css" rel="stylesheet" href="${base }/ckeditor/_samples/sample.css" />
	</head>
		<body>
		<div id="wrap">
			<div class="header">
				<div class="logo">
					<a href="${base }/index.jsp"><img src="${base}/rs/images/pet/logo160219.png"
							alt="" title="" border="0" /> </a>
				</div>
				<div id="menu">
					<ul>
						<li>
							<a href="${base }/index.jsp">首页</a>
						</li>
						<li>
							<a href="${base }/getContent/article/list?type=0">文字</a>
						</li>
						<li>
							<a href="${base }/getContent/article/list?type=1">图片</a>
						</li>
						<li>
							<a href="${base }/getContent/article/list?type=2">生活</a>
						</li>
						<li>
							<a href="${base }/getContent/media/list">影音</a>
						</li>
						<li>
							<a href="${base }/getContent/resource/list">资源</a>
						</li>
						<li>
							<c:choose>
								<c:when test="${me==null }">
									<a href="${base }/page/myaccount.jsp">登录</a>
								</c:when>
								<c:otherwise>
									<a href="${base }/page/myaccount.jsp">我的</a>
								</c:otherwise>
							</c:choose>
						</li>
						<c:if test="${me!=null }">
						<li class="selected">
							<a href="${base}/page/upload.jsp">上传</a>
						</li>
						</c:if>
						<li>
							<a>欢迎您，(^*^)</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="center_content">
				<div class="left_content" style="background-color: white;width: 880px">
					<div class="title">
						<span class="title_icon"><img
								src="${base}/rs/images/pet/bullet1.gif" alt="" title="" /> </span>内容上传
					</div>
					<div class="feat_prod_box_details"> 
						<div class="contact_form" style="width: 770px">
							<div class="form_row">
								<label class="contact">
									<strong>类型:</strong>
								</label>
								<select name="type" class="contact_input"
									onchange="changeForm(this.value);">
									<option value="0">
										文字
									</option>
									<option value="1">
										影音
									</option>
									<option value="2">
										资源
									</option>
								</select>
								<% if(session.getAttribute("upload-error-msg")!=null){ %>
								Error:
								<%=session.getAttribute("upload-error-msg") %>
								, 上传失败！
								<% }else{ %>
								准备上传 || 上传成功
								<%} %>
							</div>
						</div>

						<%--文字--%>
						<div id="article" style="display: '';" >
							<form action="${base }/admin/upload/article" enctype='multipart/form-data' method="post">
								<div class="contact_form"  style="width: 770px">
									<label class="contact">
										<strong>文章类型:</strong>
									</label>
									<select name="type" class="contact_input"
										onchange="getAtype(this.value)">
										<option value="0">
											文字
										</option>
										<option value="1">
											图文
										</option>
										<option value="2">
											生活
										</option>
									</select>
									<div class="form_row">
										<label class="contact">
											<strong>标题:</strong>
										</label>
										<input type="text" name="title" class="contact_input" />
									</div>
									<div class="form_row">
										<label class="contact">
											<strong>简介:</strong>
										</label>
										<textarea style="width: 248px; height: 120px" name="remark"
											class="contact_textarea"></textarea>
									</div>
									<div class="form_row" style="width: 770px;">
										<label class="contact">
											<strong>内容编辑器:</strong>
										</label>
										<textarea id="content" name="content"
											class="contact_textarea"></textarea>
									</div>
									<div class="form_row">
										<label class="contact">
											<strong>主图:</strong>
										</label>
										<input type="file" name="mainPic" />
									</div>
									<div class="form_row" id="article_pics" style="display: none;">
										<label class="contact">
											<strong>文章图片:</strong>
										</label>
										<br/><br/>
										<div name="picsDiv"><input type="file" name="file" /><input type="button" value="删除" onclick="removePic(this)"
												class="registerBt" /></div>
										<div name="picsDiv"><input type="file" name="file" /><input type="button" value="删除" onclick="removePic(this)"
												class="registerBt" /></div>
										<div name="picsDiv"><input type="file" name="file" /><input type="button" value="删除" onclick="removePic(this)"
												class="registerBt" /></div>
										<input id="addPicBtn" type="button" value="+" onclick="addPic();" />
									</div>
									<div class="form_row">
										<input type="submit" value="提交" class="registerBt" />
									</div>
								</div>
							</form>
						</div>
						<%--资源 --%>
						<div id="resource" style="display: none;">
							<form action="${base }/admin/upload/resource" enctype='multipart/form-data' method="post">
								<div class="contact_form">
									<label class="contact">
										<strong>资源类型:</strong>
									</label>
									<select name="type" class="contact_input">
										<option value="0">
											电影
										</option>
										<option value="1">
											音乐
										</option>
										<option value="2">
											书籍
										</option>
										<option value="3">
											软件
										</option>
										<option value="4">
											其它
										</option>
									</select>
									<div class="form_row">
										<label class="contact">
											<strong>标题:</strong>
										</label>
										<input type="text" name="title" class="contact_input" />
									</div>
									<div class="form_row">
										<label class="contact">
											<strong>下载URL:</strong>
										</label>
										<input type="text" name="url" class="contact_input" />
									</div>
									<div class="form_row">
										<label class="contact">
											<strong>下载密码:</strong>
										</label>
										<input type="text" name="password" class="contact_input" />
									</div>
									<div class="form_row">
										<label class="contact">
											<strong>说明:</strong>
										</label>
										<textarea style="width: 248px; height: 120px"
											name="explanation" class="contact_textarea"></textarea>
									</div>
									<div class="form_row">
										<label class="contact">
											<strong>配图:</strong>
										</label>
										<input type="file" name="file" />
									</div>
									<div class="form_row">
										<input type="submit" value="提交" class="registerBt" />
									</div>
								</div>
							</form>
						</div>
						<%--影音 --%>
						<div id="media" style="display: none;">
							<form action="${base }/admin/upload/media" enctype='multipart/form-data' method="post">
								<div class="contact_form">
									<label class="contact">
										<strong>类型:</strong>
									</label>
									<select name="type" class="contact_input">
										<option value="0">
											电影
										</option>
										<option value="1">
											音乐
										</option>
									</select>
									<div class="form_row">
										<label class="contact">
											<strong>标题:</strong>
										</label>
										<input type="text" name="title" class="contact_input" />
									</div>
									<div class="form_row">
										<label class="contact">
											<strong>说明:</strong>
										</label>
										<textarea style="width: 248px; height: 120px"
											name="explanation" class="contact_textarea"></textarea>
									</div>
									<div class="form_row">
										<label class="contact">
											<strong>代码:</strong>
										</label>
										<textarea style="width: 248px; height: 120px" name="code"
											class="contact_textarea"></textarea>
									</div>
									<div class="form_row">
										<label class="contact">
											<strong>配图:</strong>
										</label>
										<input type="file" name="file" />
									</div>
									<div class="form_row">
										<input type="submit" value="提交" class="registerBt" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="footer">
				<div class="left_footer">
					&nbsp;&nbsp;
					<img src="${base}/rs/images/pet/footer_logo.gif" alt="" title="" />
					<br />
					<a href="http://www.zhangshiying.com/" title="Welcome here!">zhangshiying.com</a>
				</div>
				<div class="right_footer">
					<a href="#">home</a>
					<a href="#">about us</a>
					<a href="#">services</a>
					<a href="#">privacy policy</a>
					<a href="#">contact us</a>
				</div>
			</div>
			<!--end of center content-->
		</div>
		<ckeditor:replace  replace="content" basePath="${base }/ckeditor/" />
		<script>
	function changeForm(value) {
		if (value == '0') {
			document.getElementById("article").style.display = '';
			document.getElementById("media").style.display = 'none';
			document.getElementById("resource").style.display = 'none';
		}
		if (value == '1') {
			document.getElementById("article").style.display = 'none';
			document.getElementById("media").style.display = '';
			document.getElementById("resource").style.display = 'none';
		}
		if (value == '2') {
			document.getElementById("article").style.display = 'none';
			document.getElementById("media").style.display = 'none';
			document.getElementById("resource").style.display = '';
		}
	}

	function getAtype(value) {
		if (value == '1') {
			document.getElementById("article_pics").style.display = '';
		} else {
			document.getElementById("article_pics").style.display = 'none';
		}
	}

	function addPic() {
		var div = document.createElement("div");
		div.setAttribute('name', 'picsDiv');
		var overlay = document.createElement("input");
		overlay.setAttribute('type', 'file');
		overlay.setAttribute('name', 'file');
		var del = document.createElement("input");
		del.setAttribute('type', 'button');
		del.setAttribute('value', '删除');
		del.setAttribute('onclick', 'removePic(this)');
		del.setAttribute('class', 'registerBt');
		div.appendChild(overlay);
		div.appendChild(del);
		var btn = document.getElementById("addPicBtn");
		document.getElementById("article_pics").insertBefore(div, btn);
	}

	function removePic(obj) {
		var divs = document.getElementsByName("picsDiv");
		for ( var i = 0; i < divs.length; i++) {
			if (obj == divs[i].childNodes[1]) {
				divs[i].parentNode.removeChild(divs[i]);
				break;
			}
		}
	}
</script>
	</body>
</html>