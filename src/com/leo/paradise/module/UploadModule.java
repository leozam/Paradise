package com.leo.paradise.module;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.nutz.dao.DaoException;
import org.nutz.img.Images;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.Scope;
import org.nutz.mvc.annotation.AdaptBy;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Attr;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.POST;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.impl.AdaptorErrorContext;
import org.nutz.mvc.upload.TempFile;
import org.nutz.mvc.upload.UploadAdaptor;

import com.leo.paradise.bean.Article;
import com.leo.paradise.bean.Media;
import com.leo.paradise.bean.Picture;
import com.leo.paradise.bean.Resource;

@IocBean
@At("/admin/upload")
public class UploadModule extends BaseModule
{
	@RequiresRoles("admin")
	@AdaptBy(type=UploadAdaptor.class, args={"${app.root}/WEB-INF/tmp/pictures", "8192", "utf-8", "20000", "4096000"})
	@POST
	@Ok("jsp:/page/upload")
	@At("/article")
	public void newArticle(@Param("..")Article article,@Param("mainPic")TempFile tf,
			@Param("file")List<TempFile> pics,AdaptorErrorContext err,
			@Attr(scope=Scope.SESSION,value="me")int userId)
	{
		Mvcs.getHttpSession().removeAttribute("upload-error-msg");
		String msg = null;
		if (err != null && err.getAdaptorErr() != null) {
			msg = "文件大小不符合规定";
		} else if (tf == null) {
			msg = "空文件";
		} else {
			try {
				BufferedImage image = Images.read(tf.getFile());
				ByteArrayOutputStream out = new ByteArrayOutputStream();
				image = Images.zoomScale(image, 160, 120, Color.WHITE);
				Images.writeJpeg(image, out, 0.8f);
				article.setHeadPic(out.toByteArray());
				article.setCreateTime(new Date());
				article.setUpdateTime(new Date());
				article.setUserId(userId);
				if(pics!=null && pics.size()>0)
				{
					List<Picture> pl = new ArrayList<Picture>();
					for(TempFile te:pics)
					{
						BufferedImage bi = Images.read(te.getFile());
						ByteArrayOutputStream bos = new ByteArrayOutputStream();
						Images.writeJpeg(bi, bos, 0.6f);
						Picture p = new Picture();
						p.setPic(bos.toByteArray());
						p.setCreateTime(new Date());
						p.setUpdateTime(new Date());
						p.setArticle_id(article.getId());
						pl.add(p);
					}
					article.setPics(pl);
					dao.insertWith(article, "pics");
				}
				else
				{
					dao.insert(article);
				}
			} catch(DaoException e) {
				msg = "系统错误";
			} catch (Throwable e) {
				msg = "图片格式错误";
			}
		}
		if (msg != null)
		{
			Mvcs.getHttpSession().setAttribute("upload-error-msg", msg);
		}
	}
	@RequiresRoles("admin")
	@AdaptBy(type=UploadAdaptor.class, args={"${app.root}/WEB-INF/tmp/pictures", "8192", "utf-8", "20000", "1024000"})
	@POST
	@Ok("jsp:/page/upload")
	@At("/picture")
	public void newPic(@Param("..")Picture pic,
			@Param("file")List<TempFile> tf,AdaptorErrorContext err,@Param("remark")String remark,
			@Attr(scope=Scope.SESSION, value="article")int articleId)
	{
		Mvcs.getHttpSession().removeAttribute("upload-error-msg");
		String msg = null;
		if (err != null && err.getAdaptorErr() != null) {
			msg = "文件大小不符合规定";
		} else if (tf == null) {
			msg = "空文件";
		} else {
			try {
				Picture p = new Picture();
				p.setRemark(pic.getRemark());
				p.setRemark(remark);
				for(TempFile t:tf)
				{
					BufferedImage image = Images.read(t.getFile());
					ByteArrayOutputStream out = new ByteArrayOutputStream();
					Images.writeJpeg(image, out, 0.8f);
					p.setArticle_id(articleId);
					p.setPic(out.toByteArray());
					p.setCreateTime(new Date());
					p.setUpdateTime(new Date());
					dao.insert(p);
				}
			} catch(DaoException e) {
				msg = "系统错误";
			} catch (Throwable e) {
				msg = "图片格式错误";
			}
		}
		if (msg != null)
		{
			Mvcs.getHttpSession().setAttribute("upload-error-msg", msg);
		}
	}
	@RequiresRoles("admin")
	@AdaptBy(type=UploadAdaptor.class, args={"${app.root}/WEB-INF/tmp/pictures", "8192", "utf-8", "20000", "1024000"})
	@POST
	@Ok("jsp:/page/upload")
	@At("/media")
	public void addMedia(@Param("..")Media m,@Param("file")TempFile tf,AdaptorErrorContext err,@Attr(scope=Scope.SESSION,value="me")int userId)
	{
		Mvcs.getHttpSession().removeAttribute("upload-error-msg");
		String msg = null;
		if (err != null && err.getAdaptorErr() != null) {
			msg = "文件大小不符合规定";
		}
		else if (tf == null) {
			msg = "空文件";
		}
		else
		{
			m.setUserId(userId);
			m.setCreateTime(new Date());
			m.setUpdateTime(new Date());
			try {
				if (tf != null) {
					BufferedImage image = Images.read(tf.getFile());
					ByteArrayOutputStream out = new ByteArrayOutputStream();
					image = Images.zoomScale(image, 160, 120, Color.WHITE);
					Images.writeJpeg(image, out, 1f);
					m.setPic(out.toByteArray());
				}
				dao.insert(m);
			} catch(DaoException e) {
				msg = "系统错误";
			} catch (Throwable e) {
				msg = "图片格式错误";
			}
		}

		if (msg != null)
		{
			Mvcs.getHttpSession().setAttribute("upload-error-msg", msg);
		}
	}
	@RequiresRoles("admin")
	@AdaptBy(type=UploadAdaptor.class, args={"${app.root}/WEB-INF/tmp/pictures", "8192", "utf-8", "20000", "2048000"})
	@POST
	@Ok("jsp:/page/upload")
	@At("/resource")
	public void newRes(@Param("..")Resource rs,@Param("file")TempFile tf,AdaptorErrorContext err, @Attr(scope=Scope.SESSION, value="me")int userId)
	{
		Mvcs.getHttpSession().removeAttribute("upload-error-msg");
		String msg = null;
		if (err != null && err.getAdaptorErr() != null) {
			msg = "文件大小不符合规定";
		} else if (tf == null) {
			msg = "空文件";
		} else {
			try {
					BufferedImage image = Images.read(tf.getFile());
					ByteArrayOutputStream out = new ByteArrayOutputStream();
					image = Images.zoomScale(image, 160, 120, Color.WHITE);
					Images.writeJpeg(image, out, 1f);
					rs.setPic(out.toByteArray());
					rs.setCreateTime(new Date());
					rs.setUpdateTime(new Date());
					rs.setUserId(userId);
					dao.insert(rs);
			} catch(DaoException e) {
				msg = "系统错误";
			} catch (Throwable e) {
				msg = "图片格式错误";
			}
		}
		if (msg != null)
		{
			Mvcs.getHttpSession().setAttribute("upload-error-msg", msg);
		}
	}
}
