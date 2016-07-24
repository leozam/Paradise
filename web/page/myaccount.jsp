<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Paradise</title><link rel="shortcut icon" href="${base }/Favicon.ico" >
		<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js"></script>
<!-- 把user id复制到一个js变量 -->
<script type="text/javascript">
    var me = '<%=session.getAttribute("me")%>';
    var base = '${base}';
    $(function() {
        $("#login_button").click(function() {
            $.ajax({
                url : base + "/user/login",
                type: "POST",
                data:$('#loginForm').serialize(),
                error: function(request) {
                    alert("Connection error");
                },
                dataType:"json",
                success: function(data) {
                    if (data && data.ok) {
                        alert("登陆成功");
                        location.reload();
                    } else {
                        alert(data.msg);
                    }
                }
            });
            return false;
        });
        if (me != "null") {
            $("#login_div").hide();
            $("#user_info_div").show();
        } else {
            $("#login_div").show();
            $("#user_info_div").hide();
        }
    });
</script>
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

					<div class="feat_prod_box_details">
						<div id="login_div" class="contact_form">
						<div class="form_subtitle">
								密码框
							</div>
							<form action="#" id="loginForm" method="post">
								<div class="form_row">
									<label class="contact">
										<strong>账号:</strong>
									</label>
									<input name="username" type="text" class="contact_input">
								</div>
								<div class="form_row">
									<label class="contact">
										<strong>密码:</strong>
									</label>
									<input name="password" type="password" class="contact_input">
								</div>
								<script type="text/javascript">
            function next_captcha() {
                $("#captcha_img").attr("src", "${base}/captcha/next?_=" + new Date().getTime()); 
            }
        </script>
								<div class="form_row">
									<label class="contact">
										<strong> 验证码: </strong>
									</label>
									<input name="captcha" type="text" class="contact_input"
										value="">
								</div><br>
								<img id="captcha_img" onclick="next_captcha();return false;"
									src="${base}/captcha/next" style="cursor: pointer;padding-left: 23%"/>
									<div class="terms">
										<input type="checkbox" name="rememberMe" />
										记住我<font color="red">(公共电脑上请勿勾选此项)</font>
									</div>
									<div class="form_row">
									<input type="button" id="login_button" class="register"
										value="Biu!" />
								</div>
							</form>
						</div>
						<div id="user_info_div">
							<p id="userInfo">您的Id是${me }</p>
							<c:if test="${lastLoginTime !=null }">
							<p>您上一次登录是在 
							<fmt:formatDate value="${lastLoginTime }" type="both" />  
							</p>
							</c:if>
							<c:if test="${empty needTxt}"><a href="${base }/user/login">展开备忘录</a></c:if>
							<c:if test="${not empty needTxt}">
							<a href="#">备忘录</a>
							<form id="needTxtForm" method="post" action="${base }/user/profile/updateTxt">
							<br/>
								<textarea rows="20" cols="63" class="contact_input" name="needTxt">
								${needTxt }
								</textarea><br/><br/>
								<input type="submit" class="register" value="提交">
							</form>
							</c:if>
							<br><br>
							<hr>
							<p>
							<form id="uptPwdForm" method="post" action="${base }/user/uptPwd">
								<label style="text-align: right;">
									<strong>修改密码||${uptPwdMsg }</strong>
								</label>
							<div class="form_row">
								<label class="contact">
									<strong>原始密码:</strong>
								</label>
								<input name="pwd" type="password" class="contact_input">
							</div>
							<div class="form_row">
								<label class="contact">
									<strong>新的密码:</strong>
								</label>
								<input name="newPwd" type="password" class="contact_input">
							</div>
							<div class="form_row">
								<label class="contact">
									<strong>确认密码:</strong>
								</label>
								<input name="newPwdRepeat" type="password" class="contact_input">
							</div>
							<br>
							<input type="button" class="register" value="修改" onclick="return checkPwdRepeat()"/>
							<br>
							</form>
							<script>
								function checkPwdRepeat()
								{
									var pwd=document.getElementsByName("pwd")[0].value;
									var pwd1=document.getElementsByName("newPwd")[0].value;
									var pwd2=document.getElementsByName("newPwdRepeat")[0].value;
									if(!(pwd1==pwd2) || pwd=="" || pwd1=="" || pwd2=="")
									{
										alert("密码为空或两次密码不一致");
										return false;
									}
									var uptForm = document.getElementById("uptPwdForm");
									uptForm.submit();
								}
							</script>
							</p>
							<hr>
							<a href="${base}/user/logout">登出<font color="blue">(取消“记住我”)</font></a>
						</div>
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
</html>