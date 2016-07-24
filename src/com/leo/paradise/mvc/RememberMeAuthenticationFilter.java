package com.leo.paradise.mvc;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;

import com.leo.paradise.bean.UserProfile;

public class RememberMeAuthenticationFilter extends FormAuthenticationFilter
{
	@Inject protected Dao dao;
	/**
	 * 这个方法决定了是否能让用户登录
	 */
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
		Subject subject = getSubject(request, response);

		//如果 isAuthenticated 为 false 证明不是登录过的，同时 isRememberd 为true 证明是没登陆直接通过记住我功能进来的
		if(!subject.isAuthenticated() && subject.isRemembered()){

			//获取session看看是不是空的
			Session session = subject.getSession(true);

			//随便拿session的一个属性来看session当前是否是空的，我用userId，你们的项目可以自行发挥
			if(session.getAttribute("me") == null){
				//如果是空的才初始化，否则每次都要初始化，项目得慢死
				//注意,userId一定要转换成int类型，不然会影响uploadModule。因为uploadModule里的方法需要int类型的userId作为入参。
				int userId = Integer.valueOf(subject.getPrincipal().toString());
				//在这个方法里面做初始化用户上下文的事情，比如通过查询数据库来设置session值
				session.setAttribute("me", userId);
			}
		}
		//这个方法本来只返回 subject.isAuthenticated() 现在我们加上 subject.isRemembered() 让它同时也兼容remember这种情况
//		return subject.isAuthenticated() || subject.isRemembered();
		return true;
	}
}
