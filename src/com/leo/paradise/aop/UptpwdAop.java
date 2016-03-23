package com.leo.paradise.aop;

import java.util.Date;

import org.nutz.aop.InterceptorChain;
import org.nutz.aop.MethodInterceptor;
import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.leo.paradise.bean.AccountRecord;

/**
 * 
 * @author LeoLau
 * @time 2016-3-2上午10:54:22
 * @explanation 用户修改密码时触发此AOP拦截器。将改密操作信息记入DB。
 */
@IocBean
public class UptpwdAop implements MethodInterceptor
{
	@Inject protected Dao dao;
	@Override
	public void filter(InterceptorChain chain) throws Throwable
	{
		chain.doChain();
		if((Boolean) chain.getReturn())
		{
			Object[] args=chain.getArgs();
			AccountRecord ar=new AccountRecord();
			ar.setCreateTime(new Date());
			ar.setUpdateTime(new Date());
			ar.setUserId(Integer.valueOf(args[2].toString()));
			ar.setOp(AccountRecord.UPTPWD);
			dao.insert(ar);
		}
	}
}
