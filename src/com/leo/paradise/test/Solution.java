package com.leo.paradise.test;

import org.nutz.aop.ClassAgent;
import org.nutz.aop.ClassDefiner;
import org.nutz.aop.DefaultClassDefiner;
import org.nutz.aop.InterceptorChain;
import org.nutz.aop.MethodInterceptor;
import org.nutz.aop.asm.AsmClassAgent;
import org.nutz.aop.matcher.MethodMatcherFactory;

public class Solution {
	public boolean login(String username, String password) throws Throwable {
		if ("wendal".equals(username) && "qazwsxedc".equals(password)) {
			System.out.println("登陆成功");
			return true;
		}
		System.out.println("登陆失败");
		return false;
	}
	

	private static ClassDefiner cd = new DefaultClassDefiner();

	public static void main(String[] args) throws Throwable {
		//无AOP的时候
		Solution ua = new Solution(); //直接new,将按原本的流程执行
		ua.login("wendal", "qazwsxedc");

		System.out.println("-----------------------------------------------------");
		System.out.println("-----------------------------------------------------");

		//有AOP的时候
		ClassAgent agent = new AsmClassAgent();
		LogInterceptor log = new LogInterceptor();
		agent.addInterceptor(MethodMatcherFactory.matcher("^login$"), log);
		//返回被AOP改造的Class实例
		Class<? extends Solution> userAction2 = agent.define(cd, Solution.class);
		Solution action = userAction2.newInstance();
		action.login("wendal", "qazwsxedc");//通过日志,可以看到方法执行前后有额外的日志
	}
}

class LogInterceptor implements MethodInterceptor {
    public void filter(InterceptorChain chain) throws Throwable {
        System.out.println("方法即将执行 -->" + chain.getCallingMethod());
        chain.doChain();// 继续执行其他拦截器,如果没有,则执行原方法
        System.out.println("方法执行完毕 -->" + chain.getCallingMethod());
    }
}







