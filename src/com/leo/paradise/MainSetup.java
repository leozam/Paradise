package com.leo.paradise;

import net.sf.ehcache.CacheManager;

import org.nutz.dao.Dao;
import org.nutz.dao.util.Daos;
import org.nutz.integration.quartz.NutQuartzCronJobFactory;
import org.nutz.ioc.Ioc;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;
import org.nutz.plugins.cache.dao.CachedNutDaoExecutor;

import com.leo.paradise.bean.Article;
import com.leo.paradise.bean.Media;
import com.leo.paradise.bean.Picture;
import com.leo.paradise.bean.Resource;
import com.leo.paradise.bean.User;
import com.leo.paradise.service.AuthorityService;
import com.leo.paradise.service.UserService;

public class MainSetup implements Setup {

	public void init(NutConfig conf) {
		Log log = Logs.get();
		Ioc ioc = conf.getIoc();
		Dao dao = ioc.get(Dao.class);
		Daos.createTablesInPackage(dao, "com.leo.paradise", false);
		Daos.migration(dao, User.class, true, false);
		Daos.migration(dao, Article.class, true, false);
		Daos.migration(dao, Resource.class, true, false);
		Daos.migration(dao, Picture.class, true, false);
		Daos.migration(dao, Media.class, true, false);

		// 初始化默认根用户
		User admin = dao.fetch(User.class, "admin");
		if (admin==null) {
			UserService us = ioc.get(UserService.class);
			us.add("admin", "123456");
		}

		// 获取NutQuartzCronJobFactory从而触发计划任务的初始化与启动
		ioc.get(NutQuartzCronJobFactory.class);

		// 权限系统初始化
		AuthorityService as = ioc.get(AuthorityService.class);
		as.initFormPackage("com.leo.paradise");
		as.checkBasicRoles(admin);

		CachedNutDaoExecutor.DEBUG = true;
		CacheManager cacheManager = ioc.get(CacheManager.class);
		log.debug("Ehcache CacheManager = " + cacheManager);
	}

	public void destroy(NutConfig conf) {
	}

}
