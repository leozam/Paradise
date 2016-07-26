package com.leo.paradise.module;

import java.util.Date;
import java.util.List;

import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.Scope;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Attr;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.leo.paradise.bean.FuncStudyNote;

@IocBean
@At("/func")
public class FuncModule extends BaseModule
{
	@Ok("jsp:/page/myFuncBody/funcStudyNote")
	@At("/studynote/show")
	public void showStudyNote(@Attr(scope=Scope.SESSION,value="me")int userId)
	{
		Sql sql=Sqls.create(
				"select fsn.name from funcstudynote fsn where fsn.user_id="+userId+" group by fsn.name");
		sql.setCallback(Sqls.callback.entities());
		sql.setEntity(dao.getEntity(FuncStudyNote.class));
		dao.execute(sql);
		List<FuncStudyNote> list=sql.getList(FuncStudyNote.class);
		Mvcs.getHttpSession().setAttribute("objName", "学习笔记");
		Mvcs.getHttpSession().setAttribute("fsnList", list);
	}

	@Ok("jsp:/page/myFuncBody/funcStudyNote")
	@At("/studynote/showType")
	public void showStudyNoteType(@Param("name")String name,@Attr(scope=Scope.SESSION,value="me")int userId)
	{
		Sql sql=Sqls.create(
				" select fsn.type from funcstudynote fsn where fsn.user_id=@userid" +
				" and fsn.name=@name");
		sql.params().set("userid", userId);
		sql.params().set("name", name);
		sql.setCallback(Sqls.callback.entities());
		sql.setEntity(dao.getEntity(FuncStudyNote.class));
		dao.execute(sql);
		List<FuncStudyNote> list=sql.getList(FuncStudyNote.class);
		Mvcs.getHttpSession().setAttribute("objName", name);
		Mvcs.getHttpSession().setAttribute("fsnList", list);
	}

	@Ok("jsp:/page/myFuncBody/funcStudyNote")
	@At("/studynote/showDetail")
	public void showStudyNoteDetail(@Param("name")String name,@Param("type")String type,@Attr(scope=Scope.SESSION,value="me")int userId)
	{
		Sql sql=Sqls.create(
				" select fsn.* from funcstudynote fsn where fsn.user_id=@userid" +
				" and fsn.name=@name and fsn.type=@type");
		sql.params().set("userid", userId);
		sql.params().set("name", name);
		sql.params().set("type", type);
		sql.setCallback(Sqls.callback.entities());
		sql.setEntity(dao.getEntity(FuncStudyNote.class));
		dao.execute(sql);
		FuncStudyNote fsn=sql.getObject(FuncStudyNote.class);
		Mvcs.getReq().setAttribute("fsn", fsn);
	}
	
	@Ok("jsp:/page/myFuncBody/funcStudyNote")
	@At("/studynote/add")
	public void addStudyNote(@Param("..")FuncStudyNote fsn,@Attr(scope=Scope.SESSION,value="me")int userId)
	{
		fsn.setUser_id(userId);
		fsn.setCreateTime(new Date());
		fsn.setUpdateTime(new Date());
		dao.insert(fsn);
		showStudyNote(userId);
	}

	@Ok("jsp:/page/myFuncBody/funcStudyNote")
	@At("/studynote/update")
	public void updateStudyNote(@Param("..")FuncStudyNote fsn,@Attr(scope=Scope.SESSION,value="me")int userId)
	{
		fsn.setUser_id(userId);
		fsn.setUpdateTime(new Date());
//		dao.update(fsn,"^[^createTime]");//regex:doesn't start with createTime
		dao.updateIgnoreNull(fsn);
		showStudyNote(userId);
	}
}
