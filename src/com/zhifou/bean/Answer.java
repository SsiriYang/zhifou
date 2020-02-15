package com.zhifou.bean;

public class Answer {
	private Integer answerid;//回答ID
	private Integer answerproposer;//回答提出者(userID)
	private String answercontent;//回答内容
	private String answertime;//回答时间
	private Integer questionid;//外键问题(quesID)
	private Integer answer_count;//回答浏览次数
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
	public Integer getQuestionid() {
		return questionid;
	}
	public void setQuestionid(Integer questionid) {
		this.questionid = questionid;
	}
	public Integer getAnswer_count() {
		return answer_count;
	}
	public void setAnswer_count(Integer answer_count) {
		this.answer_count = answer_count;
	}
	
}
