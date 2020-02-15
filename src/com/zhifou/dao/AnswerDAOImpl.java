package com.zhifou.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.zhifou.bean.Answer;
import com.zhifou.utils.DataSourceUtils;

public class AnswerDAOImpl implements AnswerDAO {
	private static final int Answer = 0;
	QueryRunner queryrunner = new QueryRunner(DataSourceUtils.getDataSource());

	@Override
	public void add(Answer answer) {
		// TODO Auto-generated method stub
		String sql = "insert into answer(answercontent,answerproposer,questionid,answertime) values(?,?,?,?)";
		try {
			String answercontent = answer.getAnswercontent();
			Integer answerproposer = answer.getAnswerproposer();
			Integer questionid = answer.getQuestionid();
			queryrunner.update(sql, answercontent, answerproposer, questionid, new Date());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
