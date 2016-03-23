<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>Paradise</title>
	<link rel="shortcut icon" href="${base }/Favicon.ico" >
		<link rel="stylesheet" type="text/css"
			href="${base }/rs/css/style.css" />
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
						<li class="selected">
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
								src="${base}/rs/images/pet/bullet1.gif" alt="" title="" /> </span>置顶

					</div>
					<c:forEach var="i" begin="0" end="2">
					<div class="feat_prod_box">
					<div class="prod_img">
								<a href="${base }/getContent/article/detail?id=${obj[i].id }"
									target="_blank"><img
										src="${base}/getContent/article/getHeadPic?articleId=${obj[i].id }"
										alt="" title="" border="0" width="120" height="80" /> </a>
							</div>
						<div class="prod_det_box">
							<div class="box_top"></div>
							<div class="box_center">
								<div class="prod_title">
									<a href="${base }/getContent/article/detail?id=${obj[i].id }" target="_blank"  style="text-decoration: none;">${obj[i].title }</a>
								</div>
								<p class="details">
								${obj[i].remark }
								</p>
								<div class="clear"></div>
							</div>
							<div class="box_bottom"></div>
						</div>
						<div class="clear"></div>
					</div>
					</c:forEach>
					<div class="title">
						<span class="title_icon"><img
								src="${base}/rs/images/pet/bullet2.gif" alt="" title="" /> </span>最新
					</div>
					<div class="new_products">
					<c:forEach var="i" begin="3" end="5">
						<div class="new_prod_box">
							<div class="new_prod_bg">
								<a href="${base }/getContent/article/detail?id=${obj[i].id }" target="_blank"><img
										src="${base}/getContent/article/getHeadPic?articleId=${obj[i].id }" alt="${obj[i].title }" title="${obj[i].title }"
										class="thumb" border="0" width="90" height="90" /> </a>
							</div>
						</div>
						</c:forEach>
					</div>
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
							&emsp;&emsp;&emsp;山有木，木有枝
							
						</p>
					</div>
					<div class="right_box">
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
					<a href="${base }/druid">druid</a>
					<a href="${base }/jspwebadmin">control</a>
				</div>
			</div>
		</div>
	</body>
</html>