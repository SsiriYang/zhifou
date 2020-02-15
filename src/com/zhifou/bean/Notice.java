package com.zhifou.bean;

public class Notice {
	private Integer noticeid;//公告id
	private String noticetitle;//公告标题
	private String noticecontent;//公告内容
	private String noticerelease;//发布时间
	private Integer noticeproposer;//公告发布者
	public Integer getNoticeid() {
		return noticeid;
	}
	public void setNoticeid(Integer noticeid) {
		this.noticeid = noticeid;
	}
	public String getNoticetitle() {
		return noticetitle;
	}
	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}
	public String getNoticecontent() {
		return noticecontent;
	}
	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}
	public String getNoticerelease() {
		return noticerelease;
	}
	public void setNoticerelease(String noticerelease) {
		this.noticerelease = noticerelease;
	}
	public Integer getNoticeproposer() {
		return noticeproposer;
	}
	public void setNoticeproposer(Integer noticeproposer) {
		this.noticeproposer = noticeproposer;
	}
	
}
