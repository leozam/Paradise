<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${base }/rs/css/style.css" />
<title>${obj.title }-Paradise</title><link rel="shortcut icon" href="${base }/Favicon.ico" >
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
						<li <c:if test="${type==0 }">class="selected"</c:if>>
							<a href="${base }/getContent/article/list?type=0">文字</a>
						</li>
						<li <c:if test="${type==1 }">class="selected"</c:if>>
							<a href="${base }/getContent/article/list?type=1">图片</a>
						</li>
						<li <c:if test="${type==2 }">class="selected"</c:if>>
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
       	<div class="left_content" style="width: 880px;background-color: white;">
            <div class="title"><span class="title_icon"><img src="${base}/rs/images/pet/bullet1.gif" alt="" title="" /></span>${obj.title }</div>
        
        	    <c:choose>
					<c:when test="${type==1 }">
					<div class="feat_prod_box_details">
					<p style="text-align:center;">${obj.content }</p>
					<br/>
					<c:forEach var="pic" items="${obj.pics }">
					<p style="text-align:center;">
						<img src="${base}/getContent/picture/getPic?pictureId=${pic.id}"
							width="430px"/>
					</p>
					<br/>
					</c:forEach>
					</div>
					</c:when>
					<c:otherwise>
						<div class="feat_prod_box_details">
							<p class="words">
								${obj.content }
							</p>
						</div>
					</c:otherwise>
				</c:choose>
            
        <div class="clear"></div>
        </div><!--end of left content-->
       <div class="clear"></div>
       </div><!--end of center content-->
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