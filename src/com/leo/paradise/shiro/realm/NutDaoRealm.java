package com.leo.paradise.shiro.realm;

import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAccount;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.integration.shiro.CaptchaUsernamePasswordToken;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.mvc.Mvcs;

import com.leo.paradise.bean.AccountRecord;
import com.leo.paradise.bean.Permission;
import com.leo.paradise.bean.Role;
import com.leo.paradise.bean.User;
import com.leo.paradise.util.Toolkit;

/**
 * 用NutDao来实现Shiro的Realm
 * <p/> 在Web环境中通过Ioc来获取NutDao
 * 这个类也存在于shiro插件中,但切勿直接引用, 因为这个类与实际的权限模型(User-Role-Permission)紧密相关,提供一个通用实现不现实.
 * 类中的Ioc注解仅供参考,因为shiro先于NutFilter初始化,所以ioc容器没法直接提供支持.
 */
@IocBean
public class NutDaoRealm extends AuthorizingRealm {

	@Inject protected Dao dao;

	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//null usernames are invalid
		if (principals == null) {
			throw new AuthorizationException("PrincipalCollection method argument cannot be null.");
		}
		int userId = (Integer)principals.getPrimaryPrincipal();
		User user = dao().fetch(User.class, userId);
		if (user == null)
			return null;
		if (user.isLocked()) 
			throw new LockedAccountException("Account [" + user.getName() + "] is locked.");

		SimpleAuthorizationInfo auth = new SimpleAuthorizationInfo();
		user = dao().fetchLinks(user, null);
		if (user.getRoles() != null) {
			dao().fetchLinks(user.getRoles(), null);
			for (Role role : user.getRoles()) {
				auth.addRole(role.getName());
				if (role.getPermissions() != null) {
					for (Permission p : role.getPermissions()) {
						auth.addStringPermission(p.getName());
					}
				}
			}
		}
		if (user.getPermissions() != null) {
			for (Permission p : user.getPermissions()) {
				auth.addStringPermission(p.getName());
			}
		}
		return auth;
	}

	//aop无法实现，可能原因：shiro先于nutfilter初始化，ioc容器无法提供支持。而aopInterceptor是iocbean。
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		CaptchaUsernamePasswordToken upToken = (CaptchaUsernamePasswordToken) token;

		if (Strings.isBlank(upToken.getCaptcha()))
			throw new AuthenticationException("验证码不能为空");
		String _captcha = Strings.sBlank(SecurityUtils.getSubject().getSession(true).getAttribute(Toolkit.captcha_attr));
		if (!upToken.getCaptcha().equalsIgnoreCase(_captcha))
			throw new AuthenticationException("验证码错误");

		User user = dao().fetch(User.class, Cnd.where("name", "=", upToken.getUsername()));
		if (user == null)
		{
			return null;
		}
		if (user.isLocked()) 
			throw new LockedAccountException("Account [" + upToken.getUsername() + "] is locked.");
		SimpleAccount account = new SimpleAccount(user.getId(), user.getPassword(), getName());
		account.setCredentialsSalt(ByteSource.Util.bytes(user.getSalt()));
		AccountRecord ar=new AccountRecord();
		ar.setOp(AccountRecord.LOGIN);
		ar.setUserId(user.getId());
		ar.setCreateTime(new Date());
		ar.setUpdateTime(new Date());
		dao.insert(ar);
		return account;
	}
	
	public NutDaoRealm() {
		this(null, null);
	}

	public NutDaoRealm(CacheManager cacheManager, CredentialsMatcher matcher) {
		super(cacheManager, matcher);
		setAuthenticationTokenClass(CaptchaUsernamePasswordToken.class);
	}

	public NutDaoRealm(CacheManager cacheManager) {
		this(cacheManager, null);
	}

	public NutDaoRealm(CredentialsMatcher matcher) {
		this(null, matcher);
	}

	public Dao dao() {
		if (dao == null) {
			dao = Mvcs.ctx().getDefaultIoc().get(Dao.class, "dao");
			return dao;
		}
		return dao;
	}

	public void setDao(Dao dao) {
		this.dao = dao;
	}
}
