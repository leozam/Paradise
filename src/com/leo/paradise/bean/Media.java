package com.leo.paradise.bean;

import org.nutz.dao.entity.annotation.ColDefine;
import org.nutz.dao.entity.annotation.ColType;
import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.json.JsonField;

@Table("media")
public class Media extends BasePojo
{
	private static final long serialVersionUID = 1L;
	@Id
	private long id;
	@Column("userId")
	private long userId;
	@Column("type")
	private Integer type;
	@Column("title")
	private String title;
	@Column("exp")
	@ColDefine(type = ColType.VARCHAR, width = 5000)
	private String explanation;
	@Column("pic")
	@JsonField(ignore=true)
	private byte[] pic;
	@Column("code")
	@ColDefine(type = ColType.VARCHAR, width = 5000)
	private String code;
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public long getUserId()
	{
		return userId;
	}
	public void setUserId(long userId)
	{
		this.userId = userId;
	}
	public Integer getType()
	{
		return type;
	}
	public void setType(Integer type)
	{
		this.type = type;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getTitle()
	{
		return title;
	}
	public String getExplanation()
	{
		return explanation;
	}
	public void setExplanation(String explanation)
	{
		this.explanation = explanation;
	}
	public byte[] getPic()
	{
		return pic;
	}
	public void setPic(byte[] pic)
	{
		this.pic = pic;
	}
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
}
