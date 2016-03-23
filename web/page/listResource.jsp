<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Paradise</title><link rel="shortcut icon" href="${base }/Favicon.ico" >
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
						<li class="selected">
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
								src="${base}/rs/images/pet/bullet1.gif" alt="" title="" /> </span>文章列表
					</div>

					<c:forEach items="${obj.list }" var="normal">
						<div class="feat_prod_box">
							<div class="prod_img">
								<a href="${base }/getContent/resource/detail?id=${normal.id}"
									target="_blank"><img
										src="${base}/getContent/resource/getHeadPic?resourceId=${normal.id}"
										alt="" title="" border="0" width="120" height="80" /> </a>
							</div>
							<div class="prod_det_box">
								<div class="box_top"></div>
								<div class="box_center">
									<div class="prod_title">
										<a href="${base }/getContent/resource/detail?id=${normal.id}"
											target="_blank" style="text-decoration: none">${fn:substring(normal.title,0,30)
											}</a>
									</div>
									<p class="details">
										${fn:substring(normal.explanation,0,80) }
									</p>
									<span style="padding-left: 60%">
									 <fmt:formatDate value="${normal.updateTime}" type="both" pattern="yyyy.MM.dd HH:mm" />
									</span>
									<div class="clear"></div>
								</div>

								<div class="box_bottom"></div>
							</div>
							<div class="clear"></div>
						</div>
					</c:forEach>

					<div class="pagination">
						<c:choose>
							<c:when test="${obj.pager.pageNumber==1 }">
								<span class="disabled"><<</span>
							</c:when>
							<c:otherwise>
								<a
									href="${base }/getContent/resource/list?type=${type }&page=${obj.pager.pageNumber-1}"><<</a>
							</c:otherwise>
						</c:choose>

						<c:forEach var="p" begin="1" end="${obj.pager.pageCount }">
							<c:choose>
								<c:when test="${p==obj.pager.pageNumber }">
									<span class="current" style="cursor: pointer;">${p }</span>
								</c:when>
								<c:otherwise>
									<a
										href="${base }/getContent/resource/list?type=${type }&page=${p}">${p
										}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${obj.pager.pageNumber==obj.pager.pageCount }">
								<span class="disabled">>></span>
							</c:when>
							<c:otherwise>
								<a
									href="${base }/getContent/resource/list?type=${type }&page=${obj.pager.pageNumber+1}">>></a>
							</c:otherwise>
						</c:choose>
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
				</div>
			</div>
		</div>

	</body>
	<script>
	function changeClass(obj) {
		var index = obj - 1;
		var spans = document.getElementsByName("pageSpan");
		var theSpan = spans[index];
		for ( var i = 0; i < 10; i++) {
			var othSpan = spans[i];
			othSpan.removeAttribute('class');
		}
		theSpan.setAttribute('class', 'current');
	}
</script>
</html>