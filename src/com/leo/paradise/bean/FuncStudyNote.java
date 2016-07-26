package com.leo.paradise.bean;

import org.nutz.dao.entity.annotation.ColDefine;
import org.nutz.dao.entity.annotation.ColType;
import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

@Table("funcstudynote")
public class FuncStudyNote extends BasePojo
{
	private static final long serialVersionUID = 3898719810103202023L;
	@Id
	private long id;
	@Column("name")
	private String name;
	@Column("type")
	private String type;
	@Column("detail")
	@ColDefine(type=ColType.VARCHAR,width=5000)
	private String detail;
	@Column("user_id")
	private long user_id;
	public long getId()
	{
		return id;
	}
	public void setId(long id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public String getDetail()
	{
		return detail;
	}
	public void setDetail(String detail)
	{
		this.detail = detail;
	}
	public long getUser_id()
	{
		return user_id;
	}
	public void setUser_id(long userId)
	{
		user_id = userId;
	}
}
