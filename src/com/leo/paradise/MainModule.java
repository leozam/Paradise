package com.leo.paradise;

import jetbrick.template.web.nutz.JetTemplateViewMaker;

import org.beetl.ext.nutz.BeetlViewMaker;
import org.nutz.integration.shiro.ShiroSessionProvider;
import org.nutz.mvc.annotation.ChainBy;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Localization;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.SessionBy;
import org.nutz.mvc.annotation.SetupBy;
import org.nutz.mvc.annotation.Views;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

@Views({JetTemplateViewMaker.class,BeetlViewMaker.class})
@SessionBy(ShiroSessionProvider.class)
@ChainBy(args="mvc/paradise-mvc-chain.js")
@SetupBy(value=MainSetup.class)
@IocBy(type=ComboIocProvider.class, args={"*js", "ioc/",
	"*anno", "com.leo.paradise","*tx", 
"*org.nutz.integration.quartz.QuartzIocLoader"})
@Modules(scanPackage=true)
@Localization(value="msg/", defaultLocalizationKey="zh-CN")
@Ok("json:full")
@Fail("jsp:jsp.500")
public class MainModule 
{
}