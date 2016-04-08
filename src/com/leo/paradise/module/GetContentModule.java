package com.leo.paradise.module;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.GET;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.leo.paradise.bean.Article;
import com.leo.paradise.bean.Media;
import com.leo.paradise.bean.Picture;
import com.leo.paradise.bean.Resource;

@IocBean
@At("/getContent")
public class GetContentModule extends BaseModule
{
	@At("/main")
	@Ok("jsp:/page/firstPage")
	public Object mainPage()
	{
		Cnd cnd = Cnd.where("1", "=", 1);
		cnd.orderBy("updateTime", "desc");
		cnd.limit(1, 6);
		List<Article> al = dao.query(Article.class, cnd);
		return al;
	}
	
	@At("/article/list")
	@Ok("jsp:/page/listArticle")
	public Object queryArticle(@Param("type")String type, @Param("..")Pager pager, int page) {
		pager.setPageNumber(page==0?1:page);
		pager.setPageSize(10);
		Cnd cnd = Strings.isBlank(type)? Cnd.where("1", "=", 1) : Cnd.where("type", "=", type);
		cnd.orderBy("updateTime", "desc");
		QueryResult qr = new QueryResult();
		List<Article> al = dao.query(Article.class, cnd, pager);
		qr.setList(al);
		pager.setRecordCount(dao.count(Article.class, cnd));
		qr.setPager(pager);
		Mvcs.getHttpSession().setAttribute("type", type);
		return qr;
	}
	@At("/media/list")
	@Ok("jsp:/page/listMedia")
	public Object queryMedia(@Param("type")String type, @Param("..")Pager pager, int page) {
		pager.setPageNumber(page==0?1:page);
		pager.setPageSize(10);
		Cnd cnd = Cnd.where("1", "=", 1);
		cnd.orderBy("updateTime", "desc");
		QueryResult qr = new QueryResult();
		List<Media> ml = dao.query(Media.class, cnd, pager);
		qr.setList(ml);
		pager.setRecordCount(dao.count(Media.class, cnd));
		qr.setPager(pager);
		return qr;
	}
	@At("/resource/list")
	@Ok("jsp:/page/listResource")
	public Object queryResource(@Param("type")String type, @Param("..")Pager pager, int page) {
		pager.setPageNumber(page==0?1:page);
		pager.setPageSize(10);
		Cnd cnd = Strings.isBlank(type)? Cnd.where("1", "=", 1) : Cnd.where("type", "=", type);
		cnd.orderBy("updateTime", "desc");
		QueryResult qr = new QueryResult();
		List<Resource> ml = dao.query(Resource.class, cnd, pager);
		qr.setList(ml);
		pager.setRecordCount(dao.count(Resource.class, cnd));
		qr.setPager(pager);
		return qr;
	}
	@At("/article/detail")
	@Ok("jsp:/page/showArticle")
	public Object showArticle(int id)
	{
		Article a = dao.fetch(Article.class, id);
		if(a.getType()==1)
		{
			Cnd cnd = Cnd.where("article_id", "=", id);
			List<Picture> pl=dao.query(Picture.class, cnd);
			a.setPics(pl);
		}
		Mvcs.getHttpSession().setAttribute("type", a.getType());
		return a;
	}
	@At("/media/detail")
	@Ok("jsp:/page/showMedia")
	public Object showMedia(int id)
	{
		Media m = dao.fetch(Media.class,id);
		return m;
	}
	@At("/resource/detail")
	@Ok("jsp:/page/showResource")
	public Object showResource(int id)
	{
		Resource r = dao.fetch(Resource.class, id);
		return r;
	}
	@At("/article/getHeadPic")
	@GET
	@Ok("raw:jpg")
	public byte[] getArticleHeadPic(int articleId)
	{
		return dao.fetch(Article.class,articleId).getHeadPic();
	}
	@At("/picture/getPic")
	@GET
	@Ok("raw:jpg")
	public byte[] getPicture(int pictureId)
	{
		return dao.fetch(Picture.class,pictureId).getPic();
	}
	@At("/media/getHeadPic")
	@GET
	@Ok("raw:jpg")
	public byte[] getMediaHeadPic(int mediaId)
	{
		return dao.fetch(Media.class,mediaId).getPic();
	}
	@At("/resource/getHeadPic")
	@GET
	@Ok("raw:jpg")
	public byte[] getResourceHeadPic(int resourceId)
	{
		return dao.fetch(Resource.class,resourceId).getPic();
	}
}
