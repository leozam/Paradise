<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="header">
	<div class="logo">
		<a href="${base }/index.jsp"><img
				src="${base}/rs/images/pet/logo160219.png" alt="" title=""
				border="0" /> </a>
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
