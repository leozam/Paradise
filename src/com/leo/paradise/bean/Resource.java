package com.leo.paradise.bean;

import org.nutz.dao.entity.annotation.ColDefine;
import org.nutz.dao.entity.annotation.ColType;
import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.json.JsonField;

@Table("resource")
public class Resource extends BasePojo
{
	private static final long serialVersionUID = 1L;
	@Id
	private long id;
	@Column("userId")
	private long userId;
	@Column("title")
	private String title;
	@Column("type")
	private Integer type;
	@Column("exp")
	@ColDefine(type = ColType.VARCHAR, width = 1000)
	private String explanation;
	@Column("url")
	@ColDefine(type = ColType.VARCHAR, width = 500)
	private String url;
	@Column("pwd")
	private String password;
	@Column("pic")
	@JsonField(ignore=true)
	private byte[] pic;
	public byte[] getPic()
	{
		return pic;
	}
	public void setPic(byte[] pic)
	{
		this.pic = pic;
	}
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
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
	public void setType(int type)
	{
		this.type = type;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getExplanation()
	{
		return explanation;
	}
	public void setExplanation(String explanation)
	{
		this.explanation = explanation;
	}
	public String getUrl()
	{
		return url;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
}
