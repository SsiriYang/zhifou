package com.zhifou.service;
import com.zhifou.bean.Question;
import com.zhifou.dao.QuestionDAOImpl;


public class QuestionServiceImpl implements QuestionService{
	private QuestionDAOImpl questionDao=new QuestionDAOImpl();
	@Override
	public void add(Question question) {
		questionDao.add(question);		
	}
	
	
}
