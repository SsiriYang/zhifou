package com.zhifou.service;

import java.util.List;

import com.zhifou.bean.Answer;
import com.zhifou.dao.AnswerDAOImpl;

public class AnswerServiceImpl implements AnswerService {
	private AnswerDAOImpl answerDao = new AnswerDAOImpl();

	@Override
	public void add(Answer answer) {
		// TODO Auto-generated method stub
		answerDao.add(answer);
	}
}
