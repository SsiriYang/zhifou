package com.zhifou.bean;

import java.util.Date;

public class Message {
	private Integer id;
	private Integer from_id;//发信人的ID 对应User 表中的ID字段
	private Integer to_id;//收信人的id,对应user表中的id字段
	private String subject;//针对那个问题的私信
	private String content;//信息的正文
	private String create_time;//信息的创建时间
	private Integer status;//1已读,2未读,3删除

	public Message() {
		super();
	}
	public Message(Integer id, Integer from_id, Integer to_id, String subject, String content, String create_time,
			Integer status) {
		super();
		this.id = id;
		this.from_id = from_id;
		this.to_id = to_id;
		this.subject = subject;
		this.content = content;
		this.create_time = create_time;
		this.status = status;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getFrom_id() {
		return from_id;
	}
	public void setFrom_id(Integer from_id) {
		this.from_id = from_id;
	}
	public Integer getTo_id() {
		return to_id;
	}
	public void setTo_id(Integer to_id) {
		this.to_id = to_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
