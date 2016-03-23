package com.leo.paradise.bean;

import java.util.List;

import org.nutz.dao.entity.annotation.ColDefine;
import org.nutz.dao.entity.annotation.ColType;
import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Many;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.json.JsonField;

/**
 * 
 * @author LeoLau
 * @time 2016-1-21下午04:28:21
 * @explanation 栏目：文章（文字）
 */
@Table("article")
public class Article extends BasePojo
{
	private static final long serialVersionUID = 1L;
	@Id
	private long id;
	@Column("title")
	private String title;
	@Column("userId")
	private long userId;
	@Column("type")
	private Integer type;
	@Column("content")
	@ColDefine(type = ColType.VARCHAR, width = 100000)
	private String content;
	@Column("remark")
	@ColDefine(type = ColType.VARCHAR, width = 5000)
	private String remark;
	@Column("headPic")
	@JsonField(ignore=true)
	private byte[] headPic;
	@Many(target=Picture.class,field="article_id")
	private List<Picture> pics;
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public void setUserId(long userId)
	{
		this.userId = userId;
	}
	public long getUserId()
	{
		return userId;
	}
	public Integer getType()
	{
		return type;
	}
	public void setType(Integer type)
	{
		this.type = type;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getRemark()
	{
		return remark;
	}
	public void setRemark(String remark)
	{
		this.remark = remark;
	}
	public byte[] getHeadPic()
	{
		return headPic;
	}
	public void setHeadPic(byte[] headPic)
	{
		this.headPic = headPic;
	}
	public List<Picture> getPics()
	{
		return pics;
	}
	public void setPics(List<Picture> pics)
	{
		this.pics = pics;
	}
}
