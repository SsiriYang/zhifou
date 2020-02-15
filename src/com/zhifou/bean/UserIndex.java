package com.zhifou.bean;

import java.util.Date;

public class UserIndex {
	private Integer userid;// 用户ID
	private String username;//用户昵称
	private String userpassword; //用户密码
	private String usermail;//用户邮箱
	private String userphoto;//用户头像
	private String usermeans;//用户签名
	private Integer questionid;//问题id
	private Integer questionproposer;//问题提出者(userID)
	private Date questionmadetime;//问题提出时间
	private String questiontitle;//问题标题
	private String questioncontent;//问题内容
	private String questionphoto;//问题图片
	private Integer ispassaudit;//审核状态
	private Integer categoryid;//问题类型(categoryID)
	private Integer question_count;//问题浏览次数
	private Integer answerid;//回答ID
	private Integer answerproposer;//回答提出者(userID)
	private String answercontent;//回答内容
	private String answertime;//回答时间
	private String categoryname;//类别名称
	private Integer answer_count;//回答浏览次数
	private Integer collectionid;//收藏ID
	private Integer status=0;//收藏的状态，默认是未收藏
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getCollectionid() {
		return collectionid;
	}
	public void setCollectionid(Integer collectionid) {
		this.collectionid = collectionid;
	}
	public String getUsermeans() {
		return usermeans;
	}
	public void setUsermeans(String usermeans) {
		this.usermeans = usermeans;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public Integer getAnswerid() {
		return answerid;
	}
	public void setAnswerid(Integer answerid) {
		this.answerid = answerid;
	}
	public Integer getAnswerproposer() {
		return answerproposer;
	}
	public void setAnswerproposer(Integer answerproposer) {
		this.answerproposer = answerproposer;
	}
	public String getAnswercontent() {
		return answercontent;
	}
	public void setAnswercontent(String answercontent) {
		this.answercontent = answercontent;
	}
	public String getAnswertime() {
		return answertime;
	}
	public void setAnswertime(String answertime) {
		this.answertime = answertime;
	}
	public Integer getAnswer_count() {
		return answer_count;
	}
	public void setAnswer_count(Integer answer_count) {
		this.answer_count = answer_count;
	}
	
	public UserIndex() {
		super();
	}
	public UserIndex(Integer userid, String username, String userpassword, String usermail, String userphoto,
			Integer questionid, Integer questionproposer, Date questionmadetime, String questiontitle,
			String questioncontent, String questionphoto, Integer ispassaudit, Integer categoryid,
			Integer question_count) {
		super();
		this.userid = userid;
		this.username = username;
		this.userpassword = userpassword;
		this.usermail = usermail;
		this.userphoto = userphoto;
		this.questionid = questionid;
		this.questionproposer = questionproposer;
		this.questionmadetime = questionmadetime;
		this.questiontitle = questiontitle;
		this.questioncontent = questioncontent;
		this.questionphoto = questionphoto;
		this.ispassaudit = ispassaudit;
		this.categoryid = categoryid;
		this.question_count = question_count;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUsermail() {
		return usermail;
	}
	public void setUsermail(String usermail) {
		this.usermail = usermail;
	}
	public String getUserphoto() {
		return userphoto;
	}
	public void setUserphoto(String userphoto) {
		this.userphoto = userphoto;
	}
	public Integer getQuestionid() {
		return questionid;
	}
	public void setQuestionid(Integer questionid) {
		this.questionid = questionid;
	}
	public Integer getQuestionproposer() {
		return questionproposer;
	}
	public void setQuestionproposer(Integer questionproposer) {
		this.questionproposer = questionproposer;
	}
	public Date getQuestionmadetime() {
		return questionmadetime;
	}
	public void setQuestionmadetime(Date questionmadetime) {
		this.questionmadetime = questionmadetime;
	}
	public String getQuestiontitle() {
		return questiontitle;
	}
	public void setQuestiontitle(String questiontitle) {
		this.questiontitle = questiontitle;
	}
	public String getQuestioncontent() {
		return questioncontent;
	}
	public void setQuestioncontent(String questioncontent) {
		this.questioncontent = questioncontent;
	}
	public String getQuestionphoto() {
		return questionphoto;
	}
	public void setQuestionphoto(String questionphoto) {
		this.questionphoto = questionphoto;
	}
	public Integer getIspassaudit() {
		return ispassaudit;
	}
	public void setIspassaudit(Integer ispassaudit) {
		this.ispassaudit = ispassaudit;
	}
	public Integer getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(Integer categoryid) {
		this.categoryid = categoryid;
	}
	public Integer getQuestion_count() {
		return question_count;
	}
	public void setQuestion_count(Integer question_count) {
		this.question_count = question_count;
	}
	 
	 
}
