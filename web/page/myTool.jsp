<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Paradise</title><link rel="shortcut icon" href="${base }/Favicon.ico" >
<link rel="stylesheet" type="text/css" href="${base }/rs/css/style.css" />
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
						<li class="selected">
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
						<li>
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
				<div class="left_content">
					<div class="title">
						<span class="title_icon"><img
								src="${base}/rs/images/pet/bullet1.gif" alt="" title="" /> </span>我的账户
					</div>
					<div class="clear"></div>
				</div>
				<!--end of left content-->
				<div class="right_content">
					<div class="title">
						<span class="title_icon"><img
								src="${base}/rs/images/pet/bullet3.gif" alt="" title="" /> </span>关于我
					</div>
					<div class="about">
						<p>
							<img src="${base}/rs/images/pet/about.gif" alt="" title=""
								class="right" />
							若登录界面版示出错，请更换新版浏览器或更换浏览器模式（如：极速模式）进行浏览。
						</p>
					</div>
					<div class="right_box" style="padding-left: ">
						<div class="title">
							<span class="title_icon"><img
									src="${base}/rs/images/pet/bullet4.gif" alt="" title="" /> </span>哈罗呀
						</div>
						<div class="new_prod_box">
							<a href="#">D</a>
							<div class="new_prod_bg">
								<a href="details.jsp"><img
										src="${base}/rs/images/pet/thumb1.gif" alt="" title=""
										class="thumb" border="0" /> </a>
							</div>
						</div>
						<div class="new_prod_box">
							<a href="#">O</a>
							<div class="new_prod_bg">
								<a href="details.jsp"><img
										src="${base}/rs/images/pet/thumb1.gif" alt="" title=""
										class="thumb" border="0" /> </a>
							</div>
						</div>
						<div class="new_prod_box">
							<a href="#">G</a>
							<div class="new_prod_bg">
								<a href="details.jsp"><img
										src="${base}/rs/images/pet/thumb1.gif" alt="" title=""
										class="thumb" border="0" /> </a>
							</div>
						</div>
					</div>
					<div class="right_box">
						<div class="title">
							<span class="title_icon"><img
									src="${base}/rs/images/pet/bullet5.gif" alt="" title="" /> </span>嘿啊啰吖
						</div>
						<ul class="list">
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
						</ul>
						<div class="title">
							<span class="title_icon"><img
									src="${base}/rs/images/pet/bullet6.gif" alt="" title="" /> </span>友情链接
						</div>
						<ul class="list">
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
							<li>
								<a href="#">木有</a>
							</li>
						</ul>
					</div>
				</div>
				<!--end of right content-->
				<div class="clear"></div>
			</div>
			<!--end of center content-->
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
		</div>

	</body>
</html>