package com.leo.paradise.bean;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * 
 * @author LeoLau
 * @time 2016-3-2上午10:39:47
 * @explanation 账户记录（登录，修改等操作时记录）
 */
@Table("accountRecord")
public class AccountRecord extends BasePojo
{
	/**
	 * 登录操作
	 */
	public static final int LOGIN=0;
	/**
	 * 修改密码操作
	 */
	public static final int UPTPWD=1;
	private static final long serialVersionUID = 1L;
	@Id
	private Long id;
	@Column("userId")
	private long userId;
	@Column("op")
	private int op;
	@Column("remark")
	private String remark;
	public Long getId()
	{
		return id;
	}
	public void setId(Long id)
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
	public int getOp()
	{
		return op;
	}
	public void setOp(int op)
	{
		this.op = op;
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
