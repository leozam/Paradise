package com.leo.paradise.bean;

import org.nutz.dao.entity.annotation.ColDefine;
import org.nutz.dao.entity.annotation.ColType;
import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.json.JsonField;

@Table("picture")
public class Picture extends BasePojo
{
	private static final long serialVersionUID = 1L;
	@Id
	private long id;
	@Column("article_id")
	private long article_id;
	@Column
	@JsonField(ignore=true)
	private byte[] pic;
	@Column
	@ColDefine(type = ColType.VARCHAR, width = 5000)
	private String remark;
	public long getArticle_id()
	{
		return article_id;
	}
	public void setArticle_id(long article_id)
	{
		this.article_id = article_id;
	}
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public byte[] getPic()
	{
		return pic;
	}
	public void setPic(byte[] pic)
	{
		this.pic = pic;
	}
	public String getRemark()
	{
		return remark;
	}
	public void setRemark(String remark)
	{
		this.remark = remark;
	}
}
